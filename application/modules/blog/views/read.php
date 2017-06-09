<div class="main-container">
	<header class="title">
			<div class="background-image-holder parallax-background">
				<img class="background-image" alt="Background Image" src="/esdm/assets/img/bg/grey-bg.jpg">
			</div>
			<div class="container align-bottom">
				<div class="row">
					<div class="col-xs-12">
						<h1 class="text-white"><?php echo $model->title ?></h1>
						<span class="sub alt-font text-white"><?php foreach ($categories as $key => $value): echo $key != 0 ? ', ' : ''; echo $value->category; endforeach ?> - <?php echo $model->created_at ?> - 3 Minute Read</span>
					</div>
				</div>
			</div>
	</header>
	<section class="article-single">
		<div class="container">
			<div class="row">

				<div class="col-sm-4 col-md-3">
					<div class="author-details no-pad-top">
						<?php $user = $this->ion_auth->user($model->id_user)->row();?>
						<?php if (filter_var($user->photo,FILTER_VALIDATE_URL)): ?>
						 <img src="<?php echo $user->photo; ?>" class="user-image" alt="<?php echo $user->full_name ?>"/>
						<?php else: ?>
						 <img src="<?php echo $user->photo == '' ? base_url('assets/img/logo/kotaxdev.png') : base_url('assets/uploads/image/'.$user->photo) ?>" class="user-image" alt="<?php echo $user->full_name ?>"/>
						<?php endif; ?>
						<h5><?php echo $model->username ?></h5>
						<ul class="social-icons">
						<li>
							<a href="#">
								<i class="icon social_twitter"></i>
							</a>
						</li>
						
						<li>
							<a href="#">
								<i class="icon social_facebook"></i>
							</a>
						</li>
						
						<li>
							<a href="#">
								<i class="icon social_tumblr"></i>
							</a>
						</li>
					</ul>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="article-body">
						<?php echo $model->content ?>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8 col-md-offset-3 col-sm-10 col-sm-offset-1">
				<div id="disqus_thread" class="comment-list"></div></div>
				<script>

/**
*  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
*  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/

var disqus_config = function () {
this.page.url = <?php echo "blog/".$model->path ?>;
this.page.identifier = <?php echo $model->id ?>;
};

(function() {
var d = document, s = d.createElement('script');
s.src = 'https://esdm.disqus.com/embed.js';
s.setAttribute('data-timestamp', +new Date());
(d.head || d.body).appendChild(s);
})();
</script>
<noscript>Mohon aktifkan JavaScript untuk melihat <a href="https://disqus.com/?ref_noscript">Komentar.</a></noscript>
			</div>
			
		</div>
	</section>
	<script id="dsq-count-scr" src="//esdm.disqus.com/count.js" async></script>