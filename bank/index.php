<?php 
include "../connect.php";

if(isset($_POST['showdata'])){

	$dpinjaman = mysqli_query($con,"select * from tpinjaman");

	while($row = mysqli_fetch_row($dpinjaman)){
		echo 
		"<tr>
		<td>".$row[0]."</td>
		<td>".$row[1]."</td>
		<td>".$row[3]."</td>
		<td>".$row[2]."</td>
		";
		// <td><span class='glyphicon glyphicon-pencil' data-toggle='modal' data-target='#mPinjaman' data-act='".$row[0]."'></span></td>
		// <td><span class='glyphicon glyphicon-remove' data-toggle='modal' data-target='#mPinjaman' data-act='".(-1 * $row[0])."'></span></td></tr>";
	}
	exit();
}

if(isset($_POST['select'])){
	$id = $_POST['id'];
	$qselect = mysqli_query($con,"SELECT * FROM `tpinjaman` WHERE idtpinjaman = '$id'");
	$qselect = mysqli_fetch_array($qselect);
	header("Content-type: text/x-json");
	echo json_encode($qselect);
	exit();
}

if(isset($_POST['insert'])){
	$kel = $_POST['kel'];
	$cur = $_POST['cur'];
	$jum = $_POST['jum'];

	if($cur=="IDR"){
		$jual = 1;
		$curjual = 'cash1';
	}
	else if($cur == "SGD"){
		$jual = 2;

		$curjual = 'cash2';
	}
	else{
		$jual = 3;
		$curjual = 'cash3';
	}

	if($jum<0){//mengembalikan pinjaman
		$pjm = mysqli_fetch_row(mysqli_query($con, "select sum(nominal) from tpinjaman where iduser = $kel and currency = '$cur'"));
		$pjm = $pjm[0];
		$uang = mysqli_fetch_row(mysqli_query($con, "select $curjual from user where iduser = $kel"));
		$uang = $uang[0];

		if($pjm+$jum<0){
			echo 2;//pinjaman ga cukup
			exit();
		}
		else if($uang+$jum <0){//uang g cukup
			echo 0;
			exit();
		}else{//uang cukup
			$result=mysqli_query($con,"insert into tpinjaman value('', '$kel', '$jum', '$cur')");
			mysqli_query($con,"UPDATE `user` SET  $curjual =$curjual+'$jum' WHERE `iduser`='$kel'");
			echo "1";
			exit();

		}

	}
#bunga pinjaman
	if($jum > 0){
		$bunga = mysqli_fetch_row(mysqli_query($con, "select harga1 from setting where namasetting ='bungapinjam'"));
		$bunga = $bunga[0]/100;
		$bunga = $jum * $bunga;
		$result=mysqli_query($con,"insert into tpinjaman value('', '$kel', '$bunga', '$cur')");
		mysqli_query($con,"UPDATE `user` SET  $curjual =$curjual+'$jum' WHERE `iduser`='$kel'");
		$result=mysqli_query($con,"insert into tpinjaman value('', '$kel', '$jum', '$cur')");
		echo "1";

	}
	exit();
}

if(isset($_POST['update'])){
	$id = $_POST['id'];
	$kel = $_POST['kel'];
	$mata = $_POST['cur'];
	$jum = $_POST['jum'];
	$id2 = $id+1;
	$cur = mysqli_fetch_array(mysqli_query($con,"SELECT nominal,currency,iduser FROM `tpinjaman` WHERE idtpinjaman = '$id'"));

	if($cur[1]=="IDR"){
		$jual = 1;
		$curjual = 'cash1';
	}
	else if($cur[1] == "SGD"){
		$jual = 2;
		$curjual = 'cash2';
	}
	else{
		$jual = 3;
		$curjual = 'cash3';
	}
	$temp = mysqli_query($con, "SELECT $curjual FROM `user` WHERE iduser='$cur[2]'");
	$temp = mysqli_fetch_row($temp);
	$bayar = $temp[0] - $cur[0] +$jum;
	mysqli_query($con,"UPDATE `user` SET  $curjual ='$bayar' WHERE `iduser`='$cur[2]'");

	mysqli_query($con,"UPDATE `tpinjaman` SET `iduser`='$kel',`currency`='$mata',`nominal`='$jum' WHERE idtpinjaman='$id'");
	mysqli_query($con,"UPDATE `tpinjaman` SET `iduser`='$kel',`currency`='$mata',`nominal`= 0.1*$jum WHERE idtpinjaman='$id2'");
	exit();
}

