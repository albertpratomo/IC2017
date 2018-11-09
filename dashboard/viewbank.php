<?php include"headerbank.php"; ?>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../css/viewbank.css">

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
              <div class="number">12.50 %</div>
              <div ><i class="glyphicon glyphicon-chevron-up" style="color:green;"></i>3% From last Period</div>
            </td>
            <td>
              <div>Bunga Tabung</div>
              <div class="number">10.50 %</div>
              <div><i class="glyphicon glyphicon-chevron-down" style="color:red;"></i>3% From last Period</div>
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
          <tr>
            <td>USD</td>
            <td>1000</td>
            <td>1222</td>
          </tr>
          <tr>
            <td>SGD</td>
            <td>1222</td>
            <td>1220</td>
          </tr>
        </tbody>
      </table>

      <!-- <div class="col-sm-6 text">
        <center>
          <div>Bunga Pinjam</div>
          <div class="number">12.50 %</div>
          <div ><i class="glyphicon glyphicon-chevron-up" style="color:green;"></i>3% From last Period</div>
        </center>
      </div>
      <div class="col-sm-6 text">
        <center>
          <div>Bunga Tabung</div>
          <div class="number">10.50 %</div>
          <div><i class="glyphicon glyphicon-chevron-down" style="color:red;"></i>3% From last Period</div>
        </center>
      </div> -->
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
          <div class="ct-chart-saless"></div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-sm-12">
      <div class="card card-banner card-chart card-green no-br">
        <div class="card-header">
          <div class="card-title">
            <div class="title">SGD</div>
          </div>
        </div>
        <div class="card-body">
          <div class="ct-chart-sale"></div>
        </div>

      </div>
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
          <div class="ct-chart-sales"></div>
        </div>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript" src="../js/vendor.js"></script>
<script type="text/javascript" src="../js/app.js"></script>
<?php include"footerbank.php"; ?>
<script type="text/javascript">
 $( document ).ready(function() {
  document.getElementById("viewbank").className += "active";
});
</script>