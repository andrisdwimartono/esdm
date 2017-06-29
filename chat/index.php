<?php 
session_start();
error_reporting(E_ALL);
include "koneksi.php";
if(empty($_SESSION['nick']))
{
	if(isset($_COOKIE['nick']))
	{
		$_SESSION['nick']=$_COOKIE['nick'];
		header("location:".$_SERVER['PHP_SELF']);
	}
	else
	{
		belum_login();
	}
}
else
{
	sudah_login();
}
function belum_login(){
?>
<!doctype html>
<html lang="en">
<meta charset="utf-8">
<head>
<title> Selamat Datang </title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="jquery/jquery-1.10.2.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="style.css">
<script src="ajaxku.js"></script>
<body>
<!-- CONTAINER -->
<div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a rel="nofollow" rel="noreferrer"href="#signup">Sign Up</a></li>
        <li class="tab"><a rel="nofollow" rel="noreferrer"href="#login">Log In</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup">   
          <h1>Sign Up for Chatting</h1>
          
			<form id="formdaftar">
          
          <div class="field-wrap">
            <label>
              Name<span class="req">*</span>
            </label>
            <input id="dnick" type="text"required autocomplete="off"/>
          </div>

          <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input  id="email" type="email"required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Set A Password<span class="req">*</span>
            </label>
            <input id="dpass" type="password"required autocomplete="off"/>
          </div>
          
          <button type="submit" class="button button-block" id="daftar"/>Get Started</button>
			<p id="dnotif"></p>
          
          </form>

        </div>
        
        <div id="login">   
          <h1>Welcome Back!</h1>
          
			<form id="formmasuk" method="post" action="">
          
            <div class="field-wrap">
            <label>
              Name<span class="req">*</span>
            </label>
            <input  id="nick" type="text"required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input id="pass" type="password"required autocomplete="off"/>
          </div>
                  
			<button type="submit" class="button button-block" id="masuk">Log In</button>
			<p id="notif"></p>
          
          </form>

        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
<script src="myscripts.js"></script></head>

</body>
</html>

<?php }
function sudah_login(){
?>
<!doctype html>
<html lang="en">
<head>
<title> Nge-Chatz, Ruang Percapakan </title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<link href="style_sesudah.css" rel="stylesheet">
<script src="bootstrap/js/jQuery.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script src="ajaxku.js"></script>

</head>
<body>
<div class="container">
	<div class="row">
		<div class="span6 offset2">
			<h1 class="text-info pull-left"> Chat Room </h1>
		</div>
		<div class="span2">
			<a href="logout.php" class="btn btn-danger"  type="button" ><i class="icon-off icon-white"></i> Sign Out </a>
		</div>
	</div>
	<div class="row">
		<div class="span6 offset2">
				<div id="boxpesan">
				</div>
		</div>
		<div class="span2">
				<div class="boxonline">
				</div>
		</div>
	</div>
	</br>
	<div class="row">
		<div class="span6 offset2">
			<form method="post" action="" id="formpesan" class="form-inline">
			<input class="input-xlarge" name="pesan" type="text" placeholder="Ketik Pesan kemudian Enter !" required x-moz-errormessage="Ketik pesannya gan !">
			<input type='submit' value='Send' class='btn btn-info pull-right' id='pencet'>
			</form>
		<audio controls id="suara">
		<source src="../Nge_Chat/chat.mp3" type="audio/mpeg">
		Your browser does not support the audio element.
		</audio>
		</div>

	</div>
</div>
</body>
</html>
<?php  
}
?>
