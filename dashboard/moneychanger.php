<?php include "headerbank.php"; ?>

<div class="container">
  <div class="col-md-8 col-md-offset-2">
    <form class="form-horizontal" action="index.php" method="get">
      <fieldset>
        <div class="form-group">
          <label class="col-sm-2 control-label">Pinjaman</label>
          <div class="col-sm-10">
            <input type="hidden" name="id" value="">
            <input type="hidden" name="pin" value="Pinjam">
            <input type="checkbox" name="pin" value="Kembali" data-toggle="toggle" data-on="Kembali" data-off="Pinjam" data-onstyle="success" data-offstyle="danger">
          </div>
        </div>
        <div class="form-group">
          <label for="select" class="col-sm-2 control-label">Kelompok</label>
          <div class="col-sm-10">
            <select name="kel" class="selectpicker form-control" data-live-search="true">
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
              <option value="6">6</option>
              <option value="7">7</option>
              <option value="8">8</option>
              <option value="9">9</option>
              <option value="10">10</option>
              <option value="11">11</option>
              <option value="12">12</option>
              <option value="13">13</option>
              <option value="14">14</option>
              <option value="15">15</option> 
            </select>
          </div>
        </div>
        <div class="form-group">
          <label for="select" class="col-sm-2 control-label">Mata Uang</label>
          <div class="col-sm-10">
            <label class="radio-inline">
              <input type="radio" name="cur" value="IDR" class="flat" checked=""> IDR
            </label>
            <label class="radio-inline">
              <input type="radio" name="cur" value="USD" class="flat"> USD
            </label>
            <label class="radio-inline">
              <input type="radio" name="cur" value="SGD" class="flat"> SGD
            </label>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label">Jumlah</label>
          <div class="col-sm-10">
            <input class="form-control" name="jum" id="inputEmail" placeholder="Jumlah" type="text">
          </div>
        </div>    
        <div class="form-group">
          <div class="col-sm-10 col-sm-offset-2">
            <input type="hidden" name="act" value="1">
            <button type="reset" class="btn btn-default">Cancel</button>
            <button type="submit" class="btn btn-primary">Submit</button>
          </div>
        </div>
      </fieldset> 
    </form>
  </div>
  <div class="col-xs-12 mt2">
    <table id="datatable-checkbox" class="table table-striped table-bordered bulk_action">
      <thead>
        <tr>
          <th><input type="checkbox" id="check-all" class="flat"></th>
          <th>ID</th>
          <th>Pinjaman</th>
          <th>Kelompok</th>
          <th>Mata Uang</th>
          <th>Jumlah</th>
          <th>Edit</th>
          <th>Delete</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><input type="checkbox" class="flat" name="table_records"></td>
          <td>1</td>
          <td>Pinjam</td>
          <td>1</td>
          <td>USD</td>
          <td>61</td>
          <td><a href='index.php?act=2&id=1&pin=Pinjam&kel=1&cur=USD&jum=61'><span class='glyphicon glyphicon-pencil'></span></a></td>
          <td><a href='index.php?act=3&id=1&pin=Pinjam&kel=1&cur=USD&jum=61'><span class='glyphicon glyphicon-remove'></span></a></td>
        </tr>
        <tr>
          <td><input type="checkbox" class="flat" name="table_records"></td>
          <td>2</td>
          <td>Pinjam</td>
          <td>4</td>
          <td>IDR</td>
          <td>100</td>
          <td><a href='index.php?act=2&id=2&pin=Pinjam&kel=4&cur=IDR&jum=100'><span class='glyphicon glyphicon-pencil'></span></a></td>
          <td><a href='index.php?act=3&id=2&pin=Pinjam&kel=4&cur=IDR&jum=100'><span class='glyphicon glyphicon-remove'></span></a></td>
        </tr>
        <tr>
          <td><input type="checkbox" class="flat" name="table_records"></td>
          <td>3</td>
          <td>Kembali</td>
          <td>8</td>
          <td>SGD</td>
          <td>20</td>
          <td><a href='index.php?act=2&id=3&pin=Kembali&kel=8&cur=SGD&jum=20'><span class='glyphicon glyphicon-pencil'></span></a></td>
          <td><a href='index.php?act=3&id=3&pin=Kembali&kel=8&cur=SGD&jum=20'><span class='glyphicon glyphicon-remove'></span></a></td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
<?php   
if(isset($_GET['act'])){
  $edit='';
  $judul = 'Konfirmasi!';
  if($_GET['act']==3){
    $kata = 'Apakah anda yakin ingin menghapus ini?';;
  }elseif($_GET['act']==2){
    $kata = 'Silahkan mengedit data';
    $judul = 'Edit';
  }elseif($_GET['act']==1){
    $kata = 'Apakah anda yakin ingin memasukkan ini?';
  }

  echo"
  <div class='modal fade' id='mPinjaman' tabindex='-1' role='dialog' aria-labelledby='myModalLabel'>
    <div class='modal-dialog' role='document'>
      <div class='modal-content'>

          <div class='modal-header'>
            <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>
            <h4 class='modal-title'>".$judul."</h4>
          </div>
          <form method='POST' action='test.php'>
          <div class='modal-body'>"
            .$kata."<br>
            <table class='table table-bordered'>
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Pinjaman</th>
                  <th>Kelompok</th>
                  <th>Mata Uang</th>
                  <th>Jumlah</th>
                </tr>
              </thead>
              <tbody>
                <tr>";
                if($_GET['act']==2){
                  echo"
                  <td>".$_GET['id']."</td>
                  <td><input type='text' name='pin' value='".$_GET['pin']."'></td>
                  <td><input type='text' name='kel' value='".$_GET['kel']."'></td>
                  <td><input type='text' name='cur' value='".$_GET['cur']."'></td>
                  <td><input type='text' name='jum' value='".$_GET['jum']."'></td>
                  ";
                }else{
                  echo"
                  <td>".$_GET['id']."</td>
                  <td>".$_GET['pin']."</td>
                  <td>".$_GET['kel']."</td>
                  <td>".$_GET['cur']."</td>
                  <td>".$_GET['jum']."</td>
                  ";
                }
                echo "</tr>
              </tbody>
            </table>

          </div>
          <div class='modal-footer'>
            <button type='button' class='btn btn-danger' data-dismiss='modal'>No</button>
            <button type='submit' class='btn btn-success'";if($_GET['act']!=2){echo "data-dismiss='modal'";}echo">Yes</button>
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


<?php include "footerbank.php"; ?>
<script type="text/javascript">
 $( document ).ready(function() {
  document.getElementById("moneychanger").className += "active";
});
</script>