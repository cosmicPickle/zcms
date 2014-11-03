<?php

class Content_Article extends Module_Base {
    
    protected $articles_table = "content_articles";
    protected $category_table = "content_categories";
    protected $admins_table = "zcms_admins";
    protected $alias_404 = "404_page_not_found";
    protected $alias_uncategorised = "uncategorised";
    protected $article = NULL;
    protected $category = NULL;
    
    public function fetch()
    {
        $fetch_function = "_fetch_".$this->config->view_type->value;
        $this->{$fetch_function}();
    }
    
    public function render()
    {
        $this->_override_meta_info();
        parent::render();
    }
    
    public function preview_content($content)
    {
        if($this->config->preview->value
           && mb_strlen($content) > $this->config->preview->value)
        {
            $cut_at = $this->config->preview->value;
            while($content[$cut_at] != ' ')
                $cut_at ++;
            
            return mb_strcut($content,0,$cut_at). " ...";
        }
            
        return $content;
    }
    
    protected function _fetch_single_article()
    {
        if(!$this->config->article->value)
            $this->config->article->value = $this->alias_404;
        
        //Fetching the article
        $this->db->from($this->articles_table." as t1");
        $this->sql->add_lang_table($this->articles_table.$this->translate->get_table_sufix());
        $this->db->where('alias',$this->config->article->value);
        $this->article = $this->db->get()->row();
        
        //Article doesn't exists. Will rerun with default article
        if(!$this->article)
        {
            $this->config->article->value = NULL;
            $this->_fetch_single_article();
            return NULL;
        }
        
        //Fetching the category
        $this->db->from($this->category_table." as t1");
        $this->sql->add_lang_table($this->category_table.$this->translate->get_table_sufix());
        $this->db->where('alias', $this->article->category);
        $this->article->category = $this->db->get()->row();
        
        //Fetching author
        $this->db->from($this->admins_table." as t1");
        $this->sql->add_lang_table($this->admins_table.$this->translate->get_table_sufix());
        $this->db->where('id_', $this->article->author);
        $this->article->author = $this->db->get()->row();
        
        $this->view_data = array('article' => $this->get_article());
    }
    
    protected function _fetch_category_article()
    {
        if(!$this->config->category->value)
            $this->config->category->value = $this->alias_uncategorised;
        
        //Fetching the category
        $this->db->from($this->category_table." as t1");
        $this->sql->add_lang_table($this->category_table.$this->translate->get_table_sufix());
        $this->db->where('alias', $this->config->category->value);
        $this->category = $this->db->get()->row();

        //Article doesn't exists. Will rerun with default article
        if(!$this->category)
        {
            $this->config->category->value = NULL;
            $this->_fetch_category_article();
            return NULL;
        }
        
        //Fetching the articles
        $this->db->from($this->articles_table." as t1");
        $this->sql->add_lang_table($this->articles_table.$this->translate->get_table_sufix());
        $this->db->where('category',$this->category->alias);
        
        //Getting the whole count of articles before adding the limit
        $db_ = clone($this->db);
        $this->category->article_count = $db_->count_all_results();
        
        //Ordering the collection of articles
        if(isset($this->config->order_by->value) && $this->config->order_by->value)
        {
            $od = isset($this->config->order_dir->value) ? $this->config->order_dir->value : 'asc';
            $ob = $this->config->order_by->value;
            
            $this->db->order_by($ob,$od);
        }
        
        //Setting pagination
        if(isset($this->config->pagination->value) && $this->config->pagination->value)
        {
            $limit = $this->config->items_per_page->value;
            $offset = ($this->config->article_page->value - 1)*$this->config->items_per_page->value;
            
            $this->db->limit($limit, $offset);
        }
        else if(isset($this->config->limit->value) && $this->config->limit->value)
        {
            //If there is no pagination but there is a limit
            $this->db->limit($this->config->limit->value);
        }
        
        $this->category->articles = $this->db->get()->result();
        
        //Loading article authors
        if($this->config->show_author)
        {
            $ids = array();
            foreach($this->category->articles as $article)
                if(!in_array($article->author, $ids))
                     $ids[] = $article->author;
                
            //Fetching the articles
            $this->db->from($this->admins_table." as t1");
            $this->sql->add_lang_table($this->admins_table.$this->translate->get_table_sufix());
            $this->db->where_in('id_',$ids);
            
            $authors = $this->db->get()->result();
            
            foreach($authors as $author)
                foreach($this->category->articles as $article)
                    if($author->id_ == $article->author)
                        $article->author = $author;
        }
        
        $this->view_data = array('category' => $this->get_category()); 
    }
    
    protected function _override_meta_info()
    {
        if($this->config->meta_use_title->value)
            $this->page->set_title(($this->article) ? $this->article->title : $this->category->label);
        if($this->config->meta_use_keywords->value)
            $this->page->set_keywords(($this->article) ? $this->article->keywords : $this->category->keywords);
        if($this->config->meta_use_description->value)
            $this->page->set_description(($this->article) ? $this->article->description : $this->category->description);
        
    }
}
