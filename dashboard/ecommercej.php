<?php include "headerdashboard.php"; ?>
<?php 
if(isset($_POST['delete'])){


  //cek barang masih ada
  $cekbarang = mysqli_fetch_row(mysqli_query($con, "SELECT count(*) from onsale  where  pembeli = 0 and idonsale = '".$_POST['o']."'"));
  $cekbarang = $cekbarang[0];



  if($cekbarang!=0){//barang masih ada
   $result = mysqli_query($con, "DELETE from onsale where idonsale = '".$_POST['o']."'");
   $temp = $_POST['j'];
   $result = mysqli_query($con, "insert into  inventory(qty,iduser, idbahanbaku ) values( '$temp','".$_SESSION['id']."','".$_POST['ibb']."')");
 }
 else {
  echo '<script language="javascript">';
echo 'alert("barang sudah tidak ada")';
echo '</script>';

 }
 header("location:ecommercej.php");

}

?>
<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <h2>Dalam Penjualan</h2>
      <table id="datatable-checkbox" class="table table-striped table-bordered bulk_action">
        <thead>
          <tr>
            <th>No</th>
            <th>Nama Barang</th>
            <th>Jumlah</th>
            <th>Weight</th>          
            <th>Subtotal</th>
            <th>Mata Uang</th>
            <th>Harga</th>
            <th>Cancel</th>
          </tr>
        </thead>
        <tbody>
          <?php 
          $onsale = mysqli_query($con, "SELECT * FROM onsale where pembeli = 0 and iduser = '".$_SESSION['id']."'");
          $count = 1;
          while($row = mysqli_fetch_row($onsale)){
            $nama = mysqli_query($con, "SELECT nama, weight from bahanbaku where idbahanbaku = '".$row[2]."'");
            $nama = mysqli_fetch_row($nama);
            echo '
            <tr>
              <td>'.$count.'</td>
              <td>'.$nama[0].'</td>   
              <td>'.$row[3].'</td>
              <td>'.$nama[1].'</td>       
              <td>'.$nama[1]*$row[3].'</td>
              <td>'.$row[5].'</td>
              <td>'.$row[4].'</td>
              <td><a href="ecommercej.php?n='.$count.'&b='.$nama[0].'&j='.$row[3].'&w='.$nama[1].'&s='.$nama[1]*$row[3].'&m='.$row[5].'&h='.$row[4].'&o='.$row[0].'&i='.$row[2].'"><span class="glyphicon glyphicon-remove"></span></a></td>
            </tr>
            ';
            $count = $count +1;
          }
          ?>
        </tbody>
      </table>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <h2>Sudah Terjual</h2>
      <table id="datatable" class="table table-striped table-bordered bulk_action">
        <thead>
          <tr>
            <th>No</th>
            <th>Nama Barang</th>
            <th>Jumlah</th>
            <th>Mata Uang</th>
            <th>Harga</th>
            <th>Pembeli</th>
          </tr>
        </thead>
        <tbody>
          <?php 
          $onsale = mysqli_query($con, "SELECT * FROM onsale where pembeli > 0 and iduser = '".$_SESSION['id']."'");
          $count = 1;
          while($row = mysqli_fetch_row($onsale)){
            $nama = mysqli_query($con, "SELECT nama, weight from bahanbaku where idbahanbaku = '".$row[2]."'");
            $nama = mysqli_fetch_row($nama);
            echo '
            <tr>
              <td>'.$count.'</td>
              <td>'.$nama[0].'</td>   
              <td>'.$row[3].'</td>
              <td>'.$row[5].'</td>
              <td>'.$row[4].'</td>
              <td>'.$row[6].'</td>
            </tr>
            ';
            $count = $count +1;
          }
          ?>
        </tbody>
      </table>
    </div>
  </div>
</div>

<?php   
if(isset($_GET['n'])){
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
            Apakah anda yakin ingin membatalkan penjualan ini?<br>
            <table class='table table-bordered'>
              <thead>
                <tr>
                  <th>No</th>
                  <th>Nama Barang</th>
                  <th>Jumlah</th>
                  <th>Weight</th>
                  <th>Subtotal</th>
                  <th>Mata Uang</th>
                  <th>Harga Total</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <input type='hidden' name='ibb' value='".$_GET['i']."'>              
                  <input type='hidden' name='j' value='".$_GET['j']."'>
                  <input type='hidden' name='o' value='".$_GET['o']."'>

                  <td>".$_GET['n']."</td>
                  <td>".$_GET['b']."</td>
                  <td>".$_GET['j']."</td>
                  <td>".$_GET['w']."</td>                                    
                  <td>".$_GET['s']."</td>
                  <td>".$_GET['m']."</td>
                  <td>".$_GET['h']."</td>  
                </tr>
              </tbody>
            </table>

          </div>
          <div class='modal-footer'>
            <button type='button' class='btn btn-danger' data-dismiss='modal'>No</button>
            <button type='submit' class='btn btn-success' name='delete'>Yes</button>
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
}
?>

<?php include "footerdashboard.php"; ?>
<script type="text/javascript">
  $( document ).ready(function() {
    document.getElementById("ecommercej").className += "active";
  });
</script>