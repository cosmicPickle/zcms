<?php

class SQL extends ZCMS {
    
    public function add_lang_table($lang_table, $add_empty_lang_rows = FALSE)
    {
        if(!$add_empty_lang_rows)
            return $this->db->join($lang_table." as t2", " t1.id = t2.id_ ", "left")
                            ->where("(t2.lang_id = IFNULL("
                                    . "(SELECT t3.lang_id FROM ".$lang_table." as t3"
                                    . " WHERE t1.id = t3.id_ AND lang_id = '".$this->translate->get_lang()."'), "
                                    . "'".$this->translate->get_default_lang(). "')) ");
        
        return $this->db->join($lang_table." as t2", " t1.id = t2.id_ "
                               . "AND (t2.lang_id = IFNULL("
                                . "(SELECT t3.lang_id FROM ".$lang_table." as t3"
                                . " WHERE t1.id = t3.id_ AND lang_id = '".$this->translate->get_lang()."'), "
                                . "'".$this->translate->get_default_lang(). "')) ", "left");
        
    }
    
    public function add_lang_table_no_default($lang_table, $add_empty_lang_rows = FALSE)
    {
        if(!$add_empty_lang_rows)
            return $this->db->join($lang_table." as t2", " t1.id = t2.id_ ", "left")
                            ->where("t2.lang_id", $this->translate->get_lang());
        
        return $this->db->join($lang_table." as t2", " t1.id = t2.id_ AND t2.lang_id='".$this->translate->get_lang()."'", "left");
        
    }
    
    /**
     * This function retrieves the path to a node in a hierarchical table
     * 
     * @param type $table
     * @param type $node_id
     * @param type $join_lang
     * @param type $levels
     */
    public function get_node_path($table, $node_id, $join_lang = TRUE, $parent_column = "parent_id")
    {
        $this->db->from($table." as t1");
        if($join_lang)
            $this->add_lang_table ($table.$this->translate->get_table_sufix());
        $this->db->where('t1.id', $node_id);
        
        $node = $this->db->get()->row();
        if($node)
            $node->parent = $this->get_node_path($table, $node->{$parent_column}, $join_lang, $parent_column);
        
        return $node;
    }
}