<?php

class Html_News extends Module_base {
    
    protected $news_id;
    protected $news;
    protected $news_page = "news";
    
    protected $news_table = "html_news";
    protected $news_table_lang;
    
    public function render($count = NULL, $view = "html_news")
    {
        $this->news_id = $this->input->get("id");
        
        $this->_load_news($count);
        $this->_load_view($view, array("news" => $this));
    }
    
    protected function _load_news($count)
    {
        $this->news_table_lang = $this->news_table.$this->translate->get_table_sufix();
        
        $this->db->from($this->news_table." as t1");
        $this->sql->add_lang_table_no_default($this->news_table_lang, FALSE);
        
        if($this->news_id)
            $this->db->where("t1.id", $this->news_id);
        
        $this->db->order_by('date', 'desc');
        
        if($count)
            $this->limit($count);
                       
        $this->event->trigger("html_news_load_before", $this);
        
        $this->news = $this->db->get()->result();
        
        $this->event->trigger("html_news_load_after", $this);
    }
}
