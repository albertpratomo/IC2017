<?php 
include "../connect.php";

if(isset($_POST['showdata'])){

  $dtabungan = mysqli_query($con,"select * from ttabungan");

  while($row = mysqli_fetch_row($dtabungan)){
    echo 
    "<tr>
    <td>".$row[0]."</td>
    <td>".$row[1]."</td>
    <td>".$row[3]."</td>
    <td>".$row[2]."</td>";
    // <td><span class='glyphicon glyphicon-pencil' data-toggle='modal' data-target='#mTabungan' data-act='".$row[0]."'></span></td>
    // <td><span class='glyphicon glyphicon-remove' data-toggle='modal' data-target='#mTabungan' data-act='".(-1 * $row[0])."'></span></td></tr>";
  }
  exit();
}

if(isset($_POST['select'])){
  $id = $_POST['id'];
  $qselect = mysqli_query($con,"SELECT * FROM `ttabungan` WHERE idttabungan = '$id'");
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

  $cash = mysqli_fetch_row(mysqli_query($con, "SELECT $curjual FROM `user` WHERE iduser='$kel'"));

  if ($jum>0) {#lagi menabung uang
    if ($cash[0] < $jum){
      echo "gbstabung";  
      exit();
    }
  }else{#lagi menarik uang
    $tabungan = mysqli_fetch_row(mysqli_query($con, "SELECT sum(nominal) FROM `ttabungan` WHERE iduser='$kel' AND currency = '$cur'"));
    if ($tabungan[0] < -1*$jum){
      echo "gbstarik";
      exit();
    }
  }

  $bayar = $cash[0] - $jum;
  mysqli_query($con,"insert into ttabungan value('', '$kel', '$jum', '$cur')");
  mysqli_query($con,"UPDATE `user` SET  $curjual ='$bayar' WHERE `iduser`='$kel'");
  echo "berhasil";
  exit();
}

if(isset($_POST['update'])){
  $id = $_POST['id'];
  $kel = $_POST['kel'];
  $cur = $_POST['cur'];
  $jum = $_POST['jum'];

  mysqli_query($con,"UPDATE `ttabungan` SET `iduser`='$kel',`currency`='$cur',`nominal`='$jum' WHERE idttabungan='$id'");
  exit();
}

if(isset($_POST['deletedata'])){
  $id = $_POST['id'];
  mysqli_query($con,"DELETE FROM `ttabungan` WHERE idttabungan = '$id'");
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
          <label class="col-sm-2 control-label">Tabungan</label>
          <div class="col-sm-10">
            <input type="checkbox" name="itabungan" value="0" data-toggle="toggle" data-on="Tabung" data-off="Tarik" data-onstyle="success" data-offstyle="danger">
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
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mTabungan" data-act="insert">Submit</button>
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
          <!-- <th>Edit</th>
          <th>Delete</th> -->
        </tr>
      </thead>
      <tbody id="showdata"></tbody>
    </table>
  </div>
</div>

<div class='modal fade' id='mTabungan' tabindex='-1' role='dialog' aria-labelledby='myModalLabel'>
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

<div class='modal fade' id='mNotif' tabindex='-1' role='dialog' aria-labelledby='myModalLabel'>
  <div class='modal-dialog' role='document'>
    <div class='modal-content'>

      <div class='modal-header'>
        <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>
        <h4 class='modal-title'></h4>
      </div>
      <div class="modal-body modal-kata"></div>
      <div class='modal-footer'>
        <button type='button' class='btn btn-danger' id="btn-no" data-dismiss='modal'>No</button>
        <button type='submit' class='btn btn-success' id="btn-yes" data-dismiss='modal'>Yes</button>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript">
  $('#mTabungan').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var act = button.data('act');

    if(act=="insert"){
      var _kel = $('#ikelompok').val();
      var _tab = $("input[name='itabungan']:checked").val();
      var _cur = $("input[name='icurrency']:checked").val();
      var _jum = $('#ijumlah').val();
      if(_tab!="0"){_jum*=-1;}
      
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
          "<td id='mjum'>"+_jum+"</td>"
          );
        $("#btn-yes").attr("onclick","insert()");
      }
    }else if(parseInt(act)>0){
      $.ajax({
        url: "tabungan.php",
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
            "<td id='mid'>"+res.idttabungan+"</td>"+
            "<td><input id='mkel' type='text' name='kel' value='"+res.iduser+"'></td>"+
            "<td><input id='mcur' type='text' name='cur' value='"+res.currency+"'></td>"+
            "<td><input id='mjum' type='number' name='jum' value='"+res.nominal+"'></td>"
            );
          $("#btn-yes").attr("onclick","update()");
        }
      });
      
    }else if(parseInt(act)<0){
      $.ajax({
        url: "tabungan.php",
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
            "<td id='mid'>"+res.idttabungan +"</td>"+
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
      url: "tabungan.php",
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
      url: "tabungan.php",
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
        showdata();
        $('#ijumlah').val("");
        $("#btn-yes").attr("onclick","");

        if (res == "gbstabung") {
          $(".modal-title").html("Error 103!");
          $(".modal-kata").html("Uang cash tidak cukup.");
          $('#mNotif').modal('show');
        }else if (res == "gbstarik") {
          $(".modal-title").html("Error 104!");
          $(".modal-kata").html("Saldo tabungan tidak cukup.");
          $('#mNotif').modal('show');
        }else{
          location.reload();          
        }
      }
    });
  }

  function update(){
    var _id = parseInt($('#mid').html());
    var _kel = $('#mkel').val();
    var _cur = $('#mcur').val();
    var _jum = parseInt($('#mjum').val());

    $.ajax({
      url: "tabungan.php",
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
      url: "tabungan.php",
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
    document.getElementById("tabungan").className += "active";
    showdata();
  });
</script>
<?php include "footerbank.php"; ?>