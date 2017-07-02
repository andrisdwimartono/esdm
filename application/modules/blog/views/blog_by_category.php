<div class="main-container">
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
				<p class="lead">
					Seputar ESDM
				</p>
			</div>
		</div>
	</div>
	
	<div class="projects-wrapper clearfix">
		<div class="container">
			<div class="row">
				<ul class="filters">
					<?php $categories = $this->db->query("SELECT category FROM category where category='".$category."'")->result(); ?>
					<?php foreach ($categories as $k => $v): echo $k != 0 ? ' ' : ''; echo '<li data-filter=".'.$v->category.'">'.$v->category.'</li>'; endforeach ?>
				</ul>
			</div>
		</div>
		
		<div class="projects-container">
		<?php foreach ($model as $key => $value): ?>
			<?php $categories = $this->db->query("SELECT category FROM categories_blogs join category ON category.id=categories_blogs.id_category where id_blog = ".$value->id_blog)->result(); ?>
			<div class="col-md-6 col-sm-12 no-pad project <?php foreach ($categories as $k => $v): echo $k != 0 ? ' ' : ''; echo $v->category; endforeach ?> image-holder">
				<div class="background-image-holder">
					<img class="background-image" alt="Background Image" src="/esdm/assets/img/content/project1.jpg">
				</div>
				<div class="hover-state">
					<div class="align-vertical">
						<h1 class="text-white"><strong><?php echo $value->title ?></strong></h1>
						<a href="<?php echo site_url('blog/read/' . $value->path . '/' . $value->id_blog) ?>" title="<?php echo $value->title ?>" class="btn btn-primary btn-white">Baca</a>
						<p class="text-white"><!-- ?php echo $value->created_at  echo $value->username?-->
							<?php 
							echo strlen($value->content) > 50 ? substr(strip_tags($value->content), 0, 200) . '...' : strip_tags($value->content) ?>
						</p>
						
					</div>
				</div>
			</div>
		<?php endforeach ?>
		
		</div>
	</div>
		<div class="text-center">
			<?php echo $pagination ?>
		</div>
</section>
</div>