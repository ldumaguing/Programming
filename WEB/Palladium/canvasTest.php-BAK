<!DOCTYPE html>
<html>
<head>
   <title>Canvas Test</title>
</head>
<body onload="pageLoaded();">
   <canvas width="1600" height="900" id="canvas01" style="border: 1px solid black;">
      <?php
      $output = null;
      $retval = null;
      exec('bin/php_img', $output, $retval);
      print($output[0]);
      ?>
   </canvas>

</body>
</html>

<script type="text/javascript">
function pageLoaded() {
   var canvas01 = document.getElementById("canvas01");
   var context = canvas01.getContext("2d");

   context.drawImage(document.getElementById("Moe"), <?php echo "130, 30"; ?>);
   context.drawImage(document.getElementById("Curly"), <?php echo "100, 160"; ?>);
}
</script>

