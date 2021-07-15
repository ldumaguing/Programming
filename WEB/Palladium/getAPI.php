<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Palladium</title>
	</head>
	<body>
<script>
fetch("http://localhost/WEB/Palladium/generateAPI.php")
   .then( response => response.json() )
   .then( json => console.log(json) )
   .catch( e => console.log(e.message) );
</script>
	</body>
</html>
