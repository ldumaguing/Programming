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
      foreach ($output as $o) {
		  echo $o;
	  }
      ?>
   </canvas>

</body>
</html>

<script type="text/javascript">
setInterval(fish, 1000);

function fish() {
	location.reload();
}
	
	
function pageLoaded() {
   var canvas01 = document.getElementById("canvas01");
   var context = canvas01.getContext("2d");
   <?php
 $output1 = null;
      $retval1 = null;
      exec('bin/php_drawImage 142', $output1, $retval1);
      foreach ($output1 as $o1) {
		  echo $o1;
		  echo "\n";
	  }
	  ?>
}
</script>

