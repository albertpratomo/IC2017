<?php include "headerpasarbeli.php"; ?>

<script>
  function changeJumlah(nilai){
    document.getElementById("jumlah").value = nilai;

  }
  function changeJumlah2(nilai){
    document.getElementById("jumlah2").value = nilai;
  }

  function changeTotal(nilai){
    if(document.getElementById("IDR").checked){
      document.getElementById("total").value = 10000 * nilai;
    }
    else if(document.getElementById("USD").checked){
      document.getElementById("total").value = 50000 * nilai;
    }
    else{
      document.getElementById("total").value = 20000 * nilai;
    }

  }
</script>
<div class="container">
  <div class="col-md-8 col-md-offset-2">
    <form class="form-horizontal">
      <fieldset>
        <input type="hidden" name="id" value ="8">
        <div class="form-group">
          <label for="select" class="col-sm-2 control-label">Kelompok</label>

          <div class="col-sm-10">
            <select id="kelompok" name="kel" class="selectpicker form-control" data-live-search="true">
              <option value="1">01 - Betelgeuse</option>
              <option value="2">02 - Hamal</option>
              <option value="3">03 - Antares</option>
              <option value="4">04 - Pollux</option>
              <option value="5">05 - Castor</option>
              <option value="6">06 - Alhena</option>
              <option value="7">07 - Polaris</option>
              <option value="8">08 - Bellatrix</option>
              <option value="9">09 - Arcturus</option>
              <option value="10">10 - Formalhaut</option>
              <option value="11">11 - Spica</option>
              <option value="12">12 - Regulus</option>
              <option value="13">13 - Denebola</option>
              <option value="14">14 - Vega</option>
              <option value="15">15 - Aquila</option> 
            </select>
          </div>
        </div>
        <div class="form-group">
          <label for="select" class="col-sm-2 control-label">Barang</label>
          <div class="col-sm-10">
            <select id="barang" name="pin" class="selectpicker form-control" data-live-search="true">
              <option>Laptop</option>
              <option>Mouse</option>
              <option>Keyboard</option>
              <option>Processor</option>
              <option>Motherboard</option>
            </select>
          </div>
        </div>

        <div class="form-group">
          <label for="inputPassword" class="col-sm-2 control-label">Jumlah</label>
          <div class="col-sm-10">
            <input class="form-control" id="jumlah" name="jum" oninput="changeJumlah2(this.value),changeTotal(this.value)" type="text">
          </div>

          <div class="col-sm-10 col-sm-offset-2" style="margin-top:5%;">
            <input oninput="changeJumlah(this.value), changeTotal(this.value)" type="range" id="jumlah2" name="slideBlue" min="0" max="255">
          </div>
        </div>
        <div class="form-group">
          <label for="select" class="col-sm-2 control-label">Mata Uang</label>
          <div class="col-sm-10">
            <label class="radio-inline">
              <input id="IDR" type="radio" name="cur" value="IDR" class="flat" checked=""> IDR
            </label>
            <label class="radio-inline">
              <input id="USD" type="radio" name="cur" value="USD" class="flat"> USD
            </label>
            <label class="radio-inline">
              <input id="SGD" type="radio" name="cur" value="SGD" class="flat"> SGD
            </label>
          </div>
        </div>
        <div class="form-group">
          <label for="Total" class="col-sm-2 control-label">Total</label>
          <div class="col-sm-10">
            <input class="form-control" id="total"  name = "tot" type="text" readonly>
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
          <th>Kelompok</th>
          <th>Barang</th>
          <th>Mata Uang</th>
          <th>Jumlah</th>
          <th>Total</th>
          <th>Edit</th>
          <th>Delete</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><input type="checkbox" class="flat" name="table_records"></td>
          <td>1</td>
          <td>1</td>
          <td>Laptop</td>
          <td>USD</td>
          <td>61</td>
          <td>61000</td>          
          <td><a href='index.php?act=2&id=1&pin=Laptop&kel=1&cur=USD&jum=61&tot=61000'><span class='glyphicon glyphicon-pencil'></span></a></td>
          <td><a href='index.php?act=3&id=1&pin=Laptop&kel=1&cur=USD&jum=61&tot=61000'><span class='glyphicon glyphicon-remove'></span></a></td>
        </tr>
        <tr>
          <td><input type="checkbox" class="flat" name="table_records"></td>
          <td>2</td>
          <td>4</td>
          <td>Mouse</td>
          <td>USD</td>
          <td>20</td>
          <td>4000</td>          
          <td><a href='index.php?act=2&id=2&pin=Mouse&kel=4&cur=USD&jum=20&tot=4000'><span class='glyphicon glyphicon-pencil'></span></a></td>
          <td><a href='index.php?act=3&id=2&pin=Mouse&kel=4&cur=USD&jum=20&tot=4000'><span class='glyphicon glyphicon-remove'></span></a></td>
        </tr>
        <tr>
          <td><input type="checkbox" class="flat" name="table_records"></td>
          <td>3</td>
          <td>6</td>
          <td>Keyboard</td>
          <td>SGD</td>
          <td>50</td>
          <td>10000</td>          
          <td><a href='index.php?act=2&id=3&pin=Keyboard&kel=6&cur=USD&jum=50&tot=10000'><span class='glyphicon glyphicon-pencil'></span></a></td>
          <td><a href='index.php?act=3&id=3&pin=Keyboard&kel=6&cur=USD&jum=50&tot=10000'><span class='glyphicon glyphicon-remove'></span></a></td>
        </tr>
        <tr>
          <td><input type="checkbox" class="flat" name="table_records"></td>
          <td>4</td>
          <td>3</td>
          <td>Mouse</td>
          <td>USD</td>
          <td>20</td>
          <td>4000</td>          
          <td><a href='index.php?act=2&id=4&pin=Mouse&kel=3&cur=USD&jum=20&tot=4000'><span class='glyphicon glyphicon-pencil'></span></a></td>
          <td><a href='index.php?act=3&id=4&pin=Mouse&kel=3&cur=USD&jum=20&tot=4000'><span class='glyphicon glyphicon-remove'></span></a></td>
        </tr>
        <tr>
          <td><input type="checkbox" class="flat" name="table_records"></td>
          <td>5</td>
          <td>8</td>
          <td>Laptop</td>
          <td>USD</td>
          <td>61</td>
          <td>61000</td>          
          <td><a href='index.php?act=2&id=5&pin=Laptop&kel=8&cur=USD&jum=61&tot=61000'><span class='glyphicon glyphicon-pencil'></span></a></td>
          <td><a href='index.php?act=3&id=5&pin=Laptop&kel=8&cur=USD&jum=61&tot=61000'><span class='glyphicon glyphicon-remove'></span></a></td>
        </tr>
        <tr>
          <td><input type="checkbox" class="flat" name="table_records"></td>
          <td>6</td>
          <td>9</td>
          <td>Mouse</td>
          <td>USD</td>
          <td>200</td>
          <td>40000</td>          
          <td><a href='index.php?act=2&id=6&pin=Mouse&kel=9&cur=USD&jum=200&tot=40000'><span class='glyphicon glyphicon-pencil'></span></a></td>
          <td><a href='index.php?act=3&id=6&pin=Mouse&kel=9&cur=USD&jum=200&tot=40000'><span class='glyphicon glyphicon-remove'></span></a></td>
        </tr>
        <tr>
          <td><input type="checkbox" class="flat" name="table_records"></td>
          <td>7</td>
          <td>9</td>
          <td>Keyboard</td>
          <td>SGD</td>
          <td>30</td>
          <td>60000</td>          
          <td><a href='index.php?act=2&id=7&pin=Keyboard&kel=9&cur=USD&jum=30&tot=60000'><span class='glyphicon glyphicon-pencil'></span></a></td>
          <td><a href='index.php?act=3&id=7&pin=Keyboard&kel=9&cur=USD&jum=30&tot=60000'><span class='glyphicon glyphicon-remove'></span></a></td>
        </tr>
        <tr>
          <td><input type="checkbox" class="flat" name="table_records"></td>
          <td>8</td>
          <td>6</td>
          <td>Mouse</td>
          <td>USD</td>
          <td>15</td>
          <td>4500</td>          
          <td><a href='index.php?act=2&id=8&pin=Mouse&kel=6&cur=USD&jum=15&tot=4500'><span class='glyphicon glyphicon-pencil'></span></a></td>
          <td><a href='index.php?act=3&id=8&pin=Mouse&kel=6&cur=USD&jum=15&tot=4500'><span class='glyphicon glyphicon-remove'></span></a></td>
        </tr>
        <tr>
          <td><input type="checkbox" class="flat" name="table_records"></td>
          <td>9</td>
          <td>11</td>
          <td>Laptop</td>
          <td>USD</td>
          <td>60</td>
          <td>60000</td>          
          <td><a href='index.php?act=2&id=9&pin=Laptop&kel=11&cur=USD&jum=60&tot=60000'><span class='glyphicon glyphicon-pencil'></span></a></td>
          <td><a href='index.php?act=3&id=9&pin=Laptop&kel=11&cur=USD&jum=60&tot=60000'><span class='glyphicon glyphicon-remove'></span></a></td>
        </tr>
        <tr>
          <td><input type="checkbox" class="flat" name="table_records"></td>
          <td>10</td>
          <td>12</td>
          <td>Mouse</td>
          <td>USD</td>
          <td>22</td>
          <td>4400</td>          
          <td><a href='index.php?act=2&id=10&pin=Mouse&kel=12&cur=USD&jum=22&tot=4400'><span class='glyphicon glyphicon-pencil'></span></a></td>
          <td><a href='index.php?act=3&id=10&pin=Mouse&kel=12&cur=USD&jum=22&tot=4400'><span class='glyphicon glyphicon-remove'></span></a></td>
        </tr>
        <tr>
          <td><input type="checkbox" class="flat" name="table_records"></td>
          <td>11</td>
          <td>10</td>
          <td>Keyboard</td>
          <td>SGD</td>
          <td>20</td>
          <td>10000</td>          
          <td><a href='index.php?act=2&id=11&pin=Keyboard&kel=10&cur=USD&jum=20&tot=10000'><span class='glyphicon glyphicon-pencil'></span></a></td>
          <td><a href='index.php?act=3&id=11&pin=Keyboard&kel=10&cur=USD&jum=20&tot=10000'><span class='glyphicon glyphicon-remove'></span></a></td>
        </tr>
        <tr>
          <td><input type="checkbox" class="flat" name="table_records"></td>
          <td>12</td>
          <td>15</td>
          <td>Mouse</td>
          <td>USD</td>
          <td>200</td>
          <td>40000</td>          
          <td><a href='index.php?act=2&id=12&pin=Mouse&kel=15&cur=USD&jum=200&tot=40000'><span class='glyphicon glyphicon-pencil'></span></a></td>
          <td><a href='index.php?act=3&id=12&pin=Mouse&kel=15&cur=USD&jum=200&tot=40000'><span class='glyphicon glyphicon-remove'></span></a></td>
        </tr>
        <tr>
          <td><input type="checkbox" class="flat" name="table_records"></td>
          <td>13</td>
          <td>11</td>
          <td>Laptop</td>
          <td>USD</td>
          <td>30</td>
          <td>90000</td>          
          <td><a href='index.php?act=2&id=13&pin=Laptop&kel=11&cur=USD&jum=30&tot=90000'><span class='glyphicon glyphicon-pencil'></span></a></td>
          <td><a href='index.php?act=3&id=13&pin=Laptop&kel=11&cur=USD&jum=30&tot=90000'><span class='glyphicon glyphicon-remove'></span></a></td>
        </tr>
        <tr>
          <td><input type="checkbox" class="flat" name="table_records"></td>
          <td>14</td>
          <td>12</td>
          <td>Mouse</td>
          <td>USD</td>
          <td>23</td>
          <td>4600</td>          
          <td><a href='index.php?act=2&id=14&pin=Mouse&kel=12&cur=USD&jum=23&tot=4600'><span class='glyphicon glyphicon-pencil'></span></a></td>
          <td><a href='index.php?act=3&id=14&pin=Mouse&kel=12cur=USD&jum=23&tot=4600'><span class='glyphicon glyphicon-remove'></span></a></td>
        </tr>
        <tr>
          <td><input type="checkbox" class="flat" name="table_records"></td>
          <td>15</td>
          <td>19</td>
          <td>Keyboard</td>
          <td>SGD</td>
          <td>30</td>
          <td>60000</td>          
          <td><a href='index.php?act=2&id=15&pin=Keyboard&kel=19&cur=USD&jum=30&tot=60000'><span class='glyphicon glyphicon-pencil'></span></a></td>
          <td><a href='index.php?act=3&id=15&pin=Keyboard&kel=19&cur=USD&jum=30&tot=60000'><span class='glyphicon glyphicon-remove'></span></a></td>
        </tr>
        <tr>
          <td><input type="checkbox" class="flat" name="table_records"></td>
          <td>16</td>
          <td>18</td>
          <td>Mouse</td>
          <td>USD</td>
          <td>16</td>
          <td>3200</td>          
          <td><a href='index.php?act=2&id=16&pin=Mouse&kel=18&cur=USD&jum=16&tot=3200'><span class='glyphicon glyphicon-pencil'></span></a></td>
          <td><a href='index.php?act=3&id=16&pin=Mouse&kel=18&cur=USD&jum=16&tot=3200'><span class='glyphicon glyphicon-remove'></span></a></td>
        </tr>
        <tr>
          <td><input type="checkbox" class="flat" name="table_records"></td>
          <td>17</td>
          <td>20</td>
          <td>Mouse</td>
          <td>USD</td>
          <td>25</td>
          <td>5000</td>          
          <td><a href='index.php?act=2&id=17&pin=Mouse&kel=20&cur=USD&jum=25&tot=5000'><span class='glyphicon glyphicon-pencil'></span></a></td>
          <td><a href='index.php?act=3&id=17&pin=Mouse&kel=20&cur=USD&jum=25&tot=5000'><span class='glyphicon glyphicon-remove'></span></a></td>
        </tr>
      </tr>
      <tr>
        <td><input type="checkbox" class="flat" name="table_records"></td>
        <td>18</td>
        <td>21</td>
        <td>Keyboard</td>
        <td>SGD</td>
        <td>40</td>
        <td>20000</td>          
        <td><a href='index.php?act=2&id=18&pin=Keyboard&kel=21&cur=USD&jum=40&tot=20000'><span class='glyphicon glyphicon-pencil'></span></a></td>
        <td><a href='index.php?act=3&id=18&pin=Keyboard&kel=21&cur=USD&jum=40&tot=20000'><span class='glyphicon glyphicon-remove'></span></a></td>
      </tr>
      <tr>
        <td><input type="checkbox" class="flat" name="table_records"></td>
        <td>19</td>
        <td>122</td>
        <td>Mouse</td>
        <td>USD</td>
        <td>100</td>
        <td>10000</td>          
        <td><a href='index.php?act=2&id=19&pin=Mouse&kel=12&cur=USD&jum=100&tot=10000'><span class='glyphicon glyphicon-pencil'></span></a></td>
        <td><a href='index.php?act=3&id=19&pin=Mouse&kel=12&cur=USD&jum=100&tot=10000'><span class='glyphicon glyphicon-remove'></span></a></td>
      </tr>
      <tr>
        <td><input type="checkbox" class="flat" name="table_records"></td>
        <td>20</td>
        <td>16</td>
        <td>Mouse</td>
        <td>USD</td>
        <td>200</td>
        <td>40000</td>          
        <td><a href='index.php?act=2&id=20&pin=Mouse&kel=16&cur=USD&jum=200&tot=40000'><span class='glyphicon glyphicon-pencil'></span></a></td>
        <td><a href='index.php?act=3&id=20&pin=Mouse&kel=16&cur=USD&jum=200&tot=40000'><span class='glyphicon glyphicon-remove'></span></a></td>
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
                  <th>Kelompok</th>
                  <th>Barang</th>
                  <th>Mata Uang</th>
                  <th>Jumlah</th>
                  <th>Total</th>
                </tr>
              </thead>
              <tbody>
                <tr>";
                  if($_GET['act']==2){
                    echo"
                    <td>".$_GET['id']."</td>
                    <td><input type='text' name='kel' value='".$_GET['kel']."'></td>
                    <td><input type='text' name='pin' value='".$_GET['pin']."'></td>
                    <td><input type='text' name='cur' value='".$_GET['cur']."'></td>
                    <td><input type='text' name='jum' value='".$_GET['jum']."'></td>
                    <td><input type='text' name='jum' value='".$_GET['tot']."'></td>
                    ";
                  }else{
                    echo"
                    <td>".$_GET['id']."</td>
                    <td>".$_GET['kel']."</td>
                    <td>".$_GET['pin']."</td>
                    <td>".$_GET['cur']."</td>
                    <td>".$_GET['jum']."</td>
                    <td>".$_GET['tot']."</td>
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

  <?php include "footerpasarbeli.php"; ?>
  <script type="text/javascript">
    $( document ).ready(function() {
      document.getElementById("insert").className += "active";
    });
  </script>