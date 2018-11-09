<?php include"headerbank.php"; ?>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../css/viewbank.css">
<?php include"../connect.php" ;

$result = mysqli_query($con, "select hjual1 from hargasaham");
$row = mysqli_fetch_row($result);

?>

<style>
  .text{
    font-size: 20px;
    font-weight: bold;
/*    border-left: thick solid black;
border-right: thick solid black;*/
}
.number{
  font-size: 50px;
  font-weight: bold;

}
table{
  font-weight: bold;
  font-size:20px;
  border-style: double;
}
</style>
<div class="container">
  <div class="row">
    <div class="col-sm-6">
      <table class="table table-bordered">
        <tbody>
          <tr>
            <td>
              <div>Bunga Pinjam</div>
              <div class="number">10.50 %</div>
              <!-- <div ><i class="glyphicon glyphicon-chevron-up" style="color:#1abc9c;"></i>3% From last Period</div> -->
            </td>
            <td>
              <div>Bunga Tabung</div> 
              <div class="number">8.50 %</div>
              <!-- <div><i class="glyphicon glyphicon-chevron-down" style="color:#d70206;"></i>3% From last Period</div> -->
            </td>
          </tr>
          <tr>
          <td colspan="2">
            <ul class="list-inline" style="font-size:18px;margin-bottom: 0; ">
              <li><span style="color:#f4c63d">&bull; Ciputra</li></span>
              <li><span style="color:#d70206">&bull; Sampoerna</li></span>
              <li><span style="color:#f05b4f">&bull; Freeport</li></span>
            </ul>
            </td>
          </tr>
        </tbody>
      </table>

    </div>
    <div class="col-sm-6 ">
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>Kurs</th>
            <th>Jual</th>
            <th>Beli</th>
          </tr>
        </thead>
        <tbody>
          <?php 
          $kurs = mysqli_query($con,"select * from currency where idcurrency != 1");
          while($row = mysqli_fetch_row($kurs)){
            echo
            "<tr>
            <td>".$row[1]."</td>
            <td>".$row[2]."</td>
            <td>".$row[3]."</td>
          </tr>";
        }
        ?>
      </tbody>
    </table>
  </div>
</div>
<div class="row">
  <div class="col-sm-12">
    <div class="card card-banner card-chart card-green no-br">
      <div class="card-header">
        <div class="card-title">
          <div class="title">IDR</div>
        </div>
      </div>
      <div class="card-body">
       <div id="coba1"></div>
     </div>
   </div>
 </div>
</div>
<div class="row">
  <div class="col-sm-12">
    <div class="card card-banner card-chart card-green no-br">
      <div class="card-header">
        <div class="card-title">
          <div class="title">USD</div>
        </div>
      </div>
      <div class="card-body">
       <div id="coba2"></div>
     </div>

   </div>
 </div>
</div>
<div class="row">
  <div class="col-sm-12">
    <div class="card card-banner card-chart card-green no-br">
      <div class="card-header">
        <div class="card-title">
          <div class="title">RMB</div>
        </div>
      </div>
      <div class="card-body">
       <div id="coba3"></div>
     </div>
   </div>
 </div>
</div>
</div>
<script>
  showdata();

  var statusIntervalId = window.setInterval(showdata, 5000);
  
  function showdata() {

    $.ajax({
      url: 'testview.php',
      type: 'POST',
      async: false,
      data: {
        showdata1: 1
      },
      success: function(res)
      {
        $('#coba1').html(res);
      }
    });
    $.ajax({
      url: 'testview.php',
      type: 'POST',
      async: false,
      data: {
        showdata2: 1
      },
      success: function(res)
      {
        $('#coba2').html(res);
      }
    });
    $.ajax({
      url: 'testview.php',
      type: 'POST',
      async: false,
      data: {
        showdata3: 1
      },
      success: function(res)
      {
        $('#coba3').html(res);
      }
    });

  }
</script>