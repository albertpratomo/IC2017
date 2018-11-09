<?php 
if (isset($_POST['hold'])) {
  include "../connect.php";
  SESSION_START();
  //echo $_POST['cur']." ".$_POST['wei'];
  $cash = mysqli_query($con, "SELECT cash1, cash2, cash3 FROM user where iduser = '".$_SESSION['id']."'");
  $cash = mysqli_fetch_row($cash);

  $kidr = mysqli_fetch_array(mysqli_query($con,"select hjual from currency where idcurrency=1"));
  $ksgd = mysqli_fetch_array(mysqli_query($con,"select hjual from currency where idcurrency=2"));
  $krmb = mysqli_fetch_array(mysqli_query($con,"select hjual from currency where idcurrency=3"));

  if ($_POST['cur'] == 'IDR') {
    $index=1;
    $hcost=$_POST['wei']*10;
  }
  else if ($_POST['cur'] == 'SGD') {
    $index=2;
    $hcost=$_POST['wei']*10;
  }
  else if ($_POST['cur'] == 'RMB') {
    $index=3;
    $hcost=$_POST['wei']*10;
  }

  $ncash = "cash".$index;
  if ($cash[$index-1] >= $hcost) {
    mysqli_query($con,"update user set $ncash = $ncash-$hcost where iduser = '".$_SESSION['id']."'");
  }else{
    $sisa = $hcost - $cash[$index-1];
    mysqli_query($con,"update user set $ncash = $ncash-$hcost+$sisa where iduser = '".$_SESSION['id']."'");
    mysqli_query($con,"INSERT into tpinjaman(iduser, currency, nominal) values('".$_SESSION['id']."','".$_POST['cur']."','".$sisa."')");
  }
  echo "Tim ".$_SESSION['id']." membayar ".$hcost." ".$_POST['cur']." untuk weight ".$_POST['wei']."  ";
  exit();
}
?>
<?php include "headerdashboard.php"; ?>
<?php 
$cash = mysqli_query($con, "SELECT cash1, cash2, cash3 FROM user where iduser = '".$_SESSION['id']."'");
$cash = mysqli_fetch_row($cash);

$pinjaman = mysqli_query($con, "SELECT sum(nominal) FROM tpinjaman where iduser = '".$_SESSION['id']."' and currency = 'IDR'");
$pinjaman = mysqli_fetch_row($pinjaman);
if($pinjaman[0] == NULL){$pinjaman[0]=0;}
$pinjaman1 = mysqli_query($con, "SELECT sum(nominal) FROM tpinjaman where iduser = '".$_SESSION['id']."' and currency = 'SGD'");
$pinjaman1 = mysqli_fetch_row($pinjaman1);
if($pinjaman1[0] == NULL){$pinjaman1[0]=0;}
$pinjaman2 = mysqli_query($con, "SELECT sum(nominal) FROM tpinjaman where iduser = '".$_SESSION['id']."' and currency = 'RMB'");
$pinjaman2 = mysqli_fetch_row($pinjaman2);
if($pinjaman2[0] == NULL){$pinjaman2[0]=0;}

$tabungan = mysqli_query($con, "SELECT sum(nominal) FROM ttabungan where iduser = '".$_SESSION['id']."' and currency = 'IDR'");
$tabungan = mysqli_fetch_row($tabungan);
if($tabungan[0] == NULL){$tabungan[0]=0;}
$tabungan1 = mysqli_query($con, "SELECT sum(nominal) FROM ttabungan where iduser = '".$_SESSION['id']."' and currency = 'SGD'");
$tabungan1 = mysqli_fetch_row($tabungan1);
if($tabungan1[0] == NULL){$tabungan1[0]=0;}
$tabungan2 = mysqli_query($con, "SELECT sum(nominal) FROM ttabungan where iduser = '".$_SESSION['id']."' and currency = 'RMB'");
$tabungan2 = mysqli_fetch_row($tabungan2);
if($tabungan2[0] == NULL){$tabungan2[0]=0;}



