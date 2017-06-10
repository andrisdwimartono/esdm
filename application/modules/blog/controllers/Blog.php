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

        $this->title = 'Blog';
        $this->front_template = 'template/front_template';
		$this->frontend_template = 'template/frontend_template';
        $this->admin_template = 'template/admin_template';
		$this->administrator_template = 'template/administrator_template';
    }

    public function index($offset = 0)
    {
        $this->load->library('pagination');
        $this->load->model('blogModel');
        $this->load->model('categoryModel');

        $this->db->join('users', 'blog.id_user = users.id', 'left');
        $model = $this->blogModel->search(null, $this->limit, $offset);
        $count = $this->blogModel->count();

        $config['base_url'] = site_url('blog/index');
        $config['total_rows'] = $count;
        $config['per_page'] = $this->limit;
        $config['uri_segment'] = 3;
        $config['num_links'] = 5;
        $config['full_tag_open'] = '<ul class="pagination">';
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

        $this->output_view->set_title($this->title);
        $this->output_view->set_wrapper('page', 'index', $data);
        $this->output_view->output('template/blog_template');
    }

    public function read($path, $id)
    {
    	$this->load->model('blogModel');
    	$this->load->model('categoryModel');

    	$this->db->join('users', 'blog.id_user = users.id', 'left');
    	$model = $this->blogModel->single(['blog.id_blog' => $id]);

    	$this->db->join('categories_blogs', 'category.id = categories_blogs.id_category', 'left');
    	$category = $this->categoryModel->search(['id_blog' => $id]);
    	$data = [
	    	'model' => $model,
	    	'categories' => $category
    	];

        $this->output_view->set_title($model->title);
        $this->output_view->set_wrapper('page', 'read', $data);
        $this->output_view->output($this->front_template);
    }

    public function manage()
    {
        $this->output_view->auth();

        $crud = new grocery_CRUD();

        $crud->set_table('blog');
        $crud->set_subject('Blog');

        $crud->unset_fields('created_at');
        $segment = $this->uri->segment(3);
        if ($segment != 'edit' && $segment != 'add') {
	        $crud->set_relation('id_user', 'users', 'username');
        }
        $crud->change_field_type('path', 'hidden');
        $crud->change_field_type('id_user', 'hidden');
		$crud->change_field_type('content', 'Textarea');
		
        $crud->unset_columns('content', 'path');
        $crud->columns('title', 'Categories', 'id_user', 'created_at', 'publish_time', 'expired_time');
        $crud->set_relation_n_n('Categories', 'categories_blogs', 'category', 'id_blog', 'id_category', 'category');
        $crud->callback_before_insert(array($this, 'savePath'));
        $crud->callback_before_update(array($this, 'savePath'));
        $crud->display_as('id_user', 'Username');
        $crud->callback_column('title', array($this, 'linkBlog'));

        $data = (array) $crud->render();

        $template_data['grocery_css'] = $data['css_files'];
        $template_data['grocery_js'] = $data['js_files'];
        $template_data['judul'] = 'Blog Starter';
        $template_data['crumb'] = [
            'Blog' => '',
        ];

        $this->output_view->set_wrapper('page', 'grocery', $data, false);
        $this->output_view->output($this->admin_template, $template_data);
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
}

/* End of file blog.php */
/* Location: ./application/controllers/blog.php */
