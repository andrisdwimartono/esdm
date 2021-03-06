<!DOCTYPE html>
<html lang="en">
<head>
	
	 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <?php echo $this->output_view->get_meta_tags() ?>
    <?php echo $this->output_view->get_title() ?>
    <?php echo $this->output_view->get_favicon() ?>
    <?php echo $this->output_view->get_schema() ?>
    <?php
    $path = [
        'assets/plugins/bootstrap/dist/css/bootstrap.min.css',
        'assets/plugins/AdminLTE/dist/css/AdminLTE.min.css',
        'assets/plugins/AdminLTE/dist/css/skins/skin-'.$this->config->item('skin').'.min.css',
        'assets/plugins/font-awesome/css/font-awesome.min.css',
        'assets/plugins/alertify-js/build/css/alertify.min.css',
        'assets/plugins/alertify-js/build/css/themes/default.min.css',
        'assets/plugins/iCheck/skins/square/blue.css'
    ];
    ?>
    <?php $this->output_view->set_assets($path, true, 'styles') ?>
    <?php 
    if (isset($grocery_css)) {
        foreach ($grocery_css as $key => $value) {
            $crud_css[] = $value;
        }
        if (isset($crud_css)) {
            $this->output_view->set_assets($crud_css, false, 'styles');
        }
    }
    if (isset($css_plugins)) {
        $this->output_view->set_assets($css_plugins, false, 'styles');
    }
    ?>
    <?php $this->output_view->set_assets('assets/css/a-design.css?v=1', true, 'styles') ?>
    <?php echo $this->output_view->get_assets('styles') ?>
	<script src="<?php echo base_url(); ?>plugins/ckeditor/ckeditor.js"></script>
	
	<link href="<?php echo base_url(); ?>assets/css/bootstrap-combined.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen" href="<?php echo base_url(); ?>assets/css/bootstrap-datetimepicker.min.css">
	<link href="<?php echo base_url(); ?>assets/css/font-awesome.css" rel="stylesheet">
