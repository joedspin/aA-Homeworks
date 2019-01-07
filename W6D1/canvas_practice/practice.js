document.addEventListener("DOMContentLoaded", function(){
  const plaything = document.getElementById("mycanvas");
  plaything.width = 500;
  plaything.height = 500;

  const ctx = plaything.getContext('2d');
  ctx.fillStyle = 'lightblue';
  ctx.fillRect(0,0,500,500);
  
  // Draw a circle
  ctx.beginPath();
  ctx.arc(250, 250, 240, 0, 2 * Math.PI, true);
  ctx.strokeStyle = 'orange';
  ctx.lineWidth = 20;
  ctx.stroke();
  ctx.fillStyle = 'gray';
  ctx.fill();
});