if(isset($_POST['deletedata'])){
	$id = $_POST['id'];
	$id2=$id +1;
	$cur = mysqli_fetch_array(mysqli_query($con,"SELECT nominal,currency,iduser FROM `tpinjaman` WHERE idtpinjaman = '$id'"));
 	mysqli_query($con,"DELETE FROM `tpinjaman` WHERE idtpinjaman = '$id'");
 	mysqli_query($con,"DELETE FROM `tpinjaman` WHERE idtpinjaman = '$id2'");

	if($cur[1]=="IDR"){
		$jual = 1;
		$curjual = 'cash1';
	}
	else if($cur[1] == "SGD"){
		$jual = 2;
		$curjual = 'cash2';
	}
	else{
		$jual = 3;
		$curjual = 'cash3';
	}
	$temp = mysqli_query($con, "SELECT $curjual FROM `user` WHERE iduser='$cur[2]'");
	$temp = mysqli_fetch_row($temp);
	$bayar = $temp[0] - $cur[0];
	mysqli_query($con,"UPDATE `user` SET  $curjual ='$bayar' WHERE `iduser`='$cur[2]'");
	exit();
}

include "headerbank.php";
$dkelompok = mysqli_query($con,"select * from user");
?>

<div class="container">
	<div class="col-md-8 col-md-offset-2">
		<form class="form-horizontal">
			<fieldset>
				<div class="form-group">
					<label class="col-sm-2 control-label">Pinjaman</label>
					<div class="col-sm-10">
						<input type="checkbox" name="ipinjaman" value="0" data-toggle="toggle" data-on="Kembali" data-off="Pinjam" data-onstyle="success" data-offstyle="danger">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Tim</label>
					<div class="col-sm-10">
						<select id="ikelompok" class="selectpicker form-control" data-live-search="true">
							<option disabled selected value>Tim</option>
							<?php 
							while($row = mysqli_fetch_row($dkelompok)){
								echo "<option value=".$row[0].">".$row[0]." - ".$row[1]."</option>";
							}
							?>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Mata Uang</label>
					<div class="col-sm-10" >
						<label class="radio-inline">
							<input type="radio" name="icurrency" value="IDR" class="flat" checked=""> IDR
						</label>
						<label class="radio-inline">
							<input type="radio" name="icurrency" value="SGD" class="flat"> SGD
						</label>
						<label class="radio-inline">
							<input type="radio" name="icurrency" value="RMB" class="flat"> RMB
						</label>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Jumlah</label>
					<div class="col-sm-10">
						<input class="form-control" id="ijumlah" placeholder="Jumlah" type="number" min="1">
					</div>
				</div>    
				<div class="form-group">
					<div class="col-sm-10 col-sm-offset-2">
						<button type="reset" class="btn btn-default">Cancel</button>
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mPinjaman" data-act="insert">Submit</button>
					</div>
				</div>
			</fieldset> 
		</form>
	</div>
	<div class="col-xs-12 mt2">
		<table id="datatable" class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>ID</th>
					<th>Kelompok</th>
					<th>Mata Uang</th>
					<th>Jumlah</th>
					<!-- <th>Edit</th> -->
					<!-- <th>Delete</th> -->
				</tr>
			</thead>
			<tbody id="showdata"></tbody>
		</table>
	</div>
</div>

