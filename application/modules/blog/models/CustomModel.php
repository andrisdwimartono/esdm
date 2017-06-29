<?php

defined('BASEPATH') or exit('No direct script access allowed');

class CustomModel extends CI_Model
{
    

    public function __construct()
    {
        parent::__construct();
        //$this->table = 'comment';
    }
	function get_a_blog($id_blog){
		$this->db->select("*");
		$this->db->from('blog');
		$this->db->where('id_blog', $id_blog);
		$query = $this->db->get();
		return $query;
	}
	
	function insert_a_comment($data){
		$this->db->insert('comment',$data);
		return $this->db->affected_rows() ? true : false;
	}
	function update_a_comment($comment_id, $data){
		$this->db->where('comment_id', $comment_id);
		$this->db->update('comment',$data);
		return $this->db->affected_rows() ? true : false;
	}
	
	
}

/* End of file categoryModel.php */
/* Location: ./application/models/categoryModel.php */
