<script src="../js/bootstrap.min.js"></script>
<!-- Bootstrap Toggle -->
<script src="../vendors/bootstrap-toggle-master/js/bootstrap-toggle.min.js"></script>
<!-- Bootstrap Select -->
<script src="../js/bootstrap-select.js"></script>

<!-- Datatables -->
<script src="../vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="../vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="../vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="../vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
<script src="../vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="../vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="../vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="../vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
<script src="../vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script src="../vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="../vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
<script src="../vendors/datatables.net-scroller/js/datatables.scroller.min.js"></script>

<!-- iCheck -->
<script src="../vendors/iCheck/icheck.min.js"></script>

<script type="text/javascript">
//iCheck
$(document).ready(function() {
  if ($("input.flat")[0]) {
    $(document).ready(function () {
      $('input.flat').iCheck({
        checkboxClass: 'icheckbox_flat-green',
        radioClass: 'iradio_flat-green'
      });
    });
  }
});
</script>

<!-- Datatables -->
<script>
  $(document).ready(function() {

    $('#datatable').dataTable( {
      "order": [[ 0, 'desc' ]]
    } );
  });
</script>
<!-- /Datatables -->

</body>
</html>