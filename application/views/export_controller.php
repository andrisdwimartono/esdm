<?php

echo '<?php defined("BASEPATH") or exit("No direct script access allowed");

/**
 * ' . ucfirst($table->table_name) . ' Controller.
 */
class ' . ucfirst($table->table_name) . ' extends MX_Controller
{
    private $title;
    private $front_template;
    private $admin_template;

    public function __construct()
    {
        parent::__construct();
        $this->load->library("output_view");

        $this->title = "' . $table->subject . '";
    }

    /**
     * Index
     */
    public function index()
    {
    }

    /**
     * CRUD
     */
' . $method . '
}

/* End of file example.php */
/* Location: ./application/modules/' . $table->table_name . '/controllers/' . ucfirst($table->table_name) . '.php */';