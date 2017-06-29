<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Comment extends CI_Controller
{
    

    public function __construct()
    {
        parent::__construct();
        
    }
	
	public function insert_comment_reply($id_blog){
		$this->load->model('customModel');
		
		$path=$this->customModel->get_a_blog($id_blog)->row()->path;
		$error = 0;
		$errComment = '';
		if ($this->input->post("comment_name") == "") {
			$errComment .= 'Nama tidak boleh kosong!<br>';
			$error           = 1;
		}
		if ($this->input->post("comment_email") == "") {
			$errComment .= 'Email tidak boleh kosong!<br>';
			$error           = 1;
		}elseif (filter_var($this->input->post("comment_email"), FILTER_VALIDATE_EMAIL) && preg_match('/@.+\./', $this->input->post("comment_email"))) {
			$errComment .= 'Email harus benar!<br>';
			$error           = 1;
		}
		if ($this->input->post("comment_parent") == "") {
			$errComment .= 'Komentar parent tidak boleh kosong!<br>';
			$error           = 1;
		}
		if ($this->input->post("comment_message") == "") {
			$errComment .= 'Komentar tidak boleh kosong!<br>';
			$error           = 1;
		}
		$mess = preg_replace('/[^A-Za-z0-9\-]/', '', $this->input->post("comment_message"));
		
		
		$data = array(
			'id_blog'=>$id_blog,
			'comment_name'=>$this->input->post("comment_name"),
			'comment_email'=>$this->input->post("comment_email"),
			'parent_id'=>$this->input->post("comment_parent"),
			'comment_body'=>$mess
		);
		
		if($error!=1){
			if($this->customModel->insert_a_comment($data)){
				echo ("<SCRIPT LANGUAGE='JavaScript'>
						window.alert('Balasan komentar terkirim, butuh verifikasi admin untuk dapat ditampilkan!!')
						window.location.href='".base_url().'blog/read/'.$path.'/'.$id_blog."';
						</SCRIPT>");
			}else{
				echo ("<SCRIPT LANGUAGE='JavaScript'>
					window.alert('Balasan komentar tidak terkirim!!')
					window.location.href='".base_url().'blog/read/'.$path.'/'.$id_blog."';
					</SCRIPT>");
			}
		}else{
			echo ("<SCRIPT LANGUAGE='JavaScript'>
				window.alert('Balasan komentar tidak sesuai!!<br>'".$errComment.")
				window.location.href='".base_url().'blog/read/'.$path.'/'.$id_blog."';
				</SCRIPT>");
		}
	}
	
    public function insert_comment($id_blog){
		
		$this->load->model('customModel');
		
		$path=$this->customModel->get_a_blog($id_blog)->row()->path;
		$error = 0;
		$errComment = '';
		if ($this->input->post("comment_name") == "") {
			$errComment .= 'Nama tidak boleh kosong!<br>';
			$error           = 1;
		}
		if ($this->input->post("comment_email") == "") {
			$errComment .= 'Email tidak boleh kosong!<br>';
			$error           = 1;
		}elseif (filter_var($this->input->post("comment_email"), FILTER_VALIDATE_EMAIL) && preg_match('/@.+\./', $this->input->post("comment_email"))) {
			$errComment .= 'Email harus benar!<br>';
			$error           = 1;
		}
		if ($this->input->post("comment_message") == "") {
			$errComment .= 'Komentar tidak boleh kosong!<br>';
			$error           = 1;
		}
		$mess = preg_replace('/[^A-Za-z0-9\-]/', '', $this->input->post("comment_message"));
		
		
		$data = array(
			'id_blog'=>$id_blog,
			'comment_name'=>$this->input->post("comment_name"),
			'comment_email'=>$this->input->post("comment_email"),
			'comment_body'=>$mess
		);
		
		if($error!=1){
			if($this->customModel->insert_a_comment($data)){
				echo ("<SCRIPT LANGUAGE='JavaScript'>
						window.alert('Komentar terkirim, butuh verifikasi admin untuk dapat ditampilkan!!')
						window.location.href='".base_url().'blog/read/'.$path.'/'.$id_blog."';
						</SCRIPT>");
			}else{
				echo ("<SCRIPT LANGUAGE='JavaScript'>
					window.alert('Komentar tidak terkirim!!')
					window.location.href='".base_url().'blog/read/'.$path.'/'.$id_blog."';
					</SCRIPT>");
			}
		}else{
			echo ("<SCRIPT LANGUAGE='JavaScript'>
				window.alert('Komentar tidak sesuai!!<br>'".$errComment.")
				window.location.href='".base_url().'blog/read/'.$path.'/'.$id_blog."';
				</SCRIPT>");
		}
		
	}
}

/* End of file blog.php */
/* Location: ./application/controllers/blog.php */
