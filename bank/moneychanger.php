<?php 
include "../connect.php";

if(isset($_POST['showdata'])){

	$dcurrency = mysqli_query($con,"select * from tcurrency");

	while($row = mysqli_fetch_row($dcurrency)){
		echo 
		"<tr>
		<td>".$row[0]."</td>
		<td>".$row[1]."</td>
		<td>".$row[2]."</td>
		<td>".$row[3]."</td>
		<td>".$row[4]."</td>";
		// <td><span class='glyphicon glyphicon-pencil' data-toggle='modal' data-target='#mCurr' data-act='".$row[0]."'></span></td>
		// <td><span class='glyphicon glyphicon-remove' data-toggle='modal' data-target='#mCurr' data-act='".(-1 * $row[0])."'></span></td></tr>";
	}
	exit();
}

if(isset($_POST['select'])){
	$id = $_POST['id'];
	$qselect = mysqli_query($con,"SELECT * FROM `tcurrency` WHERE idtcurrency = '$id'");
	$qselect = mysqli_fetch_array($qselect);
	header("Content-type: text/x-json");
	echo json_encode($qselect);
	exit();
}

if(isset($_POST['insert'])){
	$kel = $_POST['kel'];
	$cur = $_POST['cur'];
	$cur2 = $_POST['cur2'];
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

	if($cur2=="IDR"){
		$beli = 1;
		$curbeli = 'cash1';
	}
	else if($cur2 == "SGD"){
		$beli = 2;
		$curbeli = 'cash2';		
	}
	else{
		$beli = 3;
		$curbeli = 'cash3';		
	}
	$hbeli = mysqli_query($con,"SELECT hjual FROM `currency` WHERE idcurrency ='$beli'");
	$hbeli = mysqli_fetch_row($hbeli);
	$hbeli = $hbeli[0];//kurs beli
	$hjual = mysqli_query($con,"SELECT hjual FROM `currency` WHERE idcurrency ='$jual'");
	$hjual = mysqli_fetch_row($hjual);
	$hjual = $hjual[0];//kurs jual

	$bayar = $hbeli*$jum/$hjual;
	$terima = mysqli_query($con, " SELECT $curbeli FROM `user` WHERE iduser='$kel'");
	$terima = mysqli_fetch_row($terima);
	$terima = $terima[0]+$bayar;
	$temp = mysqli_query($con, "SELECT $curjual FROM `user` WHERE iduser='$kel'");
	$temp = mysqli_fetch_row($temp);
	$bayar = $temp[0] - $jum;


	if($hbeli/$hjual > 2){//tidak boleh tukar
		echo 2;
		exit();
	}
	else if($bayar<0){// uang g cukup
		echo "1";
		exit();

	}
	else{
		$result=mysqli_query($con,"insert into tcurrency value('', '$kel', '$cur', '$cur2', '$jum')");

		$result=mysqli_query($con,"UPDATE `user` SET  $curbeli='$terima', $curjual ='$bayar' WHERE `iduser`='$kel'");
		echo "0";
		exit();
	}

	exit();
}

if(isset($_POST['update'])){
	$id = $_POST['id'];
	$kel = $_POST['kel'];
	$cur = $_POST['cur'];
	$cur2 = $_POST['cur2'];
	$jum = $_POST['jum'];

	mysqli_query($con,"UPDATE `tcurrency` SET `iduser`='$kel',`currency1`='$cur',`currency2`='$cur2',`nominal`='$jum' WHERE idtcurrency='$id'");
	exit();
}

