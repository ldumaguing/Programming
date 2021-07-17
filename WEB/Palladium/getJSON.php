<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Palladium</title>
	</head>
	<body>
<script>
fetch("http://localhost/WEB/Palladium/generateJSON.php")
   .then( response => response.json() )
   .then( json => foo(json) )
   .catch( e => console.log(e.message) );

function foo(X) {
   console.log(X);
   var Y = document.getElementById("fish");
   Y.innerHTML = X[0][0];
}



</script>

<div id="fish"></div>
	</body>
</html>
