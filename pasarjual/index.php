<?php 
include "../connect.php";
if(isset($_POST['cekinventory'])){
  $kel = $_POST['kel'];
  $des = $_POST['des'];
  $jum = $_POST['jum'];

  $result = mysqli_query($con, "SELECT idbahanbaku , count(idbahanbaku) from detildesain where iddesain = '$des' group by idbahanbaku");
  while($row = mysqli_fetch_row($result)){
    $sum = mysqli_query($con, "SELECT sum(qty) from inventory where iduser = $kel and idbahanbaku = $row[0]");
    $sum = mysqli_fetch_row($sum);
    $sum = $sum[0];
    if($sum<$row[1]*$jum){
      echo "0";
      exit();
    }
  }
  echo "1";
  exit();
}
if(isset($_POST['cekuang'])){


  $kel = $_POST['kel'];
  $des = $_POST['des'];
  $cur = $_POST['cur'];
  $jum = $_POST['jum'];
  $sta = $_POST['sta'];

  if($des<4){
    $tempdes = 1;
  }
  else if($des<10){
    $tempdes = 4;
  }
  else{
    $tempdes = 10;

  }
  $ex=$_POST['ex'];

  if($cur == "IDR"){
    $harga = "harga1";
    $cash = "cash1";
    $stok="stok1";  
  }
  else if($cur == "SGD"){
    $harga = "harga2";
    $cash = "cash2";
    $stok="stok2";
  }
  else{
    $harga = "harga3";
    $cash = "cash3";
    $stok="stok3";
  }

  $cek = mysqli_query($con, "select $cash from user where iduser=$kel");
  $cek =mysqli_fetch_row($cek);
  $cek =$cek[0];

  $export=mysqli_query($con, "select $harga from setting where idsetting=1");
  $export = mysqli_fetch_row($export);
  $export = $export[0];

  $st = mysqli_query($con, "select $stok from desain where iddesain=$tempdes");
  $st =mysqli_fetch_row($st);
  $st =$st[0];


  if($st-$jum<0){//stok habis

    echo "2";
    exit();

  }
  else{
    if($export > $cek && $ex==1){//uang ga cukup
      echo 0;
      exit();
    }
    else{//aman

      if($sta == "IN"){

        $temp = mysqli_query($con, "SELECT $harga FROM desain where iddesain = '$tempdes'");
        $temp = mysqli_fetch_row($temp);
        $har = $temp[0];
        $terima = $temp[0] * $jum;
        $temp = mysqli_query($con, "SELECT $cash FROM user where iduser = '$kel'");
        $temp = mysqli_fetch_row($temp);
        $terima = $temp[0]+$terima;
        $result=mysqli_query($con,"insert into penjualan value('', '$kel', '$des', '$jum', '$har', '$cur')");
        $result = mysqli_query($con,"UPDATE user set $cash = $terima where iduser = '$kel'");

        mysqli_query($con,"update desain set $stok=$stok-$jum where iddesain='$tempdes'");

      }

      $temp = mysqli_query($con, "SELECT $cash FROM user where iduser = '$kel'");
      $temp = mysqli_fetch_row($temp);
      $terima = $temp[0]-$export;






      $result = mysqli_query($con, "SELECT idbahanbaku from detildesain where iddesain = '$des'");

      while($row = mysqli_fetch_row($result)){
        mysqli_query($con, "INSERT into inventory(iduser, idbahanbaku, qty) values('$kel','".$row[0]."',-1*$jum)");
      }


      echo  1;
      exit();


    }
  }


}
if(isset($_POST['showdata'])){
  $cur = $_POST['cur'];
  $dpenjualan = mysqli_query($con,"select idpenjualan, iduser, nama, currency, qty, hsatuan from penjualan p join desain d on p.iddesain = d.iddesain where currency = '$cur'");

  while($row = mysqli_fetch_row($dpenjualan)){
    echo 
    "<tr>
    <td>".$row[0]."</td>
    <td>".$row[1]."</td>
    <td>".$row[2]."</td>
    <td>".$row[3]."</td>
    <td>".$row[4]."</td>
    <td>".$row[4]*$row[5]."</td>
    <td><span class='glyphicon glyphicon-remove' data-toggle='modal' data-target='#mPenjualan' data-act='".(-1 * $row[0])."'></span></td></tr>";
  }
  // <td><span class='glyphicon glyphicon-pencil' data-toggle='modal' data-target='#mPenjualan' data-act='".$row[0]."'></span></td>
  exit();
}
if(isset($_POST['getharga'])){

  $cur = $_POST['cur'];
  $des = $_POST['des'];
 if($des<4){
    $tempdes = 1;
  }
  else if($des<10){
    $tempdes = 4;
  }
  else{
    $tempdes = 10;

  }
  if($cur == "IDR"){
    $harga = "harga1";
    $cash = "cash1";  
  }
  else if($cur == "SGD"){
    $harga = "harga2";
    $cash = "cash2";
  }
  else{
    $harga = "harga3";
    $cash = "cash3";
  }

  $temp = mysqli_query($con, "SELECT $harga FROM desain where iddesain = '$tempdes'");
  $temp = mysqli_fetch_row($temp);
  $har = $temp[0];
  echo $har;
  exit();
}