</head>
<body class="hold-transition skin-<?php echo $this->config->item('skin') ?> fixed">

    <!-- Site wrapper -->
    <div class="wrapper">  
        <header class="main-header">
            <a href="<?php echo site_url(); ?>" class="logo">
               <span class="logo-mini"><b>ES</b>DM</span>
               <span class="logo-lg">Admin Panel</span>
           </a>

           <nav class="navbar navbar-static-top" role="navigation">
                <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <li class="dropdown user user-menu" >
                            <?php $user = $this->ion_auth->user()->row() ?>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <?php if (filter_var($user->photo,FILTER_VALIDATE_URL)): ?>
                                    <img src="<?php echo $user->photo; ?>" class="user-image" alt="<?php echo $user->full_name ?>"/>
                                <?php else: ?>
                                    <img src="<?php echo $user->photo == '' ? base_url('assets/img/logo/kotaxdev.png') : base_url('assets/uploads/image/'.$user->photo) ?>" class="user-image" alt="<?php echo $user->full_name ?>"/>
                                <?php endif; ?>
                                <span class="hidden-xs"><?php echo $user->username ?></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="user-header">
                                    <?php if (filter_var($user->photo,FILTER_VALIDATE_URL)): ?>
                                        <img src="<?php echo $user->photo; ?>" class="img-circle" alt="<?php echo $user->full_name ?>"/>
                                    <?php else: ?>
                                        <img src="<?php echo $user->photo == '' ? base_url('assets/img/logo/kotaxdev.png') : base_url('assets/uploads/image/'.$user->photo) ?>" class="img-circle" alt="<?php echo $user->full_name ?>"/>
                                    <?php endif; ?>
                                    <p>
                                      <?php echo $user->full_name ?>
                                      <small>Last login <?php echo ' '.date('d/m/Y H:i', $user->last_login); ?></small>
                                  </p>
                                </li>
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="<?php echo  site_url('admin/profile')?>" class="btn btn-default btn-flat">Profile</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="<?php echo  site_url('logout')?>" class="btn btn-default btn-flat">Logout</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <aside class="main-sidebar">
            <section class="sidebar" id="menuSidebar">
                <form action="#" method="get" class="sidebar-form">
                    <div class="input-group">
                        <input type="text" style="height:25px" class="form-control searchlist" id="searchSidebar" placeholder="Search..." autocomplete="off"/>
                        <span class="input-group-btn">
                            <button type='button' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                        </span>
                    </div>
                </form>
                <ul class="sidebar-menu list" id="menuList">
                </ul>
                <ul class="sidebar-menu list" id="menuSub">
                    <?php $menus = $this->output_view->get_menu() ?>
                    <?php foreach ($menus as $menu): ?>
                        <li class="header"><?php echo $menu['label'] ?></li>
                        <?php if (is_array($menu['children'])): ?>
                            <?php foreach ($menu['children'] as $menu2): ?>
                                <li <?php echo $menu2['attr'] != '' ? ' id="'.$menu2['attr'].'" ' : '' ?> <?php echo is_array($menu2['children']) ? ' class="treeview" ' : '' ?>>
                                    <?php if (is_array($menu2['children'])): ?>
                                        <a href="<?php echo $menu2['link'] != '#' ? base_url($menu2['link']) : '#' ?>" class="name">
                                            <i class="fa fa-<?php echo $menu2['icon'] ?>"></i> <span><?php echo $menu2['label'] ?></span><span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                                        </a>
                                        <ul class="treeview-menu">
                                            <?php foreach ($menu2['children'] as $menu3): ?>
                                                <li <?php echo $menu3['attr'] != '' ? ' id="'.$menu3['attr'].'" ' : '' ?>>
                                                    <a href="<?php echo $menu3['link'] != '#' ? base_url($menu3['link']) : '#' ?>" class="name">
                                                        <i class="fa fa-<?php echo $menu3['icon'] ?>"></i> <span><?php echo $menu3['label'] ?></span>
                                                    </a>
                                                </li>
                                            <?php endforeach ?>
                                        </ul>
                                    <?php else: ?>
                                        <a href="<?php echo $menu2['link'] != '#' ? base_url($menu2['link']) : '#' ?>" class="name">
                                            <i class="fa fa-<?php echo $menu2['icon'] ?>"></i> <span><?php echo $menu2['label'] ?>
                                        </a>
                                    <?php endif ?>
                                </li>
                            <?php endforeach ?>
                        <?php endif ?>
                    <?php endforeach ?>
                </ul>
            </section>
        </aside>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    <?php echo $judul ?>
                </h1>
                <?php $this->output_view->breadcrumb($crumb) ?>
            </section>
            <!-- Main content -->
            <section class="content exspan-bottom">
                <!-- /.box -->
				  <!-- general form elements disabled -->
					<div class="box box-warning">
						<div class="box-header with-border">
							<h3 class="box-title"></h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<form role="form" enctype="multipart/form-data" method="post" action="<?php echo base_url().$urlAction; ?>">
								<!--field title-->
								<div class="form-group">
									<label>Judul <font color="red">*</font></label>
									 <input type="text" style="height:25px" name="title" value="<?php if(isset($fieldtitle)){echo $fieldtitle;} ?>" class="form-control" placeholder="Judul . . ." >
									 <div style="color:red"><?php if(isset($errtitle)){echo $errtitle;} ?></div>
								</div>
								
								
								<!--field categories-->
								<div class="form-group">
									<label>Kategori <font color="red">*</font></label>
									 <select multiple="multiple" name="category[]" class="form-control" >
										<?php foreach($categories->result() as $category){ ?>
										<option value="<?php echo $category->id; ?>" <?php if(isset($fieldcategory)){if($fieldcategory[$category->id]==$category->id){echo 'selected';}} ?>><?php echo ucfirst($category->category); ?></option>
										<?php } ?>
									</select>
									<div style="color:red"><?php if(isset($errcategory)){echo $errcategory;} ?></div>
								</div>
								
								
								<!--field content-->
								<div class="form-group">
									<label>Konten <font color="red">*</font></label>
									<div>
									 <?php
									 $conte=''; 
									 if(isset($fieldcontent)){$conte = $fieldcontent;}									 
									 echo $this->ckeditor->editor('content', $conte);
									 ?>
									 </div>
									 <div style="color:red"><?php if(isset($errcontent)){echo $errcontent;} ?></div>
								</div>
								

								<!--field status-->
								<div class="form-group">
									<label>Status <font color="red">*</font></label>
									 <select class="form-control" name="status">
										<option value="publish" <?php if(isset($fieldstatus)){if($fieldstatus=="publish"){echo " selected";}} ?> >Publish</option>
										<option value="hidden" <?php if(isset($fieldstatus)){if($fieldstatus=="hidden"){echo " selected";}} ?> >Hidden</option>
									</select>
									<div style="color:red"><?php if(isset($errstatus)){echo $errstatus;} ?></div>
								</div>

								<!--field publish_time-->
								<div class="form-group">
									<label>Waktu Publish </label>
									<div id="datetimepicker" class="input-append date">
										<input type="text" style="height:25px" name="publish_time"  value="<?php if(isset($fieldpublish_time)){echo $fieldpublish_time;} ?>" class="form-control" placeholder="Waktu Publish . . ." >
										<br>
										<span class="add-on" style="height:25px">
											<i data-time-icon="icon-time" data-date-icon="icon-calendar" class="fa fa-calendar"></i>
										</span>
									</div>
									<div style="color:red"><?php if(isset($errpublish_time)){echo $errpublish_time;} ?></div>
								</div>
								
								<!--field expired_time-->
								<div class="form-group">
									<label>Waktu Selesai </label>
									<div id="datetimepicker2" class="input-append date">
										<input type="text" style="height:25px" name="expired_time" value="<?php if(isset($fieldexpired_time)){echo $fieldexpired_time;} ?>" class="form-control" placeholder="Waktu Selesai . . ." >
										<br>
										<span class="add-on" style="height:25px">
											<i data-time-icon="icon-time" data-date-icon="icon-calendar" class="fa fa-calendar"></i>
										</span>
									 </div>
									 <div style="color:red"><?php if(isset($errexpired_time)){echo $errexpired_time;} ?></div>
								</div>
								
			  
								<input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>">
								<button type="submit" class="btn btn-primary">Submit</button>
							</form>
						</div>
					</div>
                <?php //echo $this->output_view->get_wrapper('page') ?>
            </section><!-- /.content -->
        </div><!-- /.content-wrapper -->

        <footer class="main-footer">
            <div class="pull-right hidden-xs">
                <b>Version</b> <?php echo $this->config->item('version') ?>
            </div>
            <strong>Copyright &copy;<?php echo date('Y') ?></strong> All rights reserved.
        </footer>
    </div><!-- ./wrapper -->
