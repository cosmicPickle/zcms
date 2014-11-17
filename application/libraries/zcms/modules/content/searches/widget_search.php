<?php

class Widget_Search extends Content_Search {
    
    var $widgets_table = "content_widgets";
    var $pages_table = "zcms_pages";
    var $menus_table = "menus_frontend_menus";
    var $widgets;
    var $pages;
    var $results = array();
    
    public function search() {
        $this->_fetch();
        $this->_prep_results();
        return $this->results;
    }
    
    protected function _fetch()
    {
       $s = mysql_real_escape_string(urldecode($this->config->s->value));
       
       //Fetching the widgets
       $this->db->from($this->widgets_table." as t1");
       $this->sql->add_lang_table($this->widgets_table.$this->translate->get_table_sufix());
       
       $where = array();
       foreach(explode(",", $this->config->widgets_search_in->value) as $column)
       {
           $where[] = $column . " LIKE '%" . $s . "%'";
       }
       
       $where = "(" . implode(" OR ", $where) . ")";
       $this->db->where($where);
       
       $this->widgets = $this->db->get()->result();
       
       if(!$this->widgets)
           return;
       
       //Fetching the pages they are in
       $this->db->select("t1.*, t2.*, menus.params as menu_params");
       $this->db->from($this->pages_table." as t1");
       $this->sql->add_lang_table($this->pages_table.$this->translate->get_table_sufix());
       $this->db->join($this->menus_table . " as menus", "menus.page_id = t1.page_id");
       
       $where = array();
       foreach($this->widgets as $widget)
       {
           $where[] = "modules LIKE '%widget=". $widget->alias ."%'";
       }
       $where = "(" . implode(" OR ", $where) . ")";
       
       $this->db->where($where);
       $this->pages = $this->db->get()->result();
    }
    
    protected function  _prep_results()
    {
        foreach($this->widgets as $widget)
        {
            $pattern = "#widget\=".$widget->alias."#";
            foreach($this->pages as $page)
            {
                if(preg_match($pattern, $page->modules))
                {
                    $index = count($this->results);
                    
                    $this->results[$index] = new stdClass();
                    $this->results[$index]->title = $widget->title;
                    $this->results[$index]->content = $widget->content;
                    $this->results[$index]->link = $this->page->link(
                        $page->page_id,
                        $page->menu_params,
                        TRUE
                    );

                    foreach(explode(",",$this->config->widgets_search_in->value) as $column)
                    {
                        $this->results[$index]->{$column} = $this->highlight_search($this->results[$index]->{$column});
                        $this->results[$index]->{$column} = $this->trim_search($this->results[$index]->{$column});
                    }
                }
            }
        }
    }
    
}

