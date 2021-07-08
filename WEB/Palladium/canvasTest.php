<!DOCTYPE html>
<html>
<head>
   <title>Canvas Test</title>
</head>
<body onload="pageLoaded();">
   <canvas width="1600" height="900" id="canvas01" style="border: 1px solid black;">
      <img src="images/Bank.png" id="u0001">
   </canvas>
</body>
</html>

<script type="text/javascript">
function pageLoaded() {
   var canvas01 = document.getElementById("canvas01");
   var context = canvas01.getContext("2d");

   var u0001 = document.getElementById("u0001");
   context.drawImage(u0001, <?php echo "30, 30";  ?>);
}
</script>

