 <?php 
 include "../connect.php";
#untuk update
 function random(){
  $random=rand(0,3);
  if($random==0){$kon = 0.8;}
  if($random==1){$kon = 1.1;}
  if($random==2){$kon = 0.9;}
  if($random==3){$kon = 1.2;}
  return $kon;
}
if(isset($_POST['startclockgames'])){

  $time1=$_POST['jam']+time();
  mysqli_query($con, "update timer set time=$time1 where id=1");
  $result=mysqli_fetch_row(mysqli_query($con,"select * from timer"));
  echo $result[1]-time();
  exit();
};
if(isset($_POST['timergame'])){

  $result=mysqli_fetch_row(mysqli_query($con,"select * from timer"));
  
  echo $result[1]-time();
  exit();



};

if(isset($_POST['pauseclockgames'])){

  $timegames=mysqli_fetch_array(mysqli_query($con,"select times from gamemaster"));
  mysqli_query($con, "update gamemaster set status='pause' where id=1");
  $pausetimes=$timegames[0]-time();
  echo $pausetimes;
  exit();
};

if(isset($_POST['repauseclockgames'])){
  $repause=$_POST['repause'];

  $time1=time()+$repause;
  mysqli_query($con, "update gamemaster set times=$time1, status='S' where id=1");

  exit();
};



