<!-- Styles -->
<?php 
include "../connect.php";
$res = mysqli_query($con, "SELECT nama, cash1 from user");

?>
<style>
#chartdiv {
  width: 100%;
  height: 500px;
}               
</style>
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/animate/animate.min.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

<!-- Chart code -->
<script>
/**
 * Define data for each year
 */
var chartData = {
  "1995": [
<?php 
  while($row = mysqli_fetch_row($res)){
    echo '{ "sector": "'.$row[0].'", "size": '.$row[1].' },';
  }
  ?>
    { "sector": "Finance, real estate and business services", "size": <?php echo json_encode($row[1]);?>} ]
};


/**
 * Create the chart
 */
var currentYear = 1995;
var chart = AmCharts.makeChart( "chartdiv", {
  "type": "pie",
  "theme": "light",
  "dataProvider": [],
  "valueField": "size",
  "titleField": "sector",
  "startDuration": 0,
  "innerRadius": 80,
  "pullOutRadius": 20,
  "marginTop": 30,
  "titles": [{
    "text": "TOTAL CASH TIM"
  }],
  "allLabels": [{
    "y": "54%",
    "align": "center",
    "size": 25,
    "bold": true,
    "text": "1995",
    "color": "#555"
  }, {
    "y": "49%",
    "align": "center",
    "size": 15,
    "text": "Periode",
    "color": "#555"
  }],
  "listeners": [ {
    "event": "init",
    "method": function( e ) {
      var chart = e.chart;

      function getCurrentData() {
        var data = chartData[currentYear];
        if (currentYear > 2014)
          currentYear = 1995;
        return data;
      }

      function loop() {
        chart.allLabels[0].text = 1;
        var data = getCurrentData();
        chart.animateData( data, {
          duration: 1000,
          complete: function() {
            setTimeout( loop, 3000 );
          }
        } );
      }

      loop();
    }
  } ],
   "export": {
   "enabled": true
  }
} );
</script>

<?php if(isset($_POST['showdata'])){ echo '<div id="chartdiv"></div>';} ?>