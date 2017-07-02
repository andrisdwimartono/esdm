<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Blog extends MX_Controller
{
    private $title;
    private $front_template;
    private $admin_template;

    private $limit = 10;

    public function __construct()
    {
        parent::__construct();
        $this->load->library('output_view');
		$this->load->library(array('ckeditor')); //library ckeditor diload
		
        $this->title = 'ESDM';
        $this->front_template = 'template/front_template';
		$this->frontend_template = 'template/frontend_template';
        $this->admin_template = 'template/admin_template';
		$this->admin_blog_template = 'template/admin_blog_template';
		$this->administrator_template = 'template/administrator_template';
    }

    public function index($offset = 0)
    {
        $this->load->library('pagination');
        $this->load->model('blogModel');
        $this->load->model('categoryModel');
		$this->load->model('commentModel');
		$this->load->model('customModel');
		$this->load->model('RunningTextModel');
		
        $this->db->join('users', 'blog.id_user = users.id', 'left');
        $model = $this->blogModel->search("blog.status = 'publish' and blog.publish_time <= now() and (blog.expired_time >= now()or blog.expired_time = '0000-00-00 00:00:00' or blog.expired_time is null) order by blog.publish_time desc", $this->limit, $offset);
		//$model2 = $this->customModel->get_blogs(null, $this->limit, $offset);
        $count = $this->blogModel->count("blog.status = 'publish' and blog.publish_time <= now() and (blog.expired_time >= now()or blog.expired_time = '0000-00-00 00:00:00' or blog.expired_time is null) order by blog.publish_time desc");
		
		
		// $this->db->join('users', 'blog.id_user = users.id', 'left');
        // $model = $this->blogModel->search("blog.status = 'publish' and blog.publish_time <= now() order by blog.publish_time desc", $this->limit, $offset);
		// //$count = count($model->array_result());
        // $count = $this->blogModel->count("status = 'publish' and publish_time <= now() order by publish_time desc");

        $config['base_url'] = site_url('blog/index');
        $config['total_rows'] = $count;
        $config['per_page'] = $this->limit;
        $config['uri_segment'] = 3;
        $config['num_links'] = 5;
        $config['full_tag_open'] = '<br><br><ul class="pagination">';
        $config['full_tag_close'] = '</ul>';
        $config['first_link'] = 'First';
        $config['first_tag_open'] = '<li>';
        $config['first_tag_close'] = '</li>';
        $config['last_link'] = 'Last';
        $config['last_tag_open'] = '<li>';
        $config['last_tag_close'] = '</li>';
        $config['next_link'] = 'Next';
        $config['next_tag_open'] = '<li>';
        $config['next_tag_close'] = '</li>';
        $config['prev_link'] = 'Previous';
        $config['prev_tag_open'] = '<li>';
        $config['prev_tag_close'] = '</li>';
        $config['num_tag_open'] = '<li class="paginate_button">';
        $config['num_tag_close'] = '</li>';
        $config['cur_tag_open'] = '<li class="paginate_button active"><a>';
        $config['cur_tag_close'] = '</a></li>';
        
        $this->pagination->initialize($config);
        
        $data = [
            'model' => $model,
            'pagination' => $this->pagination->create_links()
        ];
		$template_data['running_text'] = $this->RunningTextModel->getRunningText();
		
        $this->output_view->set_title($this->title);
        $this->output_view->set_wrapper('page', 'index', $data);
        $this->output_view->output('template/blog_template', $template_data);
    }
	
	
	
	public function read($path, $id)
    {
    	$this->load->model('blogModel');
    	$this->load->model('categoryModel');
		$this->load->model('commentModel');
		
    	$this->db->join('users', 'blog.id_user = users.id', 'left');
    	$model = $this->blogModel->single(['blog.id_blog' => $id]);

    	$this->db->join('categories_blogs', 'category.id = categories_blogs.id_category', 'left');
    	$category = $this->categoryModel->search(['id_blog' => $id]);
		
    	$comments = $this->commentModel->search(['id_blog' => $id, 'parent_id'=>null]);
		$comments_replies = $this->commentModel->search(['id_blog' => $id, 'parent_id!=null']);
    	$data = [
	    	'model' => $model,
	    	'categories' => $category,
			'url_path' => base_url().'blog/read/'.$path.'/'.$id,
			'comments' => $comments,
			'comments_replies' => $comments_replies
    	];

        $this->output_view->set_title($model->title);
        $this->output_view->set_wrapper('page', 'read', $data);
        $this->output_view->output($this->front_template);
    }
	
	function ckeditorConfig($width,$height) {
		//configure base path of ckeditor folder
		$this->ckeditor->basePath = 'plugins/ckeditor/';
		$this->ckeditor-> config['toolbar'] = 'Full';
		$this->ckeditor->config['language'] = 'en';
		$this->ckeditor-> config['width'] = $width;
		$this->ckeditor-> config['height'] = $height;
	  }
  
	public function manage()
    {
        $this->output_view->auth();

        $crud = new grocery_CRUD();

        $crud->set_table('blog');
        $crud->set_subject('Blog');

        $crud->unset_fields('created_at');
		$crud->unset_add();
		$crud->unset_delete();
		$crud->unset_read();
		$crud->unset_edit();
		//$crud->add_action('More', '', 'demo/action_more','ui-icon-plus');//not work
		$crud->add_action('Ubah', '', '','fa fa-pencil', array($this, 'ubah_sebuah_blog'));
		//$crud->add_action('Comments', '', '','fa fa-comments', array($this, 'comment_sebuah_blog'));
        $segment = $this->uri->segment(3);
        if ($segment != 'edit' && $segment != 'add') {
	        $crud->set_relation('id_user', 'users', 'username');
        }
        $crud->change_field_type('path', 'hidden');
        $crud->change_field_type('id_user', 'hidden');
		$crud->change_field_type('title', 'input');
		
		
		
		$crud->change_field_type('publish_time', 'datetime');
		$crud->change_field_type('status', 'enum');
        $crud->change_field_type('content', 'text');
		$crud->unset_columns('content', 'path');
		$crud->unset_jquery();
        $crud->columns('title', 'Categories', 'id_user', 'created_at', 'publish_time', 'expired_time');
        $crud->set_relation_n_n('Categories', 'categories_blogs', 'category', 'id_blog', 'id_category', 'category');
		
        $crud->callback_before_insert(array($this, 'savePath'));
        $crud->callback_before_update(array($this, 'savePath'));
        $crud->display_as('id_user', 'Username');
        $crud->callback_column('title', array($this, 'linkBlog'));

        $data = (array) $crud->render();

        $template_data['grocery_css'] = $data['css_files'];
        $template_data['grocery_js'] = $data['js_files'];
        $template_data['judul'] = 'Buat Konten Blog Baru seperti Berita, Pengumuman, dan lainnya';
        $template_data['crumb'] = [
            'Blog' => '',
        ];

        $this->output_view->set_wrapper('page', 'grocery', $data, false);
        $this->output_view->output($this->admin_blog_template, $template_data);
    }
	
	function ubah_sebuah_blog($value, $row){
		return site_url('manageBlog/editBlog/'.$row->id_blog);
	}
	
	function comment_sebuah_blog($value, $row){
		return site_url('managecomment/comments/'.$row->id_blog);
	}

    public function linkBlog($value, $row)
    {
    	return '<a href="' . site_url('blog/read/' . $row->path . '/' . $row->id_blog) . '" title="' . $value .'">' . $value . '</a>';
    }

    public function savePath($post_array, $primary_key = null)
    {
    	$path = strtolower(urlencode(str_replace(' ', '-', $post_array['title'])));
    	$post_array['path'] = $path;
    	$post_array['id_user'] = $this->ion_auth->user()->row()->id;

    	return $post_array;
    }

    public function category()
    {
        $this->output_view->auth();

        $crud = new grocery_CRUD();

        $crud->set_table('category');
        $crud->set_subject('Category');

        $crud->unset_fields('created_at');

        $data = (array) $crud->render();

        $template_data['grocery_css'] = $data['css_files'];
        $template_data['grocery_js'] = $data['js_files'];
        $template_data['judul'] = 'Blog Category';
        $template_data['crumb'] = [
            'Blog Category' => '',
        ];

        $this->output_view->set_wrapper('page', 'grocery', $data, false);
        $this->output_view->output($this->admin_template, $template_data);
    }
	
	public function insert_comment($id_blog){
		$this->load->model('customModel');
		
		$path=$this->customModel->get_a_blog($id_blog)->row()->path;
		$error = 0;
		$errComment = '';
		if ($this->input->post("comment_name") == "") {
			$errComment .= 'Nama tidak boleh kosong!\\n';
			$error           = 1;
		}elseif(strlen($this->input->post("comment_name"))>100){
			$errComment .= 'Nama terlalu panjang!\\n';
			$error           = 1;
		}
		
		$co_name = preg_replace('[\<]', '&lt;', $this->input->post("comment_name"));
		$co_name = preg_replace('[\>]', '&gt;', $co_name);
		
		if($this->ion_auth->logged_in()){
			$co_name = '<b>'.$this->ion_auth->user()->row()->full_name.'</b>';
		}
		
		if ($this->input->post("comment_email") == "") {
			$errComment .= 'Email tidak boleh kosong!\\n';
			$error           = 1;
		}elseif (!(filter_var($this->input->post("comment_email"), FILTER_VALIDATE_EMAIL) && preg_match('/@.+\./', $this->input->post("comment_email")))) {
			$errComment .= 'Email harus benar!\\n';
			$error           = 1;
		}elseif(strlen($this->input->post("comment_email"))>100){
			$errComment .= 'Email terlalu panjang!\\n';
			$error           = 1;
		}
		
		$co_email = preg_replace('[\<]', '&lt;', $this->input->post("comment_email"));
		$co_email = preg_replace('[\>]', '&gt;', $co_email);
		
		
		if ($this->input->post("comment_message") == "") {
			$errComment .= 'Komentar tidak boleh kosong!\\n';
			$error           = 1;
		}
		//$mess = preg_replace('/[^A-Za-z0-9\-\)\(\:]/', ' ', $this->input->post("comment_message"));
		$mess = preg_replace('[\<]', '&lt;', $this->input->post("comment_message"));
		$mess = preg_replace('[\>]', '&gt;', $mess);
		
		$data = array(
			'id_blog'=>$id_blog,
			'comment_name'=>$co_name,
			'comment_email'=>$co_email,
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
				window.alert('Komentar tidak sesuai!!\\n".$errComment."')
				window.location.href='".base_url().'blog/read/'.$path.'/'.$id_blog."';
				</SCRIPT>");
		}
	}
	
	public function insert_comment_reply($id_blog){
		$this->load->model('customModel');
		
		$path=$this->customModel->get_a_blog($id_blog)->row()->path;
		$error = 0;
		$errComment = '';
		if ($this->input->post("comment_name") == "") {
			$errComment .= 'Nama tidak boleh kosong!\\n';
			$error           = 1;
		}elseif(strlen($this->input->post("comment_name"))>100){
			$errComment .= 'Nama terlalu panjang!\\n';
			$error           = 1;
		}
		
		$co_name = preg_replace('[\<]', '&lt;', $this->input->post("comment_name"));
		$co_name = preg_replace('[\>]', '&gt;', $co_name);
		
		if($this->ion_auth->logged_in()){
			$co_name = '<b>'.$this->ion_auth->user()->row()->full_name.'</b>';
		}
		
		if ($this->input->post("comment_email") == "") {
			$errComment .= 'Email tidak boleh kosong!\\n';
			$error           = 1;
		}elseif (!(filter_var($this->input->post("comment_email"), FILTER_VALIDATE_EMAIL) && preg_match('/@.+\./', $this->input->post("comment_email")))) {
			$errComment .= 'Email harus benar!\\n';
			$error           = 1;
		}elseif(strlen($this->input->post("comment_email"))>100){
			$errComment .= 'Email terlalu panjang!\\n';
			$error           = 1;
		}
		
		$co_email = preg_replace('[\<]', '&lt;', $this->input->post("comment_email"));
		$co_email = preg_replace('[\>]', '&gt;', $co_email);
		if ($this->input->post("comment_parent") == "") {
			$errComment .= 'Komentar parent tidak boleh kosong!<br>';
			$error           = 1;
		}
		if ($this->input->post("comment_message") == "") {
			$errComment .= 'Komentar tidak boleh kosong!\\n';
			$error           = 1;
		}
		//$mess = preg_replace('/[^A-Za-z0-9\-\)\(\:]/', ' ', $this->input->post("comment_message"));
		$mess = preg_replace('[\<]', '&lt;', $this->input->post("comment_message"));
		$mess = preg_replace('[\>]', '&gt;', $mess);
		
		$data = array(
			'id_blog'=>$id_blog,
			'comment_name'=>$co_name,
			'comment_email'=>$co_email,
			'parent_id'=>$this->input->post("comment_parent"),
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
				window.alert('Komentar tidak sesuai!!\\n".$errComment."')
				window.location.href='".base_url().'blog/read/'.$path.'/'.$id_blog."';
				</SCRIPT>");
		}
	}
	
		
	public function accept_comment($comment_id, $id_blog, $state){
		$this->load->model('blogModel');
		$this->load->model('customModel');
		$this->output_view->auth();
		
		$path=$this->customModel->get_a_blog($id_blog)->row()->path;
		
		if($this->customModel->update_a_comment($comment_id, array('comment_state'=>$state))){
			if($state=="accepted")
				echo ("<SCRIPT LANGUAGE='JavaScript'>
					window.alert('Komentar terverivikasi!!')
					window.location.href='".base_url().'blog/read/'.$path.'/'.$id_blog."';
					</SCRIPT>");
			else
				echo ("<SCRIPT LANGUAGE='JavaScript'>
					window.alert('Komentar dihapus!!')
					window.location.href='".base_url().'blog/read/'.$path.'/'.$id_blog."';
					</SCRIPT>");
		}else{
			if($state=="accepted")
				echo ("<SCRIPT LANGUAGE='JavaScript'>
					window.alert('Komentar gagal diverivikasi!!')
					window.location.href='".base_url().'blog/read/'.$path.'/'.$id_blog."';
					</SCRIPT>");
			else
				echo ("<SCRIPT LANGUAGE='JavaScript'>
					window.alert('Komentar gagal dihapus!!')
					window.location.href='".base_url().'blog/read/'.$path.'/'.$id_blog."';
					</SCRIPT>");
		}
		
	}
	
	public function artikel($offset = 0)
    {
        $this->load->library('pagination');
        $this->load->model('blogModel');
        $this->load->model('categoryModel');
		$this->load->model('commentModel');
		$this->load->model('customModel');
		$this->load->model('RunningTextModel');
		
        $this->db->join('users', 'blog.id_user = users.id', 'left');
		$this->db->join('categories_blogs', 'blog.id_blog = categories_blogs.id_blog', 'inner');
		$this->db->join('category', 'category.id = categories_blogs.id_category and category.category = \'Artikel\'', 'inner');
        $model = $this->blogModel->search("blog.status = 'publish' and blog.publish_time <= now() and (blog.expired_time >= now()or blog.expired_time = '0000-00-00 00:00:00' or blog.expired_time is null) order by blog.publish_time desc", $this->limit, $offset);
		
		$this->db->join('users', 'blog.id_user = users.id', 'left');
		$this->db->join('categories_blogs', 'blog.id_blog = categories_blogs.id_blog', 'inner');
		$this->db->join('category', 'category.id = categories_blogs.id_category and category.category = \'Artikel\'', 'inner');
		$model2 = $this->blogModel->search("blog.status = 'publish' and blog.publish_time <= now() and (blog.expired_time >= now()or blog.expired_time = '0000-00-00 00:00:00' or blog.expired_time is null) order by blog.publish_time desc");
        $count = count($model2);

        $config['base_url'] = site_url('blog/artikel/');
        $config['total_rows'] = $count;
        $config['per_page'] = $this->limit;
        $config['uri_segment'] = 3;
        $config['num_links'] = 5;
        $config['full_tag_open'] = '<br><br><ul class="pagination">';
        $config['full_tag_close'] = '</ul>';
        $config['first_link'] = 'First';
        $config['first_tag_open'] = '<li>';
        $config['first_tag_close'] = '</li>';
        $config['last_link'] = 'Last';
        $config['last_tag_open'] = '<li>';
        $config['last_tag_close'] = '</li>';
        $config['next_link'] = 'Next';
        $config['next_tag_open'] = '<li>';
        $config['next_tag_close'] = '</li>';
        $config['prev_link'] = 'Previous';
        $config['prev_tag_open'] = '<li>';
        $config['prev_tag_close'] = '</li>';
        $config['num_tag_open'] = '<li class="paginate_button">';
        $config['num_tag_close'] = '</li>';
        $config['cur_tag_open'] = '<li class="paginate_button active"><a>';
        $config['cur_tag_close'] = '</a></li>';
        
        $this->pagination->initialize($config);
        
        $data = [
            'model' => $model,
            'pagination' => $this->pagination->create_links(),
			'category' => 'Artikel'
        ];
		$template_data['running_text'] = $this->RunningTextModel->getRunningText();
		
        $this->output_view->set_title($this->title);
        $this->output_view->set_wrapper('page', 'blog_by_category', $data);
        $this->output_view->output('template/blog_template', $template_data);
    }
	
	public function informasi($offset = 0)
    {
        $this->load->library('pagination');
        $this->load->model('blogModel');
        $this->load->model('categoryModel');
		$this->load->model('commentModel');
		$this->load->model('customModel');
		$this->load->model('RunningTextModel');
		
        $this->db->join('users', 'blog.id_user = users.id', 'left');
		$this->db->join('categories_blogs', 'blog.id_blog = categories_blogs.id_blog', 'inner');
		$this->db->join('category', 'category.id = categories_blogs.id_category and category.category = \'Informasi\'', 'inner');
        $model = $this->blogModel->search("blog.status = 'publish' and blog.publish_time <= now() and (blog.expired_time >= now()or blog.expired_time = '0000-00-00 00:00:00' or blog.expired_time is null) order by blog.publish_time desc", $this->limit, $offset);
		
		$this->db->join('users', 'blog.id_user = users.id', 'left');
		$this->db->join('categories_blogs', 'blog.id_blog = categories_blogs.id_blog', 'inner');
		$this->db->join('category', 'category.id = categories_blogs.id_category and category.category = \'Informasi\'', 'inner');
		$model2 = $this->blogModel->search("blog.status = 'publish' and blog.publish_time <= now() and (blog.expired_time >= now()or blog.expired_time = '0000-00-00 00:00:00' or blog.expired_time is null) order by blog.publish_time desc");
        $count = count($model2);

        $config['base_url'] = site_url('blog/informasi/');
        $config['total_rows'] = $count;
        $config['per_page'] = $this->limit;
        $config['uri_segment'] = 3;
        $config['num_links'] = 5;
        $config['full_tag_open'] = '<br><br><ul class="pagination">';
        $config['full_tag_close'] = '</ul>';
        $config['first_link'] = 'First';
        $config['first_tag_open'] = '<li>';
        $config['first_tag_close'] = '</li>';
        $config['last_link'] = 'Last';
        $config['last_tag_open'] = '<li>';
        $config['last_tag_close'] = '</li>';
        $config['next_link'] = 'Next';
        $config['next_tag_open'] = '<li>';
        $config['next_tag_close'] = '</li>';
        $config['prev_link'] = 'Previous';
        $config['prev_tag_open'] = '<li>';
        $config['prev_tag_close'] = '</li>';
        $config['num_tag_open'] = '<li class="paginate_button">';
        $config['num_tag_close'] = '</li>';
        $config['cur_tag_open'] = '<li class="paginate_button active"><a>';
        $config['cur_tag_close'] = '</a></li>';
        
        $this->pagination->initialize($config);
        
        $data = [
            'model' => $model,
            'pagination' => $this->pagination->create_links(),
			'category' => 'Informasi'
        ];
		$template_data['running_text'] = $this->RunningTextModel->getRunningText();
		
        $this->output_view->set_title($this->title);
        $this->output_view->set_wrapper('page', 'blog_by_category', $data);
        $this->output_view->output('template/blog_template', $template_data);
    }
	
	public function faq($offset = 0)
    {
        $this->load->library('pagination');
        $this->load->model('blogModel');
        $this->load->model('categoryModel');
		$this->load->model('commentModel');
		$this->load->model('customModel');
		$this->load->model('RunningTextModel');
		
        $this->db->join('users', 'blog.id_user = users.id', 'left');
		$this->db->join('categories_blogs', 'blog.id_blog = categories_blogs.id_blog', 'inner');
		$this->db->join('category', 'category.id = categories_blogs.id_category and category.category = \'FAQ\'', 'inner');
        $model = $this->blogModel->search("blog.status = 'publish' and blog.publish_time <= now() and (blog.expired_time >= now()or blog.expired_time = '0000-00-00 00:00:00' or blog.expired_time is null) order by blog.publish_time desc", $this->limit, $offset);
		
		$this->db->join('users', 'blog.id_user = users.id', 'left');
		$this->db->join('categories_blogs', 'blog.id_blog = categories_blogs.id_blog', 'inner');
		$this->db->join('category', 'category.id = categories_blogs.id_category and category.category = \'FAQ\'', 'inner');
		$model2 = $this->blogModel->search("blog.status = 'publish' and blog.publish_time <= now() and (blog.expired_time >= now()or blog.expired_time = '0000-00-00 00:00:00' or blog.expired_time is null) order by blog.publish_time desc");
        $count = count($model2);

        $config['base_url'] = site_url('blog/faq/');
        $config['total_rows'] = $count;
        $config['per_page'] = $this->limit;
        $config['uri_segment'] = 3;
        $config['num_links'] = 5;
        $config['full_tag_open'] = '<br><br><ul class="pagination">';
        $config['full_tag_close'] = '</ul>';
        $config['first_link'] = 'First';
        $config['first_tag_open'] = '<li>';
        $config['first_tag_close'] = '</li>';
        $config['last_link'] = 'Last';
        $config['last_tag_open'] = '<li>';
        $config['last_tag_close'] = '</li>';
        $config['next_link'] = 'Next';
        $config['next_tag_open'] = '<li>';
        $config['next_tag_close'] = '</li>';
        $config['prev_link'] = 'Previous';
        $config['prev_tag_open'] = '<li>';
        $config['prev_tag_close'] = '</li>';
        $config['num_tag_open'] = '<li class="paginate_button">';
        $config['num_tag_close'] = '</li>';
        $config['cur_tag_open'] = '<li class="paginate_button active"><a>';
        $config['cur_tag_close'] = '</a></li>';
        
        $this->pagination->initialize($config);
        
        $data = [
            'model' => $model,
            'pagination' => $this->pagination->create_links(),
			'category' => 'FAQ'
        ];
		$template_data['running_text'] = $this->RunningTextModel->getRunningText();
		
        $this->output_view->set_title($this->title);
        $this->output_view->set_wrapper('page', 'blog_by_category', $data);
        $this->output_view->output('template/blog_template', $template_data);
    }
	
	public function berita($offset = 0)
    {
        $this->load->library('pagination');
        $this->load->model('blogModel');
        $this->load->model('categoryModel');
		$this->load->model('commentModel');
		$this->load->model('customModel');
		$this->load->model('RunningTextModel');
		
        $this->db->join('users', 'blog.id_user = users.id', 'left');
		$this->db->join('categories_blogs', 'blog.id_blog = categories_blogs.id_blog', 'inner');
		$this->db->join('category', 'category.id = categories_blogs.id_category and category.category = \'Berita\'', 'inner');
        $model = $this->blogModel->search("blog.status = 'publish' and blog.publish_time <= now() and (blog.expired_time >= now()or blog.expired_time = '0000-00-00 00:00:00' or blog.expired_time is null) order by blog.publish_time desc", $this->limit, $offset);
		
		$this->db->join('users', 'blog.id_user = users.id', 'left');
		$this->db->join('categories_blogs', 'blog.id_blog = categories_blogs.id_blog', 'inner');
		$this->db->join('category', 'category.id = categories_blogs.id_category and category.category = \'Berita\'', 'inner');
		$model2 = $this->blogModel->search("blog.status = 'publish' and blog.publish_time <= now() and (blog.expired_time >= now()or blog.expired_time = '0000-00-00 00:00:00' or blog.expired_time is null) order by blog.publish_time desc");
        $count = count($model2);

        $config['base_url'] = site_url('blog/berita/');
        $config['total_rows'] = $count;
        $config['per_page'] = $this->limit;
        $config['uri_segment'] = 3;
        $config['num_links'] = 5;
        $config['full_tag_open'] = '<br><br><ul class="pagination">';
        $config['full_tag_close'] = '</ul>';
        $config['first_link'] = 'First';
        $config['first_tag_open'] = '<li>';
        $config['first_tag_close'] = '</li>';
        $config['last_link'] = 'Last';
        $config['last_tag_open'] = '<li>';
        $config['last_tag_close'] = '</li>';
        $config['next_link'] = 'Next';
        $config['next_tag_open'] = '<li>';
        $config['next_tag_close'] = '</li>';
        $config['prev_link'] = 'Previous';
        $config['prev_tag_open'] = '<li>';
        $config['prev_tag_close'] = '</li>';
        $config['num_tag_open'] = '<li class="paginate_button">';
        $config['num_tag_close'] = '</li>';
        $config['cur_tag_open'] = '<li class="paginate_button active"><a>';
        $config['cur_tag_close'] = '</a></li>';
        
        $this->pagination->initialize($config);
        
        $data = [
            'model' => $model,
            'pagination' => $this->pagination->create_links(),
			'category' => 'Berita'
        ];
		$template_data['running_text'] = $this->RunningTextModel->getRunningText();
		
        $this->output_view->set_title($this->title);
        $this->output_view->set_wrapper('page', 'blog_by_category', $data);
        $this->output_view->output('template/blog_template', $template_data);
    }
	
	public function opini($offset = 0)
    {
        $this->load->library('pagination');
        $this->load->model('blogModel');
        $this->load->model('categoryModel');
		$this->load->model('commentModel');
		$this->load->model('customModel');
		$this->load->model('RunningTextModel');
		
        $this->db->join('users', 'blog.id_user = users.id', 'left');
		$this->db->join('categories_blogs', 'blog.id_blog = categories_blogs.id_blog', 'inner');
		$this->db->join('category', 'category.id = categories_blogs.id_category and category.category = \'Opini\'', 'inner');
        $model = $this->blogModel->search("blog.status = 'publish' and blog.publish_time <= now() and (blog.expired_time >= now()or blog.expired_time = '0000-00-00 00:00:00' or blog.expired_time is null) order by blog.publish_time desc", $this->limit, $offset);
		
		$this->db->join('users', 'blog.id_user = users.id', 'left');
		$this->db->join('categories_blogs', 'blog.id_blog = categories_blogs.id_blog', 'inner');
		$this->db->join('category', 'category.id = categories_blogs.id_category and category.category = \'Opini\'', 'inner');
		$model2 = $this->blogModel->search("blog.status = 'publish' and blog.publish_time <= now() and (blog.expired_time >= now()or blog.expired_time = '0000-00-00 00:00:00' or blog.expired_time is null) order by blog.publish_time desc");
        $count = count($model2);

        $config['base_url'] = site_url('blog/opini/');
        $config['total_rows'] = $count;
        $config['per_page'] = $this->limit;
        $config['uri_segment'] = 3;
        $config['num_links'] = 5;
        $config['full_tag_open'] = '<br><br><ul class="pagination">';
        $config['full_tag_close'] = '</ul>';
        $config['first_link'] = 'First';
        $config['first_tag_open'] = '<li>';
        $config['first_tag_close'] = '</li>';
        $config['last_link'] = 'Last';
        $config['last_tag_open'] = '<li>';
        $config['last_tag_close'] = '</li>';
        $config['next_link'] = 'Next';
        $config['next_tag_open'] = '<li>';
        $config['next_tag_close'] = '</li>';
        $config['prev_link'] = 'Previous';
        $config['prev_tag_open'] = '<li>';
        $config['prev_tag_close'] = '</li>';
        $config['num_tag_open'] = '<li class="paginate_button">';
        $config['num_tag_close'] = '</li>';
        $config['cur_tag_open'] = '<li class="paginate_button active"><a>';
        $config['cur_tag_close'] = '</a></li>';
        
        $this->pagination->initialize($config);
        
        $data = [
            'model' => $model,
            'pagination' => $this->pagination->create_links(),
			'category' => 'Opini'
        ];
		$template_data['running_text'] = $this->RunningTextModel->getRunningText();
		
        $this->output_view->set_title($this->title);
        $this->output_view->set_wrapper('page', 'blog_by_category', $data);
        $this->output_view->output('template/blog_template', $template_data);
    }
	
	public function search($offset=0)
    {
		$search=$this->input->get("search"); 
        $this->load->library('pagination');
        $this->load->model('blogModel');
        $this->load->model('categoryModel');
		$this->load->model('commentModel');
		$this->load->model('customModel');
		$this->load->model('RunningTextModel');
		
        $this->db->join('users', 'blog.id_user = users.id', 'left');
        $model = $this->blogModel->search("(blog.title like '%".$search."%' or blog.content like '%".$search."%') and blog.status = 'publish' and blog.publish_time <= now() and (blog.expired_time >= now()or blog.expired_time = '0000-00-00 00:00:00' or blog.expired_time is null) order by blog.publish_time desc", $this->limit, $offset);
		
		$this->db->join('users', 'blog.id_user = users.id', 'left');
		$model2 = $this->blogModel->search("(blog.title like '%".$search."%' or blog.content like '%".$search."%') and blog.status = 'publish' and blog.publish_time <= now() and (blog.expired_time >= now()or blog.expired_time = '0000-00-00 00:00:00' or blog.expired_time is null) order by blog.publish_time desc");
        $count = count($model2);

        $config['base_url'] = site_url('blog/search/'.$category);
        $config['total_rows'] = $count;
        $config['per_page'] = $this->limit;
        $config['uri_segment'] = 3;
        $config['num_links'] = 5;
        $config['full_tag_open'] = '<br><br><ul class="pagination">';
        $config['full_tag_close'] = '</ul>';
        $config['first_link'] = 'First';
        $config['first_tag_open'] = '<li>';
        $config['first_tag_close'] = '</li>';
        $config['last_link'] = 'Last';
        $config['last_tag_open'] = '<li>';
        $config['last_tag_close'] = '</li>';
        $config['next_link'] = 'Next';
        $config['next_tag_open'] = '<li>';
        $config['next_tag_close'] = '</li>';
        $config['prev_link'] = 'Previous';
        $config['prev_tag_open'] = '<li>';
        $config['prev_tag_close'] = '</li>';
        $config['num_tag_open'] = '<li class="paginate_button">';
        $config['num_tag_close'] = '</li>';
        $config['cur_tag_open'] = '<li class="paginate_button active"><a>';
        $config['cur_tag_close'] = '</a></li>';
        
        $this->pagination->initialize($config);
        
        $data = [
            'model' => $model,
            'pagination' => $this->pagination->create_links()
        ];
		$template_data['running_text'] = $this->RunningTextModel->getRunningText();
		
        $this->output_view->set_title($this->title);
		$this->output_view->set_wrapper('page', 'index', $data);
        $this->output_view->output('template/blog_template', $template_data);
    }
}

/* End of file blog.php */
/* Location: ./application/controllers/blog.php */
