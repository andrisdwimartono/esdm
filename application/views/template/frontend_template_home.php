<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
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
		'assets/css/flexslider.min.css',
		'assets/css/line-icons.min.css',
		'assets/css/elegant-icons.min.css',
		'assets/css/lightbox.min.css',
        'assets/plugins/bootstrap/dist/css/bootstrap.min.css',
		'assets/css/theme.css',
		'assets/css/custom.css',
        'assets/plugins/font-awesome/css/font-awesome.min.css',
    ];
    ?>
    <?php $this->output_view->set_assets($path, true, 'styles') ?>
    <?php 
    if (isset($css_plugins)) {
        $this->output_view->set_assets($css_plugins, false, 'styles');
    }
    ?>
    <?php $this->output_view->set_assets('assets/css/front.css', true, 'styles') ?>
    <?php echo $this->output_view->get_assets('styles') ?>
	<!--[if gte IE 9]>
        	<link rel="stylesheet" type="text/css" href="css/ie9.css" />
		<![endif]-->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,400,300,600,700%7CRaleway:700' rel='stylesheet' type='text/css'>
	<script src="assets/js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>
<body>
    	<div class="loader">
    		<div class="spinner">
			  <div class="double-bounce1"></div>
			  <div class="double-bounce2"></div>
			</div>
    	</div>
				
				<div class="nav-container">
			<nav class="top-bar overlay-bar">
				<div class="container">
				
					<div class="row utility-menu">
						<div class="col-sm-12">
							<div class="utility-inner clearfix">
								<span class="alt-font"><i class="icon icon_pin"></i> Jl. Soekarno-Hatta No. 576 Bandung Jawa Barat 40286 Indonesia</span>
								<span class="alt-font"><i class="icon icon_mail"></i> admin.esdm@jabarprov.go.id</span>
							</div>
						</div>
					</div><!--end of row-->
				
				
					<div class="row nav-menu">
						<div class="col-sm-3 col-md-2 columns">
							<a href="#top">
								<img class="logo logo-light" alt="Logo" src="<?php echo base_url('assets/img/logo/logo-light.png');?>">
								<img class="logo logo-dark" alt="Logo" src="<?php echo base_url('assets/img/logo/logo-light.png');?>">
							</a>
						</div>
					
						<div class="col-sm-9 col-md-10 columns">
						
						<?php $menus = $this->output_view->get_menu('top menu'); ?>
								<ul class="menu">
<?php foreach ($menus as $menu): ?>
<?php if (is_array($menu['children'])): ?>
									<li class="has-dropdown">
										<a href="#"><?php echo $menu['label'] ?></a>
										<ul class="subnav">
	<?php foreach ($menu['children'] as $menu2): ?>
										<li><a href="<?php echo base_url($menu2['link']) ?>"><?php echo $menu2['label'] ?></a></li>
	<?php endforeach ?>
									</ul>
									</li>
<?php else: ?>
									<li><a href="<?php echo base_url($menu['link']) ?>"><?php echo $menu['label'] ?></a></li>
