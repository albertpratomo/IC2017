<?php 
session_start();
if($_SESSION['id']!='admin'){
  header("location:../index.php");
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
	<link href="../css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Toggle -->
  <link href="../vendors/bootstrap-toggle-master/css/bootstrap-toggle.min.css" rel="stylesheet">
  <!-- Bootstrap Select -->
  <link href="../css/bootstrap-select.css" rel="stylesheet">
  <!-- iCheck -->
  <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
  <!-- Datatables -->
  <link href="../vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
  <link href="../vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
  <link href="../vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
  <link href="../vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
  <link href="../vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
  <!-- Custom Style -->
  <link href="../css/style.css" rel="stylesheet">
  <script src="../js/jquery.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand">IC 2017 | Bank</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <li id="pinjaman"><a href="index.php">Pinjaman</a></li>
        <li id="tabungan"><a href="tabungan.php">Tabungan</a></li>
        <!-- <li id="saham"><a href="saham.php">Saham</a></li> -->
        <li id="moneychanger"><a href="moneychanger.php">Money Changer</a></li>
        <!-- <li id="viewbank"><a href="viewbank.php">View</a></li> -->
        <li><a href="../logout.php">Log Out</a></li>
      </ul>
    </div>
  </div>
</nav>