<?php 
$this->output_view->set_assets('assets/plugins/jquery/dist/jquery.min.js', true, 'scripts');
if (isset($grocery_js)) {
    foreach ($grocery_js as $key => $value) {
        $crud_js[] = $value;
    }
    if (isset($crud_js)) {
        $this->output_view->set_assets($crud_js, false, 'scripts');
    }
}
?>
<?php
$path = [
    'assets/plugins/bootstrap/dist/js/bootstrap.min.js',
    'assets/plugins/AdminLTE/dist/js/app.min.js',
    'assets/plugins/alertify-js/build/alertify.min.js',
    'assets/plugins/slimScroll/jquery.slimscroll.min.js',
    'assets/plugins/list.js/dist/list.min.js',
    'assets/plugins/iCheck/icheck.min.js'
];
?>
<?php $this->output_view->set_assets($path, true, 'scripts') ?>
<?php 
if (isset($js_plugins)) {
    $this->output_view->set_assets($js_plugins, false, 'scripts');
}
?>
<?php $this->output_view->set_assets('assets/js/a-design.js?v=4', true, 'scripts') ?>
<?php echo $this->output_view->get_assets('scripts') ?>
<?php echo $this->output_view->get_script(); ?>

<script type="text/javascript"
     
    
    <script type="text/javascript" src="<?php echo base_url(); ?>assets/js/bootstrap-datetimepicker.min.js">
    </script>
    <script type="text/javascript"
     src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.pt-BR.js">
    </script>
    <script type="text/javascript">
      $('#datetimepicker').datetimepicker({
        format: 'yyyy-MM-dd hh:mm:ss',
        language: 'en-en'
      });
	  $('#datetimepicker2').datetimepicker({
        format: 'yyyy-MM-dd hh:mm:ss',
        language: 'en-en'
      });
    </script>
</body>
</html>