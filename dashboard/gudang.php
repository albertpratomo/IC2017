<?php 
 if(isset($_POST['sh'])){

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
              Apakah anda yakin ingin menjual ini?<br>
              <table class='table table-bordered'>
                <thead>
                  <tr>
                    <th>No</th>
                    <th>Nama Barang</th>
                    <th>Jumlah</th>
                    <th>Weight</th>
                    <th>Mata Uang</th>
                    <th>Harga Total</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                  <input type='hidden' name='ibb' value='".$_POST['nama']."'>
                    <td>".$_POST['count']."</td>
                    <td>".$_POST['namabarang']."</td>
                    <td><input id='jum' type='number' min='1' max='".$_POST['jumlah']."'name='j' value='".$_POST['jumlah']."'></td>
                    <td id='wei'>".$_POST['weight']."</td>                         
                    <td>
                      <select name='cur'>
                        <option value='IDR'>IDR</option>
                        <option value='SGD'>SGD</option>
                        <option value='RMB'>RMB</option>
                      </select>
                    </td>
                    <td><input type='number' min='1' name='harga'></td>  
                  </tr>
                </tbody>
              </table>

            </div>
            <div class='modal-footer'>
              <button type='button' class='btn btn-danger' data-dismiss='modal'>No</button>
              <button type='submit' name='onsale' class='btn btn-success'>Yes</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    ";
    exit();
    }

     if(isset($_POST['buang'])){

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
              Apakah anda yakin ingin membuang barang ini?<br>
              <table class='table table-bordered'>
                <thead>
                  <tr>
                    <th>No</th>
                    <th>Nama Barang</th>
                    <th>Jumlah</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                  <input type='hidden' name='ibb' value='".$_POST['nama']."'>
                    <td>".$_POST['count']."</td>
                    <td>".$_POST['namabarang']."</td>
                    <td><input id='jum' type='number' min='1' max='".$_POST['jumlah']."'name='j' value='".$_POST['jumlah']."'></td>
                    
                  </tr>
                </tbody>
              </table>

            </div>
            <div class='modal-footer'>
              <button type='button' class='btn btn-danger' data-dismiss='modal'>No</button>
              <button type='submit' name='hapus' class='btn btn-success'>Yes</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    ";
    exit();
    }


include "headerdashboard.php"; ?>
<?php 
if(isset($_POST['hapus'])){
  $temp = $_POST['j']*-1;
  $result = mysqli_query($con, "insert into  inventory(qty,iduser, idbahanbaku ) values( '".$temp."','".$_SESSION['id']."','".$_POST['ibb']."')");

}
if(isset($_POST['onsale'])){
  $result = mysqli_query($con, "INSERT into onsale(iduser, idbahanbaku, qty, harga, currency, pembeli) values('".$_SESSION['id']."','".$_POST['ibb']."','".$_POST['j']."','".$_POST['harga']."','".$_POST['cur']."','0')");

  $temp = $_POST['j']*-1;
  $result = mysqli_query($con, "insert into  inventory(qty,iduser, idbahanbaku ) values( '$temp','".$_SESSION['id']."','".$_POST['ibb']."')");
  header("location:gudang.php");
}

$maxweight = mysqli_fetch_array(mysqli_query($con, "SELECT maxweight FROM user WHERE iduser = '".$_SESSION['id']."'"));

$gudang = mysqli_query($con, "SELECT sum(i.qty)*b.weight FROM inventory i join bahanbaku b on i.idbahanbaku = b.idbahanbaku WHERE iduser = '".$_SESSION['id']."' GROUP BY i.idbahanbaku");
$sumgudang = 0;
while($row = mysqli_fetch_row($gudang)) { 
  $sumgudang += $row[0];
}

$onsale = mysqli_query($con, "SELECT sum(i.qty)*b.weight FROM onsale i join bahanbaku b on i.idbahanbaku = b.idbahanbaku WHERE pembeli = 0 and iduser = '".$_SESSION['id']."' GROUP BY i.idbahanbaku");
$sumonsale = 0;
while($row = mysqli_fetch_row($onsale)) { 
  $sumonsale += $row[0];
}

?>
<div class="container mt5">
  <div class="row">
    <div class="col-xs-12">
      <h2><?php echo "Kapasitas (".$sumgudang."+".$sumonsale."/".$maxweight[0].")"?></h2>
      <table id="datatable-checkbox" class="table table-striped table-bordered bulk_action">
        <thead>
          <tr>
            <!-- <th><input type="checkbox" id="check-all" class="flat"></th> -->
            <th>No</th>
            <th>Nama Barang</th>
            <th>Jumlah</th>
            <th>Weight</th>          
            <th>Subtotal</th>
            <th>Jual</th>
            <th>Delete</th>
          </tr>
        </thead>
        <tbody>

          <?php 
          $inven = mysqli_query($con, "SELECT idbahanbaku, sum(qty) FROM inventory WHERE iduser = '".$_SESSION['id']."'  GROUP BY idbahanbaku having idbahanbaku <5");
          $count = 1;
          while($row = mysqli_fetch_row($inven)){
            if($row[1]!=0){
              $nama = mysqli_query($con, "SELECT nama, weight from bahanbaku where idbahanbaku='".$row[0]."'");
              $nama = mysqli_fetch_row($nama);
              echo '
              <tr>
                <td>'.$count.'</td>
                <td>'.$nama[0].'</td>   
                <td>'.$row[1].'</td>
                <td>'.$nama[1].'</td>       
                <td>'.$nama[1]*$row[1].'</td>
                <td onclick=coba('.$count.','.$row[0].','.$row[1].','.$nama[1].',"'.$nama[0].'")><span class="glyphicon glyphicon-tags"></span></td>
                <td onclick=buang('.$count.','.$row[0].','.$row[1].','.$nama[1].',"'.$nama[0].'")><span class="glyphicon glyphicon-remove"></span>
                </td>
              </tr>';
              
              $count = $count +1;}
            }
            ?>

          </table>
        </div>
      </div>
    </div>
    <div id="modal"></div>


    <?php include "footerdashboard.php"; ?>
    <script type='text/javascript'>
      $(window).load(function(){
        $('#mPinjaman').modal('show');
      });
    </script>
    <script type="text/javascript">
      function buang(count, nama, jumlah, weight,namabarang){
    
        
        $.ajax({
          url: "gudang.php",
          type: "POST",
          async: false,
          data: {
            buang: 1,
            count: count,
            nama: nama,
            jumlah: jumlah,
            weight: weight,
            namabarang: namabarang
          },
          success: function(res){

            $('#modal').html(res);
          $('#mPinjaman').modal('show');
          }
        });


      };
      function coba(count, nama, jumlah, weight,namabarang){
    
        
        $.ajax({
          url: "gudang.php",
          type: "POST",
          async: false,
          data: {
            sh: 1,
            count: count,
            nama: nama,
            jumlah: jumlah,
            weight: weight,
            namabarang: namabarang
          },
          success: function(res){

            $('#modal').html(res);
          $('#mPinjaman').modal('show');
          }
        });


      }
      $( document ).ready(function() {
        document.getElementById("gudang").className += "active";

        $('#jum').keypress(function (evt) {
          evt.preventDefault();
        });

        $('#jum').bind('keyup input', function(){
          $('#subtot').html($('#jum').val() * $('#wei').html());
        });


      });
    </script>