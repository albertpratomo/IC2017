<?php 
include "../connect.php";

if(isset($_POST['showdata'])){

  $dsaham1 = mysqli_query($con,"select * from tsaham");

  while($row = mysqli_fetch_row($dsaham1)){
    echo 
    "<tr>
    <td>".$row[0]."</td>
    <td>".$row[1]."</td>
    <td>".$row[2]."</td>
    <td>".$row[5]."</td>
    <td>".$row[3]."</td>
    <td>".$row[4]."</td>
    <td><span class='glyphicon glyphicon-pencil' data-toggle='modal' data-target='#mSaham' data-act='".$row[0]."'></span></td>
    <td><span class='glyphicon glyphicon-remove' data-toggle='modal' data-target='#mSaham' data-act='".(-1 * $row[0])."'></span></td></tr>";
  }
  exit();
}

if(isset($_POST['select'])){
  $id = $_POST['id'];
  $qselect = mysqli_query($con,"SELECT * FROM `tsaham` WHERE idtsaham = '$id'");
  $qselect = mysqli_fetch_array($qselect);
  header("Content-type: text/x-json");
  echo json_encode($qselect);
  exit();
}

if(isset($_POST['insert'])){

  $kel = $_POST['kel'];
  $per = $_POST['per'];
  $cur = $_POST['cur'];
  $jum = $_POST['jum'];


  $maxid = mysqli_query($con, "SELECT idhargasaham FROM hargasaham where idsaham = '$per' ORDER BY idhargasaham desc");
  $maxid = mysqli_fetch_row($maxid);
  $maxid = $maxid[0];
  if($jum < 0 ){
    if($cur == "IDR"){
      $hjual = 'hjual1';
      $cash = 'cash1';
    }
    else if($cur == "USD"){
      $hjual = 'hjual2';
      $cash = 'cash2';
    }
    else{
      $hjual = 'hjual3';
      $cash = 'cash3';
    }

    $har = mysqli_query($con, "SELECT $hjual FROM hargasaham WHERE idhargasaham = '$maxid'");
    $har = mysqli_fetch_row($har);
    $har = $har[0];
    $har2 = $har*-1;
  }
  else{
    if($cur == "IDR"){
      $hbeli = 'hbeli1';
      $cash = 'cash1';
    }
    else if($cur == "USD"){
      $hbeli = 'hbeli2';
      $cash = 'cash2';
    }
    else{
      $hbeli = 'hbeli3';
      $cash = 'cash3';
    }    

    $har = mysqli_query($con, "SELECT $hbeli FROM hargasaham WHERE idhargasaham = '$maxid'");
    $har = mysqli_fetch_row($har);
    $har = $har[0];
    $har2 = $har*-1;

  }

    $temp = mysqli_query($con, "SELECT $cash from user where iduser = '$kel'");
    $temp = mysqli_fetch_row($temp);
    $temp = $temp[0] + $jum*$har2;

  $result=mysqli_query($con,"insert into tsaham value('', '$kel', '$per', '$jum', '$har', '$cur')");
  $result=mysqli_query($con,"UPDATE user  SET  $cash ='$temp' WHERE `iduser`='$kel'");
  exit();
}

if(isset($_POST['update'])){
  $id = $_POST['id'];
  $kel = $_POST['kel'];
  $per = $_POST['sah'];
  $cur = $_POST['cur'];
  $jum = $_POST['jum'];

  mysqli_query($con,"UPDATE `tsaham` SET `iduser`='$kel',`idsaham`='$per',`currency`='$cur',`qty`='$jum' WHERE idtsaham='$id'");
  exit();
}

if(isset($_POST['deletedata'])){
  $id = $_POST['id'];
  mysqli_query($con,"DELETE FROM `tsaham` WHERE idtsaham = '$id'");
  exit();
}

include "headerbank.php";
$dkelompok = mysqli_query($con,"select * from user");
$dsaham = mysqli_query($con,"select * from saham");

?>