if(isset($_POST['deletedata'])){
	$id = $_POST['id'];
	mysqli_query($con,"DELETE FROM `tcurrency` WHERE idtcurrency = '$id'");
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
					<label class="col-sm-2 control-label">Mata Uang Asal</label>
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
					<label class="col-sm-2 control-label">Mata Uang Tujuan</label>
					<div class="col-sm-10" >
						<label class="radio-inline">
							<input type="radio" name="icurrency2" value="IDR" class="flat" checked=""> IDR
						</label>
						<label class="radio-inline">
							<input type="radio" name="icurrency2" value="SGD" class="flat"> SGD
						</label>
						<label class="radio-inline">
							<input type="radio" name="icurrency2" value="RMB" class="flat"> RMB
						</label>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Jumlah Bayar</label>
					<div class="col-sm-10">
						<input class="form-control" id="ijumlah" placeholder="Jumlah" type="number" min="1">
					</div>
				</div>    
				<div class="form-group">
					<div class="col-sm-10 col-sm-offset-2">
						<button type="reset" class="btn btn-default">Cancel</button>
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mCurr" data-act="insert">Submit</button>
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
					<th>Mata Uang Asal</th>
					<th>Mata Uang Tujuan</th>
					<th>Jumlah</th>
					<!-- <th>Edit</th>
					<th>Delete</th> -->
				</tr>
			</thead>
			<tbody id="showdata"></tbody>
		</table>
	</div>
</div>

<div class='modal fade' id='mCurr' tabindex='-1' role='dialog' aria-labelledby='myModalLabel'>
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
							<th>Mata Uang 1</th>
							<th>Mata Uang 2</th>
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
	$('#mCurr').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget);
		var act = button.data('act');

		if(act=="insert"){
			var _kel = $('#ikelompok').val();
			var _cur = $("input[name='icurrency']:checked").val();
			var _cur2 = $("input[name='icurrency2']:checked").val();
			var _jum = $('#ijumlah').val();

			if(_jum=="" || !_kel){
				$(".modal-title").html("Error 101!");
				$(".modal-kata").html("Data yang dimasukkan tidak valid.");
				$("#modal-isi").hide();
			}else{
				$(".modal-title").html("Konfirmasi!");
				$(".modal-kata").html("Apakah anda yakin ingin memasukkan ini?");
				$("#modal-isi").show();
				$("#htabelid").hide();
				$(".modal-tabel").html(
					"<td id='mkel'>"+_kel+"</td>"+
					"<td id='mcur'>"+_cur+"</td>"+
					"<td id='mcur2'>"+_cur2+"</td>"+
					"<td id='mjum'>"+_jum+"</td>"
					);
				$("#btn-yes").attr("onclick","insert()");
			}
		}else if(parseInt(act)>0){
			$.ajax({
				url: "moneychanger.php",
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
						"<td id='mid'>"+res.idtcurrency+"</td>"+
						"<td><input id='mkel' type='text' name='kel' value='"+res.iduser+"'></td>"+
						"<td><input id='mcur' type='text' name='cur' value='"+res.currency1+"'></td>"+
						"<td><input id='mcur' type='text' name='cur2' value='"+res.currency2+"'></td>"+
						"<td><input id='mjum' type='number' name='jum' value='"+res.nominal+"'></td>"
						);
					$("#btn-yes").attr("onclick","update()");
				}
			});

		}else if(parseInt(act)<0){
			$.ajax({
				url: "moneychanger.php",
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
						"<td id='mid'>"+res.idtcurrency +"</td>"+
						"<td id='mkel'>"+res.iduser +"</td>"+
						"<td id='mcur'>"+res.currency1+"</td>"+
						"<td id='mcur'>"+res.currency2+"</td>"+
						"<td id='mjum'>"+res.nominal+"</td>"
						);
					$("#btn-yes").attr("onclick","deletedata()");
				}
			});
		}
	})

	function showdata(){
		$.ajax({
			url: "moneychanger.php",
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
		var _cur2 = $('#mcur2').html();
		var _jum = parseInt($('#mjum').text());

		$.ajax({
			url: "moneychanger.php",
			type: "POST",
			async: false,
			data: {
				insert: 1,
				kel: _kel,
				cur: _cur,
				cur2: _cur2,
				jum: _jum  
			},
			success: function(res)
			{
				if(res==1){alert("Uang tidak mencukupi");}
				if(res==2){alert("Anda tidak boleh menukar ke mata uang tersebut");}
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
		var _cur2 = $('#mcur2').val();  
		var _jum = parseInt($('#mjum').val());

		$.ajax({
			url: "moneychanger.php",
			type: "POST",
			async: false,
			data: {
				update: 1,
				id: _id,
				kel: _kel,
				cur: _cur,
				cur2: _cur2,
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
			url: "moneychanger.php",
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
		document.getElementById("moneychanger").className += "active";
		showdata();
	});
</script>
<?php include "footerbank.php"; ?>