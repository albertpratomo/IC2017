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
    <div class="form-group">
      <label for="select" class="col-sm-2 control-label">Kelompok</label>
      <div class="col-sm-10">
        <select class="form-control" id="select">
          <option>1</option>
          <option>2</option>
          <option>3</option>
          <option>4</option>
          <option>5</option>
        </select>
      </div>
    </div>
    <div class="form-group">
      <label for="select" class="col-sm-2 control-label">Barang</label>
      <div class="col-sm-10">
        <select class="form-control" id="select">
          <option>Laptop</option>
          <option>Laptop</option>
          <option>Laptop</option>
          <option>Laptop</option>
          <option>Laptop</option>
        </select>
      </div>
    </div>
    
    <div class="form-group">
      <label for="inputPassword" class="col-sm-2 control-label">Jumlah</label>
      <div class="col-sm-10">
        <input class="form-control" id="jumlah" oninput="changeJumlah2(this.value),changeTotal(this.value)" type="text">
      </div>
      <!-- <div class="col-sm-2 col-sm-offset-2">
        <button type="button">&laquo;</button>
      </div> -->
      <div class="col-sm-10 col-sm-offset-2" style="margin-top:5%;">
        <input oninput="changeJumlah(this.value), changeTotal(this.value)" type="range" id="jumlah2" name="slideBlue" min="0" max="255">
      </div>

       <!-- <div class="col-sm-2 pull-right">
        <button type="button">&raquo;</button>
      </div>
 --></div>
    <div class="form-group">
      <label class="col-sm-2 control-label">Mata Uang</label>
      <div id="uang">
        <div class="col-sm-3">
          <div class="radio">
            <label>
              <input id="IDR" name="uang" onchange="changeTotal2()"  value="a" checked="" type="radio">
              IDR
            </label>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="radio">
            <label>
              <input id="USD" name="uang" onchange="changeTotal2()" value="b" type="radio">
              USD
            </label>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="radio">
            <label>
              <input id="SGD" name="uang" onchange="changeTotal2()"  value="c"  type="radio">
              SGD
            </label>
          </div>
        </div>
        </div>
    </div>
      <div class="form-group">
      <label for="Total" class="col-sm-2 control-label">Total</label>
      <div class="col-sm-10">
        <input class="form-control" id="total"  type="text" readonly>
      </div>
    </div>
    
    <div class="form-group">
      <div class="col-sm-10 col-sm-offset-2">
        <button type="reset" class="btn btn-default">Cancel</button>
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
    </div>
  </fieldset>
</form>
</div>
</div>

<?php include "footerpasarbeli.php"; ?>
<script type="text/javascript">
	$( document ).ready(function() {
		document.getElementById("insert").className += "active";
	});
</script>