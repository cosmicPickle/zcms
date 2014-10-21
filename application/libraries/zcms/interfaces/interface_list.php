<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');


/**
 * List Interface class
 * 
 * @author Teodor Klissarov
 * @created 24.04.2013
 * 
 * This class will interface the database and generate listings based on pagination, searches and different orders.
 * 
 */

class Interface_list extends Interface_base {

    //The constant containing the default view
    const LIST_DEFAULT_VIEW = "zlist";
    //The folder which contains the lists setup classes
    const LISTS_FOLDER = "interface_list/lists/";
    
    //The settings of the current listing
    protected $list_settings;
    protected $columns;
    protected $actions;
    protected $global_action;
    protected $search_columns;
    //The listing labels
    protected $labels = NULL;
    
    //The processed data will be saved here
    protected $pr_data = NULL;
    
    //Recognisable patterns for string parsing
    //The first pattern matches {@var_name} and will be replaced with the value of the 'var_name' column of the current row
    //The second pattern matches {#property} and will be replaced with the $this->(property) or with the number of the current
    //row if property = row
    protected $paterns = array('row_var' => '/\{@(\w*)\}/','row_num' => '/\{#(\w*)\}/');
    
    //Links flags
    protected $link_settings = array(
      'show_table_name' => 1,
      'mode' => 'URI',
      'additional' => ''
    );
    
/**
 * init()
 * 
 * This function overwrites the parent init() function. If a $interface_ca is passed it will be used to generate
 * the raw data. Otherwise settings should be provided to create the control variable. Settings may include:
 * 
 * p -> page
 * ord -> order by
 * dir -> asc/desc
 * s -> search params
 * 
 */
    
    public function init($data_table = NULL) 
    {
        if(!$data_table || !$this->db->table_exists($data_table))
             return NULL;
        
        if(!$this->list_settings)
            $this->list_settings = new stdClass();
        //Initializing the list settings
        
        if(!isseT($this->list_settings->order_column))
            $this->list_settings->order_column = NULL;
        if(!isseT($this->list_settings->page))
            $this->list_settings->page = 1;
        if(!isseT($this->list_settings->search))
            $this->list_settings->search = '';
        
        //Loading the list setup class
        $this->fetcher->interface_file('interface_list','lists', $data_table);
       
        $this->event->trigger('interface_list_setup_before', $this->{$data_table});
        //Running the setup
        $this->{$data_table}->setup($this);
        $this->event->trigger('interface_list_setup_after', $this);
        
        //Initialising the data_table
        $this->data_table = $data_table;
        
        //Initializing the language table 
        $this->_init_lang_table();

        if(!$this->get_setting('parent_column'))
        {
            //Preps the control variable
            $interface_ca = $this->_prep_control();
            
            //Parent init() executed, loads the raw data
            parent::init($data_table, $interface_ca, NULL, TRUE);
        }
        else 
        {
            parent::init($data_table, NULL, NULL, FALSE);
            $this->_get_data_recursive();
        }
        
        //Setting the data counts into the settings array for view access
        $this->list_settings->count_results = $this->count_results;
        $this->list_settings->count_all = $this->count_all;
        
        return $this;
    }
    
    public function set($option, $value) {
        
        if(!$this->list_settings)
            $this->list_settings = new stdClass();
        
        //Don't want to override here. Default params are actually set AFTER the
        //current ones
        if(!isset($this->list_settings->{$option}))
            $this->list_settings->{$option} = $value;
            
        return $this;
    }
    
    public function add_column($column) {
        
        $column = (object)$column;
        
        $this->columns[] = $column;
        return $this;
    }
    
    public function add_action($action) {
        
        $action = (object)$action;
        
        $this->actions[] = $action;
        return $this;
        
    }
    
    public function set_global_action($action) {

        $this->global_action = $action;
        return $this;
        
    }
    
    public function add_search_column($name) {

        $this->search_columns[] = $name;
        return $this;
        
    }
    