if(isset($_POST['update'])){
    //Update Harga Saham
  // $kon=random();
  // $select = mysqli_query($con,"select * from hargasaham where idsaham=1 order by idhargasaham desc");
  // $row=mysqli_fetch_row($select);

  // mysqli_query($con,"INSERT into hargasaham Values(0,1,$kon*$row[2],$kon*$row[3],$kon*$row[4],$kon*$row[5],$kon*$row[6],$kon*$row[7])");

  // $kon=random();
  // $select = mysqli_query($con,"select * from hargasaham where idsaham=2 order by idhargasaham desc");
  // $row=mysqli_fetch_row($select);

  // mysqli_query($con,"INSERT into hargasaham Values(0,2,$kon*$row[2],$kon*$row[3],$kon*$row[4],$kon*$row[5],$kon*$row[6],$kon*$row[7])");

  // $kon=random();  
  // $select = mysqli_query($con,"select * from hargasaham where idsaham=3 order by idhargasaham desc");
  // $row=mysqli_fetch_row($select);

  // mysqli_query($con,"INSERT into hargasaham Values(0,3,$kon*$row[2],$kon*$row[3],$kon*$row[4],$kon*$row[5],$kon*$row[6],$kon*$row[7])");


    //Update History Sum Cash
  $select = mysqli_query($con, "select sum(cash1), sum(cash2), sum(cash3) from user");
  $row = mysqli_fetch_row($select);
  $cash1 = $row[0];
  $cash2 = $row[1];
  $cash3 = $row[2];
  $average = ($cash1+$cash2+$cash3)/3;

  mysqli_query($con, "insert into hargasaham(hjual1, hjual2, hjual3) values($cash1, $cash2, $cash3)");

  if($average ==0)$average=1;

  //Update Perbandingan Kurs Currency
  mysqli_query($con,"update currency set hjual=hjual+20*(($cash1-$average)/$average) where idcurrency=1");
  $kurs1 = mysqli_fetch_row(mysqli_query($con, "select hjual from currency where idcurrency=1"));
  $kurs1 = $kurs1[0];
  if($kurs1<=20){mysqli_query($con,"update currency set hjual=20 where idcurrency=1");}
  if($kurs1>90){mysqli_query($con,"update currency set hjual=90 where idcurrency=1");}

  mysqli_query($con,"update currency set hjual=hjual+20*(($cash2-$average)/$average) where idcurrency=2");
  $kurs1 = mysqli_fetch_row(mysqli_query($con, "select hjual from currency where idcurrency=2"));
  $kurs1 = $kurs1[0];
  if($kurs1<=20){mysqli_query($con,"update currency set hjual=20 where idcurrency=2");}
  if($kurs1>90){mysqli_query($con,"update currency set hjual=90 where idcurrency=2");}

  mysqli_query($con,"update currency set hjual=hjual+20*(($cash3-$average)/$average) where idcurrency=3");
  $kurs1 = mysqli_fetch_row(mysqli_query($con, "select hjual from currency where idcurrency=3"));
  $kurs1 = $kurs1[0];
  if($kurs1<=20){mysqli_query($con,"update currency set hjual=20 where idcurrency=3");}
  if($kurs1>90){mysqli_query($con,"update currency set hjual=90 where idcurrency=3");}

$kurs = mysqli_query($con,"select hjual from currency");
while($row = mysqli_fetch_row($kurs)){
  echo '<td><h1 style="margin:0">'.$row[0].'</h1></td>';
}


$kurs2 = mysqli_query($con, "select hjual from currency");
$kurs  = mysqli_fetch_row($kurs2);
$kursidr = $kurs[0];
$kurs  = mysqli_fetch_row($kurs2);
$kurssgd = $kurs[0];
$kurs  = mysqli_fetch_row($kurs2);
$kursrmb = $kurs[0];

//Update Bahan Baku
    $benang1 = mysqli_query($con,"select * from bahanbaku  where idbahanbaku =1");//cuma ganti benang
    $benang1 = mysqli_fetch_row($benang1);
    $benang2 = mysqli_query($con,"select * from bahanbaku  where idbahanbaku =2");//cuma ganti benang
    $benang2 = mysqli_fetch_row($benang2);
    $benang3 = mysqli_query($con,"select * from bahanbaku  where idbahanbaku =3");//cuma ganti benang
    $benang3 = mysqli_fetch_row($benang3);

      $diff1 = $benang1[9]-$benang1[6];//selsih stok indo
      $diff2 = $benang2[10]-$benang2[7];//selisih stok sgd
      $diff3 = $benang3[11]-$benang3[8];//selisih stok rmb
      $average = ($diff1+$diff2+$diff3)/3;// rata2

if($average>0){
mysqli_query($con,"update bahanbaku set harga1=harga1+(($diff1-$average)*abs(1-(15/$average))), laststok1 = $benang1[6], laststok2=$benang1[7], laststok3=$benang1[8] where idbahanbaku=$benang1[0]");
mysqli_query($con,"update bahanbaku set harga2=harga2+(($diff2-$average)*abs(1-(15/$average))), laststok1 = $benang2[7], laststok2=$benang2[7], laststok3=$benang2[8] where idbahanbaku=$benang2[0]");
mysqli_query($con,"update bahanbaku set harga3=harga3+(($diff3-$average)*abs(1-(15/$average))), laststok1 = $benang3[8], laststok2=$benang3[7], laststok3=$benang3[8] where idbahanbaku=$benang3[0]");
}

    $benang1 = mysqli_query($con,"select * from bahanbaku  where idbahanbaku =1");//cuma ganti benang
    $benang1 = mysqli_fetch_row($benang1);
    $benang2 = mysqli_query($con,"select * from bahanbaku  where idbahanbaku =2");//cuma ganti benang
    $benang2 = mysqli_fetch_row($benang2);
    $benang3 = mysqli_query($con,"select * from bahanbaku  where idbahanbaku =3");//cuma ganti benang
    $benang3 = mysqli_fetch_row($benang3);

    if($benang1[2]<30){mysqli_query($con,"update bahanbaku set harga1=30 where idbahanbaku=$benang1[0]");}
    else if($benang1[2]>80){mysqli_query($con,"update bahanbaku set harga1=80 where idbahanbaku=$benang1[0]");}

    if($benang2[3]<30){mysqli_query($con,"update bahanbaku set harga2=30 where idbahanbaku=$benang2[0]");}
    else if($benang2[3]>80){mysqli_query($con,"update bahanbaku set harga2=80 where idbahanbaku=$benang2[0]");}

    if($benang3[4]<30){mysqli_query($con,"update bahanbaku set harga3=30 where idbahanbaku=$benang3[0]");}
    else if($benang3[4]>80){mysqli_query($con,"update bahanbaku set harga3=80 where idbahanbaku=$benang3[0]");}


//update template dan visa
    $template = mysqli_query($con,"select * from bahanbaku  where idbahanbaku =4");//ganti template
    $template = mysqli_fetch_row($template);
    $diff1 = $template[9]-$template[6];//selsih stok indo
    $diff2 = $template[10]-$template[7];//selisih stok sgd
    $diff3 = $template[11]-$template[8];//selisih stok rmb
    $average = ($diff1+$diff2+$diff3)/3;// rata2

    if($average>0){
mysqli_query($con,"update bahanbaku set harga1=harga1+(($diff1-$average)*abs(1-(15/$average))), harga2=harga2+(($diff2-$average)*abs(1-(15/$average))),harga3=harga3+(($diff3-$average)*abs(1-(15/$average))), laststok1 = $template[6], laststok2=$template[7], laststok3=$template[8] where idbahanbaku=4");
    }
   
   $template = mysqli_query($con,"select * from bahanbaku  where idbahanbaku =4");//ganti template
   $template = mysqli_fetch_row($template);
   
   if($template[2]<80){mysqli_query($con,"update bahanbaku set harga1=80 where idbahanbaku=$template[0]");}
   else if($template[2]>130){mysqli_query($con,"update bahanbaku set harga1=130 where idbahanbaku=$template[0]");}

   if($template[3]<80){mysqli_query($con,"update bahanbaku set harga2=80 where idbahanbaku=$template[0]");}
   else if($template[3]>130){mysqli_query($con,"update bahanbaku set harga2=130 where idbahanbaku=$template[0]");}

   if($template[4]<80){mysqli_query($con,"update bahanbaku set harga3=80 where idbahanbaku=$template[0]");}
   else if($template[4]>130){mysqli_query($con,"update bahanbaku set harga3=130 where idbahanbaku=$template[0]");}

//mysqli_query($con,"update bahanbaku set harga1=harga1*$kursidr/50, harga2=harga2*$kurssgd/50,harga3=harga3*$kursrmb/50 where idbahanbaku=6");


    //Update Harga Desain
$desain1 = mysqli_query($con,"select * from desain where iddesain=1");
$desain1 = mysqli_fetch_row($desain1);
$desain2 = mysqli_query($con,"select * from desain where iddesain=4");
$desain2 = mysqli_fetch_row($desain2);
$desain3 = mysqli_query($con,"select * from desain where iddesain=10");
$desain3 = mysqli_fetch_row($desain3);

 $diff1 = $desain1[8]-$desain1[5];//selisih
 $diff2 = $desain1[9]-$desain1[6];
 $diff3 = $desain1[10]-$desain1[7];
 $average = ($diff1+$diff2+$diff3)/3;

if($average>0){
  mysqli_query($con,"update desain set harga1=harga1+(($average-$diff1)*abs(1-15/$average)), harga2=harga2+(($average-$diff2)*abs(1-15/$average)), harga3=harga3+(($average-$diff3)*abs(1-15/$average)), laststok1 = $desain1[5], laststok2=$desain1[6], laststok3=$desain1[7] where iddesain=1");
}

$desain1 = mysqli_query($con,"select * from desain where iddesain=1");
$desain1 = mysqli_fetch_row($desain1);


if($desain1[2]<210){mysqli_query($con,"update desain set harga1=210 where iddesain=$desain1[0]");}
else if($desain1[2]>360){mysqli_query($con,"update desain set harga1=360 where iddesain=$desain1[0]");}

if($desain1[3]<210){mysqli_query($con,"update desain set harga2=80 where iddesain=$desain1[0]");}
else if($desain1[3]>360){mysqli_query($con,"update desain set harga2=360 where iddesain=$desain1[0]");}

if($desain1[4]<210){mysqli_query($con,"update desain set harga3=80 where iddesain=$desain1[0]");}
else if($desain1[4]>360){mysqli_query($con,"update desain set harga3=360 where iddesain=$desain1[0]");}


// end desain 1

 //update desain 2
$diff1 = $desain2[8]-$desain2[5];
$diff2 = $desain2[9]-$desain2[6];
$diff3 = $desain2[10]-$desain2[7];
$average = ($diff1+$diff2+$diff3)/3;
$count =4;

if($average>0){
  
  mysqli_query($con,"update desain set harga1=harga1+(($average-$diff1)*abs(1-2/$average)), harga2=harga2+(($average-$diff2)*abs(1-2/$average)), harga3=harga3+(($average-$diff3)*abs(1-2/$average)), laststok1 = $desain2[5], laststok2=$desain2[6], laststok3=$desain2[7] where iddesain=4");
}
$desain2 = mysqli_query($con,"select * from desain where iddesain=4");
$desain2 = mysqli_fetch_row($desain1);


if($desain2[2]<410){mysqli_query($con,"update desain set harga1=410 where iddesain=$desain2[0]");}
else if($desain2[2]>560){mysqli_query($con,"update desain set harga1=560 where iddesain=$desain2[0]");}

if($desain2[3]<410){mysqli_query($con,"update desain set harga2=410 where iddesain=$desain2[0]");}
else if($desain2[3]>560){mysqli_query($con,"update desain set harga2=560 where iddesain=$desain2[0]");}

if($desain2[4]<410){mysqli_query($con,"update desain set harga3=410 where iddesain=$desain2[0]");}
else if($desain2[4]>560){mysqli_query($con,"update desain set harga3=560 where iddesain=$desain2[0]");}
 //end desain 2

 //update desain 3
$diff1 = $desain3[8]-$desain3[5];
$diff2 = $desain3[9]-$desain3[6];
$diff3 = $desain3[10]-$desain3[7];
$average = ($diff1+$diff2+$diff3)/3;

if($average>0){
mysqli_query($con,"update desain set harga1=harga1+(($average-$diff1)*abs(1-2/$average)), harga2=harga2+(($average-$diff2)*abs(1-2/$average)), harga3=harga3+(($average-$diff3)*abs(1-2/$average)), laststok1 = $desain3[5], laststok2=$desain3[6], laststok3=$desain3[7] where iddesain=10");
}

$desain3 = mysqli_query($con,"select * from desain where iddesain=10");
$desain3 = mysqli_fetch_row($desain1);


if($desain3[2]<610){mysqli_query($con,"update desain set harga1=610 where iddesain=$desain3[0]");}
else if($desain3[2]>760){mysqli_query($con,"update desain set harga1=760 where iddesain=$desain3[0]");}

if($desain3[3]<610){mysqli_query($con,"update desain set harga2=610 where iddesain=$desain3[0]");}
else if($desain3[3]>760){mysqli_query($con,"update desain set harga2=760 where iddesain=$desain3[0]");}

if($desain3[4]<610){mysqli_query($con,"update desain set harga3=610 where iddesain=$desain3[0]");}
else if($desain3[4]>760){mysqli_query($con,"update desain set harga3=760 where iddesain=$desain3[0]");}

//end desain 3



exit();
}
if(isset($_POST['bunga'])){
  $select = mysqli_query($con, "SELECT iduser, currency, sum(nominal) from ttabungan group by iduser, currency");
  $select2 = mysqli_fetch_row(mysqli_query($con,"select harga1 from setting where namasetting ='bungatabung'"));
  $select2 = $select2[0];
  while($row= mysqli_fetch_row($select)){
    $bunga = $row[2]*$select2/100;
    $ins = mysqli_query($con, "INSERT into ttabungan(iduser, currency, nominal) values('$row[0]','$row[1]','$bunga')");
  }

  $select = mysqli_query($con, "SELECT iduser, currency, sum(nominal) from tpinjaman group by iduser, currency");
  $select2 = mysqli_fetch_row(mysqli_query($con,"select harga1 from setting where namasetting ='bungapinjam'"));
  $select2 = $select2[0];
  while($row= mysqli_fetch_row($select)){
    $bunga = $row[2]*$select2/100;
    $ins = mysqli_query($con, "INSERT into tpinjaman(iduser, currency, nominal) values('$row[0]','$row[1]','$bunga')");
  }

  $bunga = mysqli_query($con,"select harga1 from setting where namasetting like '%bunga%'");
  while($row = mysqli_fetch_row($bunga)){
    echo '<td><h1 style="margin:0">'.$row[0].'%</h1></td>';
  }
  exit();
}
include "headergm.php";
?>

