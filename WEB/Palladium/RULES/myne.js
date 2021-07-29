function assess() {
   document.getElementById("IQ_7or8").style.display = "none";
   document.getElementById("IQ_5or6").style.display = "none";
   document.getElementById("IQ_3or4").style.display = "none";
   document.getElementById("IQ_1or2").style.display = "none";
   
   document.getElementById("MA_1or7").style.display = "none";
   document.getElementById("MA_5or7").style.display = "none";
   document.getElementById("MA_3or4").style.display = "none";
   document.getElementById("MA_1or2").style.display = "none";

   document.getElementById("ME_1or7").style.display = "none";
   document.getElementById("ME_5or7").style.display = "none";
   document.getElementById("ME_3or4").style.display = "none";
   document.getElementById("ME_1or2").style.display = "none";

   document.getElementById("PS_1or7").style.display = "none";
   document.getElementById("PS_5or7").style.display = "none";
   document.getElementById("PS_3or4").style.display = "none";
   document.getElementById("PS_1or2").style.display = "none";

   document.getElementById("PP_1or7").style.display = "none";
   document.getElementById("PP_5or7").style.display = "none";
   document.getElementById("PP_3or4").style.display = "none";
   document.getElementById("PP_1or2").style.display = "none";

   document.getElementById("PE_1or7").style.display = "none";
   document.getElementById("PE_5or7").style.display = "none";
   document.getElementById("PE_3or4").style.display = "none";
   document.getElementById("PE_1or2").style.display = "none";

   document.getElementById("PB_5or7").style.display = "none";
   document.getElementById("PB_3or4").style.display = "none";
   document.getElementById("PB_1or2").style.display = "none";

   document.getElementById("Spd_1or6").style.display = "none";


   var showAttrbBonus = 0;


   var X = parseInt(document.getElementById("IQ").value);
   if (X >= 16) showAttrbBonus = 1;
   if ((X == 7) | (X == 8)) document.getElementById("IQ_7or8").style.display = "";
   if ((X == 5) | (X == 6)) document.getElementById("IQ_5or6").style.display = "";
   if ((X == 3) | (X == 4)) document.getElementById("IQ_3or4").style.display = "";
   if ((X == 1) | (X == 2)) document.getElementById("IQ_1or2").style.display = "";
   
   X = parseInt(document.getElementById("MA").value);
   if (X >= 16) showAttrbBonus = 1;
   if ((X >= 1) & (X <= 7)) document.getElementById("MA_1or7").style.display = "";
   if ((X >= 5) & (X <= 7)) document.getElementById("MA_5or7").style.display = "";
   if ((X == 3) | (X == 4)) document.getElementById("MA_3or4").style.display = "";
   if ((X == 1) | (X == 2)) document.getElementById("MA_1or2").style.display = "";
   
   X = parseInt(document.getElementById("ME").value);
   if (X >= 16) showAttrbBonus = 1;
   if ((X >= 1) & (X <= 7)) document.getElementById("ME_1or7").style.display = "";
   if ((X >= 5) & (X <= 7)) document.getElementById("ME_5or7").style.display = "";
   if ((X == 3) | (X == 4)) document.getElementById("ME_3or4").style.display = "";
   if ((X == 1) | (X == 2)) document.getElementById("ME_1or2").style.display = "";

   X = parseInt(document.getElementById("PS").value);
   if (X >= 16) showAttrbBonus = 1;
   if ((X >= 1) & (X <= 7)) document.getElementById("PS_1or7").style.display = "";
   if ((X >= 5) & (X <= 7)) document.getElementById("PS_5or7").style.display = "";
   if ((X == 3) | (X == 4)) document.getElementById("PS_3or4").style.display = "";
   if ((X == 1) | (X == 2)) document.getElementById("PS_1or2").style.display = "";

   X = parseInt(document.getElementById("PP").value);
   if (X >= 16) showAttrbBonus = 1;
   if ((X >= 1) & (X <= 7)) document.getElementById("PP_1or7").style.display = "";
   if ((X >= 5) & (X <= 7)) document.getElementById("PP_5or7").style.display = "";
   if ((X == 3) | (X == 4)) document.getElementById("PP_3or4").style.display = "";
   if ((X == 1) | (X == 2)) document.getElementById("PP_1or2").style.display = "";
   
   X = parseInt(document.getElementById("PE").value);
   if (X >= 16) showAttrbBonus = 1;
   if ((X >= 1) & (X <= 7)) document.getElementById("PE_1or7").style.display = "";
   if ((X >= 5) & (X <= 7)) document.getElementById("PE_5or7").style.display = "";
   if ((X == 3) | (X == 4)) document.getElementById("PE_3or4").style.display = "";
   if ((X == 1) | (X == 2)) document.getElementById("PE_1or2").style.display = "";
   
   X = parseInt(document.getElementById("PB").value);
   if (X >= 16) showAttrbBonus = 1;
   if ((X >= 5) & (X <= 7)) document.getElementById("PB_5or7").style.display = "";
   if ((X == 3) | (X == 4)) document.getElementById("PB_3or4").style.display = "";
   if ((X == 1) | (X == 2)) document.getElementById("PB_1or2").style.display = "";

   X = parseInt(document.getElementById("Spd").value);
   if ((X >= 1) & (X <= 6)) document.getElementById("Spd_1or6").style.display = "";

   // document.getElementById("placeholder").innerHTML = X;
   if (showAttrbBonus) {
      document.getElementById("AttBonCha").style.display = "";
      document.getElementById("AttriBonus").innerHTML = "<li>fish</li>";
      document.getElementById("AttriBonus").innerHTML += "<li>monger</li>";
}
}
	
