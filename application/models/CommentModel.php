<?php

defined('BASEPATH') or exit('No direct script access allowed');

class CommentModel extends MY_Model
{
    public $table;

    public function __construct()
    {
        parent::__construct();
        $this->table = 'comment';
    }
}

/* End of file categoryModel.php */
/* Location: ./application/models/categoryModel.php */
