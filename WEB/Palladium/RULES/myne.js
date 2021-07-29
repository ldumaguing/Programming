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


   var X1 = parseInt(document.getElementById("IQ").value);
   if (X1 >= 16) showAttrbBonus = 1;
   if ((X1 == 7) | (X1 == 8)) document.getElementById("IQ_7or8").style.display = "";
   if ((X1 == 5) | (X1 == 6)) document.getElementById("IQ_5or6").style.display = "";
   if ((X1 == 3) | (X1 == 4)) document.getElementById("IQ_3or4").style.display = "";
   if ((X1 == 1) | (X1 == 2)) document.getElementById("IQ_1or2").style.display = "";
   
   var X2 = parseInt(document.getElementById("MA").value);
   if (X2 >= 16) showAttrbBonus = 1;
   if ((X2 >= 1) & (X2 <= 7)) document.getElementById("MA_1or7").style.display = "";
   if ((X2 >= 5) & (X2 <= 7)) document.getElementById("MA_5or7").style.display = "";
   if ((X2 == 3) | (X2 == 4)) document.getElementById("MA_3or4").style.display = "";
   if ((X2 == 1) | (X2 == 2)) document.getElementById("MA_1or2").style.display = "";
   
   var X3 = parseInt(document.getElementById("ME").value);
   if (X3 >= 16) showAttrbBonus = 1;
   if ((X3 >= 1) & (X3 <= 7)) document.getElementById("ME_1or7").style.display = "";
   if ((X3 >= 5) & (X3 <= 7)) document.getElementById("ME_5or7").style.display = "";
   if ((X3 == 3) | (X3 == 4)) document.getElementById("ME_3or4").style.display = "";
   if ((X3 == 1) | (X3 == 2)) document.getElementById("ME_1or2").style.display = "";

   var X4 = parseInt(document.getElementById("PS").value);
   if (X4 >= 16) showAttrbBonus = 1;
   if ((X4 >= 1) & (X4 <= 7)) document.getElementById("PS_1or7").style.display = "";
   if ((X4 >= 5) & (X4 <= 7)) document.getElementById("PS_5or7").style.display = "";
   if ((X4 == 3) | (X4 == 4)) document.getElementById("PS_3or4").style.display = "";
   if ((X4 == 1) | (X4 == 2)) document.getElementById("PS_1or2").style.display = "";

   var X5 = parseInt(document.getElementById("PP").value);
   if (X5 >= 16) showAttrbBonus = 1;
   if ((X5 >= 1) & (X5 <= 7)) document.getElementById("PP_1or7").style.display = "";
   if ((X5 >= 5) & (X5 <= 7)) document.getElementById("PP_5or7").style.display = "";
   if ((X5 == 3) | (X5 == 4)) document.getElementById("PP_3or4").style.display = "";
   if ((X5 == 1) | (X5 == 2)) document.getElementById("PP_1or2").style.display = "";
   
   var X6 = parseInt(document.getElementById("PE").value);
   if (X6 >= 16) showAttrbBonus = 1;
   if ((X6 >= 1) & (X6 <= 7)) document.getElementById("PE_1or7").style.display = "";
   if ((X6 >= 5) & (X6 <= 7)) document.getElementById("PE_5or7").style.display = "";
   if ((X6 == 3) | (X6 == 4)) document.getElementById("PE_3or4").style.display = "";
   if ((X6 == 1) | (X6 == 2)) document.getElementById("PE_1or2").style.display = "";
   
   var X7 = parseInt(document.getElementById("PB").value);
   if (X7 >= 16) showAttrbBonus = 1;
   if ((X7 >= 5) & (X7 <= 7)) document.getElementById("PB_5or7").style.display = "";
   if ((X7 == 3) | (X7 == 4)) document.getElementById("PB_3or4").style.display = "";
   if ((X7 == 1) | (X7 == 2)) document.getElementById("PB_1or2").style.display = "";

   var X8 = parseInt(document.getElementById("Spd").value);
   if ((X8 >= 1) & (X8 <= 6)) document.getElementById("Spd_1or6").style.display = "";

   if (showAttrbBonus) {
      document.getElementById("AttBonCha").style.display = "";
      document.getElementById("AttriBonus").innerHTML = "";
      if ((X1 >= 16) & (X1 <= 30)) {
         let bonus = X1 - 14;
         document.getElementById("AttriBonus").innerHTML += "<li>+" 
         + bonus + "% to all skills</li>";
      }
      if ((X3 >= 16) & (X3 <= 30)) {
         let b1 = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8];
         let b2 = [1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
         let bonus = X3 - 16;
         document.getElementById("AttriBonus").innerHTML += "<li>+"
         + b1[bonus] + " save vs. psionic attack</li>";
         document.getElementById("AttriBonus").innerHTML += "<li>+"
         + b2[bonus] + " save vs. insanity</li>";
      }
      if ((X2 >= 16) & (X2 <= 30)) {
         let bonuses = [40, 45, 50, 55, 60, 65, 70, 75, 80, 84, 88, 92, 94, 96, 97];
         let bonus = X2 - 16;
         document.getElementById("AttriBonus").innerHTML += "<li>"
         + bonuses[bonus] + "% trust/intimidate</li>";
	  }
      if ((X4 >= 16) & (X4 <= 30)) {
         let bonus = X4 - 15;
         document.getElementById("AttriBonus").innerHTML += "<li>+"
         + bonus + " Hand to Hand combat damage</li>";
      }
      if ((X5 >= 16) & (X5 <= 30)) {
         let b1 = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8];
         let bonus = X5 - 16;
         document.getElementById("AttriBonus").innerHTML += "<li>+"
         + b1[bonus] + " strike, parry, and dodge</li>";
      }
      if ((X6 >= 16) & (X6 <= 30)) {
         let b1 = [4, 5, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30];
         let b2 = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8];
         let bonus = X6 - 16;
         document.getElementById("AttriBonus").innerHTML += "<li>+"
         + b1[bonus] + "% save vs. coma/death</li>";
         document.getElementById("AttriBonus").innerHTML += "<li>+"
         + b2[bonus] + " save vs. magic/poison</li>";
      }









   }
}
	
