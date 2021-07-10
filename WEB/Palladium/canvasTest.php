<!DOCTYPE html>
<html>
<head>
   <title>Canvas Test</title>
</head>
<body onload="pageLoaded();">
   <canvas width="1600" height="900" id="canvas01" style="border: 1px solid black;">
      <img src="images/Bank.png" id="0001">
      <img src="images/Jimmy.png" id="0002">
      <img src="images/Nick.png" id="0003">
      <img src="images/Z1.png" id="0004">
      <img src="images/Z2.png" id="0005">
   </canvas>
   <?php
   $output = null;
   $retval = null;
   exec('bin/createHuman', $output, $retval);
   print($output[2]);
   ?>
</body>
</html>

<script type="text/javascript">
function pageLoaded() {
   var canvas01 = document.getElementById("canvas01");
   var context = canvas01.getContext("2d");

   var X;
   X = document.getElementById("0001");
   context.drawImage(X, <?php echo "30, 30"; ?>);
   X = document.getElementById("0002");
   context.drawImage(X, <?php echo "100, 160"; ?>);
}
</script>

