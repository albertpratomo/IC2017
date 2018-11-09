<?php 
  if(isset($_POST['beli'])){
    echo"
    <div class='modal fade' id='mPinjaman' tabindex='-1' role='dialog' aria-labelledby='myModalLabel'>
      <div class='modal-dialog' role='document'>
        <div class='modal-content'>

          <div class='modal-header'>
            <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>
            <h4 class='modal-title'>Konfirmasi!</h4>
          </div>
          <form method='POST' action=''>
            <div class='modal-body'>
              Apakah anda yakin ingin membeli ini?<br>
              <table class='table table-bordered'>
                <thead>
                  <tr>

                    <input type='hidden' name='ibb' value='".$_POST['ibb']."'>              
                    <input type='hidden' name='j' value='".$_POST['jumlah']."'>
                    <input type='hidden' name='o' value='".$_POST['idonsale']."'>
                    <input type='hidden' name='t' value='".$_POST['kelompok']."'>
                    <input type='hidden' name='h' value='".$_POST['harga']."'>
                    <input type='hidden' name='m' value='".$_POST['cur']."'>
                    <th>ID</th>
                    <th>Tim</th>
                    <th>Nama Barang</th>
                    <th>Jumlah</th>          
                    <th>Mata Uang</th>
                    <th>Harga</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>".$_POST['count']."</td>
                    <td>".$_POST['kelompok']."</td>
                    <td>".$_POST['nama']."</td>
                    <td>".$_POST['jumlah']."</td>
                    <td>".$_POST['cur']."</td>                                    
                    <td>".$_POST['harga']."</td>
                  </tr>
                </tbody>
              </table>

            </div>
            <div class='modal-footer'>
              <button type='button' class='btn btn-danger' data-dismiss='modal'>No</button>
              <button type='submit' class='btn btn-success' name='buy'>Yes</button>
            </div>
          </form>
        </div>
      </div>
    </div>

    <script type='text/javascript'>
      $(window).load(function(){
        $('#mPinjaman').modal('show');
      });
    </script>";
    exit();
  }



include "headerdashboard.php"; ?>
<?php 
if(isset($_POST['buy'])){


//cek barang masih ada
  $cekbarang = mysqli_fetch_row(mysqli_query($con, "SELECT count(*) from onsale  where  pembeli = 0 and idonsale = '".$_POST['o']."'"));
  $cekbarang = $cekbarang[0];


  if($cekbarang!=0){//barang masih ada


  


 if($_POST['m']=="IDR"){
  $cash = 'cash1';
}
else if($_POST['m']=="SGD"){
  $cash = 'cash2';
}
else{
  $cash = 'cash3';
}




//cek uang cukup
$result = mysqli_query($con, "SELECT $cash from user where iduser = '".$_SESSION['id']."'");
$result = mysqli_fetch_row($result);


$temp = $result[0] -  $_POST['h'];

if($temp >=0){//uang cukup

  $inventory = mysqli_fetch_row(mysqli_query($con, "select maxweight from user where iduser='".$_SESSION['id']."'"));
  $inventory =$inventory[0];

$gudang = mysqli_query($con, "SELECT sum(i.qty)*b.weight FROM inventory i join bahanbaku b on i.idbahanbaku = b.idbahanbaku WHERE iduser = '".$_SESSION['id']."' GROUP BY i.idbahanbaku");
$sumgudang = 0;
while($row = mysqli_fetch_row($gudang)) { 
  $sumgudang += $row[0];
}

$onsale = mysqli_query($con, "SELECT sum(i.qty)*b.weight FROM onsale i join bahanbaku b on i.idbahanbaku = b.idbahanbaku WHERE iduser = '".$_SESSION['id']."' GROUP BY i.idbahanbaku");
$sumonsale = 0;

$weight = mysqli_fetch_row(mysqli_query($con, "select weight from bahanbaku where idbahanbaku = '".$_POST['ibb']."'"));
$weight = $weight[0]*$_POST['j'];

while($row = mysqli_fetch_row($onsale)) { 
  $sumonsale += $row[0];
}

  if($inventory < $sumgudang + $sumonsale + $weight){//inventory g cukup
  echo '<script language="javascript">';
echo 'alert("Inventory anda tidak mencukupi")';
echo '</script>';
  }
  else{//inventory cukup
    $result = mysqli_query($con, "UPDATE user set $cash = '$temp' where iduser='".$_SESSION['id']."'");
    $result = mysqli_query($con, "SELECT $cash from user where iduser = '".$_POST['t']."'");
    $result = mysqli_fetch_row($result);

    $temp = $result[0] +  $_POST['h'];
    $result = mysqli_query($con, "UPDATE user set $cash = '$temp' where iduser='".$_POST['t']."'");

    $result = mysqli_query($con, "update onsale set pembeli = '".$_SESSION['id']."' where idonsale = '".$_POST['o']."'");
    $temp = $_POST['j'];
    $result = mysqli_query($con, "insert into  inventory(qty,iduser, idbahanbaku ) values( '$temp','".$_SESSION['id']."','".$_POST['ibb']."')");
     echo '<script language="javascript">';
echo 'alert("Anda berhasil melakukan pembelian")';
echo '</script>';
  }

}
else {//uang g cukup
  echo '<script language="javascript">';
echo 'alert("Uang anda tidak mencukupi")';
echo '</script>';
}
}
else{//barang sudah tidak ada
  echo '<script language="javascript">';
echo 'alert("barang sudah tidak ada")';
echo '</script>';

}

}