<?php endif ?>
<?php endforeach ?>
						</ul>
						</div>
					</div><!--end of row-->
					
					<div class="mobile-toggle">
						<i class="icon icon_menu"></i>
					</div>
					
				</div><!--end of container-->
			</nav>
		</div>
				
		<div class="nav-container">
			<nav class="fullscreen-nav overlay-bar">
			
				<div class="fullscreen-nav-toggle" style="top:30%">
					<i class="icon icon_tablet"></i>
					<i class="icon icon_close"></i>
				</div>
				
				<div class="fullscreen-nav-container">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<a href="#top">
									<img class="logo" alt="Logo" src="<?php echo base_url('assets/img/logo/myIgniter.png');?>">
								</a>
								<ul class="menu">
									<li><a href="http://esdm.jabarprov.go.id/wub">Wirausaha Baru Jawa Barat</a></li>
									<li><a href="http://esdm.jabarprov.go.id/sitambang">SI Tambang</a></li>
									<li><a href="http://esdm.jabarprov.go.id/gisesdm">GIS ESDM</a></li>
									<li><a href="https://eoffice.jabarprov.go.id/">e-office</a></li>
									<li><a href="http://esdm.jabarprov.go.id/cpcllisdes">CPCL Lisdes</a></li>
									<li><a href="https://simaya.layanan.go.id/">SIMAYA (e-office)</a></li>
									<li><a href="http://202.150.132.187/simat/">SIMAT</a></li>
									<li><a href="https://lpse.jabarprov.go.id/eproc/">LPSE</a></li>
									<li><a href="http://202.150.132.187/owncloud">owncloud</a></li>
								</ul>
							</div>
						</div>
					</div>
					
				</div>	
			</nav>
		</div>
		<div id="top">
			<section class="hero-slider">
				<ul class="slides">		
					<li class="overlay">			
						<div class="background-image-holder parallax-background">				
							<img class="background-image" alt="Background Image" src="/esdm/assets/img/bg/hero15.jpg">			
						</div>						
						<div class="container align-vertical">				
							<div class="row">					
								<div class="col-md-6 col-sm-9">						
									<h1 class="text-white">Dinas Energi dan Sumber Daya Mineral</h1>					
								</div>				
							</div>			
						</div>		
					</li>							
					<li class="overlay">			
						<div class="background-image-holder parallax-background">				
							<img class="background-image" alt="Background Image" src="/esdm/assets/img/bg/hero7.jpg">			
						</div>						
						<div class="container align-vertical">				
							<div class="row">					
								<div class="col-md-6 col-sm-9">						
									<h1 class="text-white">Dinas Energi dan Sumber Daya Mineral</h1>					
								</div>	
							</div>	
						</div>		
					</li>							
					<li class="overlay">			
						<div class="background-image-holder parallax-background">				
							<img class="background-image" alt="Background Image" src="/esdm/assets/img/bg/hero9.jpg">			
						</div>						
						<div class="container align-vertical">				
							<div class="row">					
								<div class="col-md-6 col-sm-9">						
									<h1 class="text-white">Dinas Energi dan Sumber Daya Mineral</h1>					
								</div>				
							</div>			
						</div>	
					</li>
				</ul>
			</section>
			<section class="no-pad-bottom projects-gallery">	
				<div class="container">		
					<div class="row">			
						<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 text-center">				
							<h1>Berita</h1>				
							<p class="lead">					Seputar ESDM				</p>			
						</div>		
					</div>	
				</div>		
				<div class="projects-wrapper clearfix">		
					<div class="container">			
						<div class="row">				
							<ul class="filters">
								<li data-filter="*" class="active">Semua</li>
								<?php $categories = $this->db->query("SELECT category FROM category")->result(); ?>
								<?php foreach ($categories as $k => $v): echo $k != 0 ? ' ' : ''; echo '<li data-filter=".'.$v->category.'">'.$v->category.'</li>'; endforeach ?>
							</ul>			
						</div>		
					</div>				
					<div class="projects-container">
						<?php foreach ($model as $key => $value): ?>
						<?php $categories = $this->db->query("SELECT category FROM categories_blogs join category ON category.id=categories_blogs.id_category where id_blog = ".$value->id_blog)->result(); ?>
						<div class="col-md-5 col-sm-12 no-pad project <?php foreach ($categories as $k => $v): echo $k != 0 ? ' ' : ''; echo $v->category; endforeach ?> image-holder" style="align:center">
							<div class="background-image-holder">
								<img class="background-image" alt="Background Image" src="/esdm/assets/img/content/project1.jpg">
							</div>
							<div class="hover-state">
								<div class="align-vertical">
									<h1 class="text-white"><strong><?php echo $value->title ?></strong></h1>
									<p class="text-white"><!-- ?php echo $value->created_at  echo $value->username?-->
										<?php echo strlen($value->content) > 50 ? substr($value->content, 0, 200) . '...' : $value->content ?>
									</p>
									<a href="<?php echo site_url('blog/read/' . $value->path . '/' . $value->id_blog) ?>" title="<?php echo $value->title ?>" class="btn btn-primary btn-white">Baca</a>
								</div>
							</div>
						</div>
					<?php endforeach ?>
					<?php echo $pagination ?>

						
					</div>
				</div>
			</section>
			<?php echo $this->output_view->get_wrapper('page') ?>
		</div>
		
		<?php
		$path = [
			'assets/js/jquery.min.js',
			'assets/js/jquery.plugin.min.js',
			'assets/plugins/bootstrap/dist/js/bootstrap.min.js',
			'assets/js/jquery.flexslider-min.js',
			'assets/js/smooth-scroll.min.js',
			'assets/js/skrollr.min.js',
			'assets/js/spectragram.min.js',
			'assets/js/scrollReveal.min.js',
			'assets/js/isotope.min.js',
			'assets/js/twitterFetcher_v10_min.js',
			'assets/js/lightbox.min.js',
			'assets/js/jquery.countdown.min.js',
			'assets/js/scripts.js',
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
		<?php echo $this->output_view->get_script() ?>
    </body>
</html>