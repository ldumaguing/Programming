function assess() {
   document.getElementById("IQ_7or8").style.display = "none";
   document.getElementById("IQ_5or6").style.display = "none";
   document.getElementById("IQ_3or4").style.display = "none";
   document.getElementById("IQ_1or2").style.display = "none";
   document.getElementById("MA_1or7").style.display = "none";
   document.getElementById("MA_5or7").style.display = "none";
   document.getElementById("MA_3or4").style.display = "none";
   document.getElementById("MA_1or2").style.display = "none";

   var X = parseInt(document.getElementById("IQ").value);
   if ((X == 7) | (X == 8)) document.getElementById("IQ_7or8").style.display = "";
   if ((X == 5) | (X == 6)) document.getElementById("IQ_5or6").style.display = "";
   if ((X == 3) | (X == 4)) document.getElementById("IQ_3or4").style.display = "";
   if ((X == 1) | (X == 2)) document.getElementById("IQ_1or2").style.display = "";
   
   X = parseInt(document.getElementById("MA").value);
   if ((X >= 1) & (X <= 7)) document.getElementById("MA_1or7").style.display = "";
   if ((X >= 5) & (X <= 7)) document.getElementById("MA_5or7").style.display = "";
   if ((X == 3) | (X == 4)) document.getElementById("MA_3or4").style.display = "";
   if ((X == 1) | (X == 2)) document.getElementById("MA_1or2").style.display = "";
   
   
   
   // document.getElementById("placeholder").innerHTML = X;
}
	