?>
<div class="container mt5">
  <div class="row">
    <div class="col-xs-12">
      <h2>Pasar Online</h2>
      <table id="datatable-checkbox" class="table table-striped table-bordered bulk_action">
        <thead>
          <tr>
              <th>ID</th>
              <th>Tim</th>
              <th>Nama Barang</th>
              <th>Jumlah</th>          
              <th>Mata Uang</th>
              <th>Harga</th>
              <th>Beli</th>
            </tr>
          </thead>
          <tbody>
            <?php 
            $ecom = mysqli_query($con, "SELECT * FROM onsale where pembeli = 0 and iduser != '".$_SESSION['id']."'");
            $count = 1;
            while($row = mysqli_fetch_row($ecom)){
              $nama = mysqli_query($con, "SELECT nama, weight from bahanbaku where idbahanbaku = '".$row[2]."'");
              $nama = mysqli_fetch_row($nama);
              echo '
              <tr>
                <td>'.$count.'</td>
                <td>'.$row[1].'</td>   
                <td>'.$nama[0].'</td>
                <td>'.$row[3].'</td>       
                <td>'.$row[5].'</td>
                <td>'.$row[4].'</td>
                <td onclick=beli("'.$count.'","'.$row[1].'","'.$row[3].'","'.$row[5].'","'.$row[4].'","'.$row[2].'","'.$row[0].'","'.$nama[0].'")><span class="glyphicon glyphicon-shopping-cart"></span></td>
              </tr>';
              $count = $count +1;

            }
            ?>

          </tbody>
        </table>
        <div id="modal"></div>
      </div>
    </div>
  </div>
<script>
function beli(count, kelompok, jumlah, cur, harga, ibb, idonsale, nama){
 
 $.ajax({
          url: "ecommerceb.php",
          type: "POST",
          async: false,
          data: {
            beli: 1,
            count: count,
            kelompok: kelompok,
            jumlah: jumlah,
            cur: cur,
            harga: harga,
            ibb:ibb,
            idonsale: idonsale,
            nama: nama
          },
          success: function(res){

            $('#modal').html(res);
          $('#mPinjaman').modal('show');
          }
        });

  



}
</script>
  <?php   
  ?>

  <?php include "footerdashboard.php"; ?>
  <script type="text/javascript">
    $( document ).ready(function() {
      document.getElementById("ecommerceb").className += "active";
    });
  </script>