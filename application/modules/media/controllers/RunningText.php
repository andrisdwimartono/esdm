<?php

defined('BASEPATH') or exit('No direct script access allowed');

class RunningText extends MX_Controller
{
    private $title;
    private $front_template;
    private $admin_template;

    private $limit = 5;

    /**
     * Modules instalation.
     *
     * @return JSON
     **/
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

    public function index()
    {
		$this->output_view->auth();
		
        $crud = new grocery_CRUD();

        $crud->set_table('running_text');
        $crud->set_subject('Running Text');

        $segment = $this->uri->segment(4);

        if ($segment != 'edit' && $segment != 'add') {
	        $crud->set_relation('id_user', 'users', 'username');
        }
		
        $crud->change_field_type('id_user', 'hidden');
        $crud->change_field_type('Status', 'true_false');
		
        $crud->columns('content', 'gambar', 'id_user', 'waktu_publish', 'waktu_berakhir','status');
        $crud->callback_before_insert(array($this, 'savePath'));
        $crud->callback_before_update(array($this, 'savePath'));
        $crud->display_as('id_user', 'Username');
        $crud->callback_column('content', array($this, 'linkChoice'));
		
        $data = (array) $crud->render();

        $template_data['grocery_css'] = $data['css_files'];
        $template_data['grocery_js'] = $data['js_files'];
        $template_data['judul'] = 'Running Text';
        $template_data['crumb'] = [
            'Running Text' => ''
        ];

        $this->output_view->set_wrapper('page', 'grocery', $data, false);
        $this->output_view->output($this->admin_template, $template_data);
    }
	
    public function linkChoice($value, $row)
    {
    	return '<p> ' .$value . '</p>';
    }
	
    public function savePath($post_array, $primary_key = null)
    {
    	$post_array['id_user'] = $this->ion_auth->user()->row()->id;
    	return $post_array;
    }
	
}

/* End of file media.php */
/* Location: ./application/controllers/media.php */