if(isset($_POST['select'])){
  $id = $_POST['id'];
  $qselect = mysqli_query($con,"SELECT * FROM `penjualan` WHERE idpenjualan = '$id'");
  $qselect = mysqli_fetch_array($qselect);
  header("Content-type: text/x-json");
  echo json_encode($qselect);
  exit();
}



if(isset($_POST['update'])){
  $id = $_POST['id'];
  $kel = $_POST['kel'];
  $des = $_POST['des'];
  $cur = $_POST['cur'];
  $jum = $_POST['jum'];

  mysqli_query($con,"UPDATE `penjualan` SET `iduser`='$kel',`iddesain`='$des',`currency`='$cur',`qty`='$jum' WHERE idpenjualan='$id'");
  exit();
}

if(isset($_POST['deletedata'])){
  $id = $_POST['id'];
  $result = mysqli_fetch_row(mysqli_query($con, "select * from penjualan where idpenjualan = '$id'"));
  $cur = $result[5];
  $des = $result[2];
  $jum = $result[3];
  $temp = $result[3]*$result[4];
  $kel = $result[1];

  if($cur == "IDR"){
    $harga = "harga1";
    $cash = "cash1";  
  }
  else if($cur == "SGD"){
    $harga = "harga2";
    $cash = "cash2";
  }
  else{
    $harga = "harga3";
    $cash = "cash3";
  }




//kurangi cash
  mysqli_query($con,"UPDATE user set $cash = $cash -$temp where iduser = '$kel'");
//tambah barang
  $result = mysqli_query($con, "SELECT idbahanbaku from detildesain where iddesain = '$des'");

  while($row = mysqli_fetch_row($result)){
    mysqli_query($con, "INSERT into inventory(iduser, idbahanbaku, qty) values('$kel','".$row[0]."',$jum)");
  }

//tambah stok
  if($des<4){
    $tempdes = 1;
  }
  else if($des<10){
    $tempdes = 4;
  }
  else{
    $tempdes = 10;

  }
  mysqli_query($con,"update desain set $stok=$stok+$jum where iddesain='$tempdes'");

//hapus penjualan
  mysqli_query($con,"DELETE FROM `penjualan` WHERE idpenjualan = '$id'");
  exit();
}

include "headerpasarjual.php";
$dkelompok = mysqli_query($con,"select * from user");
$ddesain = mysqli_query($con,"select * from desain");
?>

<div class="container">
  <div class="col-md-8 col-md-offset-2">
    <form class="form-horizontal">
      <fieldset>
        <div class="form-group">
          <label class="col-sm-2 control-label">Status</label>
          <div class="col-sm-10">
            <input type="checkbox" name="istatus" value="0" data-toggle="toggle" data-on="In" data-off="Reject" data-onstyle="success" data-offstyle="danger" checked>
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
          <label class="col-sm-2 control-label">Nama Desain</label>
          <div class="col-sm-10">
            <select id="idesain" class="selectpicker form-control" data-live-search="true">
              <?php 

              if($cur == "IDR"){
                $harga = "harga1";
                $cash = "cash1";
                $stok="stok1";  
              }
              else if($cur == "SGD"){
                $harga = "harga2";
                $cash = "cash2";
                $stok="stok2";
              }
              else{
                $harga = "harga3";
                $cash = "cash3";
                $stok="stok3";
              }

              while($row = mysqli_fetch_row($ddesain)){
                if($row[0]<4){
                  $temp = 1;
                }
                else if($row[0]<10){
                  $temp = 4;

                }
                else{
                  $temp = 10;

                }
                $jmlhstok=mysqli_query($con,"select $stok from desain where iddesain=$temp");
                $jmlhstok=mysqli_fetch_array($jmlhstok);
                $jmlhstok=$jmlhstok[0];

                echo "<option value=".$row[0].">".$row[0]." - ".$row[1]." (".$jmlhstok.")</option>";
              }
              ?>
            </select>
          </div>
        </div>

        <div class="form-group">
          <label class="col-sm-2 control-label">Jumlah</label>
          <div class="col-sm-10">
            <input class="form-control" id="ijumlah" placeholder="Jumlah" type="number" min="1">
          </div>
        </div>    
        <div class="form-group">
          <label for="select" class="col-sm-2 control-label">Export Import</label>
          <div class="col-sm-10">
            <label class="radio-inline">
              <input type="checkbox" class="flat" name="iexport" value="0" data-on="In" data-off="reject">
            </label>
          </div>
        </div> 
        <div class="form-group">
          <div class="col-sm-10 col-sm-offset-2">
            <button type="reset" class="btn btn-default">Cancel</button>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mPenjualan" data-act="insert">Submit</button>
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
          <th>Desain</th>
          <th>Mata Uang</th>
          <th>Jumlah</th>
          <th>Total</th>
          <!-- <th>Edit</th> -->
          <th>Delete</th> 
        </tr>
      </thead>
      <tbody id="showdata"></tbody>
    </table>
  </div>
