hljs.initHighlightingOnLoad();

$(function() {

	// start initialize area (do this on load)
	//#########################################################################

	// main vars
	var validationInputs = ['max_length', 'min_length', 'regex', 'exact_length', 'less_than', 'less_than_equal_to', 'greater_than', 'greater_than_equal_to', 'matches', 'differs', 'in_list', 'allowed_extensions', 'max_width', 'max_height', 'max_size'], // name of classes
		defaultAnimationSpeed = 200,
		placeHolders = {
			exact_length: '0 - 99999*',
			differs: 'Any field',
			matches: 'Any field'
		},

		tableConfig = {};

	if ($('#table_config_field_box').length) {
		appendCrudTemplate(); // Ajax append crud table
	}

	if (segment[2] != 'crud_builder') {
		var builder = 'table';
		$('<a href="#exportPHP" style="margin-left: 10px" data-id="0" data-builder="' + builder + '" data-toggle="modal" class="btn-php btn btn-success btn-flat"><i class="fa fa-code"></i> Generate Module</a>').insertAfter('#save-and-go-back-button');
	}

	new Clipboard('.copy');

	$('.check').iCheck({
		checkboxClass: 'icheckbox_square-blue',
		radioClass: 'iradio_square-blue'
	});

	// add selected data to table Config
	// add rules to json on add validation
	// hide the textarea
	//#########################################################################

	// Events default
	$('#addBreadcrumb').click(add_breadcrumb); // Breadceumb script
	$('.remove-crumb').click(remove_crumb); // Breadceumb script
	$('.btn-php').click(export_php); // Ajax export to PHP
	$('#create-module').click(create_module); // create module

	// Events for html load from javascript
	$('body').on('change', '#field-table_name', get_fields_name); // Ajax get list field
	$('body').on('change', '.type', changeFieldType);
	$('body').on('change', '.table-reff', changeFieldTable);
	$('body').on('change', '.relation-n-n-relationalTable', changeFieldRelationalTable); // relation_n_n
	$('body').on('change', '.relation-n-n-selectionTable', changeFieldSelectionTable); // relation_n_n
	$('body').on('keyup', '.relation-n-n-labelName', writeRelationLabelName); // relation_n_n
	$('body').on('change', '.relation-n-n-titleFieldSelectionTable', changeTitleFieldSelectionTable); // relation_n_n
	$('body').on('change', '.relation-n-n-primaryKeyAliasToThisTable', changePrimaryKeyAliasToThisTable); // relation_n_n
	$('body').on('change', '.relation-n-n-primaryKeyAliasToSelectionTable', changePrimaryKeyAliasToSelectionTable); // relation_n_n
	$('body').on('change', '.validation', {
		extra: tableConfig
	}, addValidation);
	$('body').on('click', '.delete', remove_rules); // remove rules btn
	$('body').on('keyup', '.validationInputs', validation_inputs);
	$('body').on('keyup click change', '#table_config', update_table_config); // update json data
	$('body').on('ifChecked', '.check-config', {
		val: 1
	}, update_actions);
	$('body').on('ifUnchecked', '.check-config', {
		val: 0
	}, update_actions);
	$('body').on('keyup', '.alias', update_alias);
	$('body').on('change', '.table-reff', update_select_data);
	$('body').on('change', '.field-reff', update_field_reff);
	$('body').on('change', '.label-reff', update_label_reff);
	$('body').on('click', '#form-button-save', update_table_config);
	$('body').on('click', '#save-and-go-back-button', update_table_config);

	function changePrimaryKeyAliasToThisTable(event) {
		var $this = $(this),
			fieldName = $this.data('field');
		tableConfig[fieldName].selectMultipleData.primaryKeyAliasToThisTable = $this.val();
	}

	function changePrimaryKeyAliasToSelectionTable(event) {
		var $this = $(this),
			fieldName = $this.data('field');
		tableConfig[fieldName].selectMultipleData.primaryKeyAliasToSelectionTable = $this.val();
	}

	function changeTitleFieldSelectionTable(event) {
		var $this = $(this),
			fieldName = $this.data('field');
		tableConfig[fieldName].selectMultipleData.titleFieldSelectionTable = $this.val();
	}

	function writeRelationLabelName(event) {
		var $this = $(this),
			fieldName = $this.data('field');
		tableConfig[fieldName].selectMultipleData.labelName = $this.val();
	}

	function update_field_reff(event) {
		var $this = $(this),
			fieldName = $this.data('field');
		tableConfig[fieldName].selectData.fieldReff = $this.val();
	}

	function update_label_reff(event) {
		var $this = $(this),
			fieldName = $this.data('field');
		tableConfig[fieldName].selectData.labelReff = $this.val();
	}

	function update_select_data(event) {
		var $this = $(this),
			fieldName = $this.data('field');
		tableConfig[fieldName].selectData.table = $this.val();
	}

	function update_alias(event) {
		var value = $(this).val();
		var fieldName = $(this).data('field');
		tableConfig[fieldName].alias = value;
	}

	function update_actions(event) {
		var value = event.data.val,
			$this = $(this);
		tableConfig[$this.data('field')].actions[$this.data('action')] = value;
		// console.log(tableConfig);
		update_table_config();
	}

	function validation_inputs(event) {

		var validationObj = {},
			ruleExist = false,
			$this = $(this),
			ruleName = $this.data('name'),
			fieldName = $this.data('field');

		if ($this.val() != "") {
			validationObj[ruleName] = $this.val();

			tableConfig[fieldName].validation.forEach(function(element, index) {
				// statements
				if (typeof(element[ruleName]) !== 'undefined') {
					ruleExist = true;
					tableConfig[fieldName].validation[index] = validationObj; // update
				}
			});

			if (ruleExist === false) { // push
				tableConfig[fieldName].validation.push(validationObj);
			}
		}
	}

	// load this when table_config.php loaded
	function load_json() {
		var fieldsNames = $('.fieldsNames');

		if ($('#field-table_config').text() != '') {
			tableConfig = JSON.parse($('#field-table_config').text());
		} else {
			fieldsNames.each(get_values);
		}
	}

	function get_values() {
		var fieldData, column, add, edit, details, type, $this = $(this),
			fieldName = $this.val(); // return the field name

		column = $("input[name='table[" + fieldName + "][column]']:checked").val();
		add = $("input[name='table[" + fieldName + "][add]']:checked").val();
		edit = $("input[name='table[" + fieldName + "][edit]']:checked").val();
		details = $("input[name='table[" + fieldName + "][details]']:checked").val();
		type = $("select[name='table[" + fieldName + "][type]']").val();

		column = fix_undefined(column);
		add = fix_undefined(add);
		edit = fix_undefined(edit);
		details = fix_undefined(details);

		fieldData = {
			actions: {
				"column": column,
				"add": add,
				"edit": edit,
				"details": details
			},
			type: type,
			selectData: {},
			selectMultipleData: {},
			validation: []
		};

		tableConfig[fieldName] = fieldData;
	}

	function fix_undefined(data) {
		if (data === undefined) {
			return 0;
		} else {
			return data;
		}
	}

	function add_breadcrumb() {
		var breadcrumbItem = $('.form-breadcrumb:last').clone();
		breadcrumbItem.children().children().val('');
		breadcrumbItem.insertAfter('.form-breadcrumb:last');
		$('.remove-crumb').click(function() {
			$(this).parent().parent().remove();
		});
	}

	function remove_crumb() {
		$(this).parent().parent().remove();
	}

	// Ajax get and append crud template
	function appendCrudTemplate() {
		$.get(site + '/myigniter/columns_callback', function(data) {
			$('#table_config_field_box').after(data);
			$('#columns_field_box').next().remove(); // remove next <br>
		}).complete(function() {
			if ($('#field-table_name').val()) {
				get_fields_name();
			}
		});
	}

	function addValidation() {

		var $this = $(this),
			value = $this.val(),
			parent = $this.parent(),
			output = '',
			fieldName = $this.data('name'),
			selectedOption = $('option:selected', this); // sync with field type

		$this.val('');
		$this.trigger('chosen:updated');

		if (parent.find('.validation-name:contains("' + value + '")').length === 0) { // check if this rule already selected

			output = '<div class="box-validation ' + selectedOption.prop('class') + '">';
			output += '<label><div class="validation-name">' + value + '</div></label>';

			if ($.inArray(value, validationInputs) > -1) {
				output += '<input type="text" data-field="' + fieldName + '" data-name="' + value + '" value="" class="small-input validationInputs"/>';
			} else {
				tableConfig[fieldName].validation.push(value); // validation string
			}

			output += '<a class="delete" data-field="' + fieldName + '" data-name="' + value + '"><i class="fa fa-trash"></i></a>';
			output += '</div>';
			parent.append(output);

		}
	}

	function remove_rules() {
		var $this = $(this),
			ruleName = $this.data('name'),
			fieldName = $this.data('field');

		$this.parent('.box-validation')
			.css({
				'background-color': 'red',
				'color': 'white'
			})
			.fadeOut(defaultAnimationSpeed, function() {
				$(this).remove();
			});
		// remove item from array
		tableConfig[fieldName].validation.forEach(function(element, index) {
			// statements
			if (typeof element === 'object') {
				if (ruleName in element) {
					tableConfig[fieldName].validation.splice(index, 1); // update
				}
			} else {
				if (element === ruleName) {
					tableConfig[fieldName].validation.splice(index, 1); // update
				}
			}

		});
	}

	function changeFieldType(event) {
		// main vars
		var $this = $(this),
			relation = $.inArray($this.val(), ['select', 'select_multiple', 'checkbox']),
			// relation_n_n = $.inArray($this.val(), ['select_multiple']),
			parent = $this.parents('td'),
			validation = $this.parent().next('td').find('.validation'),
			rules = $this.parent().next('td').find('.box-validation'),
			fieldName = $this.data('field');

		// process happen when select/select multiple
		if (relation >= 0) {
			parent.find('.container-table-reff').show();
		} else {
			parent.find('.container-table-reff').hide();
			parent.find('.container-field-reff').hide();
			parent.find('.container-label-reff').hide();
			tableConfig[fieldName].selectData = {};
		}

		// For custom fields
		// if (relation_n_n >= 0 ) {
		// 	parent.find('.container-select-multiple').show();
		// } else {
		// 	parent.find('.container-select-multiple').hide();
		// 	tableConfig[fieldName].selectMultipleData = {};
		// }

		// loop on all validation options
		validation.find('option').each(function() {
			var $option = $(this);

			// make option hide if true
			if ($option.hasClass($this.val()) === false) {
				$option.addClass('hidden');
			} else {
				$option.removeClass('hidden');
			}

			if ($option.val() === 'required') {
				$option.removeClass('hidden');
			} // fix required visability

		});

		// update the rules and clean unnecessary 
		rules.each(function() {
			$rule = $(this);

			if ($rule.hasClass($this.val()) === false) {
				$rule.remove();
			}
		});

		// update chosen
		validation.trigger('chosen:updated');

		// update json
		tableConfig[fieldName].type = $this.val();
	}

	function changeFieldTable(event) {
		var $this = $(this),
			parent = $this.parents('td');

		parent.find('.container-field-reff').show();
		parent.find('.container-label-reff').show();

		$.get(site + '/myigniter/getFields/' + $this.val(), function(data) {
			parent.find('.field-reff').html('<option value></option>');
			parent.find('.label-reff').html('<option value></option>');
			$.each(data, function(index, val) {
				var selected = '';
				if (val.primary_key) {
					selected = 'selected';
					tableConfig[$this.data('field')].selectData.fieldReff = val.name;
					tableConfig[$this.data('field')].selectData.labelReff = val.name;
					update_table_config();
				}
				parent.find('.field-reff').append('<option ' + selected + ' value="' + val.name + '">' + val.name + '</option>');
				parent.find('.label-reff').append('<option ' + selected + ' value="' + val.name + '">' + val.name + '</option>');
			});
			parent.find('.field-reff').trigger('chosen:updated');
			parent.find('.label-reff').trigger('chosen:updated');

		});
	}

	function changeFieldRelationalTable(event) {
		var $this = $(this),
			parent = $this.parents('td'),
			primaryKeyAlias = parent.find('.relation-n-n-primaryKeyAliasToThisTable');

		primaryKeyAlias.parent().slideDown(defaultAnimationSpeed); // show the dropdown
		parent.find('.container-relation-n-n-selectionTable').slideDown(defaultAnimationSpeed); //show the selection table

		$.get(site + '/myigniter/getFields/' + $this.val(), function(data) {
			primaryKeyAlias.html('<option value></option>');
			$.each(data, function(index, val) {
				var selected = '';
				if (val.primary_key) {
					selected = 'selected';
					tableConfig[$this.data('field')].selectMultipleData.relationalTable = $this.val();
					tableConfig[$this.data('field')].selectMultipleData.primaryKeyAliasToThisTable = val.name;
					update_table_config();
				}
				primaryKeyAlias.append('<option ' + selected + ' value="' + val.name + '">' + val.name + '</option>');
			});

			primaryKeyAlias.trigger('chosen:updated');
		});
	}

	function changeFieldSelectionTable(event) {
		var $this = $(this),
			parent = $this.parents('td'),
			primaryKeyAlias = parent.find('.relation-n-n-primaryKeyAliasToSelectionTable'),
			titleFieldSelectionTable = parent.find('.relation-n-n-titleFieldSelectionTable');

		primaryKeyAlias.parent().slideDown(defaultAnimationSpeed); // show the dropdown
		parent.find('.container-relation-n-n-primaryKeyAliasToSelectionTable').slideDown(defaultAnimationSpeed);
		parent.find('.container-relation-n-n-titleFieldSelectionTable').slideDown(defaultAnimationSpeed);

		$.get(site + '/myigniter/getFields/' + $this.val(), function(data) {
			primaryKeyAlias.html('<option value></option>');
			titleFieldSelectionTable.html('<option value></option>');
			$.each(data, function(index, val) {
				var selected = '';
				if (val.primary_key) {
					selected = 'selected';
					tableConfig[$this.data('field')].selectMultipleData.selectionTable = $this.val();
					tableConfig[$this.data('field')].selectMultipleData.primaryKeyAliasToSelectionTable = val.name;
					tableConfig[$this.data('field')].selectMultipleData.titleFieldSelectionTable = val.name;
					update_table_config();
				}
				primaryKeyAlias.append('<option ' + selected + ' value="' + val.name + '">' + val.name + '</option>');
				titleFieldSelectionTable.append('<option ' + selected + ' value="' + val.name + '">' + val.name + '</option>');
			});

			primaryKeyAlias.trigger('chosen:updated');
			titleFieldSelectionTable.trigger('chosen:updated');
		});
	}

	function get_fields_name() {
		var element = $('#field-table_name'),
			advaceFields = $('#advance-fields'),
		    idTable = '',
		    overlay = $('.overlay'),
		    url = window.location.href;
		    
			url = url.split('edit/');
		if (typeof(url[1]) != 'undefined') {
			idTable = '?id=' + url[1];
		}

		// add preloader
		$('#field_table_name_chosen').after('<i class="fa fa-circle-o-notch fa-spin text-primary fa-fw fa-1x table-name-spinner"></i>');
		overlay.removeClass('hidden');

		$.get(site + '/myigniter/get_list_fields/' + element.val() + idTable, function(data) {
			advaceFields.html(data).find('.check').iCheck({
				checkboxClass: 'icheckbox_square-blue',
				radioClass: 'iradio_square-blue'
			});
			$('#advance-fields').find(".chosen").chosen();
			$('.chosen-container').css('width', '100%');
			$('#columns_field_box').removeClass('hidden');
			load_json();
		}).complete(function () {
			$('.table-name-spinner').remove();
			overlay.addClass('hidden');
		});
	}

	function update_table_config() {
		$('#field-table_config').val(JSON.stringify(tableConfig));
	}

	function export_php() {
		var id = $(this).data('id'),
			builder = $(this).data('builder');
		if (id) {
			$.get(site + '/myigniter/export_php/' + id + '/' + builder, function(data) {
				$('#PHPCode').html(hljs.highlightAuto(data).value);
				$('#create-module').data('id', id);
			});
		} else {
			$.ajax({
				url: site + '/myigniter/export_php/' + 0 + '/' + builder,
				type: 'POST',
				data: $('#crudForm').serialize(),
			}).done(function(data) {
				$('#PHPCode').html(hljs.highlightAuto(data).value);
				$('#create-module').data('id', id);
			}).fail(function() {
				alertify.alert("Something wrong try again!");
			});
		}
	}

	function create_module() {
		var id = $(this).data('id');
		$.ajax({
			url: site + '/myigniter/createModule',
			type: 'POST',
			data: {
				id: id
			},
		}).done(function(data) {
			if (data.status) {
				alertify.alert("Module created, can be access via path : <pre>/" + data.table + "/crud" + ucfirst(data.table) + "</pre> Controller can be found in : <pre>/applcation/modules/" + data.table + "/controllers/" + ucfirst(data.table) + ".php</pre> <br><a href='" + site + "/" + data.table + "/crud" + ucfirst(data.table) + "'>Go to module</a>");
			} else {
				alertify.alert("Module alredy exist!");
			}
		}).fail(function() {
			alertify.alert("This features can be use only in development mode!");
		});
	}

	function ucfirst(str) {
		var firstLetter = str.substr(0, 1);
		return firstLetter.toUpperCase() + str.substr(1);
	}
});