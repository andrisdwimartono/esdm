<?php
try{
	$koneksi=new PDO('mysql:host=localhost;dbname=adipatik_esdm2','root','');	
}catch(PDOException $e){
	echo "Koneksi Database gagal ".$e->getMessage();
	exit;
}
?>