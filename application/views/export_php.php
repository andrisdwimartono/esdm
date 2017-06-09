	public function crud<?php echo ucfirst($table->table_name) ?>()
	{
		$crud = new grocery_CRUD();
		
		$crud->set_table("<?php echo $table->table_name ?>");
		$crud->set_subject("<?php echo $table->subject ?>");

		// Show in
		$crud->add_fields(["<?php echo implode('", "', $config['fieldsAdd']) ?>"]);
		$crud->edit_fields(["<?php echo implode('", "', $config['fieldsEdit']) ?>"]);
		$crud->columns(["<?php echo implode('", "', $config['columns']) ?>"]);

		// Fields type
<?php
foreach ($config['fieldsType'] as $key => $value) {
	if ($value == 'text' || $value == 'wysiwyg') {
?>
<?php if ($value != 'wysiwyg') { ?>
		$crud->unset_texteditor("<?php echo $key ?>", 'full_text');
<?php } ?>
		$crud->field_type("<?php echo $key ?>", "text");
<?php
    } else if ($value == 'file') {
?>
		$crud->set_field_upload("<?php echo $key ?>", 'assets/uploads');
<?php
    } else if ($value == 'select') {
?>
		$crud->set_relation("<?php echo $key ?>", "<?php echo $config['selectData'][$key]->table ?>", "<?php echo $config['selectData'][$key]->labelReff ?>");
<?php
	} else if ($value == 'select_multiple') {
?>
		$list = [];
		$tableList = $this->db->get("<?php echo $config['selectData'][$key]->table ?>")->result_array();
		foreach ($tableList as $listMulty) {
			$list[$listMulty["<?php echo $config['selectData'][$key]->fieldReff ?>"]] = "<?php echo $config['selectData'][$key]->labelReff ?>";
		}
		$crud->field_type("<?php echo $key ?>", "multiselect", <?php echo '$list' ?>);
<?php
	} else {
?>
		$crud->field_type("<?php echo $key ?>", "<?php echo $value ?>");
<?php
    }
}
?>
<?php if ($config['validation']): ?>

		// Validation
<?php endif ?>
<?php
foreach ($config['validation'] as $key => $value) {
    $rules = '';
    foreach ($value as $index => $rule) {
        if ($index != 0) {
            $rules .= '|';
        }
        if (is_object($rule)) {
            foreach ($rule as $fieldObject => $val) {
                $rules .= $fieldObject . '[' . $val . ']';
                break;
            }
        } else {
            $rules .= $rule;
        }
    }
?>
		$crud->set_rules("<?php echo $key ?>", "<?php echo ucfirst(str_replace('_', ' ', $key)) ?>", "<?php echo $rules ?>");
<?php
}
?>

		// Display As
<?php foreach ($tableConfig as $key => $value) { 
		    if (isset($value->alias)) {
		        if ($value->alias != '') {
?>
		$crud->display_as("<?php echo $key ?>", "<?php echo $value->alias ?>");
<?php
		        }
		    }
		}
?>

		// Unset action
<?php
        if ($table->action != '') {
            $action = json_decode($table->action);
            if (!in_array('Create', $action)) {
?>
		$crud->unset_add();
<?php
            }
            if (!in_array('Read', $action)) {
?>
		$crud->unset_read();
<?php
            }
            if (!in_array('Update', $action)) {
?>
		$crud->unset_edit();
<?php
            }
            if (!in_array('Delete', $action)) {
?>
		$crud->unset_delete();
<?php
            }
        }
?>

		$data = (array) $crud->render();

		$this->output_view->set_wrapper('page', 'grocery', $data, false);

		$template_data['grocery_css'] = $data['css_files'];
		$template_data['grocery_js']  = $data['js_files'];
		$template_data["judul"] = "<?php echo $table->title ?>";
<?php 
	$add_crumb = "[";
	if ($table->breadcrumb != "null") {
	$crumbs = json_decode($table->breadcrumb);
	foreach ($crumbs as $value) {
		$add_crumb .= '"'.$value->label.'" => "'.$value->link.'",';
 	}
} else { 
	$add_crumb .= '"table" => ""';
} 
	$add_crumb .= "]";
?>
		$template_data["crumb"] = <?php echo $add_crumb ?>;

		$template = "<?php echo $admin_template ?>";
		$this->output_view->auth();
		$this->output_view->output($template, $template_data);
	}