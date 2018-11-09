<?php 
include "headerpasarjual.php";
include "../connect.php";
?>
<meta http-equiv="refresh" content="2">
<style>
table, td, th {    
/*    border: 3px solid black;*/
    text-align: center;
}

table {
    border-collapse: collapse;
    width: 100%;
}
td{
  font-size:  25px;
}

th{
  font-size:  20px;
}
</style>
<div class="container-fluid">
  <h3 style="margin-top:-10px">  Pasar Beli</h2>
  <div class="col-xs-12">
    <table class="table table-bordered text-center">
      <thead>
        <tr class="text-center">
          <th>Jenis Barang</th>
          <th>IDR</th>
          <th>SGD</th>
          <th>RMB</th>
        </tr>
      </thead>
      <tbody class="text-center">
        
        <?php  
          $hrg = mysqli_query($con,"select * from bahanbaku where idbahanbaku!=2 and idbahanbaku!=3 and idbahanbaku!=5 and idbahanbaku!=7");
          
          $kidr = mysqli_fetch_array(mysqli_query($con,"select hjual from currency where idcurrency=1"));
          $ksgd = mysqli_fetch_array(mysqli_query($con,"select hjual from currency where idcurrency=2"));
          $krmb = mysqli_fetch_array(mysqli_query($con,"select hjual from currency where idcurrency=3"));
          


          $hrg2 = mysqli_query($con,"select * from bahanbaku where idbahanbaku=2");
          $hrg3 = mysqli_query($con,"select * from bahanbaku where idbahanbaku=3");

          $row=mysqli_fetch_row($hrg);   //harga benang idr dll
          $row2 = mysqli_fetch_row($hrg2);   //harga benang sgd
          $row3 = mysqli_fetch_row($hrg3);//harga benang rmb   
               
          echo'
              <tr>
                <td>Benang</td>
                <td style="color:red">'.$row[2].'</td>
                <td style="color:#f4b841">'.$row2[3].'</td>
                <td style="color:blue">'.$row3[4].'</td>
              </tr>
            ';

          while($row=mysqli_fetch_row($hrg)){
            echo'
              <tr>
                <td>'.$row[1].'</td>
                <td>'.$row[2].'</td>
                <td>'.$row[3].'</td>
                <td>'.$row[4].'</td>
              </tr>
            ';
          }
        ?>
      </tbody>
    </table>
  </div>
  <h3>  Pasar Jual</h2>
  <div class="col-xs-12">
    <table class="table table-bordered text-center">
      <thead>
        <tr class="text-center">
          <th>Jenis Desain</th>
          <th>IDR</th>
          <th>SGD</th>
          <th>RMB</th>
        </tr>
      </thead>
      <tbody class="text-center">
        <tr>
          <td>Desain 1</td>
          <?php 
            $hrg = mysqli_fetch_row(mysqli_query($con,"select * from desain where iddesain=1"));
            echo'
            <td>'.(int)$hrg[2].'</td>
                <td>'.(int)($hrg[3]).'</td>
                <td>'.(int)($hrg[4]).'</td>
            ';
          ?>
        </tr>
        <tr>
          <td>Desain 2</td>
          <?php 
            $hrg = mysqli_fetch_row(mysqli_query($con,"select * from desain where iddesain=4"));
            echo'
                <td>'.$hrg[2].' ('.$hrg[5].')</td>
                <td>'.$hrg[3].' ('.$hrg[6].')</td>
                <td>'.$hrg[4].' ('.$hrg[7].')</td> 
            ';
          ?>
        </tr>
        <tr>
          <td>Desain 3</td>
          <?php 
            $hrg = mysqli_fetch_row(mysqli_query($con,"select * from desain where iddesain=10"));
            echo'
                <td>'.$hrg[2].' ('.$hrg[5].')</td>
                <td>'.$hrg[3].' ('.$hrg[6].')</td>
                <td>'.$hrg[4].' ('.$hrg[7].')</td>
            ';
          ?>
        </tr>
      </tbody>
    </table>
  </div>
</div>
<?php include "footerpasarjual.php"; ?>