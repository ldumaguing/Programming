var c = document.getElementById("canvas0");
var ctx = c.getContext("2d");
var hex = document.getElementById("hex");
var block = document.getElementById("block");
ctx.drawImage(hex, 0, 0);

var placement = 0;
var blocking = 0;

c.addEventListener("mousedown", (e) => {
	x = e.offsetX;
	y = e.offsetY;
	if ((x>178) & (x<223) & (y>22) & (y<67))
		place(200, 45, 11);
	if ((x>287) & (x<332) & (y>24) & (y<68))
		place(309, 47, 10);
	if ((x>355) & (x<401) & (y>64) & (y<109))
		place(377, 87, 9);
	if ((x>408) & (x<454) & (y>160) & (y<205))
		place(430, 183, 8);
	if ((x>411) & (x<457) & (y>236) & (y<281))
		place(435, 258, 7);
	if ((x>356) & (x<402) & (y>329) & (y<375))
		place(379, 352, 6);
	if ((x>290) & (x<336) & (y>377) & (y<423))
		place(312, 400, 5);
	if ((x>181) & (x<227) & (y>375) & (y<420))
		place(202, 398, 4);
	if ((x>110) & (x<156) & (y>334) & (y<380))
		place(132, 358, 3);
	if ((x>57) & (x<103) & (y>240) & (y<286))
		place(80, 262, 2);
	if ((x>56) & (x<103) & (y>157) & (y<203))
		place(80, 180, 1);
	if ((x>113) & (x<160) & (y>65) & (y<110))
		place(136, 88, 0);
	
	if ((x>225) & (x<285) & (y>40) & (y<50))
		blockin(240, 32);
});

function blockin(X, Y, Z) {
	blocking = blocking ^ (1<<Z);
	
	if (blocking & (1<<Z)) {
		ctx.drawImage(block, X, Y);
	}
	else {
		location.reload()
	}
}

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