<div class="container">
  <div class="col-md-8 col-md-offset-2">
    <form class="form-horizontal">
      <fieldset>
        <div class="form-group">
          <label class="col-sm-2 control-label">Saham</label>
          <div class="col-sm-10">
            <input type="checkbox" name="isaham" value="0" data-toggle="toggle" data-on="Beli" data-off="Jual" data-onstyle="success" data-offstyle="danger">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label">Kelompok</label>
          <div class="col-sm-10">
            <select id="ikelompok" class="selectpicker form-control" data-live-search="true">
              <?php 
              while($row = mysqli_fetch_row($dkelompok)){
                echo "<option value=".$row[0].">".$row[0]." - ".$row[1]."</option>";
              }
              ?>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label">Perusahaan</label>
          <div class="col-sm-10">
            <select id="iperusahaan" class="selectpicker form-control" data-live-search="true">
              <?php 
              while($row = mysqli_fetch_row($dsaham)){
                echo "<option value=".$row[0].">".$row[1]."</option>";
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
              <input type="radio" name="icurrency" value="USD" class="flat"> USD
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
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mSaham" data-act="insert">Submit</button>
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
          <th>Perusahaan</th>
          <th>Mata Uang</th>
          <th>Jumlah</th>
          <th>Harga Satuan</th>
          <th>Edit</th>
          <th>Delete</th>
        </tr>
      </thead>
      <tbody id="showdata"></tbody>
    </table>
  </div>
</div>

<div class='modal fade' id='mSaham' tabindex='-1' role='dialog' aria-labelledby='myModalLabel'>
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
              <th>Perusahaan</th>
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
  $('#mSaham').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var act = button.data('act');

    if(act=="insert"){
      var _kel = $('#ikelompok').val();
      var _per = $('#iperusahaan').val();
      var _sah = $("input[name='isaham']:checked").val();
      var _cur = $("input[name='icurrency']:checked").val();
      var _jum = $('#ijumlah').val();
      if(_sah!="0"){_jum*=-1;}
      
      if(_jum==""){
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
          "<td id='msah'>"+_per+"</td>"+
          "<td id='mcur'>"+_cur+"</td>"+
          "<td id='mjum'>"+_jum+"</td>"
          );
        $("#btn-yes").attr("onclick","insert()");
      }
    }else if(parseInt(act)>0){
      $.ajax({
        url: "saham.php",
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
            "<td id='mid'>"+res.idtsaham+"</td>"+
            "<td><input id='mkel' type='text' name='kel' value='"+res.iduser+"'></td>"+
            "<td><input id='msah' type='text' name='sah' value='"+res.idsaham+"'></td>"+
            "<td><input id='mcur' type='text' name='cur' value='"+res.currency+"'></td>"+
            "<td><input id='mjum' type='number' name='jum' value='"+res.qty+"'></td>"
            );
          $("#btn-yes").attr("onclick","update()");
        }
      });
      
    }else if(parseInt(act)<0){
      $.ajax({
        url: "saham.php",
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
            "<td id='mid'>"+res.idtsaham +"</td>"+
            "<td id='mkel'>"+res.iduser +"</td>"+
            "<td id='mkel'>"+res.idsaham +"</td>"+
            "<td id='mcur'>"+res.currency+"</td>"+
            "<td id='mjum'>"+res.qty+"</td>"
            );
          $("#btn-yes").attr("onclick","deletedata()");
        }
      });
    }
  })

  function showdata(){
    $.ajax({
      url: "saham.php",
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
    var _per = $('#msah').html();
    var _cur = $('#mcur').html();
    var _jum = parseInt($('#mjum').text());

    $.ajax({
      url: "saham.php",
      type: "POST",
      async: false,
      data: {
        insert: 1,
        kel: _kel,
        cur: _cur,
        jum: _jum,
        per: _per
      },
      success: function(res)
      {
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

    var _sah = $('#msah').val();
    var _cur = $('#mcur').val();
    var _jum = parseInt($('#mjum').val());

    $.ajax({
      url: "saham.php",
      type: "POST",
      async: false,
      data: {
        update: 1,
        id: _id,
        kel: _kel,
        cur: _cur,
        jum: _jum, 
        sah: _sah 
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
      url: "saham.php",
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
    document.getElementById("saham").className += "active";
    showdata();
  });
</script>
<?php include "footerbank.php"; ?>