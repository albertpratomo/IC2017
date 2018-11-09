<?php 
include "../connect.php";
if(isset($_POST['cekuang'])){
  $cur = $_POST['cur'];
  $kel =$_POST['kel'];
  $bhn = $_POST['bhn'];
  $jum = $_POST['jum'];
  $ex = $_POST['ex'];

  if($cur == "IDR"){
    $harga = "harga1";
    $cash = "cash1";
    $stok = "stok1";
    $tempkurs=1;  
  }
  else if($cur == "SGD"){
    $harga = "harga2";
    $cash = "cash2";
        $stok = "stok2";
    $tempkurs=2;
  }
  else{
    $harga = "harga3";
    $cash = "cash3";
        $stok = "stok3";
    $tempkurs=3;
  }

  $cek = mysqli_query($con, "select $cash from user where iduser=$kel");
  $cek =mysqli_fetch_row($cek);
  $cek =$cek[0];

  $export=mysqli_query($con, "select $harga from setting where idsetting=1");
  $export = mysqli_fetch_row($export);
  $export = $export[0];

  if($ex==0){$export=0;}

  if($bhn <4){
    // bukan transport
    $har =  mysqli_query($con, "SELECT $harga FROM bahanbaku where idbahanbaku = $bhn");
    $har =  mysqli_fetch_row($har);
    $har = $har[0];
  }
  else if($bhn==4){
    $har =  mysqli_query($con, "SELECT $harga FROM bahanbaku where idbahanbaku = $bhn");
    $har =  mysqli_fetch_row($har);
    $har = $har[0];

  }

  else if($bhn==5){
    $har =  mysqli_query($con, "SELECT count(*) FROM inventory where idbahanbaku = 5 and iduser=$kel");
    $har =  mysqli_fetch_row($har);
    $har = $har[0];
    
    if($har==1){
      $har=800;
    } 
    else if($har==2){
      $har=1600;
    }
    else if($har==3){
      $har=3000;
    }
    else if($har==4){
      $har=4000;
    }
    else if($har==5){
      $har=5000;
    }
    else if($har>5){
      echo 3;
      exit();

    }

  }
  else if($bhn==6){
        $har =  mysqli_query($con, "SELECT $harga FROM bahanbaku where idbahanbaku = $bhn");
    $har =  mysqli_fetch_row($har);
    $har = $har[0];
  }
  else if($bhn==7){
    $har =  mysqli_query($con, "SELECT count(*) FROM inventory where idbahanbaku = 7 and iduser=$kel");
    $har =  mysqli_fetch_row($har);
    $har = $har[0]*200+400;
  }

  
  
  $maxweight = mysqli_fetch_array(mysqli_query($con, "SELECT maxweight FROM user WHERE iduser =$kel"));
  $maxweight = $maxweight[0];

  $gudang = mysqli_query($con, "SELECT sum(i.qty)*b.weight FROM inventory i join bahanbaku b on i.idbahanbaku = b.idbahanbaku WHERE iduser = $kel GROUP BY i.idbahanbaku");
  $sumgudang = 0;
  while($row = mysqli_fetch_row($gudang)) { 
    $sumgudang += $row[0];
  }
  $onsale = mysqli_query($con, "SELECT sum(i.qty)*b.weight FROM onsale i join bahanbaku b on i.idbahanbaku = b.idbahanbaku WHERE pembeli=0 and iduser = $kel GROUP BY i.idbahanbaku");
  $sumonsale = 0;
  while($row = mysqli_fetch_row($onsale)) { 
    $sumonsale += $row[0];
  }

  $weight = mysqli_query($con,"select weight from bahanbaku where idbahanbaku=$bhn");
  $weight = mysqli_fetch_row($weight);
  $weight =$weight[0]*$jum;

  if($weight+$sumgudang+$sumonsale >$maxweight){
  // Gudang ga cukup
    echo "2";
    exit();
  }
  else{

    if(($export+$har*$jum) > $cek){
    // uang ga cukup
     echo "0";
     exit();
   }
   else{


    $result=mysqli_query($con,"INSERT INTO `pembelian` value('', '$bhn', '$kel', '$jum', '$har', '$cur')");
    mysqli_query($con,"INSERT INTO `inventory` value('', '$kel', '$bhn', '$jum')");
    $temp=mysqli_query($con, "SELECT $cash from user where iduser = '$kel'");
    $temp=mysqli_fetch_row($temp);
    if($bhn==7){
      mysqli_query($con,"update user set maxweight=maxweight+10 where iduser=$kel");
    }

    mysqli_query($con, "update bahanbaku set $stok = $stok - $jum where idbahanbaku = $bhn");

    $temp=$temp[0] - $har*$jum -$export;
    $result=mysqli_query($con,"UPDATE user  SET  $cash ='$temp' WHERE `iduser`='$kel'");
    echo "1";
    exit();


  }
}


}
if(isset($_POST['showdata'])){
  $cur = $_POST['cur'];

  $dpembelian = mysqli_query($con,"select idpembelian, iduser, nama, currency, qty, hsatuan from pembelian p join bahanbaku b on p.idbahanbaku = b.idbahanbaku where p.currency = '$cur'");

  while($row = mysqli_fetch_row($dpembelian)){
    echo 
    "<tr>
    <td>".$row[0]."</td>
    <td>".$row[1]."</td>
    <td>".$row[2]."</td>
    <td>".$row[3]."</td>
    
    <td>".$row[4]."</td>
    <td>".$row[4]*$row[5]."</td>
    
    <td><span class='glyphicon glyphicon-remove' data-toggle='modal' data-target='#mPembelian' data-act='".(-1 * $row[0])."'></span></td></tr>";
  }
  // <td><span class='glyphicon glyphicon-pencil' data-toggle='modal' data-target='#mPembelian' data-act='".$row[0]."'></span></td>
  exit();
}
if(isset($_POST['getharga'])){

  $cur = $_POST['cur'];
  $bhn = $_POST['bhn'];
  $kel=$_POST['kel'];

  if($cur == "IDR"){
    $harga = "harga1";
    $cash = "cash1"; 
    $tempkurs=1; 
  }
  else if($cur == "SGD"){
    $harga = "harga2";
    $cash = "cash2";
    $tempkurs=2;
  }
  else{
    $harga = "harga3";
    $cash = "cash3";
    $tempkurs=3;
  }

  if($bhn <4){
    // bukan transport
    $har =  mysqli_query($con, "SELECT $harga FROM bahanbaku where idbahanbaku = $bhn");
    $har =  mysqli_fetch_row($har);
    $har = $har[0];
  }
  else if($bhn==4){
    $har =  mysqli_query($con, "SELECT $harga FROM bahanbaku where idbahanbaku = $bhn");
    $har =  mysqli_fetch_row($har);
    $har = $har[0];

  }

  else if($bhn==5){
    $har =  mysqli_query($con, "SELECT count(*) FROM inventory where idbahanbaku = 5 and iduser=$kel");
    $har =  mysqli_fetch_row($har);
    $har = $har[0];
    
    if($har==1){
      $har=800;
    } 
    else if($har==2){
      $har=1600;
    }
    else if($har==3){
      $har=3000;
    }
    else if($har==4){
      $har=4000;
    }
    else if($har==5){
      $har=5000;
    }
    else if($har>5){
      echo 3;
      exit();

    }
  }
  else if($bhn==6){
    $har =  mysqli_query($con, "SELECT $harga FROM bahanbaku where idbahanbaku = $bhn");
    $har =  mysqli_fetch_row($har);
    $har = $har[0];
  }
  else if($bhn==7){
    $har =  mysqli_query($con, "SELECT count(*) FROM inventory where idbahanbaku = 7 and iduser=$kel");
    $har =  mysqli_fetch_row($har);
    $har = $har[0]*200+400;
  }

  
  echo $har;
  exit();
}
if(isset($_POST['select'])){
  $id = $_POST['id'];
  $qselect = mysqli_query($con,"SELECT * FROM `pembelian` WHERE idpembelian = '$id'");
  $qselect = mysqli_fetch_array($qselect);
  header("Content-type: text/x-json");
  echo json_encode($qselect);
  exit();
}

