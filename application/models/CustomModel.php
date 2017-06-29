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
	
	function get_blogs($limit = null, $start = null){
		$this->db->select("*");
		$this->db->from('blog');
		$this->db->where('status', 'publish');
		$this->db->where('publish_time <= now()');
		$this->db->where('(expired_time >= now() or expired_time = \'0000-00-00 00:00:00\')');
		if($limit != null && start != null){
			$this->db->limit($limit, $start);
		}
		$this->db->order_by('publish_time desc');
		$query = $this->db->get();
		return $query;
	}
		
	function insert_a_blog($data){
		$this->db->insert('blog',$data);
		//return $this->db->affected_rows() ? true : false;
		$insert_id = $this->db->insert_id();

		return  $insert_id;
	}
	
	function edit_a_blog($id_blog, $data){
		$this->db->where('id_blog', $id_blog);
		$this->db->update('blog',$data);
		
		return  $id_blog;
	}
	
	function delete_categories_blogs($id_blog){
		$this->db->where('id_blog', $id_blog);
		$this->db->delete('categories_blogs');
		return $this->db->affected_rows() ? true : false;
	}
	
	function get_categories(){
		$this->db->select("*");
		$this->db->from('category');
		$query = $this->db->get();
		return $query;
	}
	
	function get_categories_blogs($id_blog){
		$this->db->select("*");
		$this->db->from('categories_blogs');
		$this->db->where('id_blog', $id_blog);
		$query = $this->db->get();
		return $query;
	}
	
	function insert_a_categories_blogs($data){
		$this->db->insert('categories_blogs',$data);
		return $this->db->affected_rows() ? true : false;
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
