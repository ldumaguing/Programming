const canvas = document.getElementById('canvas0');
const ctx = canvas.getContext('2d');

// Viewport camera state
let scale = 1;
let offsetX = 0;
let offsetY = 0;

// Panning state
let isDragging = false;
let startX = 0;
let startY = 0;

const img = new Image();
img.src = 'Pictures/Vassal/TLR/Map A.png';
img.onload = () => {
   ctx.drawImage(img, 0, 0);
   draw();
}

function draw() {
	// 1. Reset transform to clear the entire visible canvas cleanly
	ctx.setTransform(1, 0, 0, 1, 0, 0);
	ctx.clearRect(0, 0, canvas.width, canvas.height);

	// 2. Apply camera zoom and pan transform
	ctx.setTransform(scale, 0, 0, scale, offsetX, offsetY);


   ctx.drawImage(img, 0, 0);


	// 3. Draw your scene in world coordinates
	ctx.fillStyle = '#3b82f6';
	ctx.fillRect(100, 100, 150, 100);

	ctx.fillStyle = '#ef4444';
	ctx.beginPath();
	ctx.arc(350, 200, 50, 0, Math.PI * 2);
	ctx.fill();
}

// Zoom toward the mouse cursor
canvas.addEventListener('wheel', (e) => {
	e.preventDefault();

	const zoomIntensity = 0.1;
	const wheel = e.deltaY < 0 ? 1 : -1;
	const zoomFactor = Math.exp(wheel * zoomIntensity);

	// Get mouse position relative to canvas
	const rect = canvas.getBoundingClientRect();
	const mouseX = e.clientX - rect.left;
	const mouseY = e.clientY - rect.top;

	// Keep the world point under the cursor stationary
	offsetX = mouseX - (mouseX - offsetX) * zoomFactor;
	offsetY = mouseY - (mouseY - offsetY) * zoomFactor;
	scale *= zoomFactor;

	draw();
}, { passive: false });

// Click and drag to pan
canvas.addEventListener('mousedown', (e) => {
   console.log(e.button);
	isDragging = true;
	startX = e.clientX - offsetX;
	startY = e.clientY - offsetY;
});

canvas.addEventListener('mousemove', (e) => {
	if (!isDragging) return;
	offsetX = e.clientX - startX;
	offsetY = e.clientY - startY;
	draw();
});

canvas.addEventListener('mouseup', () => isDragging = false);
canvas.addEventListener('mouseleave', () => isDragging = false);

// Initial render
// draw();

