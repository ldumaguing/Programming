function assess() {
   document.getElementById("IQ_7or8").style.display = "none";
   document.getElementById("IQ_5or6").style.display = "none";
   document.getElementById("IQ_3or4").style.display = "none";
   document.getElementById("IQ_1or2").style.display = "none";
   document.getElementById("IQ_1630").style.display = "none";
   
   document.getElementById("MA_1or7").style.display = "none";
   document.getElementById("MA_5or7").style.display = "none";
   document.getElementById("MA_3or4").style.display = "none";
   document.getElementById("MA_1or2").style.display = "none";
   document.getElementById("MA_1630").style.display = "none";

   document.getElementById("ME_1or7").style.display = "none";
   document.getElementById("ME_5or7").style.display = "none";
   document.getElementById("ME_3or4").style.display = "none";
   document.getElementById("ME_1or2").style.display = "none";
   document.getElementById("ME_1630").style.display = "none";

   document.getElementById("PS_1or7").style.display = "none";
   document.getElementById("PS_5or7").style.display = "none";
   document.getElementById("PS_3or4").style.display = "none";
   document.getElementById("PS_1or2").style.display = "none";
   document.getElementById("PS_1630").style.display = "none";

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

   document.getElementById("Spd_6").style.display = "none";

   var X = parseInt(document.getElementById("IQ").value);
   if ((X == 7) | (X == 8)) document.getElementById("IQ_7or8").style.display = "";
   if ((X == 5) | (X == 6)) document.getElementById("IQ_5or6").style.display = "";
   if ((X == 3) | (X == 4)) document.getElementById("IQ_3or4").style.display = "";
   if ((X == 1) | (X == 2)) document.getElementById("IQ_1or2").style.display = "";
   if ((X >= 16) & (X <= 30)) {
      document.getElementById("IQ_1630").style.display = "";
      let Y = X - 14;
      document.getElementById("IQ_1630txt").innerHTML = "+" + Y + "% to all skills.";
   }
   
   X = parseInt(document.getElementById("MA").value);
   if ((X >= 1) & (X <= 7)) document.getElementById("MA_1or7").style.display = "";
   if ((X >= 5) & (X <= 7)) document.getElementById("MA_5or7").style.display = "";
   if ((X == 3) | (X == 4)) document.getElementById("MA_3or4").style.display = "";
   if ((X == 1) | (X == 2)) document.getElementById("MA_1or2").style.display = "";
   
   if ((X >= 16) & (X <= 30)) {
      document.getElementById("MA_1630").style.display = "";
      let scores = [40,45,50,55,60,65,70,75,80,84,88,92,94,96,97];
      let Y = X - 16;
      document.getElementById("MA_1630txt").innerHTML = scores[Y] + "% trust/intimidate";
   }
   
   X = parseInt(document.getElementById("ME").value);
   if ((X >= 1) & (X <= 7)) document.getElementById("ME_1or7").style.display = "";
   if ((X >= 5) & (X <= 7)) document.getElementById("ME_5or7").style.display = "";
   if ((X == 3) | (X == 4)) document.getElementById("ME_3or4").style.display = "";
   if ((X == 1) | (X == 2)) document.getElementById("ME_1or2").style.display = "";
   if ((X >= 16) & (X <= 30)) {
      document.getElementById("ME_1630").style.display = "";
      let score1 = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8];
      let score2 = [1,1,2,2,3,4,5,6,7,8,9,10,11,12,13];
      let Y = X - 16;
      document.getElementById("ME_1630a").innerHTML = "+" + score1[Y] + " to save vs. psionic attack";
      document.getElementById("ME_1630b").innerHTML = "+" + score2[Y] + " to save vs. insanity";
   }

   X = parseInt(document.getElementById("PS").value);
   if ((X >= 1) & (X <= 7)) document.getElementById("PS_1or7").style.display = "";
   if ((X >= 5) & (X <= 7)) document.getElementById("PS_5or7").style.display = "";
   if ((X == 3) | (X == 4)) document.getElementById("PS_3or4").style.display = "";
   if ((X == 1) | (X == 2)) document.getElementById("PS_1or2").style.display = "";
   if ((X >= 16) & (X <= 30)) {
      document.getElementById("PS_1630").style.display = "";
      let Y = X - 15;
      document.getElementById("PS_1630txt").innerHTML = "+" + Y + " Hand to Hand combat damage";
   }
  
   X = parseInt(document.getElementById("PP").value);
   if ((X >= 1) & (X <= 7)) document.getElementById("PP_1or7").style.display = "";
   if ((X >= 5) & (X <= 7)) document.getElementById("PP_5or7").style.display = "";
   if ((X == 3) | (X == 4)) document.getElementById("PP_3or4").style.display = "";
   if ((X == 1) | (X == 2)) document.getElementById("PP_1or2").style.display = "";
   
   X = parseInt(document.getElementById("PE").value);
   if ((X >= 1) & (X <= 7)) document.getElementById("PE_1or7").style.display = "";
   if ((X >= 5) & (X <= 7)) document.getElementById("PE_5or7").style.display = "";
   if ((X == 3) | (X == 4)) document.getElementById("PE_3or4").style.display = "";
   if ((X == 1) | (X == 2)) document.getElementById("PE_1or2").style.display = "";
   
   X = parseInt(document.getElementById("PB").value);
   if ((X >= 5) & (X <= 7)) document.getElementById("PB_5or7").style.display = "";
   if ((X == 3) | (X == 4)) document.getElementById("PB_3or4").style.display = "";
   if ((X == 1) | (X == 2)) document.getElementById("PB_1or2").style.display = "";

   X = parseInt(document.getElementById("Spd").value);
   if (X <= 6) document.getElementById("Spd_6").style.display = "";


   
   
   // document.getElementById("placeholder").innerHTML = X;
}
	
