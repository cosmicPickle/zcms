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
    
    //The settings of the current listing
    private $list_settings = NULL;
    //The override settings object
    private $or_settings = NULL;
    
    //The listing labels
    private $list_labels = NULL;
    
    //The processed data will be saved here
    private $pr_data = NULL;
    
    //Table names
    private $table_affix = 'zcms_list_';
    private $settings_table = NULL;
    private $settings_table_lang = NULL;
    private $labels_table = NULL;
    private $labels_table_lang = NULL;
    
    //Recognisable patterns for string parsing
    //The first pattern matches {@var_name} and will be replaced with the value of the 'var_name' column of the current row
    //The second pattern matches {#property} and will be replaced with the $this->(property) or with the number of the current
    //row if property = row
    private $paterns = array('row_var' => '/\{@(\w*)\}/','row_num' => '/\{#(\w*)\}/');
    
    //Links flags
    private $link_show_table = 1;
    private $link_return_get = 0;
    private $link_tail = '';
    
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
    
    public function init($data_table = NULL, $interface_ca = NULL, $settings = NULL, $fetch_data = TRUE) 
    {
        if(!$data_table || !$this->db->table_exists($data_table))
             return NULL;
        
        //Initialising the data_table
        $this->data_table = $data_table;
        
        //Initializing the language table 
        $this->_init_lang_table();
        
        //Sets the tables
        $this->_set_tables();
        
        //Loads listing settings from the database
        $this->_fetch_settings();
        
        //We don't have a listing set up
        if(!$this->list_settings)
            return NULL;
        
        //Loads the labels
        $this->_fetch_labels();
        
        //Preps the control variable
        $this->_prep_control($interface_ca, $settings);
        
        //Parent init() executed, loads the raw data
        parent::init($data_table, $interface_ca, $settings, $fetch_data);
        
        //Setting the data counts into the settings array for view access
        $this->list_settings->count_results = $this->count_results;
        $this->list_settings->count_all = $this->count_all;
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
        //From raw data to one easier to render
        $this->_render_data();
        
        $view = isset($oview) && file_exists(self::VIEWS_BACKEND.$oview)
                ? self::VIEWS_BACKEND.$oview : self::VIEWS_BACKEND.self::LIST_DEFAULT_VIEW;
        
        //The view needs to know which interface is accessing it, thus the caller is passed
        return $this->load->view($view,array('data' => $this->pr_data, 'caller' => $this->caller ), $return);
    }
  
/**
 * fetch_setting()
 * 
 * Returns a setting $set or all settings if no parameter is passed
 * 
 */
    public function fetch_settings($set = NULL)
    {
        if(!$set)
            return $this->list_settings;
        else
            isset($this->list_settings->{$set}) ? $this->list_settings->{$set} : NULL ;
    }

/**
 * or_setting()
 * 
 * This function can override most of the default settings. Correct syntax must be followed for each setting, otherwise
 * there may be unexpected behavior.
 * 
 */
    
    public function or_setting($set, $val)
    {
        if(in_array($set, array('id','link','p','offset','count_results','count_all')))
            return FALSE;
        
        $this->or_settings = new stdClass();
        $this->or_settings->{$set} = $val;
        return TRUE;
    }
    
