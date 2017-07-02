<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Users extends MX_Controller
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
		
        $this->title = 'Blog';
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
	
	public function manage_users()
    {
        $this->output_view->auth();

        $crud = new grocery_CRUD();

        $crud->set_table('users');
        $crud->set_subject('users');

        // $crud->unset_fields('created_at');
		 $crud->unset_add();
		// $crud->unset_delete();
		// $crud->unset_read();
		// $crud->unset_edit();
		//$crud->add_action('More', '', 'demo/action_more','ui-icon-plus');//not work
		//$crud->add_action('Ubah', '', '','fa fa-pencil', array($this, 'ubah_sebuah_blog'));
		//$crud->add_action('Comments', '', '','fa fa-comments', array($this, 'comment_sebuah_blog'));
        $segment = $this->uri->segment(3);
        if ($segment != 'edit' && $segment != 'add') {
	        //$crud->set_relation('id_user', 'users', 'username');
        }
        // $crud->change_field_type('path', 'hidden');
        // $crud->change_field_type('id_user', 'hidden');
		// $crud->change_field_type('title', 'input');
		
		
		
		// $crud->change_field_type('publish_time', 'datetime');
		// $crud->change_field_type('status', 'enum');
        // $crud->change_field_type('content', 'text');
		// $crud->unset_columns('content', 'path');
		$crud->unset_jquery();
        $crud->columns('username', 'full_name', 'email', 'active', 'ip_address');
        // $crud->set_relation_n_n('Categories', 'categories_blogs', 'category', 'id_blog', 'id_category', 'category');
		
        $crud->callback_before_insert(array($this, 'savePath'));
        $crud->callback_before_update(array($this, 'savePath'));
        // $crud->display_as('id_user', 'Username');
        // $crud->callback_column('title', array($this, 'linkBlog'));

        $data = (array) $crud->render();

        $template_data['grocery_css'] = $data['css_files'];
        $template_data['grocery_js'] = $data['js_files'];
        $template_data['judul'] = 'Daftar Akun';
        $template_data['crumb'] = [
            'Admin' => 'dashboard',
			'users'=>'manage_users'
        ];

        $this->output_view->set_wrapper('page', 'grocery', $data, false);
        $this->output_view->output('template/admin_blog_template', $template_data);
    }
	
}

/* End of file blog.php */
/* Location: ./application/controllers/blog.php */
