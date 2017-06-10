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
    public function module()
    {
        $module = [
            'name' => 'Media',
            'menu_link' => ['media/index' => 'View media'],
            'table' => '',
            'description' => 'Module media',
        ];

        return $module;
    }

    public function __construct()
    {
        parent::__construct();
        $this->load->library('output_view');
        $this->load->library('Image_moo');
        $this->load->library('upload');

        $this->title = 'Running Text';
        $this->front_template = 'template/front_template';
        $this->admin_template = 'template/admin_template';
        $this->output_view->auth();
    }

    public function index()
    {

		$this->output_view->auth();
		
        $crud = new grocery_CRUD();

        $crud->set_table('running_text');
        $crud->set_subject('Running Text');

		
//        $crud->unset_fields('created_at');
        $segment = $this->uri->segment(3);
        if ($segment != 'edit' && $segment != 'add') {
	        $crud->set_relation('id_user', 'users', 'username');
        }
		
        $crud->change_field_type('path', 'hidden');
        $crud->change_field_type('id_user', 'hidden');
//        $crud->unset_columns('content', 'path');
		
		
        $crud->columns('content', 'id_user', 'gambar', 'waktu_publish', 'waktu_berakhir','status');
        $crud->callback_before_insert(array($this, 'savePath'));
        $crud->callback_before_update(array($this, 'savePath'));
        $crud->display_as('id_user', 'Username');
        $crud->callback_column('content', array($this, 'linkBlog'));

		
		
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
	
    public function linkBlog($value, $row)
    {
    	return '<a href="' . site_url('media/RunningText/' . $row->id) . '" title="' . $value .'">' . $value . '</a>';
    }
	

    public function loadMore()
    {
        $start = $this->input->get('start');
    
        if ($this->input->is_ajax_request()) {
            $this->load->model('mediaModel');
    
            $this->db->order_by('id', 'desc');
            $this->db->join('users', 'users.id = media.id_user', 'left');
            $this->db->select('users.id AS user_id, media.*, users.username');
            $media = $this->mediaModel->search(null, $this->limit, $start);
            $count = $this->mediaModel->count();

            $image = [];
            foreach ($media as $key => $value) {
                $image[] = [
                    'id' => $value->id,
                    'src' => base_url('assets/uploads/image/' . $value->name . '-thumb' . $value->ext),
                    'file' => $value->file,
                    'name' => $value->name,
                    'uploaded_at' => $value->uploaded_at,
                    'user' => $value->username,
                    'ext' => $value->ext
                ];
            }

            $this->output->set_content_type('application/json')->set_output(json_encode(['count' => $count, 'image' => $image]));
        } else {
            $this->output->set_content_type('application/json')->set_output(json_encode(false));
        }
    }

    public function upload()
    {
        if (!empty($_FILES)) {
            $config['upload_path'] = './assets/uploads/image/';
            $config['allowed_types'] = 'gif|jpg|png';
            $config['overwrite'] = FALSE;
            $config['max_size'] = '2000';
            $this->upload->initialize($config);
            if ($this->upload->do_upload('file')) {
                $fileData = $this->upload->data();
                $thumbnail = $fileData['raw_name'] . '-thumb' . $fileData['file_ext'];
                $fullPath = $fileData['full_path'];
                $newPath = $config['upload_path'] . $thumbnail;
                $this->image_moo->load($fullPath)->resize_crop(300, 200)->save($newPath, FALSE);

                $this->load->model('mediaModel');
                $data = [
                    'name' => $fileData['raw_name'],
                    'file' => 'assets/uploads/image/' . $fileData['file_name'],
                    'ext' => $fileData['file_ext'],
                    'id_user' => $this->ion_auth->user()->row()->id,
                    'uploaded_at' => date('Y-m-d H:i:s')
                ];
                $this->mediaModel->save($data);
                $this->output->set_content_type('application/json')->set_output(json_encode([
                    'thumbnail' => $thumbnail,
                    'id' => $this->db->insert_id(),
                    'username' => $this->ion_auth->user()->row()->username,
                    'data' => $data
                ]));
            } else {
                $this->output->set_content_type('application/json')
                    ->set_status_header(500)
                    ->set_output(json_encode(false));
            }
        }
    }

    public function delete()
    {
        if ($this->input->is_ajax_request()) {
            $id = $this->input->post('id');
            $name = $this->input->post('name');
            $ext = $this->input->post('ext');

            if ($id) {
                $this->load->model('mediaModel');
                try {
                    $this->mediaModel->delete(['id' => $id]);
                    unlink('./assets/uploads/image/' . $name . $ext);
                    unlink('./assets/uploads/image/' . $name . '-thumb' . $ext);

                    $this->output->set_content_type('application/json')->set_output(json_encode($id));
                } catch (Exception $e) {
                    $this->output->set_content_type('application/json')->set_output(json_encode(false));
                }
            }
        }
    }

    public function multiDelete()
    {
        if ($this->input->is_ajax_request()) {
            $multi = $this->input->post('multi');
            $multi = json_decode($multi);
            if (!empty($multi)) {
                $id = [];

                $this->load->model('mediaModel');
                try {
                    foreach ($multi as $key => $value) {
                        if ($value->id) {
                            $id[] = $value->id;
                            unlink('./assets/uploads/image/' . $value->name . $value->ext);
                            unlink('./assets/uploads/image/' . $value->name . '-thumb' . $value->ext);
                        }
                    }
                    $this->mediaModel->delete('id IN(' . implode(',', $id) . ')');

                    $this->output->set_content_type('application/json')->set_output(json_encode(true));
                } catch (Exception $e) {
                    $this->output->set_content_type('application/json')->set_output(json_encode(false));
                }
            }
        }
    }
}

/* End of file media.php */
/* Location: ./application/controllers/media.php */