<script type="text/javascript">

  var flag = 0;
  $(document).ready(function(){
    setInterval(function(){ if(flag==1)timer(); }, 1000);


    $('#cd_start').click(function(){
      flag = 1;

      $.ajax({
        url:"index.php",
        type:"post",
        async:true,
        data: {
          startclockgames:1,
          jam:$('#cd_seconds').val()
        },
        success: function(res){
          cd_h = parseInt(res/3600);
          cd_m = parseInt((res - 3600*cd_h)/60);
          cd_s = res - 3600*cd_h - 60 *cd_m;
          $('#cd_h').html(cd_h);
          $('#cd_m').html(cd_m);
          $('#cd_s').html(cd_s);

          return false;
        }
      });

    });

    function timer(){
      $.ajax({
        url:"index.php",
        type:"post",
        async:true,
        data: {
          timergame:1

        },
        success: function(res){
          if(res>=0){
            cd_h = parseInt(res/3600);
            cd_m = parseInt((res - 3600*cd_h)/60);
            cd_s = res - 3600*cd_h - 60 *cd_m;
            $('#cd_h').html(cd_h);
            $('#cd_m').html(cd_m);
            $('#cd_s').html(cd_s);

            if(res % 180 ==0 && flag ==1){
            // alert("masuk updatea");
            updatea();

          } 
          if(res<=0){

            if($('#periodetime').html()== 'Periode'){
              $('#periodetime').html('Freeze');
              flag =0;
            }
            else{
              $('#periodetime').html('Periode'); 
            }
          }

        }
      }
    });

    };

  });