<div class='modal fade' id='mPinjaman' tabindex='-1' role='dialog' aria-labelledby='myModalLabel'>
	<div class='modal-dialog' role='document'>
		<div class='modal-content'>

			<div class='modal-header'>
				<button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>
				<h4 class='modal-title'></h4>
			</div>
			<div class="modal-body modal-kata"></div>
			<div class='modal-body' id="modal-isi">
				<table class='table table-bordered'>
					<thead>
						<tr>
							<th id="htabelid">ID</th>
							<th>Kelompok</th>
							<th>Mata Uang</th>
							<th>Jumlah</th>
						</tr>
					</thead>
					<tbody>
						<tr class="modal-tabel"></tr>
					</tbody>
				</table>
			</div>
			<div class='modal-footer'>
				<button type='button' class='btn btn-danger' id="btn-no" data-dismiss='modal'>No</button>
				<button type='submit' class='btn btn-success' id="btn-yes" data-dismiss='modal'>Yes</button>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	$('#mPinjaman').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget);
		var act = button.data('act');

		if(act=="insert"){
			var _kel = $('#ikelompok').val();
			var _pin = $("input[name='ipinjaman']:checked").val();
			var _cur = $("input[name='icurrency']:checked").val();
			var _jum = $('#ijumlah').val();
			if(_pin=="0"){_jum*=-1;}

			if(_jum=="" || !_kel){
				$(".modal-title").html("Error 101!");
				$(".modal-kata").html("Data yang dimasukkan tidak valid.");
				$("#modal-isi").hide();
			}else{
				//alert(_kel);
				$(".modal-title").html("Konfirmasi!");
				$(".modal-kata").html("Apakah anda yakin ingin memasukkan ini?");
				$("#modal-isi").show();
				$("#htabelid").hide();
				$(".modal-tabel").html(
					"<td id='mkel'>"+_kel+"</td>"+
					"<td id='mcur'>"+_cur+"</td>"+
					"<td id='mjum'>"+_jum+"</td>"
					);
				$("#btn-yes").attr("onclick","insert()");
			}
		}else if(parseInt(act)>0){
			$.ajax({
				url: "index.php",
				type: "POST",
				async: false,
				data: {
					select: 1,
					id: act
				},
				success: function(res)
				{
					$(".modal-title").html("Edit");
					$(".modal-kata").html("Silahkan mengedit data");
					$("#htabelid").show();
					$("#modal-isi").show();
					$(".modal-tabel").html(
						"<td id='mid'>"+res.idtpinjaman+"</td>"+
						"<td><input id='mkel' type='text' name='kel' value='"+res.iduser+"'></td>"+
						"<td><input id='mcur' type='text' name='cur' value='"+res.currency+"'></td>"+
						"<td><input id='mjum' type='number' name='jum' value='"+res.nominal+"'></td>"
						);
					$("#btn-yes").attr("onclick","update()");
				}
			});

		}else if(parseInt(act)<0){
			$.ajax({
				url: "index.php",
				type: "POST",
				async: false,
				data: {
					select: 1,
					id: act*-1
				},
				success: function(res)
				{
					$(".modal-title").html("Konfirmasi!");
					$(".modal-kata").html("Apakah anda yakin ingin menghapus ini?");
					$("#htabelid").show();
					$("#modal-isi").show();
					$(".modal-tabel").html(
						"<td id='mid'>"+res.idtpinjaman +"</td>"+
						"<td id='mkel'>"+res.iduser +"</td>"+
						"<td id='mcur'>"+res.currency+"</td>"+
						"<td id='mjum'>"+res.nominal+"</td>"
						);
					$("#btn-yes").attr("onclick","deletedata()");
				}
			});
		}
	})

	function showdata(){
		$.ajax({
			url: "index.php",
			type: "POST",
			async: false,
			data: {showdata: 1},
			success: function(res)
			{
				$('#showdata').html(res);
			}
		});
	}

	function insert(){
		var _kel = $('#mkel').html();
		var _cur = $('#mcur').html();
		var _jum = parseInt($('#mjum').text());

		$.ajax({
			url: "index.php",
			type: "POST",
			async: false,
			data: {
				insert: 1,
				kel: _kel,
				cur: _cur,
				jum: _jum  
			},
			success: function(res)
			{
				if(res==0)alert("Uang tidak mencukupi");
				else if(res==2)alert("Jumlah yang dibayar melebihi pinjaman");
				showdata();
				$('#ijumlah').val("");
				$("#btn-yes").attr("onclick","");
        location.reload();
    }
});
	}

	function update(){
		var _id = parseInt($('#mid').html());
		var _kel = $('#mkel').val();
		var _cur = $('#mcur').val();
		var _jum = parseInt($('#mjum').val());

		$.ajax({
			url: "index.php",
			type: "POST",
			async: false,
			data: {
				update: 1,
				id: _id,
				kel: _kel,
				cur: _cur,
				jum: _jum  
			},
			success: function(res)
			{
				showdata();
				$("#btn-yes").attr("onclick","");
        location.reload();
    }
});
	}

	function deletedata(){
		var _id = parseInt($('#mid').html());

		$.ajax({
			url: "index.php",
			type: "POST",
			async: false,
			data: {
				deletedata: 1,
				id: _id
			},
			success: function(res)
			{
				showdata();
				$("#btn-yes").attr("onclick","");
        location.reload();
    }
});
	}

	$(function() {
		document.getElementById("pinjaman").className += "active";
		showdata();
	});
</script>
<?php include "footerbank.php"; ?>