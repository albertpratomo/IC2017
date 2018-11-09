<?php include "headerpasarjual.php"; ?>
<?php 
include "../connect.php";
$result = mysqli_query($con, "SELECT * from desain");



?>
<link href="../css/templateview.css" rel="stylesheet" type="text/css">
<script src="https://use.fontawesome.com/07b0ce5d10.js"></script>

<div id="coba"></div>

<script>
  var statusIntervalId = window.setInterval(showdata, 5000);
  function showdata() {

    $.ajax({
      url: 'test.php',
      type: 'POST',
      async: false,
      data: {
        showdata: 1
      },
      success: function(res)
      {
        $('#coba').html(res);
      }

    });
    
  }
</script>
<?php include "footerpasarjual.php"; ?>
<script type="text/javascript">
  $( document ).ready(function() {
    document.getElementById("view").className += "active";
    showdata();
  });
</script>