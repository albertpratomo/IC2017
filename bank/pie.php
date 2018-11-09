

<?php include "headerbank.php"; ?>
<div id="coba1"></div>
<script>
  showdata();

  var statusIntervalId = window.setInterval(showdata, 5000);
  
  function showdata(){

    $.ajax({
      url: 'testpie.php',
      type: 'POST',
      async: false,
      data: {
        showdata: 1
      },
      success: function(res)
      {
        $('#coba1').html(res);
      }
    });
  }
</script>