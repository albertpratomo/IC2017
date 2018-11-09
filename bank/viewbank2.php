<?php include"headerbank.php"; ?>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../css/viewbank.css">
<?php include"../connect.php" ;

$result = mysqli_query($con, "select hjual1 from hargasaham where idsaham=1");
$result1 = mysqli_query($con, "select hjual1 from hargasaham where idsaham=2");
$result2 = mysqli_query($con, "select hjual1 from hargasaham where idsaham=3");

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

<!--   <div class="row">
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
  </div> -->
  <div class="panel panel-default col-sm-6">
    <div class="panel-heading">Bandingkan Semua perusahaan</div>
    <div class="panel-body">

      <div class="form-group col-sm-12">
        <label class="col-sm-2 control-label">Mata Uang</label>
        <div class="col-sm-10" >
          <label class="radio-inline">
            <input type="radio" name="icurrency" value="hjual1" class="1" checked=""> IDR
          </label>
          <label class="radio-inline">
            <input type="radio" name="icurrency" value="hjual2" class="1"> USD
          </label>
          <label class="radio-inline">
            <input type="radio" name="icurrency" value="hjual3" class="1"> RMB
          </label>
          <button type="button" class="btn btn-primary"  onclick="currency()">Submit</button>

        </div>

      </div>

    </div>
  </div>
  <div class="panel panel-default col-sm-6">
    <div class="panel-heading">Bandingkan dengan Mata uang</div>
    <div class="panel-body">
      <form>

        <div class="form-group col-sm-12">
          <label class="col-sm-2 control-label">Saham</label>
          <div class="col-sm-10" >
            <label class="radio-inline">
              <input type="radio" name="saham" value="1" class="1" checked=""> Sampo
            </label>
            <label class="radio-inline">
              <input type="radio" name="saham" value="2" class="1"> Free
            </label>
            <label class="radio-inline">
              <input type="radio" name="saham" value="3" class="1"> Ciputra
            </label>
            <button type="button" class="btn btn-primary" onclick="sahamm()">Submit</button>

          </div>
        </div>
      </form>

    </div>
  </div>


  <div class="row">
    <div class="col-sm-12">
      <div class="card card-banner card-chart card-green no-br">
        <div class="card-header">
          <div class="card-title">
            Sumbu Y: <b id="sumbu"></b>
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
  var cur = 'hjual1';
  var curr = 'IDR';
  var sah = 1;
  var sahh = 'Sampoerna';
  var cek = 0;
  showdata();
  function currency(){

    cur = $("input[name='icurrency']:checked").val();
    if(cur =='hjual1'){curr='IDR';}
    if(cur =='hjual2'){curr='USD';}
    if(cur =='hjual3'){curr='RMB';}
    cek = 0;

    showdata();

  }
  function sahamm(){
    sah = $("input[name='saham']:checked").val();
    cek = 1;
    if(sah == 1){sahh = 'Sampoerna';}
    if(sah == 2){sahh = 'Freeport';}
    if(sah == 3){sahh = 'Ciputra';}


    showdata();

  }
  // var statusIntervalId = window.setInterval(showdata, 5000);
  function showdata() {

    // $.ajax({
    //   url: 'test.php',
    //   type: 'POST',
    //   async: false,
    //   data: {
    //     showdata1: 1
    //   },
    //   success: function(res)
    //   {
    //     $('#coba1').html(res);
    //   }
    // });
    // $.ajax({
    //   url: 'test.php',
    //   type: 'POST',
    //   async: false,
    //   data: {
    //     showdata2: 1
    //   },
    //   success: function(res)
    //   {
    //     $('#coba2').html(res);
    //   }
    // });
    if(cek == 0){
      $.ajax({
        url: 'test.php',
        type: 'POST',
        async: false,
        data: {
          cek : cek,
          showdata3: 1,
          cur: cur
        },
        success: function(res)
        {
          $('#coba3').html(res);
          $('#sumbu').html(curr);

        }
      });
    }
    else{
      $.ajax({
        url: 'test.php',
        type: 'POST',
        async: false,
        data: {
          cek : cek,
          showdata3: 1,
          sah: sah
        },
        success: function(res)
        {
          $('#coba3').html(res);
          $('#sumbu').html(sahh);

        }
      });

    }


  }
</script>
