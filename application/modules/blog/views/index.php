<div class="main-container">
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
					<li data-filter="*" <?php echo (($this->uri->segment(3) != "berita") && ($this->uri->segment(3) != "artikel") && ($this->uri->segment(3) != "informasi")) ? 'class="active"' : '';?>>Semua</li>
					<li data-filter=".Berita" <?php echo $this->uri->segment(3) == "berita" ? 'class="active"' : '';?>>Berita</li>
					<li data-filter=".Artikel"<?php echo $this->uri->segment(3) == "artikel" ? 'class="active"' : '';?>>Artikel</li>
					<li data-filter=".Informasi"<?php echo $this->uri->segment(3) == "informasi" ? 'class="active"' : '';?>>Informasi</li>
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
</div>