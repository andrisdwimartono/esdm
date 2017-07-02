<div class="main-container">
	<header class="title">
			<div class="background-image-holder parallax-background">
				<img class="background-image" alt="Background Image" src="/esdm/assets/img/bg/grey-bg.jpg">
			</div>
			<div class="container align-bottom">
				<div class="row">
					<div class="col-xs-12">
						<h1 class="text-white"><?php echo "Foto Gallery" ?></h1>
					</div>
				</div>
			</div>
	</header>
<section class="article-single">
		<div class="container">
			<div class="row">
			<div class="col-sm-12 text-center">
						<div class="media-lib-container">
						<?php if ($media): ?>
							<?php foreach ($media as $key => $value): ?>
								<a data-toggle="modal" href='#modal-id' data-id="<?php echo $value->id ?>" data-file="<?php echo $value->file ?>" data-name="<?php echo $value->name ?>" data-date="<?php echo $value->uploaded_at ?>" data-user="<?php echo $value->username ?>" data-ext="<?php echo $value->ext ?>" class="media-lib-grid normal">
									<img src="<?php echo base_url('assets/uploads/image/' . $value->name . '-thumb' . $value->ext) ?>" alt="Image"  style="border-style:solid;border-width:5px 10px 10px 15px;border-color:#edeff4;">
								</a>
							<?php endforeach ?>
						<?php else: ?>
							<h2 class="title-none text-center">There is no files uploaded.</h2>
							<a data-toggle="modal" href='#modal-id' data-id="" data-file="" data-name="" data-date="" data-user="" class="media-lib-grid normal" style="display: none;">
								<img src="" alt="Image">
								<div class="selected-check">
									<i class="fa fa-check-circle"></i>
								</div>
							</a>
						<?php endif ?>
						<?php if($this->ion_auth->logged_in()){?>
						<button type="button" class="btn btn-default btn-flat btn-block" id="load-more" style="<?php echo $count ? 'display:none' : 'display:block' ?>">Load more</button>
						<?php }?>
						</div>
			</div>
			</div>
		</div>
</section>
</div>
<!-- Modal -->
						<div class="modal fade" id="modal-id">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										<h4 class="modal-title">Image Detil</h4>
									</div>
									<div class="modal-body">
										<div class="row">
											<div class="col-md-8 col-lg-8">
												<img src="<?php echo base_url('assets/img/myIgniter-wide.jpg') ?>" class="img-responsive media-lib-image" alt="Image">
											</div>
											<div class="col-md-4 col-lg-4">
												<strong>File name : </strong><span class="media-lib-name"></span><br>
												<strong>Uploaded on : </strong><span class="media-lib-date"></span><br>
												<strong>Uploaded by : </strong><span class="media-lib-user"></span><br>
												<hr>
												<div class="form-group">
													<label for="input" class="control-label">Url :</label>
													<input type="text" class="form-control input-sm media-lib-url" value="<?php echo base_url() ?>" readonly="readonly">
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
