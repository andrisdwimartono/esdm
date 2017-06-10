<?php

defined('BASEPATH') or exit('No direct script access allowed');

class RunningTextModel extends MY_Model
{
    public $table;

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->table = 'running_text';
    }
	
	public function getRunningText(){
		$this->db->select('content');	
		$this->db->from($this->table);
		$this->db->where('status', 1);
        $query = $this->db->get();
		
        return $query->result();
	}
}

/* End of file mediaModel.php */
/* Location: ./application/models/mediaModel.php */