</script>

<style type="text/css">
  .periode{
   background: #202020;
   background-image: linear-gradient(rgba(255,255,255,0.1), transparent);
   background-image: -webkit-linear-gradient(rgba(255,255,255,0.1), transparent);
   background-image: -moz-linear-gradient(rgba(255,255,255,0.1), transparent);
   background-image: -ms-linear-gradient(rgba(255,255,255,0.1), transparent);
   background-image: -o-linear-gradient(rgba(255,255,255,0.1), transparent);
   -webkit-transform-origin: 50% 0;
   -moz-transform-origin: 50% 0;
   -ms-transform-origin: 50% 0;
   -o-transform-origin: 50% 0;
   transform-origin: 50% 0;

   color: #f8f8f8;
   font-size:200;
   border-radius: 20px;
 }
 .time {
  padding-left:50px;
}
.time2 > center{
  background: #202020;
  background-image: linear-gradient(rgba(255,255,255,0.1), transparent);
  background-image: -webkit-linear-gradient(rgba(255,255,255,0.1), transparent);
  background-image: -moz-linear-gradient(rgba(255,255,255,0.1), transparent);
  background-image: -ms-linear-gradient(rgba(255,255,255,0.1), transparent);
  background-image: -o-linear-gradient(rgba(255,255,255,0.1), transparent);
  -webkit-transform-origin: 50% 0;
  -moz-transform-origin: 50% 0;
  -ms-transform-origin: 50% 0;
  -o-transform-origin: 50% 0;
  transform-origin: 50% 0;
  border-radius: 20px;
}
.time2{
  color: #f8f8f8;
  font-size:120px;
  margin-top:20px;
  padding-top:10px;
  padding-bottom:10px;

}
.vertical{
  height: 650px;
}
.text{
  color: #202020;
  font-size:25px;
}
</style>
<div style="background-image: url('../images/bglogin.png');height: 91vh; display:flex;">
  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-12">
        <div class="col-sm-3">
          <div class="col-sm-12" style="margin-top:50px;" >
            <h1><center id='periodetime'>Periode</center></h1>
          </div>
          <div class="col-sm-12 periode time2" >
            <center><div id="period">8</div></center>
          </div>
        </div>
        <div class="col-sm-8 col-sm-offset-1">
          <div class="col-sm-12" style="margin-top:50px;">
           <h1><center>Time</center></h1>
         </div>
         <div class="col-sm-4 time2">
           <center><div id="cd_h">00</div></center>
         </div>
         <div class="col-sm-4 time2">
           <center><div id="cd_m">00</div></center>
         </div>
         <div class="col-sm-4 time2">
          <center><div id="cd_s">00</div></center>
        </div>
      </div>
    </div>
  </div>
  <div class="row" style="margin-top:20px;">
    <div class="col-sm-6 text-center">
      <h1>Kurs</h1>
      <table class="table table-bordered text-center" style="background-color: white;">
        <thead class="text-center">
          <tr>
            <th class="text-center">IDR</th>
            <th class="text-center">SGD</th>
            <th class="text-center">RMB</th>
          </tr>
        </thead>
        <tbody>
          <tr id="viewkurs">
            <?php 
            $kurs = mysqli_query($con,"select hjual from currency");
            while($row = mysqli_fetch_row($kurs)){
              echo '<td><h1 style="margin:0">'.$row[0].'</h1></td>';
            }
            ?>
          </tr>
        </tbody>
      </table> 
    </div>
    <div class="col-sm-6 text-center">
      <h1>Bunga</h1>
      <table class="table table-bordered text-center" style="background-color: white;">
        <thead>
          <tr>
            <th class="text-center">Bunga Pinjaman</th>
            <th class="text-center">Bunga Tabungan</th>
          </tr>
        </thead>
        <tbody>
          <tr id="viewbunga">
            <?php 
            $bunga = mysqli_query($con,"select harga1 from setting where namasetting like '%bunga%'");
            while($row = mysqli_fetch_row($bunga)){
              echo '<td><h1 style="margin:0">'.$row[0].'%</h1></td>';
            }
            ?>
          </tr>
        </tbody>
      </table> 
    </div>
  </div>

  <div class="row" style="margin-top:400px; ">
    <div class="col-sm-6" style="">
      <div class="text">Manage Timer:</div>        
      <input type="button" class="btn btn-primary" value="Start" id="cd_start">

      <input  type="text" class="form-control" value="15" id="cd_seconds">
    </div>

    <div class="col-sm-6" style="">
      <div class="text">Change Period:</div>        
      
      <input type="button" class="btn btn-primary" onclick="nextPer()" value="Next Period">
    </div>

    <div class="col-sm-12" style="margin:30px 0">
      <!-- <div class="text">Add Event:</div>
      <div style="margin:10px 0 20px 40px;">
        <button type="button" class="col-sm-2 btn btn-warning" onclick="Event()"><i class='glyphicon glyphicon-flash'></i>          Thunderstorm</button>
        <button type="button" class="col-sm-2 col-sm-offset-1 btn btn-danger" onclick="Event()"><i class='glyphicon glyphicon-fire'></i>          Fire</button>
        <button type="button" class="col-sm-2 col-sm-offset-1 btn btn-info" onclick="Event()"><i class='glyphicon glyphicon-tint'></i>          Flood</button> 
        <button type="button" class="col-sm-2 col-sm-offset-1 btn btn-success" onclick="Event()"><i class='glyphicon glyphicon-grain'>  </i>       Harvest</button>                       
      </div> -->
    </div>
  </div>