</div>

<div class='modal fade' id='mPenjualan' tabindex='-1' role='dialog' aria-labelledby='myModalLabel'>
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
              <th>Desain</th>
              <th>Mata Uang</th>
              <th>Jumlah</th>
              <th>Status</th>
              <th>Total</th>
              
              <th>Export</th>
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



  $('#mPenjualan').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var act = button.data('act');

    if(act=="insert"){
      var _kel = $('#ikelompok').val();
      var _des = $('#idesain').val();
      var _sta = $("input[name='istatus']:checked").val();
      var _ex = $("input[name='iexport']:checked").val();
      if(_ex==0){_ex=1}else{_ex=0};
      var _cur = <?php echo json_encode($cur);?>;
      var _jum = $('#ijumlah').val();

      var _tot;
      var _flag =0;
      $.ajax({
        url: "index.php",
        type: "POST",
        async: false,
        data: {
          cekinventory: 1,
          kel: _kel,
          des: _des,
          jum: _jum
        },
        success: function(res){
          if(res ==1){//barang ada
            $.ajax({
              url: "index.php",
              type: "POST",
              async: false,
              data: {
                getharga: 1,
                des: _des,
                cur: _cur
              },
              success: function(res){
                _tot = res* _jum;
                _flag =1;
              }
            })
          }
          else {//barang g ada
            if (!_kel) {
              alert("Silahkan masukkan nomor tim");
            }else{
              alert("Barang tidak ada di inventory tim");
            }
          }
        }
      })





      if(_flag ==1){

        if(_sta=="0"){_sta= "IN";}else{_sta="REJECT";}

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
            "<td id='mdes'>"+_des+"</td>"+
            "<td id='mcur'>"+_cur+"</td>"+
            "<td id='mjum'>"+_jum+"</td>"+
            "<td id='msta'>"+_sta+"</td>"+
            "<td id='mtot'>"+_tot+"</td>"+
            "<td id='mex'>"+_ex+"</td>"

            );
          $("#btn-yes").attr("onclick","insert()");
        }
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
            "<td id='mid'>"+res.idpenjualan+"</td>"+
            "<td><input id='mkel' type='text' name='kel' value='"+res.iduser+"'></td>"+
            "<td><input id='mdes' type='text' name='des' value='"+res.iddesain+"'></td>"+
            "<td><input id='mcur' type='text' name='cur' value='"+res.currency+"'></td>"+
            "<td><input id='mjum' type='number' name='jum' value='"+res.qty+"'></td>"+
            "<td><input id='msta' type='text' name='sta' value='IN'></td>"+

            "<td><input id='mtot' type='number' name='tot' value='"+res.hsatuan * res.qty+"'></td>"
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
            "<td id='mid'>"+res.idpenjualan +"</td>"+
            "<td id='mkel'>"+res.iduser +"</td>"+
            "<td id='mdes'>"+res.iddesain +"</td>"+
            "<td id='mcur'>"+res.currency+"</td>"+
            "<td id='mjum'>"+res.qty+"</td>"+

            "<td>IN</td>"+
            "<td id='mtot'>"+res.qty * res.hsatuan+"</td>"
            );
          $("#btn-yes").attr("onclick","deletedata()");
        }
      });
    }
  })



function showdata(){

  var _cur = <?php echo json_encode($cur);?>;
  $.ajax({
    url: "index.php",
    type: "POST",
    async: false,
    data: {showdata: 1,cur:_cur},
    success: function(res)
    {
      $('#showdata').html(res);
    }
  });
}

function insert(){
  var _kel = $('#mkel').html();
  var _cur = $('#mcur').html();
  var _des = $('#mdes').html();
  var _sta = $('#msta').html();
  var _ex = $('#mex').html();
  var _jum = parseInt($('#mjum').text());

  $.ajax({
    url: "index.php",
    type: "POST",
    async: false,
    data: {
      cekuang: 1,
      kel: _kel,
      cur: _cur,
      des: _des,
      jum: _jum,
      sta: _sta,
      ex:_ex
    },
    success: function(res)
    {
     if(res==1 || _ex == 0){


      showdata();
      $('#ijumlah').val("");
      $("#btn-yes").attr("onclick","");
      location.reload();

    }
    else{
      alert("Uang tidak cukup");
    }
  }
});



}

function update(){
  var _id = parseInt($('#mid').html());
  var _kel = $('#mkel').val();
  var _des = $('#mdes').val();

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
      des: _des,
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
  document.getElementById("insert").className += "active";
  showdata();
});
</script>
<?php include "footerpasarjual.php"; ?>