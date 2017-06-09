<?php

defined('BASEPATH') or exit('No direct script access allowed');

/**
 * Example Controller.
 */
class Example extends MX_Controller
{
    private $title;
    private $front_template;
    private $admin_template;

    public function __construct()
    {
        parent::__construct();
        $this->load->library('output_view'); // Magic library

        $this->title = 'Hello World'; // Set title page
        $this->front_template = 'template/front_template'; // Set frontend template
        $this->admin_template = 'template/admin_template'; // Set backend template
    }

    /**
     * Frontend Hello World page.
     */
    public function index()
    {
        $this->load->model('bookModel'); // Load smart model
        $data['book'] = $this->bookModel->search(); // Search model
        $data['helloWorld'] = 'Hello World'; // Data send to wrapper

        $this->output_view->set_title($this->title); // Set title page
        $this->output_view->set_wrapper('page', 'hello_world', $data); // Set partial view
        $this->output_view->output($this->front_template); // Render in template
    }

    /**
     * Backend Hello World page.
     */
    public function backend()
    {
        $this->output_view->auth(); // Login required

        $this->load->model('bookModel'); // Load model
        $data['book'] = $this->bookModel->search(); // Find model via smart model
        $data['helloWorld'] = 'Hello World'; // Parsing data example

        $template_data['grocery_css'] = [
            base_url('assets/plugins/highlightjs/styles/tomorrow-night-eighties.css'), // Load css from assets directory
            'https://cdnjs.cloudflare.com/ajax/libs/iCheck/1.0.2/skins/all.css' // Load css from cdn
        ];
        $template_data['grocery_js'] = [
            base_url('assets/plugins/highlightjs/highlight.pack.js'), // Load js from assets directory
            'https://cdnjs.cloudflare.com/ajax/libs/iCheck/1.0.2/icheck.js' // Load js from cdn
        ];
        $template_data['judul'] = 'Hellow World'; // Data send to template
        $template_data['crumb'] = [
            'Hellow World' => '', // Breadcrumb menu
        ];

        $this->output_view->set_title($this->title); // Set title page
        $this->output_view->set_wrapper('page', 'hello_world', $data); // Set partial view
        $this->output_view->output($this->admin_template, $template_data); // Render in template
    }

    /**
     * Backend CRUD Book Page.
     */
    public function crud()
    {
        $this->output_view->auth(); // Login required

        $crud = new grocery_CRUD(); // Load library grocery CRUD

        $crud->set_table('book');
        $crud->set_subject('book');

        $data = (array) $crud->render();

        $template_data['grocery_css'] = $data['css_files'];
        $template_data['grocery_js'] = $data['js_files'];
        $template_data['judul'] = 'CRUD';
        $template_data['crumb'] = [
            'CRUD' => '',
        ];

        $this->output_view->set_wrapper('page', 'grocery', $data, false);
        $this->output_view->output($this->admin_template, $template_data);
    }

    public function regular_view()
    {
        echo "Hello world";
    }
}

/* End of file example.php */
/* Location: ./application/example/controllers/example.php */