/**
 * set_links()
 * 
 * Sets the flags that are to be used with get_link()
 * 
 * @param boolean if set to TRUE get_link() will work in GET mode
 * @param boolean if set to FALSE the table name will be omited by get_link()
 * @param string any additional parameters that will be inserted befor the actual link
 * 
 */
    public function set_links($return_get = 0, $show_table = 1, $tail = '')
    {
        $this->link_return_get = $return_get;
        $this->link_show_table = $show_table;
        $this->link_tail = $tail;
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
        $link = $this->backend().$this->router->fetch_class().'/'.$this->router->fetch_method().'/'.$this->link_tail;
                
        $link .= ($this->link_show_table) ? ($this->data_table.'/') : NULL;
        
        if(!$this->link_return_get)
        {
            $link .= (isset($overrides['p']) ? $overrides['p'] : $this->list_settings->p). '/';
            $link .= (isset($overrides['ord_by']) ? $overrides['ord_by'] : $this->list_settings->ord_by) . '/';
            $link .= (isset($overrides['ord_dir']) ? $overrides['ord_dir'] : $this->list_settings->ord_dir) . '/';
            $link .= '?s='. (isset($overrides['search']) ? $overrides['search'] : $this->list_settings->search);
        }
        else
        {
            $link .= "?";
            $link .= 'p='. (isset($overrides['p']) ? $overrides['p'] : $this->list_settings->p);
            $link .= '&ord='. (isset($overrides['ord_by']) ? $overrides['ord_by'] : $this->list_settings->ord_by);
            $link .= '&dir='. (isset($overrides['ord_dir']) ? $overrides['ord_dir'] : $this->list_settings->ord_dir);
            $link .= '&s='. (isset($overrides['search']) ? $overrides['search'] : $this->list_settings->search);
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
        $pagination = '<div class="pagination span7">
                            <ul>';
        
            if($this->list_settings->p == 1)
                $pagination .= '<li class="disabled"><a href="">'.$this->translate->t('Prev').'</a></li>';
            else 
            {
                $prev = $this->get_link(array('p' => $this->list_settings->p - 1));
                $pagination .= '<li><a href="'.$prev.'">'.$this->translate->t('Prev').'</a></li>';
            }

            $max_page = ceil($this->list_settings->count_all / $this->list_settings->rpp);

            for($i = 1; $i <= $max_page; $i++)
            {
                $link = $this->get_link(array('p' => $i));
                $class = ($i == $this->list_settings->p) ? " class='active' " : NULL;
                
                $pagination .= '<li'.$class.'><a href="'.$link.'">'.$i.'</a></li>';
            }

            if($this->list_settings->p == $max_page)
                $pagination .= '<li class="disabled"><a href="">'.$this->translate->t('Next').'</a></li>';
            else
            {
                $next = $this->get_link(array('p' => $this->list_settings->p + 1));
                $pagination .= '<li><a href="'.$next.'">'.$this->translate->t('Next').'</a></li>';
            }

         $pagination .=  "</ul>
                        </div>";
         
         return $pagination;
    }
    
/*
 * _set_tables()
 * 
 * This function sets the settings and labels listing tables, as well as the language tables
 * 
 */  
      private function _set_tables()
      {
          $this->settings_table = $this->table_affix."settings";
          $this->labels_table = $this->table_affix."labels";
          
          if($this->translate->get_table_sufix())
          {
              $this->settings_table_lang = $this->settings_table.$this->translate->get_table_sufix();
              $this->labels_table_lang = $this->labels_table.$this->translate->get_table_sufix();
          }
      }
    
/*
 * _fetch_settings()
 * 
 * This function loads the settings from the database
 * 
 */
    private function _fetch_settings()
    {
        if($this->settings_table_lang)
        {
            $cols = $this->db->list_fields($this->settings_table);
            $lcols = $this->db->list_fields($this->settings_table_lang);

            $select = array('t1.*');

            foreach($lcols as $lcol)
                if($lcol != 'id')
                    $select[] = in_array($lcol, $cols) ? 'IFNULL(t2.'.$lcol.',t1.'.$lcol.') as '.$lcol : 't2.'.$lcol;

            $this->list_settings = $this->db->select(implode(', ', $select), FALSE)
                                            ->from($this->settings_table." as t1")
                                            ->join($this->settings_table_lang." as t2", "t2.id_ = t1.id", 'left')
                                            ->where("(t2.lang_id = '".$this->translate->get_lang()."' OR t2.lang_id IS NULL) AND t1.link = '".$this->data_table."'")
                                            ->get()
                                            ->row();
        }
        else
        {
            $this->list_settings = $this->db->where('t1.link', $this->data_table)
                                            ->get($this->settings_table." as t1")
                                            ->row();
        }
        
        //If we didnt get any settings we don't have a listing added
        if(!$this->list_settings)
            $this->logs->log("NO_LISTING");
        else
        //We have a listing we have to parse the global action
            $this->list_settings->global_action = $this->_parse_vars($this->list_settings->global_action, -1);
        
        //Overriding defaults with the or_settings object
        if($this->or_settings)
            foreach($this->or_settings as $or_key => $or_val)
                if(isset($this->list_settings->{$or_key}))
                    $this->list_settings->{$or_key} = $or_val;
                    
    }
    
/*
 * _fetch_labels()
 * 
 * This function fetches settings about the listing labels.
 * 
 */
    
    private function _fetch_labels()
    {
        if($this->labels_table_lang)
        {
            $cols = $this->db->list_fields($this->labels_table);
            $lcols = $this->db->list_fields($this->labels_table_lang);

            $select = array('t1.*');

            foreach($lcols as $lcol)
                if($lcol != 'id')
                    $select[] = in_array($lcol, $cols) ? 'IFNULL(t2.'.$lcol.',t1.'.$lcol.') as '.$lcol : 't2.'.$lcol;

            $this->list_labels = $this->db->select(implode(', ', $select), FALSE)
                                          ->from($this->labels_table." as t1")
                                          ->join($this->labels_table_lang." as t2", "t2.id_ = t1.id", 'left')
                                          ->where(array('t2.lang_id' => $this->translate->get_lang(), 't1.list_id' => $this->list_settings->id))
                                          ->get()
                                          ->result();
        }
        else
        {
            $this->list_labels = $this->db->where('t1.list_id', $this->list_settings->id)
                                          ->get($this->labels_table." as t1")
                                          ->result();
        }
    }
    
/*
 * _prep_control()
 * 
 * This function creates a custom control variable if needed.
 * 
 */
    private function _prep_control(&$ctrl, $settings)
    {
        if(!$ctrl)
            $ctrl = new stdClass();
        
        $settings = (object) $settings;
        
        //Setting the limit
        $this->list_settings->p = (!isset($settings->p) || !$settings->p) ? 1 : $settings->p;
        $this->list_settings->offset = $this->list_settings->rpp*($this->list_settings->p - 1);
        $ctrl->limit = array($this->list_settings->rpp, $this->list_settings->offset);
        
        
        //Setting the order
        $this->list_settings->ord_by = (!isset($settings->ord) || !$settings->ord) ? $this->list_settings->ord_by : $settings->ord;
        $this->list_settings->ord_dir = (!isset($settings->dir) || !$settings->dir) ? 'asc' : $settings->dir;
        
        $ctrl->order = array($this->list_settings->ord_by, $this->list_settings->ord_dir);
        
        //Setting up the "like" variable
        $this->list_settings->search = NULL;
        if(isset($settings->s) && $settings->s)
        { 
            $this->list_settings->search = $settings->s;
            foreach(json_decode($this->list_settings->search_fields) as $sf)
                $ctrl->or_like[$sf] = $settings->s;
        }
        
    }
/*
 * _render_data()
 * 
 * This function uses the settings, labels and raw_data to create an array prototype of the table tha will be rendered in the view. It also
 * uses parser function on the meta language fields.
 * 
 */
    private function _render_data()
    {
        //We don't have a listing set up
        if(!$this->list_settings)
            return NULL;
        
        $columns = json_decode($this->list_settings->columns);
        $this->pr_data = new stdClass();
        
        //Do we have any columns to list ?
        if(!$columns)
        {
            $this->logs->log("NO_LIST_COLUMNS");
            return NULL;
        }
        
        //This will set initial values to the titles and rows arrays
        foreach ($columns as $key => $column)
        {
            //The titles array will be used mainly as means dictionary. It maps numerical indexes
            //to the field names, which are the same in the rows below
            $this->pr_data->titles[] = $key;
            
            //The first row are the titles
            $this->pr_data->rows[0][] = $column;
        }
        
        //Two blank boxes for labels and actions
        $this->pr_data->rows[0] = array_merge($this->pr_data->rows[0], array(NULL,NULL));
        
        foreach($this->raw_data as $row)
        {    
            //Setting the raw_data into rows
            $index = count($this->pr_data->rows);
            foreach ($columns as $key => $column)
                $this->pr_data->rows[$index][] = $row->{$key};
                
            //Setting the labels
            $labels = array();
            foreach($this->list_labels as $label)
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
            if($raw_acts = json_decode($this->list_settings->actions))
                foreach($raw_acts as $action)
                {
                    $action->link = $this->_parse_vars($action->link, $index);    
                    $actions[] = $action;
                }

            $this->pr_data->rows[$index][999] = $actions;
        }
    }
    
    private function _parse_vars($str, $index)
    {
        $matches = array();
        
        //This checks if we are parsing a row or the global action
        if($index >= 0)
        {
            preg_match($this->paterns['row_var'],$str,$matches);

            if($matches)
                $str = str_replace($matches[0], $this->pr_data->rows[$index][array_search($matches[1], $this->pr_data->titles)], $str);
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
    
    
    private function _parse_cond($str)
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
    
    /*
     * Developer section functions
     * 
     * The following functions will be used to edit the settings of the listing interface. They will be accessible through 
     * the developer controller.
     * 
     */
    public function dev_add_column($id)
    {
        
        $post = $this->input->post();
        $data = array('action' => 'add_column');
        
        $table = $this->table_affix."settings";
        $table_lang = $this->translate->get_table_sufix() ? $table.$this->translate->get_table_sufix() : NULL;
        
        if($table_lang)
            $this->db->select('t2.columns')
                     ->from($table." as t1")
                     ->join($table_lang." as t2", "t1.id = t2.id_ AND t2.lang_id = '".$this->translate->get_lang()."'")
                     ->where('t1.link', $id);
        else
        {
                $this->db->select('columns')
                         ->from($table)
                         ->where('link', $id);
                
        }
        $current_cols = (array)json_decode($this->db->get()->row()->columns);
        
        $data['columns'] = $this->db->list_fields($id);       
        foreach($data['columns'] as $key => $val)
            if(array_key_exists($val,$current_cols))
                unset($data['columns'][$key]);
        
        if($post)
        {
            $break = FALSE;
            if(!$post['column'])
            {    
                $this->logs->log('INP_REQUIRED', $this->translate->t('Column Id'));
                $break = TRUE;
            }
            if(!$post['label'])
            {    
                $this->logs->log('INP_REQUIRED', $this->translate->t('Column Label'));
                $break = TRUE;
            }
            if(!$break)
            {
                $new_cols = json_encode(array_merge($current_cols, array($post['column'] => $post['label'])));
                unset($data['columns'][array_search($post['column'], $data['columns'])]);
                
                $id_ = $this->db->select('id')->where('link', $id)->get($table)->row()->id;
                
                if(!$table_lang)
                {
                    $this->db->where('link',$id);
                    $this->db->update($table, array('columns' => $new_cols));
                    $this->logs->log('MODIFY_SUCCESS');
                }
                else
                {
                    $this->db->where(array('id_' => $id_, 'lang_id' => $this->translate->get_lang()));
                    $this->db->update($table_lang, array('columns' => $new_cols));
                    $this->logs->log('MODIFY_SUCCESS');
                }
            }
        }
        
        
        $this->load->view(self::VIEWS_BACKEND . 'listing_actions', $data);
    }
    
    public function dev_remove_column($id)
    {
        $post = $this->input->post();
        $data = array('action' => 'remove_column');
        
        $table = $this->table_affix."settings";
        $table_lang = $this->translate->get_table_sufix() ? $table.$this->translate->get_table_sufix() : NULL;
        
        if($table_lang)
            $this->db->select('t2.columns')
                     ->from($table." as t1")
                     ->join($table_lang." as t2", "t1.id = t2.id_ AND t2.lang_id = '".$this->translate->get_lang()."'")
                     ->where('t1.link', $id);
        else
        {
                $this->db->select('columns')
                         ->from($table)
                         ->where('link', $id);
                
        }
        $current_cols = (array)json_decode($this->db->get()->row()->columns);
        
        $data['columns'] = $current_cols;
        if($post)
        {
            if(!$post['column'])  
                $this->logs->log('INP_REQUIRED', $this->translate->t('Column Id'));
            else
            {
                unset($current_cols[$post['column']]);
                unset($data['columns'][$post['column']]);
                
                $id_ = $this->db->select('id')->where('link', $id)->get($table)->row()->id;
                
                if(!$table_lang)
                {
                    $this->db->where('link',$id);
                    $this->db->update($table, array('columns' => json_encode($current_cols)));
                    $this->logs->log('MODIFY_SUCCESS');
                }
                else
                {
                    $this->db->where(array('id_' => $id_, 'lang_id' => $this->translate->get_lang()));
                    $this->db->update($table_lang, array('columns' => json_encode($current_cols)));
                    $this->logs->log('MODIFY_SUCCESS');
                }
            }
        }
        
        $this->load->view(self::VIEWS_BACKEND . 'listing_actions', $data);
    }
}