    public function add_label($label) {
        
        $label = (object)$label;
        
        $this->labels[] = $label;
        return $this;
    }
    
/**
 * get_setting()
 * 
 * Returns a setting $set or all settings if no parameter is passed
 * 
 */
    public function get_setting($set = NULL)
    {
        if(!$set)
            return $this->list_settings;
        else
            return isset($this->list_settings->{$set}) ? $this->list_settings->{$set} : NULL ;
    }
    
    public function get_actions()
    {
        return $this->actions;
    }
    
    public function get_global_action()
    {
        return $this->global_action;
    }
    
    public function get_search_columns()
    {
        return $this->search_columns;
    }
    
    public function get_labels()
    {
        return $this->labels;
    }
/**
 * render()
 * 
 * The render function displays the list interface. The override view is ... well to override the default view
 * If $return is set to true, the view will be returned instead of rendered.
 * 
 */
    public function render($oview = NULL, $return = FALSE)
    {
        $this->event->trigger('interface_list_render_before', $this);
        //From raw data to one easier to render
        $this->_render_data();
        
        $view = isset($oview) && file_exists(static::VIEWS_BACKEND.$oview)
                ? static::VIEWS_BACKEND.$oview : static::VIEWS_BACKEND.static::LIST_DEFAULT_VIEW;
        
        //The view needs to know which interface is accessing it, thus the caller is passed
        $this->loaded_view = $this->load->view($view,array('data' => $this->pr_data, 'caller' => $this->caller ), $return);
        $this->event->trigger('interface_list_render_after', $this);
        return $this->loaded_view;
    }
    

/*
 * get_link()
 * 
 * This function creates a link to be used in the listing view. For example a pagination link or a link to change order.
 * It can work in two modes. The default returns a URL to the current controler and method with parameters in the following 
 * order: link_name/page/ord_by/ord_dir/?s=search. If the flag return_get is set it will return a link to the current
 * controller and method and pass all variables via $_GET. If the flag show_table is set to 0 the table name will not be included
 * in the link. Both flags are set via set_links method.
 * 
 * The first parameter is an array of overrides that may override each part of the link
 */
    
    public function get_link($overrides)
    {
        
        $link = $this->backend().$this->router->fetch_class().'/'.$this->router->fetch_method().'/'
                .(isset($this->list_settings->link_additional) ? $this->list_settings->link_additional : NULL);
                
        $link .= isset($this->list_settings->link_show_table) && $this->list_settings->link_show_table ? ($this->data_table.'/') : NULL;

        if(!isset($this->list_settings->link_mode) || strtoupper($this->list_settings->link_mode) == "URI")
        {
            $link .= (isset($overrides['p']) ? $overrides['p'] : $this->list_settings->page). '/';
            $link .= (isset($overrides['ord_by']) ? $overrides['ord_by'] : $this->list_settings->order_column) . '/';
            $link .= (isset($overrides['ord_dir']) ? $overrides['ord_dir'] : $this->list_settings->order_direction) . '/';
            $link .= '?search='. (isset($overrides['search']) ? $overrides['search'] : $this->list_settings->search);
        }
        else if(strtoupper($this->list_settings->link_mode) == "GET")
        {
            $link .= "?";
            $link .= 'p='. (isset($overrides['p']) ? $overrides['p'] : $this->list_settings->page);
            $link .= '&ord='. (isset($overrides['ord_by']) ? $overrides['ord_by'] : $this->list_settings->order_column);
            $link .= '&dir='. (isset($overrides['ord_dir']) ? $overrides['ord_dir'] : $this->list_settings->order_direction);
            $link .= '&search='. (isset($overrides['search']) ? $overrides['search'] : $this->list_settings->search);
        }
        
        return $link;
    }
/*
 * render_pagination()
 * 
 * As the name suggests the function helps render the pagination for the listing
 * 
 */
    
