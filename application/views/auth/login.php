<div class="login-box">
  <div class="login-logo">
    <a href="<?php echo site_url() ?>"><img src="<?php echo base_url($this->output_view->get_logo()) ?>" height="100px"></a>
    
  </div><!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Sign in to start your session</p>
    <?php echo $message;?>
    <?php echo form_open('login'); ?>
    <div class="form-group has-feedback">
      <input type="email" name="identity" class="form-control" placeholder="Email" required="required" autofocus />
      <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
    </div>
    <div class="form-group has-feedback">
      <input type="password" id="password" data-toggle="password" name="password" class="form-control" placeholder="Password" required="required" />
    </div>
    <div class="row">
      <div class="col-xs-8">    
        <div class="checkbox icheck">
          <label>
            <input name="remember" type="checkbox" value="1"> Remember
          </label>
        </div>                        
      </div><!-- /.col -->
      <div class="col-xs-4">
        <button type="submit" class="btn btn-primary btn-block btn-flat" id="btnLoading">Login</button>
      </div><!-- /.col -->
    </div>
    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="<?php echo $login_url; ?>" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using Facebook</a>
      <a href="<?php echo $googlelogin; ?>" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google"></i> Sign in using Google+</a>
      <a href="<?php echo $twitter; ?>" class="btn btn-block btn-social btn-twitter btn-flat"><i class="fa fa-twitter"></i> Sign in using Twitter</a>
      <a href="<?php echo base_url('myigniter/link')?>" class="btn btn-block btn-social btn-linkedin btn-flat"><i class="fa fa-linkedin"></i> Sign in using LinkedIn</a>
    </div>
    <?php echo form_close(); ?>
    <a href="<?php echo site_url('forgot-password') ?>" title="Sign Up">I forgot my password</a><br>
    <a href="<?php echo site_url('register') ?>" title="Sign Up">Register a new membership</a>
  </div><!-- /.login-box-body -->
  <br>
</div><!-- /.login-box -->
<script>
  $(function(){
    $('input').iCheck({ checkboxClass: 'icheckbox_square-blue' });
  });
</script>