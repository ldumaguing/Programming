function assess() {
   var STRtype = document.getElementById("strTypes").value;

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

   document.getElementById("AttBonCha").style.display = "none";
   document.getElementById("AttriBonus").innerHTML = "";  


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
   var lbs = X4 * 10;
   if (X4 < 17) {
      document.getElementById("LiftCarry").innerHTML = "<b>Lift and Carry: </b>"
      + lbs + " lbs.";
   } else {
	   lbs = X4 * 20;
      document.getElementById("LiftCarry").innerHTML = "<b>Lift and Carry: </b>"
      + lbs + " lbs.";
      if (X4 > 30) {
         let b1 = Math.floor((X4 - 30) / 5);
         let b2 = ((b1 * 30) / 100) + 1;
         document.getElementById("LiftCarry").innerHTML = "<b>Lift and Carry: </b>" + (lbs * b2) + " lbs.";
      }
   }
   document.getElementById("StrType").innerHTML = "";
   if ((STRtype == 'augmented') & (X4 >= 24)) {
      document.getElementById("StrType").innerHTML += "<h2>Augmented Strength</h2>";
      let StrTypeList = "<ul>";
      if (X4 == 24)
         StrTypeList += "<li>Inflicts 1 point of Mega-Damage when deliv­ered as a Power Punch or Power Kick; counts as 2 melee attacks.</li>";
	  if ((X4 >= 25) & (X4 <= 27))
	     StrTypeList += "<li>Inflicts 1D4 M.D. with a Power Punch or Power Kick; counts as 2 melee attacks.</li>";
	  if ((X4 >= 28) & (X4 <= 30))
	     StrTypeList += "<li>Inflicts 1D6 M.D. with a Power Punch or Power Kick; counts as 2 melee attacks.</li>";
      if ((X4 >= 31) & (X4 <= 40))
	     StrTypeList += "<li>Inflicts 2D4 M.D. with a Power Punch or Power Kick; counts as 2 melee attacks.</li>";
	  if ((X4 >= 41) & (X4 <= 50)) {
		 StrTypeList += "<li>Inflicts 3D6 S.D.C. <i>plus</i> P.S. damage bonus on a restrained punch.</li>";
		 StrTypeList += "<li>1D4 M.D. on a full punch.</li>";
		 StrTypeList += "<li>3D4 M.D. with a power punch or power kick.</li>";
      }
	  if (X4 > 50) {
		 StrTypeList += "<li>Inflicts 4D6 S.D.C. <i>plus</i> P.S. damage bonus on a restrained punch.</li>";
		 StrTypeList += "<li>1D8 M.D. on a full punch.</li>";
		 StrTypeList += "<li>4D4 M.D. with a power punch or power kick.</li>";
      }
	     
      StrTypeList += "</ul>";
      document.getElementById("StrType").innerHTML += StrTypeList;
   }
   if (STRtype == 'robot') {
      document.getElementById("StrType").innerHTML += "<h2>Robot Strength</h2>";
      let StrTypeList = "<ul>";
      if (X4 <= 15) {
         StrTypeList += "<li>Inflicts 1D6 S.D.C. <i>plus</i> P.S. damage bonus on a restrained punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Inflicts 2D6 S.D.C. <i>plus</i> P.S. damage bonus on a full strength punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>4D6 S.D.C. <i>plus</i> P.S. damage bonus on a power punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Kicks do 2D6 S.D.C.</li>";
         StrTypeList += "<li>Leap Kicks 3D6 S.D.C.</li>";
      }
      if ((X4 >= 16) & (X4 <= 20)){
         StrTypeList += "<li>Inflicts 2D6 S.D.C. <i>plus</i> P.S. damage bonus on a restrained punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Inflicts 1 M.D. on a full strength punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>1D6 M.D. on a power punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Kicks do 1D4 M.D.; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Leap Kicks 2D4 M.D.; counts as 2 melee attacks.</li>";
      }
      if ((X4 >= 21) & (X4 <= 25)){
         StrTypeList += "<li>Inflicts 6D6 S.D.C. <i>plus</i> P.S. damage bonus on a restrained punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Inflicts 1D4 M.D. on a full strength punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>2D4 M.D. on a power punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Kicks do 1D6 M.D.; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Leap Kicks 2D6 M.D.; counts as 2 melee attacks.</li>";
      }
      if ((X4 >= 26) & (X4 <= 30)){
         StrTypeList += "<li>Inflicts 1D4 M.D. on a restrained punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Inflicts 1D6 M.D. on a full strength punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>2D6 M.D. on a power punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Kicks do 2D4 M.D.; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Leap Kicks 2D8 M.D.; counts as 2 melee attacks.</li>";
      }
      if ((X4 >= 31) & (X4 <= 35)){
         StrTypeList += "<li>Inflicts 1D4 M.D. on a restrained punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Inflicts 2D4 M.D. on a full strength punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>4D4 M.D. on a power punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Kicks do 2D8 M.D.; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Leap Kicks 4D8 M.D.; counts as 2 melee attacks.</li>";
      }
      if ((X4 >= 36) & (X4 <= 40)){
         StrTypeList += "<li>Inflicts 1D4 M.D. on a restrained punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Inflicts 2D4 M.D. on a full strength punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>4D6 M.D. on a power punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Kicks do 3D8 M.D.; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Leap Kicks 5D8 M.D.; counts as 2 melee attacks.</li>";
      }
      if ((X4 >= 41) & (X4 <= 50)){
         StrTypeList += "<li>Inflicts 1D6 M.D. on a restrained punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Inflicts 3D6 M.D. on a full strength punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>1D6x10 M.D. on a power punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Kicks do 5D8 M.D.; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Leap Kicks 1D8x10 M.D.; counts as 2 melee attacks.</li>";
      }
      if ((X4 >= 51) & (X4 <= 60)){
         StrTypeList += "<li>Inflicts 2D6 M.D. on a restrained punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Inflicts 6D6 M.D. on a full strength punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>2D6x10 M.D. on a power punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Kicks do 6D8 M.D.; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Leap Kicks 2D6x10 M.D.; counts as 2 melee attacks.</li>";
      }
      if (X4 > 60){
         StrTypeList += "<li>Robot strength of 60 is the limit.</li>";
      }

      StrTypeList += "</ul>";
      document.getElementById("StrType").innerHTML += StrTypeList;
   }
   if (STRtype == 'supernatural') {
      document.getElementById("StrType").innerHTML += "<h2>Supernatural Strength</h2>";
      let StrTypeList = "<ul>";
      if (X4 <= 15) {
         StrTypeList += "<li>Inflicts 1D6 S.D.C. <i>plus</i> P.S. damage bonus on a restrained punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Inflicts 4D6 S.D.C. <i>plus</i> P.S. damage bonus on a full strength punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>1D4 M.D. on a power punch; counts as 2 melee attacks.</li>";
      }
      if ((X4 >= 16) & (X4 <= 20)){
         StrTypeList += "<li>Inflicts 3D6 S.D.C. <i>plus</i> P.S. damage bonus on a restrained punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Inflicts 1D6 M.D. on a full strength punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>2D6 M.D. on a power punch; counts as 2 melee attacks.</li>";
      }
      if ((X4 >= 21) & (X4 <= 25)){
         StrTypeList += "<li>Inflicts 4D6 S.D.C. <i>plus</i> P.S. damage bonus on a restrained punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Inflicts 2D6 M.D. on a full strength punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>4D6 M.D. on a power punch; counts as 2 melee attacks.</li>";
      }
      if ((X4 >= 26) & (X4 <= 30)){
         StrTypeList += "<li>Inflicts 5D6 S.D.C. <i>plus</i> P.S. damage bonus on a restrained punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Inflicts 3D6 M.D. on a full strength punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>6D6 M.D. on a power punch; counts as 2 melee attacks.</li>";
      }
      if ((X4 >= 31) & (X4 <= 35)){
         StrTypeList += "<li>Inflicts 5D6 S.D.C. <i>plus</i> P.S. damage bonus on a restrained punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Inflicts 4D6 M.D. on a full strength punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>1D4x10 M.D. on a power punch; counts as 2 melee attacks.</li>";
      }
      if ((X4 >= 36) & (X4 <= 40)){
         StrTypeList += "<li>Inflicts 6D6 S.D.C. <i>plus</i> P.S. damage bonus on a restrained punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Inflicts 5D6 M.D. on a full strength punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>1D6x10 M.D. on a power punch; counts as 2 melee attacks.</li>";
      }
      if ((X4 >= 41) & (X4 <= 50)){
         StrTypeList += "<li>Inflicts 1D6x10 S.D.C. <i>plus</i> P.S. damage bonus on a restrained punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Inflicts 6D6 M.D. on a full strength punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>2D4x10 M.D. on a power punch; counts as 2 melee attacks.</li>";
      }
      if ((X4 >= 51) & (X4 <= 60)){
         StrTypeList += "<li>Inflicts 1D6 M.D. on a restrained punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>Inflicts 1D6x10 M.D. on a full strength punch; counts as 2 melee attacks.</li>";
         StrTypeList += "<li>2D6x10 M.D. on a power punch; counts as 2 melee attacks.</li>";
      }
      if (X4 > 60){
         StrTypeList += "<li>Supernatural strength of 60 is the limit.</li>";
      }

      StrTypeList += "</ul>";
      document.getElementById("StrType").innerHTML += StrTypeList;
   }

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
   document.getElementById("DeadBy").innerHTML = "<b>Dead: </b>below -"
      + X6 + " HP";
   
   
   
   
   
   
   
   
   
   var X7 = parseInt(document.getElementById("PB").value);
   if (X7 >= 16) showAttrbBonus = 1;
   if ((X7 >= 5) & (X7 <= 7)) document.getElementById("PB_5or7").style.display = "";
   if ((X7 == 3) | (X7 == 4)) document.getElementById("PB_3or4").style.display = "";
   if ((X7 == 1) | (X7 == 2)) document.getElementById("PB_1or2").style.display = "";

   var X8 = parseInt(document.getElementById("Spd").value);
   if ((X8 >= 1) & (X8 <= 6)) document.getElementById("Spd_1or6").style.display = "";
   var mph = (X8 * 20 * 60) / 1760;
   var atks = parseInt(document.getElementById("attacks").value);
   document.getElementById("Move").innerHTML = "<b>Speed: </b>"
   + ((X8 * 5) / atks).toFixed(2) + " yds/attack; "
   + (X8 * 5) + " yds/round; "
   + mph.toFixed(2) + " mph";   

   if (showAttrbBonus) {
      document.getElementById("AttBonCha").style.display = "";
      document.getElementById("AttriBonus").innerHTML = "";   

      // ********** IQ
      if ((X1 >= 16) & (X1 <= 30)) {
         let bonus = X1 - 14;
         document.getElementById("AttriBonus").innerHTML += "<li>+" 
         + bonus + "% to all skills</li>";
      }
      if (X1 > 30) {
         let b1 = (Math.floor((X1 - 30) / 5) * 2) + 16;
         let b2 = Math.floor((X1 - 30) / 10) + 1;
         let b3 = Math.floor((X1 - 1) / 3) - 9;
         document.getElementById("AttriBonus").innerHTML += "<li>+" 
         + b1 + "% to all skills</li>";
         document.getElementById("AttriBonus").innerHTML += "<li>+" 
         + b2 + " to Perception Roll</li>";
         if (b3 > 7) {
            document.getElementById("AttriBonus").innerHTML += "<li>+"
            + "7 to Save vs. Illusion</li>";
         } else {
            document.getElementById("AttriBonus").innerHTML += "<li>+" 
            + b3 + " to Save vs. Illusion</li>";
         }
      }

      // ********** ME
      if ((X3 >= 16) & (X3 <= 30)) {
         let b1 = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8];
         let b2 = [1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
         let bonus = X3 - 16;
         document.getElementById("AttriBonus").innerHTML += "<li>+"
         + b1[bonus] + " to Save vs. Psionic attack</li>";
         document.getElementById("AttriBonus").innerHTML += "<li>+"
         + b2[bonus] + " to Save vs. Insanity</li>";
      }
      if (X3 > 30) {
         document.getElementById("AttriBonus").innerHTML += "<li>+"
         + "8 to Save vs. Psionic attack</li>";
         document.getElementById("AttriBonus").innerHTML += "<li>+"
         + "13 to Save vs. Insanity</li>";
         let b1 = Math.floor((X3 - 30) / 10) + 1;
         document.getElementById("AttriBonus").innerHTML += "<li>+"
         + b1 + " to Save vs. Possession</li>";
      }

      // ********** MA
      if ((X2 >= 16) & (X2 <= 30)) {
         let bonuses = [40, 45, 50, 55, 60, 65, 70, 75, 80, 84, 88, 92, 94, 96, 97];
         let bonus = X2 - 16;
         document.getElementById("AttriBonus").innerHTML += "<li>"
         + bonuses[bonus] + "% to Trust/Intimidate</li>";
	  }
      if (X2 > 30) {
		 document.getElementById("AttriBonus").innerHTML += "<li>"
         + "97% to Trust/Intimidate</li>";
         let b1 = Math.floor((X2 - 30) / 5) + 1;
         document.getElementById("AttriBonus").innerHTML += "<li>-"
         + b1 + " to Perception Roll of <i>others</i> interacting with him.</li>";
         document.getElementById("AttriBonus").innerHTML += "<li>"
         + "+5% to Find Con­traband, Gambling, Intelligence (gathering), Seduction and Undercover Ops skills.</li>"
         + "<li>+10% to Interrogation, Performance, Public Speaking and Sing.</li>";
      }

	  // ********** PS
      if ((X4 >= 16) & (X4 <= 30)) {
         let bonus = X4 - 15;
         document.getElementById("AttriBonus").innerHTML += "<li>+"
         + bonus + " to Hand to Hand combat damage</li>";
      }
      if (X4 > 30) {
         let bonus = X4 - 15;
         document.getElementById("AttriBonus").innerHTML += "<li>+"
         + bonus + " to Hand to Hand combat damage</li>";
         let b1 = Math.floor((X4 - 30) / 5) + 1;
         let b2 = b1 * 10;
         document.getElementById("AttriBonus").innerHTML += "<li>+"
         + b2 + " yards to hurling rocks, balls, throwing weapons, or shooting arrows without losing accuracy (no penalties for the greater distance).</li>";
         b1 = Math.floor((X4 - 30) / 5);
         b2 = b1 * 30;
         if (b1 > 0) {
            document.getElementById("AttriBonus").innerHTML += "<li>"
            + b2 + "% more to carry or lift.</li>";
         }
      }

      // ********** PP
      if ((X5 >= 16) & (X5 <= 30)) {
         let b1 = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8];
         let bonus = X5 - 16;
         document.getElementById("AttriBonus").innerHTML += "<li>+"
         + b1[bonus] + " to strike, parry, and dodge</li>";
      }
      if (X5 > 30) {
         document.getElementById("AttriBonus").innerHTML += "<li>+"
         + "8 to strike, parry, and dodge</li>";
         let b1 = Math.floor((X5 - 31) / 3) + 1;
         document.getElementById("AttriBonus").innerHTML += "<li>+"
         + b1 + " to Initiative Roll</li>";
      }

      // ********** PE
      if ((X6 >= 16) & (X6 <= 30)) {
         let b1 = [4, 5, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30];
         let b2 = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8];
         let bonus = X6 - 16;
         document.getElementById("AttriBonus").innerHTML += "<li>+"
         + b1[bonus] + "% to Save vs. Coma/Death</li>";
         document.getElementById("AttriBonus").innerHTML += "<li>+"
         + b2[bonus] + " to Save vs. Magic/Poison</li>";
      }
      if (X6 > 30) {
         document.getElementById("AttriBonus").innerHTML += "<li>+"
         + X6 + "% to Save vs. Coma/Death</li>";
         document.getElementById("AttriBonus").innerHTML += "<li>+"
         + "8 to Save vs. Magic/Poison</li>";
         document.getElementById("AttriBonus").innerHTML += "<li>"
         + "Fatigues at half the normal rate.</li>";
         document.getElementById("AttriBonus").innerHTML += "<li>"
         + "Impervious to disease. Only the most virulent virus (or de­signer bug) has a chance of affecting this character.</li>";
      }

      // ********** PB
      if ((X7 >= 16) & (X7 <= 30)) {
         let b1 = [30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 83, 86, 90, 92];
         let bonus = X7 - 16;
         document.getElementById("AttriBonus").innerHTML += "<li>"
         + b1[bonus] + "% Save vs. Charm/Impress</li>";
      }
      if (X7 > 30) {
         document.getElementById("AttriBonus").innerHTML += "<li>"
         + "92% Save vs. Charm/Impress</li>";
         document.getElementById("AttriBonus").innerHTML += "<li>"
         + "+5% to Cardsharp, Concealment, Palming, Pick Pockets, Performance and Public Speaking skill</li>";
         document.getElementById("AttriBonus").innerHTML += "<li>"
         + "+13% to Seduction</li>";
         document.getElementById("AttriBonus").innerHTML += "<li>"
         + "-10% to Prowl</li>";
      }
   }
}
	
