<?php

defined('BASEPATH') or exit('No direct script access allowed');

class RunningTextModel extends MY_Model
{
    public $table;

    public function __construct()
    {
        parent::__construct();
        $this->table = 'running_text';
    }
}

/* End of file mediaModel.php */
/* Location: ./application/models/mediaModel.php */