$saham = mysqli_query($con, "SELECT sum(qty) FROM tsaham where iduser = '".$_SESSION['id']."' and idsaham =1");
$saham = mysqli_fetch_row($saham);
if($saham[0]==NULL){$saham[0] = 0;}
$saham1 = mysqli_query($con, "SELECT sum(qty) FROM tsaham where iduser = '".$_SESSION['id']."' and idsaham =2");
$saham1 = mysqli_fetch_row($saham1);
if($saham1[0]==NULL){$saham1[0] = 0;}
$saham2 = mysqli_query($con, "SELECT sum(qty) FROM tsaham where iduser = '".$_SESSION['id']."' and idsaham =3");
$saham2 = mysqli_fetch_row($saham2);
if($saham2[0]==NULL){$saham2[0] = 0;}
?>
<div class="container mt7">
  <div class="row">
    <div class="col-sm-6">
      <h2>Cash</h2>
      <table class="table table-bordered">
        <tbody>
          <tr>
            <td>
              <div class="title">IDR</div>
              <div class="number"><?php echo $cash[0] ?></div>
            </td>
            <td>
              <div class="title">SGD</div>
              <div class="number"><?php echo $cash[1] ?></div>
            </td>
            <td>
              <div class="title">RMB</div>
              <div class="number"><?php echo $cash[2] ?></div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="col-sm-6">
      <h2>Pinjaman</h2>
      <table class="table table-bordered">
        <tbody>
          <tr>
            <td>
              <div class="title">IDR</div>
              <div class="number red"><?php echo $pinjaman[0] ?></div>
            </td>
            <td>
              <div class="title">SGD</div>
              <div class="number red"><?php echo $pinjaman1[0] ?></div>
            </td>
            <td>
              <div class="title">RMB</div>
              <div class="number red"><?php echo $pinjaman2[0] ?></div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
  <div class="row">
    <div class="col-sm-6">
      <h2>Tabungan</h2>
      <table class="table table-bordered">
        <tbody>
          <tr>
            <td>
              <div class="title">IDR</div>
              <div class="number"><?php echo $tabungan[0] ?> </div>
            </td>
            <td>
              <div class="title">SGD</div>
              <div class="number"><?php echo $tabungan1[0] ?></div>
            </td>
            <td>
              <div class="title">RMB</div>
              <div class="number"><?php echo $tabungan2[0] ?></div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="col-sm-6">
      <h2>Holding Cost</h2>
      <table class="table table-bordered">
        <form class="form-horizontal">
          <fieldset style="margin-top:30px"  >
            <div class="form-group">
              <div class="col-sm-6" style="margin:10px 0 0 40px;padding:  0;">
                <label class="radio-inline">
                  <input type="radio" name="icurrency" value="IDR" class="flat" checked> IDR
                </label>
                <label class="radio-inline">
                  <input type="radio" name="icurrency" value="SGD" class="flat"> SGD
                </label>
                <label class="radio-inline">
                  <input type="radio" name="icurrency" value="RMB" class="flat"> RMB
                </label>
              </div>
              <div class="col-sm-3" style="padding-left:0" >
                <input class="form-control" placeholder="Weight" type="number" min=1 max=100 id="iweight">
              </div>
              <button type="submit" class="btn btn-primary" onclick="insert()">Submit</button>
            </div>
          </fieldset> 
        </form>
      </table>
    </div>
  </div>
</div>

<?php include "footerdashboard.php"; ?>
<script type="text/javascript">
 $( document ).ready(function() {
  document.getElementById("uang").className += "active";
});

 function insert(){
  var _cur = $("input[name='icurrency']:checked").val();
  var _wei = $('#iweight').val();

  if (_wei<=0) {
    alert("Weight yang diinputkan tidak valid");
  }else{

  $.ajax({
    url: "index.php",
    type: "POST",
    async: false,
    data: {
      hold: 1,
      cur: _cur,
      wei: _wei  
    },
    success: function(res){
      alert(res);
      location.reload();
    }
  });
}
}
</script>