if(isset($_POST['insert'])){
  $kel = $_POST['kel'];
  $bhn = $_POST['bhn'];
  $cur = $_POST['cur'];



  $jum = $_POST['jum'];

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

  $har =  mysqli_query($con, "SELECT $harga FROM bahanbaku where idbahanbaku = $bhn");
  $har = mysqli_fetch_row($har);
  $har = $har[0];
  $result=mysqli_query($con,"INSERT INTO `pembelian` value('', '$bhn', '$kel', '$jum', '$har', '$cur')");
  mysqli_query($con,"INSERT INTO `inventory` value('', '$kel', '$bhn', '$jum')");
  $temp=mysqli_query($con, "SELECT $cash from user where iduser = '$kel'");
  $temp=mysqli_fetch_row($temp);
  $temp=$temp[0] - $har*$jum;
  $result=mysqli_query($con,"UPDATE user  SET  $cash ='$temp' WHERE `iduser`='$kel'");
  exit();
}

if(isset($_POST['update'])){
  $id = $_POST['id'];

  $bhn = $_POST['bhn'];
  $kel = $_POST['kel'];
  $cur = $_POST['cur'];
  $jum = $_POST['jum'];
  $har = 0;
  mysqli_query($con,"UPDATE `pembelian` SET `iduser`='$kel',`idbahanbaku`='$bhn',`currency`='$cur',`qty`='$jum' WHERE idpembelian='$id'");
  exit();
}

