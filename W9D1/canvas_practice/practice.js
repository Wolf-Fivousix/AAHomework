document.addEventListener("DOMContentLoaded", function(){

});

const canvas = document.getElementById("mycanvas");
canvas.height = 500;
canvas.width = 500;
const ctx = canvas.getContext("2d");
ctx.fillStyle = "blue";
ctx.fillRect(5, 5, 100, 100);

ctx.beginPath();
ctx.arc(200, 200, 100, 0, 2 * Math.PI);
ctx.strokeStyle = "black";
ctx.lineWidth = 5;
ctx.fillStyle = "black";
// ctx.fill();
ctx.stroke();