<?php

class SQL extends ZCMS {
    
    public function add_lang_table($lang_table)
    {
        return $this->db->join($lang_table." as t2", " t1.id = t2.id_ ", "left")
                        ->where("(t2.lang_id = IFNULL("
                                . "(SELECT t3.lang_id FROM ".$lang_table." as t3"
                                . " WHERE t1.id = t3.id_ AND lang_id = '".$this->translate->get_lang()."'), "
                                . "'".$this->translate->get_default_lang(). "')) ");
    }
}
