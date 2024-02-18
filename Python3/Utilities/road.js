var c = document.getElementById("canvas0");
var ctx = c.getContext("2d");
var hex = document.getElementById("hex");
var slot = document.getElementById("slot")
ctx.drawImage(hex, 0, 0);

var placement = 0;
var blocking = 0;

c.addEventListener("mousedown", (e) => {
	x = e.offsetX;
	y = e.offsetY;
	if ((x>238) & (x<278) & (y>40) & (y<80))
		place(258, 60, 0);
	if ((x>382) & (x<422) & (y>119) & (y<159))
		place(402, 139, 1);
	if ((x>382) & (x<422) & (y>286) & (y<326))
		place(402, 306, 2);
	if ((x>238) & (x<278) & (y>369) & (y<409))
		place(258, 389, 3);
	if ((x>91) & (x<131) & (y>286) & (y<326))
		place(111, 306, 4);
	if ((x>93) & (x<133) & (y>123) & (y<163))
		place(113, 143, 5);






	slot.innerHTML = placement;


});

function place(X, Y, Z) {
	placement = placement ^ (1 << Z);

	if (placement & (1<<Z)) {
		ctx.beginPath();
		ctx.fillStyle = "#000000";
		ctx.arc(X, Y, 20, 0, 2 * Math.PI);
		ctx.fill();
	}
	else {
		ctx.beginPath();
		ctx.fillStyle = "#ffffff";
		ctx.arc(X, Y, 20, 0, 2 * Math.PI);
		ctx.fill();
	}
}