    public function pagination()
    {
        if($this->get_setting('parent_column'))
            return NULL;
        
        $pagination = '<div class="btn-group" style="margin:10px;">';
        
            if($this->list_settings->page == 1)
                $pagination .= '<a class="btn btn-default btn-xs disabled" href="">'.$this->translate->t('Prev').'</a>';
            else 
            {
                $prev = $this->get_link(array('p' => $this->list_settings->page - 1));
                $pagination .= '<a class="btn btn-default btn-xs" href="'.$prev.'">'.$this->translate->t('Prev').'</a></li>';
            }

            $max_page = ceil($this->list_settings->count_all / $this->list_settings->rows_per_page);

            for($i = 1; $i <= $max_page; $i++)
            {
                $link = $this->get_link(array('p' => $i));
                $class = ($i == $this->list_settings->page) ? "active" : NULL;
                
                $pagination .= '<a class="btn btn-default btn-xs '.$class.'" href="'.$link.'">'.$i.'</a>';
            }

            if($this->list_settings->page == $max_page)
                $pagination .= '<a class="btn btn-default btn-xs disabled" href="">'.$this->translate->t('Next').'</a>';
            else
            {
                $next = $this->get_link(array('p' => $this->list_settings->page + 1));
                $pagination .= '<a class="btn btn-default btn-xs" href="'.$next.'">'.$this->translate->t('Next').'</a>';
            }

         $pagination .=  "</div>";
         
         return $pagination;
    }
    
    
/*
 * _prep_control()
 * 
 * This function creates a custom control variable if needed.
 * 
 */
    protected function _prep_control()
    {
        $ctrl = new stdClass();
        
        //Setting the limit
        
        if(isset($this->list_settings->rows_per_page))
        {
            $this->list_settings->page = (!isset($this->list_settings->page) || !$this->list_settings->page) ? 1 : $this->list_settings->page;
            $this->list_settings->offset = $this->list_settings->rows_per_page*($this->list_settings->page - 1);
            
            $ctrl->limit = array($this->list_settings->rows_per_page, $this->list_settings->offset);
        }
        
        
        
        //Setting the order
        if(isset($this->list_settings->order_column) && isset($this->list_settings->order_direction)
           && $this->list_settings->order_column && $this->list_settings->order_direction)
            $ctrl->order = array($this->list_settings->order_column, $this->list_settings->order_direction);
        
        
        
        //Setting up the "like" variable
        if(isset($this->list_settings->search) && $this->list_settings->search)
        { 
            foreach($this->search_columns as $sf)
                $ctrl->or_like[$sf] = $this->list_settings->search;
        }
        
        return $ctrl;
        
    }
/**
 * This function loads the data if its hierachical. It loads it recursively by level
 * 
 */
    private function _get_data_recursive($parent = 0, $level = 0)
    {
        $loaded = array();
        $count = "SELECT COUNT(*) as rows ";
        $select = NULL;
        $from = NULL;
        $join = NULL;
        $where = NULL;
        
        if($this->data_table_lang)
        {
            //We will need to know which fields to get from which tables below
            $this->_locate_columns();
            
            //If we have a language table the query will be a bit more complicated
            $select = "SELECT ".$this->_map_select()." ";
            $from = "FROM ".$this->data_table." as t1 ";
            $join = "LEFT JOIN ".$this->data_table_lang." as t2 ON t1.id = t2.id_ ";
            $where = "WHERE (t2.lang_id = IFNULL("
                    . "(SELECT t3.lang_id FROM ".$this->data_table_lang." as t3"
                    . " WHERE t1.id = t3.id_ AND lang_id = '".$this->translate->get_lang()."'), "
                    . "'".$this->translate->get_default_lang(). "')) ";
            $where .= "AND ".$this->get_setting('parent_column')." = '".$parent."'";
        }
        else
        {
            //Otherwise simple stuff
            $select = "SELECT t1.* ";
            $from = "FROM ".$this->data_table." as t1 ";
            $where .= "WHERE ".$this->get_setting('parent_column')." = '".$parent."'";
        }
        
        //And we get our data
        $loaded = $this->db->query($select.$from.$join.$where)->result();
        
        //Counting results
        $this->count_all += $this->db->query($count.$from.$join.$where)->row()->rows;
        $this->count_results += count($loaded);
        
        
        
        //Some formatin to make the data easier for later use
        foreach($loaded as $row)
        {
            if(isset($row->id_))
            {    
                $row->id = $row->id_;
                
                if(!$row->lang_id)
                 $row->lang_id = Translate::DEFAULT_LANG; 
                
                unset($row->id_);   
            }   
            
            //Setting the level of the row
            $row->level = $level;

            //Setting indent
            $row->{$this->get_setting('indent_column')} = str_repeat("&nbsp", $level*4) .
                                                              $row->{$this->get_setting('indent_column')};
            
            $this->raw_data[] = $row;
            $this->_get_data_recursive($row->id, $level + 1);
        }
    }
/*
 * _render_data()
 * 
 * This function uses the settings, labels and raw_data to create an array prototype of the table tha will be rendered in the view. It also
 * uses parser function on the meta language fields.
 * 
 */
    protected function _render_data()
    {
        //We don't have a listing set up
        if(!$this->list_settings)
            return NULL;
        
        $this->pr_data = new stdClass();
        
        //Do we have any columns to list ?
        if(!$this->columns)
        {
            $this->logs->log("NO_LIST_COLUMNS");
            return NULL;
        }
        
        //This will set initial values to the titles and rows arrays
        foreach ($this->columns as $column)
        {
            //The titles array will be used mainly as means dictionary. It maps numerical indexes
            //to the field names, which are the same in the rows below
            $this->pr_data->titles[] = $column->name;
            
            //The first row are the titles
            $this->pr_data->rows[0][] = $column->label;
        }
        
        //Two blank boxes for labels and actions
        $this->pr_data->rows[0] = array_merge($this->pr_data->rows[0], array(NULL,NULL));
        
        if($this->raw_data)
            foreach($this->raw_data as $row)
            {    
                //Setting the raw_data into rows
                $index = count($this->pr_data->rows);
                foreach ($this->columns as $column)
                    $this->pr_data->rows[$index][] = $row->{$column->name};

                //Setting the labels
                $labels = array();
                if($this->labels)
                    foreach($this->labels as $label)
                    {
                        //We clone the $label as it is passed by reference and we want it to stay unchanged
                        $tmp = clone($label);

                        //This line first parses any meta language then parses the resulting condition to 0 and 1
                        $tmp->cond = $this->_parse_cond($this->_parse_vars($tmp->cond, $index));

                        $labels[] = $tmp;

                        //We don't need that $tmp anymore
                        unset($tmp);
                    }

                //Second to last cell of the row
                $this->pr_data->rows[$index][998] = $labels;

                //Setting the actions
                $actions = array();

                if($this->actions)
                    foreach($this->actions as $action)
                    {
                        $tmp = clone $action;
                        $tmp->link = $this->_parse_vars($tmp->link, $index);    
                        $actions[] = $tmp;
                    }

                $this->pr_data->rows[$index][999] = $actions;
            }
    }
    
