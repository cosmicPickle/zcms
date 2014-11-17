<?php

class Article_Search extends Content_Search {
    
    var $articles_table = "content_articles";
    var $articles_table_lang;
    var $articles;
    var $results;
    
    public function search() {
        $this->_fetch_articles();
        $this->_prep_results();
        return $this->results;
    }
    
    protected function _fetch_articles()
    {
        //Fetching the article
        $this->db->from($this->articles_table." as t1");
        $this->sql->add_lang_table($this->articles_table.$this->translate->get_table_sufix());
        
        $where = array();
        $s = mysql_real_escape_string(urldecode($this->config->s->value));
        foreach(explode(",", $this->config->article_search_in->value) as $column)
        {
            $where[] = $column . " LIKE '%" . $s . "%'";
        }
        
        $where = "(" . implode(" OR ", $where) . ")";
        
        $this->db->where($where);
        $this->articles = $this->db->get()->result();
    }
    
    protected function  _prep_results()
    {
        foreach($this->articles as $article)
        {
            $index = count($this->results);
            $this->results[$index] = new stdClass();
            $this->results[$index]->title = $article->title;
            $this->results[$index]->content = $article->content;
            $this->results[$index]->link = $this->page->link(
                $this->config->single_article_page->value,
                array('article' => $article->alias),
                TRUE
            );
            
            foreach(explode(",",$this->config->article_search_in->value) as $column)
            {
                $this->results[$index]->{$column} = $this->highlight_search($this->results[$index]->{$column});
                $this->results[$index]->{$column} = $this->trim_search($this->results[$index]->{$column});
            }
        }
    }
    
}

