<?php

defined('BASEPATH') or exit('No direct script access allowed');
//test
/**
 * Name : myIgniter base controller.
 *
 * @version 3.9.5
 *
 * @author : Kotaxdev
 */

require_once APPPATH.'libraries/traits/Social_login.php';
require_once APPPATH.'libraries/traits/DB_Manager.php';

class Manageblog extends CI_Controller
{
    
    public function __construct()
    {
        parent::__construct();
		$this->load->library('output_view');
        $this->load->library(array('ckeditor')); //library ckeditor diload
        $this->load->model('categoryModel');
		$this->load->model('commentModel');
		$this->load->model('customModel');
    }

    /**
     * Default page.
     *
     * @return HTML
     **/
    public function index()
    {
        if (!$this->ion_auth->logged_in()) {
            redirect('login');
        } else {
            redirect('manageBlog/newBlog');
        }
    }

    function ckeditorConfig($width,$height) {
		//configure base path of ckeditor folder
		$this->ckeditor->basePath = 'plugins/ckeditor/';
		$this->ckeditor-> config['toolbar'] = 'Full';
		$this->ckeditor->config['language'] = 'en';
		$this->ckeditor-> config['width'] = $width;
		$this->ckeditor-> config['height'] = $height;
	  }
  
	public function newBlog(){
		$this->output_view->auth();
		$template_data['crumb'] = [
            'Blog' => '',
        ];
		$template_data['judul']='Buat Konten Baru';
		$template_data['urlAction'] = 'manageBlog/insert_blog';
		$template_data['categories'] = $this->customModel->get_categories();
		
		$this->ckeditorConfig('100%','500px');
        $this->load->view('template/template_new_blog', $template_data);
	}
	
	
	public function insert_blog(){
		$fieldblog = array();
		$errblog = array();
		//id_blog no need checking

		//checking the path
		$template_data["errpath"]="";
		//uses another field value
		$var_path=$this->input->post("title");
		//check null value
		if($var_path==""){
			$error=1;
			$errorMsg .= '<br>Path tidak boleh kosong!';
			$template_data["errpath"] .= "Path tidak boleh kosong!";
		}
		//change a char
		$var_path = str_replace(" ","-", $var_path);
		$var_path = preg_replace('/[^A-Za-z0-9\-]/', '-', $var_path);
		//slice the value
		$var_path = substr($var_path,0,255);
		//check max length value
		if(strlen($var_path)>255){
			$error=1;
			$errorMsg .= '<br>Path melebihi batas maksimal 255 karakter!';
			$template_data["errpath"] .= "<br>Path melebihi batas maksimal 255 karakter!";
		}
		$template_data["fieldpath"]=$var_path;

		//checking the title
		$template_data["errtitle"]="";
		$var_title=$this->input->post("title");
		//check null value
		if($var_title==""){
			$error=1;
			$errorMsg .= '<br>Judul tidak boleh kosong!';
			$template_data["errtitle"] .= "Judul tidak boleh kosong!";
		}
		//slice the value
		$var_title = substr($var_title,0,255);
		//check max length value
		if(strlen($var_title)>255){
			$error=1;
			$errorMsg .= '<br>Judul melebihi batas maksimal 255 karakter!';
			$template_data["errtitle"] .= "<br>Judul melebihi batas maksimal 255 karakter!";
		}
		$template_data["fieldtitle"]=$var_title;

		//checking the content
		$template_data["errcontent"]="";
		$var_content=$this->input->post("content");
		//check null value
		if($var_content==""){
			$error=1;
			$errorMsg .= '<br>Content tidak boleh kosong!';
			$template_data["errcontent"] .= "Content tidak boleh kosong!";
		}
		$template_data["fieldcontent"]=$var_content;

		//checking the id_user
		$template_data["errid_user"]="";
		//uses default value
		$var_id_user=$this->ion_auth->user()->row()->id;

		$template_data["fieldid_user"]=$var_id_user;

		//created_at no need checking

		//checking the status
		$template_data["errstatus"]="";
		$var_status=$this->input->post("status", false);
		//check null value
		if($var_status==""){
			$error=1;
			$errorMsg .= '<br>Status tidak boleh kosong!';
			$template_data["errstatus"] .= "Status tidak boleh kosong!";
		}
		//check enum options val
		if($var_status != "publish" && $var_status != "hidden"){
			$error=1;
			$errorMsg .= '<br> Pilihan Status tidak ada atau tidak diizinkan!';
			$template_data["errstatus"] .= "<br> Pilihan Status tidak ada atau tidak diizinkan!";
		}
		$template_data["fieldstatus"]=$var_status;

		//checking the publish_time
		$template_data["errpublish_time"]="";
		$var_publish_time=$this->input->post("publish_time");
		//check null value
		if($var_publish_time!="" && !$this->validateDate($var_publish_time)){
			$error=1;
			$errorMsg = '<br>Publish_time tidak boleh kosong!';
			$template_data["errpublish_time"] = "<br>Format Waktu Publish harus yyyy-MM-dd hh:mm:ss!";
		}
		$template_data["fieldpublish_time"]=$var_publish_time;

		//checking the expired_time
		$template_data["errexpired_time"]="";
		$var_expired_time=$this->input->post("expired_time");
		//check null value
		if($var_expired_time!="" && !$this->validateDate($var_expired_time)){
			$error=1;
			$errorMsg .= '<br>Expired_time tidak boleh kosong!';
			$template_data["errexpired_time"] = "<br>Format Waktu Expired harus yyyy-MM-dd hh:mm:ss!";
		}
		$template_data["fieldexpired_time"]=$var_expired_time;
		
		if($error == 1){
			$this->output_view->auth();
			$template_data['crumb'] = [
				'Blog' => '',
			];
			$template_data['judul']='Buat Konten Baru';
			$template_data['urlAction'] = 'manageBlog/insert_blog';
			$template_data['categories'] = $this->customModel->get_categories();
			
			$this->ckeditorConfig('100%','500px');
			$this->load->view('template/template_new_blog', $template_data);
			

			return;
		}
		
		$data = array(
			'path' => $var_path,
			'title' => $var_title,
			'content' => $var_content,
			'id_user' => $var_id_user,
			'status' => $var_status,
			'publish_time' => $var_publish_time,
			'expired_time' => $var_expired_time,
		);

		$id_blog = $this->customModel->insert_a_blog($data);
		
		foreach ($this->input->post('category') as $category_id){
			$data2= array('id_category'=>$category_id, 'id_blog'=>$id_blog);
			$this->customModel->insert_a_categories_blogs($data2);
		}
			
		redirect('manageBlog/editBlog/'.$id_blog);
	}
	
