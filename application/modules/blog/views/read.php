<div class="main-container">
	<header class="title">
			<div class="background-image-holder parallax-background">
				<img class="background-image" alt="Background Image" src="/esdm/assets/img/bg/grey-bg.jpg">
			</div>
			<div class="container align-bottom">
				<div class="row">
					<div class="col-xs-12">
						<h1 class="text-white"><?php echo $model->title ?></h1>
						<span class="sub alt-font text-white"><?php foreach ($categories as $key => $value): echo $key != 0 ? ', ' : ''; echo $value->category; endforeach ?> - <?php echo $model->created_at ?></span>
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
				
				<div class="fb-share-button" data-href="<?php echo $url_path; ?>" data-layout="box_count" data-size="small" data-mobile-iframe="true">
					<a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse">Bagikan</a>
				</div>
				<div class="col-sm-8">
					<div class="article-body">
						<?php echo $model->content ?>
					</div>
						<?php 
						foreach($comments as $comment){
							$accepting = '';
							if($this->ion_auth->logged_in() && $comment->comment_state == 'deleted'){
								$accepting = '<br><a class="comment-ok" href="../../../blog/accept_comment/'.$comment->comment_id.'/'.$comment->id_blog.'/accepted">Accept</a>';
							}elseif($this->ion_auth->logged_in() && $comment->comment_state == 'accepted'){
								$accepting = '<br><a class="comment-no" href="../../../blog/accept_comment/'.$comment->comment_id.'/'.$comment->id_blog.'/deleted">Delete</a><a class="comment-reply" id="reply-comment-'.$comment->comment_id.'" href="#rep" onclick="document.getElementById(\'reply-comment-form-'.$comment->comment_id.'\').style.display = \'unset\';">Reply</a>';
							}elseif($comment->comment_state == 'accepted'){
								$accepting = '<br><a class="comment-reply" id="reply-comment-'.$comment->comment_id.'" href="#rep" onclick="document.getElementById(\'reply-comment-form-'.$comment->comment_id.'\').style.display = \'unset\';">Reply</a>';
							}elseif($this->ion_auth->logged_in() && $comment->comment_state == 'waiting'){
								$accepting = '<br><a class="comment-ok" href="../../../blog/accept_comment/'.$comment->comment_id.'/'.$comment->id_blog.'/accepted">Accept</a> <a class="comment-no" href="../../../blog/accept_comment/'.$comment->comment_id.'/'.$comment->id_blog.'/deleted">Delete</a>';
							}
							
							$comme = $comment->comment_body;
							if($comment->comment_state == 'waiting'){
								if(!$this->ion_auth->logged_in()){
									$comme = '<font color="#a8bf00">Komentar menunggu moderasi</font>';
								}else{
									$comme .= '<br><font color="#a8bf00">Komentar menunggu moderasi</font>';
								}
							}elseif($comment->comment_state == 'deleted'){
								if(!$this->ion_auth->logged_in()){
									$comme = '<font color="#cc2702">Komentar dihapus oleh admin</font>';
								}else{
									$comme .= '<br><font color="#cc2702">Komentar dihapus oleh admin</font>';
								}
							}
							$date=date_create($comment->comment_created);
							echo '<div class="comment-body">'.'<div class="comment-name">'.$comment->comment_name.' pada '.date_format($date,"d M Y H:i:s").'</div>'.
							$comme.'<div class="act-comment">'.$accepting.'</div></div><br>';
							echo '';
							?>
							<div class="comment-form"  style="display:none;" id="reply-comment-form-<?php echo $comment->comment_id;?>">
								<form action="../../insert_comment_reply/<?php echo $model->id_blog;?>" method="post">
								<label>Balas Komentar</label>
								<input class="form-name validate-required comment-input" type="text" placeholder="Nama" name="comment_name"<?php if($this->ion_auth->logged_in()){echo " value=\"".$this->ion_auth->user()->row()->full_name."\"";}?> maxlength="100">
								<input class="form-email validate-required validate-email comment-input" type="text" placeholder="Email" name="comment_email"<?php if($this->ion_auth->logged_in()){echo " value=\"".$this->ion_auth->user()->row()->email."\"\"";}?> maxlength="100"><br>
								<textarea name="comment_message" class="form-message validate-required" placeholder="Pesan"></textarea><br>
								<input type="hidden" name="comment_parent" value="<?php echo $comment->comment_id;?>">
								<div class="submit-comment"><input type="button" class="comment-reply-cancel" value="Cancel" onclick="document.getElementById('reply-comment-form-<?php echo $comment->comment_id;?>').style.display = 'none';"> <input type="submit" class="send-form btn-filled" value="Kirim"></div>
								<input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>">
								</form>
							</div>
							<?php 
							//comment reply
								foreach($comments_replies as $comment_reply){
									if($comment_reply->parent_id == $comment->comment_id){
										$accepting = '';
										if($this->ion_auth->logged_in() && $comment_reply->comment_state == 'deleted'){
											$accepting = '<br><a class="comment-ok" href="../../../blog/accept_comment/'.$comment_reply->comment_id.'/'.$comment_reply->id_blog.'/accepted">Accept</a>';
										}elseif($this->ion_auth->logged_in() && $comment_reply->comment_state == 'accepted'){
											$accepting = '<br><a class="comment-no" href="../../../blog/accept_comment/'.$comment_reply->comment_id.'/'.$comment_reply->id_blog.'/deleted">Delete</a>';
										}elseif($this->ion_auth->logged_in() && $comment_reply->comment_state == 'waiting'){
											$accepting = '<br><a class="comment-ok" href="../../../blog/accept_comment/'.$comment_reply->comment_id.'/'.$comment_reply->id_blog.'/accepted">Accept</a> <a class="comment-no" href="../../../blog/accept_comment/'.$comment_reply->comment_id.'/'.$comment_reply->id_blog.'/deleted">Delete</a>';
										}
										
										$comme = $comment_reply->comment_body;
										if($comment_reply->comment_state == 'waiting'){
											if(!$this->ion_auth->logged_in()){
												$comme = '<font color="#a8bf00">Komentar menunggu moderasi</font>';
											}else{
												$comme .= '<br><font color="#a8bf00">Komentar menunggu moderasi</font>';
											}
										}elseif($comment_reply->comment_state == 'deleted'){
											if(!$this->ion_auth->logged_in()){
												$comme = '<font color="#cc2702">Komentar dihapus oleh admin</font>';
											}else{
												$comme .= '<br><font color="#cc2702">Komentar dihapus oleh admin</font>';
											}
										}
										$date=date_create($comment_reply->comment_created);
										echo '<div class="comment-body-reply">'.'<div class="comment-name">'.$comment_reply->comment_name.' pada '.date_format($date,"d M Y H:i:s").'</div>'.
										$comme.'<div class="act-comment">'.$accepting.'</div></div><br>';
										echo '';
								?>
						<?php
									}
								}
							}
						?>
						<div class="comment-form">
							<form action="../../insert_comment/<?php echo $model->id_blog;?>" method="post">
							<label>Isi Komentar</label>
							<input class="form-name validate-required comment-input" type="text" placeholder="Nama" name="comment_name"<?php if($this->ion_auth->logged_in()){echo " value=\"".$this->ion_auth->user()->row()->full_name."\"";}?> maxlength="100">
							<input class="form-email validate-required validate-email comment-input" type="text" placeholder="Email" name="comment_email"<?php if($this->ion_auth->logged_in()){echo " value=\"".$this->ion_auth->user()->row()->email."\"\"";}?> maxlength="100">
							<textarea name="comment_message" class="form-message validate-required" placeholder="Pesan"></textarea>
							<div class="submit-comment"><input type="submit" class="send-form btn-filled" value="Kirim"></div>
							<input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>">
							</form>
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