    protected function _parse_vars($str, $index)
    {
        $matches = array();
        
        //This checks if we are parsing a row or the global action
        if($index >= 0)
        {
            preg_match($this->paterns['row_var'],$str,$matches);
            if($matches)
                $str = str_replace($matches[0], $this->raw_data[$index - 1]->{$matches[1]}, $str);
        }
        
        preg_match($this->paterns['row_num'],$str,$matches);
        if($matches)
        {
            if($matches[1] == "row" && $index >= 0)
                $str = str_replace ($matches[0], $index, $str);
            
            if(property_exists($this, $matches[1]))
                $str = str_replace ($matches[0], $this->{$matches[1]}, $str);
        }      
        
        return $str;
    }
    
    
    protected function _parse_cond($str)
    {
        $matches = NULL;
        preg_match('/(\w+)\s?(<|<=|>=|>|==|!=)\s?(\w+)/',$str,$matches);
        
        if($matches)
        {
            switch ($matches[2])
            {
                case '<': return $matches[1] < $matches[3];break;
                case '<=': return $matches[1] <= $matches[3];break;
                case '>': return $matches[1] > $matches[3];break;
                case '>=': return $matches[1] >= $matches[3];break;
                case '==': return $matches[1] == $matches[3];break;
                case '!=': return $matches[1] != $matches[3];break;
            }
        }
    }
}