if(isset($_POST['deletedata'])){
  $id = $_POST['id'];
  $result = mysqli_fetch_row(mysqli_query($con, "select * from pembelian where idpembelian = '$id'"));
  $cur = $result[5];
  $bhn = $result[1];
  $jum = $result[3]*-1;
  $temp = $result[3]*$result[4];
  $kel = $result[2];

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



  //tambah cash 
  mysqli_query($con,"UPDATE user  SET  $cash =$cash + $temp WHERE `iduser`='$kel'");

  //kurangi inventory
mysqli_query($con,"INSERT INTO `inventory` value('', '$kel', '$bhn', '$jum')");
  //hapus transaksi
  mysqli_query($con,"DELETE FROM `pembelian` WHERE idpembelian = '$id'");
  exit();
}

include "headerpasarbeli.php";
$dkelompok = mysqli_query($con,"select * from user");

if($cur=="IDR"){$id1=2;$id2=3;}
if($cur=="SGD"){$id1=1;$id2=3;}
if($cur=="RMB"){$id1=1;$id2=2;}

$dbahan = mysqli_query($con,"select * from bahanbaku where idbahanbaku != $id1 and idbahanbaku != $id2");

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
          <label class="col-sm-2 control-label">Bahan Baku</label>
          <div class="col-sm-10">
            <select id="ibahan" class="selectpicker form-control" data-live-search="true">
              <?php 
              while($row = mysqli_fetch_row($dbahan)){
                echo "<option value=".$row[0].">".$row[0]." - ".$row[1]."</option>";
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
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mPembelian" data-act="insert">Submit</button>
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
          <th>Bahan Baku</th>
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

<div class='modal fade' id='mPembelian' tabindex='-1' role='dialog' aria-labelledby='myModalLabel'>
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
              <th>Bahan Baku</th>
              <th>Mata Uang</th>
              <th>Jumlah</th>

              <th>Total</th>
              <th>Import</th>
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
  $('#mPembelian').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var act = button.data('act');

    if(act=="insert"){
      var _kel = $('#ikelompok').val();
      var _bhn = $('#ibahan').val();
      var _cur = <?php echo json_encode($cur);?>;

      var _ex = $("input[name='iexport']:checked").val();
      if(_ex==0){_ex=1}else{_ex=0};
      var _jum = $('#ijumlah').val();
      var _tot;
      $.ajax({
        url: "index.php",
        type: "POST",
        async: false,
        data: {
          getharga: 1,
          bhn: _bhn,
          kel:_kel,
          cur: _cur
        },
        success: function(res){
          _tot = res* _jum;

        }

      })

      


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
          "<td id='mbhn'>"+_bhn+"</td>"+
          "<td id='mcur'>"+_cur+"</td>"+
          "<td id='mjum'>"+_jum+"</td>"+
          "<td id='mtot'>"+_tot+"</td>"+
          "<td id='mex'>"+_ex+"</td>"
          
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
            "<td id='mid'>"+res.idpembelian+"</td>"+
            "<td><input id='mkel' type='text' name='kel' value='"+res.iduser+"'></td>"+
            "<td><input id='mbhn' type='text' name='bhn' value='"+res.idbahanbaku+"'></td>"+
            "<td><input id='mcur' type='text' name='cur' value='"+res.currency+"'></td>"+
            "<td><input id='mjum' type='number' name='jum' value='"+res.qty+"'></td>"+
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
            "<td id='mid'>"+res.idpembelian +"</td>"+
            "<td id='mkel'>"+res.iduser +"</td>"+
            "<td id='mkel'>"+res.idbahanbaku +"</td>"+
            "<td id='mcur'>"+res.currency+"</td>"+
            "<td id='mjum'>"+res.qty+"</td>"+
            "<td id='mtot'>"+res.hsatuan * res.qty+"</td>"
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
      data: {
        showdata: 1,
        cur: _cur


      },
      success: function(res)
      {
        $('#showdata').html(res);
      }
    });
  }

  function insert(){
    var _kel = $('#mkel').html();
    var _bhn = $('#mbhn').html();
    var _cur = $('#mcur').html();
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
        bhn: _bhn,
        jum: _jum,
        ex:_ex
      },
      success: function(res)
      {

        if(res==1){

          showdata();
          $('#ijumlah').val("");
          $("#btn-yes").attr("onclick","");
          location.reload();
        }
        else if(res==0){

          alert("Uang tidak cukup");
        }
        else if(res==2){
          alert("Inventory tidak cukup");

        }
        else if(res==3){
          alert("Jumlah transport lebih");
        }
      }
    });



  }

  function update(){
    var _id = parseInt($('#mid').html());
    var _kel = $('#mkel').val();
    var _bhn = $('#mbhn').val();
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
        bhn: _bhn,
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
<?php include "footerpasarbeli.php"; ?>