	public function editBlog($id_blog){
		$this->output_view->auth();
		$template_data['crumb'] = [
            'Blog' => '',
        ];
		
		foreach($this->customModel->get_a_blog($id_blog)->result() as $thisblog){
			$template_data['fieldtitle'] = $thisblog->title;
			$template_data['fieldcontent'] = $thisblog->content;
			$template_data['fieldstatus'] = $thisblog->status;
			$template_data['fieldpublish_time'] = $thisblog->publish_time;
			$template_data['fieldexpired_time'] = $thisblog->expired_time;
			$categories = array();
			foreach($this->customModel->get_categories_blogs($id_blog)->result() as $cate){
				$categories[$cate->id_category] = $cate->id_category;
			}
			$template_data['fieldcategory'] = $categories;
			
		}
		
		$template_data['judul']='Ubah blog';
		$template_data['urlAction'] = 'manageBlog/change_blog/'.$id_blog;
		$template_data['categories'] = $this->customModel->get_categories();
		
		$this->ckeditorConfig('100%','500px');
        $this->load->view('template/template_new_blog', $template_data);
	}
	
	public function change_blog($id_blog){
		$fieldblog = array();
		$errblog = array();
		//id_blog no need checking

		//checking the path
		$template_data["errpath"]="";
		//uses another field value
		$var_path=$this->input->post("title");
		//check null value
		if($var_path==""){
			$error=1;
			$errorMsg .= '<br>Path tidak boleh kosong!';
			$template_data["errpath"] .= "Path tidak boleh kosong!";
		}
		//change a char
		$var_path = str_replace(" ","-", $var_path);
		$var_path = preg_replace('/[^A-Za-z0-9\-]/', '', $var_path);
		//slice the value
		$var_path = substr($var_path,0,255);
		//check max length value
		if(strlen($var_path)>255){
			$error=1;
			$errorMsg .= '<br>Path melebihi batas maksimal 255 karakter!';
			$template_data["errpath"] .= "<br>Path melebihi batas maksimal 255 karakter!";
		}
		$template_data["fieldpath"]=$var_path;

		//checking the title
		$template_data["errtitle"]="";
		$var_title=$this->input->post("title");
		//check null value
		if($var_title==""){
			$error=1;
			$errorMsg .= '<br>Judul tidak boleh kosong!';
			$template_data["errtitle"] .= "Judul tidak boleh kosong!";
		}
		//slice the value
		$var_title = substr($var_title,0,255);
		//check max length value
		if(strlen($var_title)>255){
			$error=1;
			$errorMsg .= '<br>Judul melebihi batas maksimal 255 karakter!';
			$template_data["errtitle"] .= "<br>Judul melebihi batas maksimal 255 karakter!";
		}
		$template_data["fieldtitle"]=$var_title;

		//checking the content
		$template_data["errcontent"]="";
		$var_content=$this->input->post("content");
		//check null value
		if($var_content==""){
			$error=1;
			$errorMsg .= '<br>Content tidak boleh kosong!';
			$template_data["errcontent"] .= "Content tidak boleh kosong!";
		}
		$template_data["fieldcontent"]=$var_content;

		//checking the id_user
		$template_data["errid_user"]="";
		//uses default value
		$var_id_user=$this->ion_auth->user()->row()->id;

		$template_data["fieldid_user"]=$var_id_user;

		//created_at no need checking

		//checking the status
		$template_data["errstatus"]="";
		$var_status=$this->input->post("status", false);
		//check null value
		if($var_status==""){
			$error=1;
			$errorMsg .= '<br>Status tidak boleh kosong!';
			$template_data["errstatus"] .= "Status tidak boleh kosong!";
		}
		//check enum options val
		if($var_status != "publish" && $var_status != "hidden"){
			$error=1;
			$errorMsg .= '<br> Pilihan Status tidak ada atau tidak diizinkan!';
			$template_data["errstatus"] .= "<br> Pilihan Status tidak ada atau tidak diizinkan!";
		}
		$template_data["fieldstatus"]=$var_status;

		//checking the publish_time
		$template_data["errpublish_time"]="";
		$var_publish_time=$this->input->post("publish_time");
		//check null value
		if($var_publish_time!="" && !$this->validateDate($var_publish_time)){
			$error=1;
			$errorMsg = '<br>Publish_time tidak boleh kosong!';
			$template_data["errpublish_time"] = "<br>Format Waktu Publish harus yyyy-MM-dd hh:mm:ss!";
		}
		$template_data["fieldpublish_time"]=$var_publish_time;

		//checking the expired_time
		$template_data["errexpired_time"]="";
		$var_expired_time=$this->input->post("expired_time");
		//check null value
		if($var_expired_time!="" && !$this->validateDate($var_expired_time)){
			$error=1;
			$errorMsg .= '<br>Expired_time tidak boleh kosong!';
			$template_data["errexpired_time"] = "<br>Format Waktu Expired harus yyyy-MM-dd hh:mm:ss!";
		}
		$template_data["fieldexpired_time"]=$var_expired_time;
		
		if($error == 1){
			$this->output_view->auth();
			$template_data['crumb'] = [
				'Blog' => '',
			];
			
			foreach($this->customModel->get_a_blog($id_blog)->result() as $thisblog){
				$template_data['fieldtitle'] = $thisblog->title;
				$template_data['fieldcontent'] = $thisblog->content;
				$template_data['fieldstatus'] = $thisblog->status;
				$template_data['fieldpublish_time'] = $thisblog->publish_time;
				$template_data['fieldexpired_time'] = $thisblog->expired_time;
				$categories = array();
				foreach($this->customModel->get_categories_blogs($id_blog)->result() as $cate){
					$categories[$cate->id_category] = $cate->id_category;
				}
				$template_data['fieldcategory'] = $categories;
				
			}
			
			$template_data['judul']='Ubah blog';
			$template_data['urlAction'] = 'manageBlog/change_blog/'.$id_blog;
			$template_data['categories'] = $this->customModel->get_categories();
			
			$this->ckeditorConfig('100%','500px');
			$this->load->view('template/template_new_blog', $template_data);

			return;
		}
		
		$data = array(
			'path' => $var_path,
			'title' => $var_title,
			'content' => $var_content,
			'id_user' => $var_id_user,
			'status' => $var_status,
			'publish_time' => $var_publish_time,
			'expired_time' => $var_expired_time,
		);

		$id_blog = $this->customModel->edit_a_blog($id_blog, $data);
		
		$this->customModel->delete_categories_blogs($id_blog);
		foreach ($this->input->post('category') as $category_id){
			$data2= array('id_category'=>$category_id, 'id_blog'=>$id_blog);
			$this->customModel->insert_a_categories_blogs($data2);
		}
			
		redirect('manageBlog/editBlog/'.$id_blog);
	}
	
	function validateDate($date, $format = 'Y-m-d H:i:s')
	{
		
		$d = DateTime::createFromFormat($format, $date);
		return $d && $d->format($format) == $date;
	}
}

/* End of file Crud.php */
/* Location: ./application/controllers/Crud.php */