</div>
</div>
</div>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.5.2.min.js"></script>

<script>
  //var statusIntervalId = window.setInterval(updatea, 180000);
  function updatea() {
    $.ajax({
      url: 'index.php',
      type: 'POST',
      async: false,
      data: {
        update: 1
      },
      success: function(res){
        $('tr#viewkurs').html(res);
      }
    });
  }
</script>
<script type="text/javascript">

  document.onkeydown = function(){
    switch (event.keyCode){
        case 116 : //F5 button
        event.returnValue = false;
        event.keyCode = 0;
        return false;
        case 82 : //R button
        if (event.ctrlKey){ 
          event.returnValue = false;
          event.keyCode = 0;
          return false;
        }
      }
    }
    function nextPer(){

      var curr = document.getElementById("period").innerHTML;

      document.getElementById("period").innerHTML = parseInt(curr)+1;
      $.ajax({
        url: 'index.php',
        type: 'POST',
        async: false,
        data: {
          bunga: 1
        },
        success: function(res){
         // alert(res);
         $('tr#viewbunga').html(res);
       }
     });

    }
    function backPer(){

      var curr = document.getElementById("period").innerHTML;

      document.getElementById("period").innerHTML = parseInt(curr)-1;

    }
    

    function changePeriod(){
      var currPer = parseInt(document.getElementById("period").innerHTML)+1;
      document.getElementById("period").innerHTML = currPer;


    }



  </script>