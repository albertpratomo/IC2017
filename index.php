<?php 
include "connect.php";
SESSION_START();
if(isset($_POST['username']) && isset($_POST['password'])){
	if($_POST['username']=='bank' && $_POST['password']=='bank'){
		$_SESSION['id']='admin';
		header("location:bank");
	}else if($_POST['username']=='pbindonesia' && $_POST['password']=='pbindonesia'){
		$_SESSION['id']='pbindonesia';  
		header("location:pasarbeli");
	}
	else if($_POST['username']=='pbsingapura' && $_POST['password']=='pbsingapura'){
		$_SESSION['id']='pbsingapura';  	
		header("location:pasarbeli");
	}
	else if($_POST['username']=='pbchina' && $_POST['password']=='pbchina'){
		$_SESSION['id']='pbchina';  	
		header("location:pasarbeli");
	}
	else if($_POST['username']=='pjindonesia' && $_POST['password']=='pjindonesia'){
		$_SESSION['id']='pjindonesia';  
		header("location:pasarjual");
	}
	else if($_POST['username']=='pjsingapura' && $_POST['password']=='pjsingapura'){
		$_SESSION['id']='pjsingapura';  	
		header("location:pasarjual");
	}
	else if($_POST['username']=='pjchina' && $_POST['password']=='pjchina'){
		$_SESSION['id']='pjchina';  	
		header("location:pasarjual");
	

	}else if($_POST['username']=='gamemaster' && $_POST['password']=='gamemaster'){
		$_SESSION['id']='admin';  	
		header("location:gamemaster");
	}else{
		$cek = mysqli_query($con,"SELECT count(*) FROM user where nama = '".$_POST['username']."' and password = '".$_POST['password']."'");
		$cek = mysqli_fetch_row($cek);
		$cek = $cek[0];
		if($cek == 1){
			$id = mysqli_query($con,"SELECT iduser from user where nama = '".$_POST['username']."' ");
			$id = mysqli_fetch_row($id);
			$id = $id[0];
			$_SESSION['id'] = $id;
			header("location:dashboard");
		}
		else {
			header("location:index.php?err=1");
		}
		
	}
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>Industrial Competition 2017</title>

	<!-- Bootstrap -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-default" style="margin:0" >
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="">IC 2017</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a>Login</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div style="background-image: url('images/bglogin.png');height: 91vh; display:flex;">
		<div class="container mt5">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<img src="images/logoicblue.png" class="img-responsive img-center">
				</div>
			</div>
			<div class="row mt2">
				<div class="col-sm-6 col-sm-offset-3">
					<form class="form-horizontal" action="index.php" method="post">
						<fieldset>
							<div class="form-group">
								<label for="inputEmail" class="col-sm-2 control-label">Username</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="username" placeholder="Username">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword" class="col-sm-2 control-label">Password</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" name="password" placeholder="Password">
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-8">
									<button type="reset" class="btn btn-success">Cancel</button>
									<input type="submit" class="btn btn-primary" value="Sign In">
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modalLogin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">Oops!</h4>
				</div>
				<div class="modal-body">
					Username or password is incorrect.
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
	<?php 
	if(isset($_GET['err']) && $_GET['err']==1){
		echo"
		<script type='text/javascript'>
			$(window).load(function(){
				$('#modalLogin').modal('show');
			});
		</script>";
	}
	?>
</body>
</html>