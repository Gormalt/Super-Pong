float paddle1x, paddle1y, paddle2x, paddle2y, start = 0;
float p1u = 0, p1d = 0, p2u = 0, p2d = 0;
float ballx, bally, timer, go, timer2, boxtimer, boxy = 255, activ = 0, timer3;
float lengthpu1, lengthpu2, ballspu, secondball;
float bd, bd2, ballx2, bally2, bpu, ballstart2, timer4, paddlespeed1, paddlespeed2;
PImage gameover, startscreen,P1W, P2W;
String PU;
float text_op;

void setup(){
  size(600,600);
  gameover = loadImage("GameOverScreen.png");
  startscreen = loadImage("StartScreen.png");
  P1W = loadImage("P1W.png");
  P2W = loadImage("P2W.png");
}

void draw(){
 if(start == 0){
     background(255);
  image(startscreen, 5, 230, 590, 120);
  if(keyCode == 32){
    start = 1;
 }
 }
 if(start == 1){
  paddle1x = 0;
  paddle2x = 569;
  paddle1y = 225;
  paddle2y = 225;
  start = 2;
  ballx = 300;
  bally = 300;
  timer = 120;
  go = 0;  
  bd = random(1,15);
  bd = int(bd);
  timer2 = 70;
  boxtimer = 370;
  activ = 0;
  lengthpu1 = 0;
  lengthpu2 = 0;
  ballspu = 0;
  bd2 = 0;
  ballx2 = 0;
  bally2 = 0;
  secondball=0;
  timer3=15;
  timer4 = 120;
  ballstart2 = 0;
  paddlespeed1 = 0;
  paddlespeed2 = 0; 
  PU = "BRO";
  text_op = 0;
 }
  if(start == 2){ 
    background(200);
    
    boxtimer--;
if(boxtimer <= 0){
  boxy = 255;
  rect(255, boxy, 70,70);
if(timer3>0){
  timer3--;
}
else{
if((ballx >= 240 && ballx <= 360)||( ballx2 > 240 && ballx2 < 360 )){
  if((bally+26 > boxy && bally-26 < boxy +70)||(bally2+26 > boxy && bally2-26 < boxy +70)){
  boxtimer = 330;
  activ = random(1,7);
  activ = int(activ);
  println("upgrade number " + activ);
timer3 = 15;
//println(ballx + " " + bally + " " + boxy);
if(ballx >= 240 && ballx <= 360 && bally+26 > boxy && bally-26 < boxy +70){
if(bd == 8 || bd == 9 || bd == 10 || bd == 11 || bd == 12 || bd == 13 || bd == 14){
bpu = 1;
}
if(bd == 1 || bd == 2 || bd == 3 || bd == 4 || bd == 5 || bd == 6 || bd == 7){
bpu = 2;
}
}
if(ballx2 > 240 && ballx2 < 360 && bally2+26 > boxy && bally2-26 < boxy +70){
if(bd2 == 8 || bd2 == 9 || bd2 == 10 || bd2 == 11 || bd2 == 12 || bd2 == 13 || bd2 == 14){
bpu = 1;
}
if(bd2 == 1 || bd2 == 2 || bd2 == 3 || bd2 == 4 || bd2 == 5 || bd2 == 6 || bd2 == 7){
bpu = 2;
}
}
  boxy = -100;

  if(activ == 2){
    PU = "Paddle Length Up";
   if(bpu == 2){
     lengthpu2 = lengthpu2 + 50;
   }
    if(bpu == 1){
      lengthpu1 = lengthpu1 + 50;
    }
  }
  if(activ == 1){
        PU = "Paddle Length Down";
   if(bpu == 2){
     lengthpu1 = lengthpu1-50;
   }
    if(bpu == 1){
      lengthpu2 = lengthpu2-50;
    }
  }
  if(activ == 3){
    PU = "Ball Speed Up";
    ballspu = ballspu + 3;
    } 
    if(activ == 4){
      PU = "Second Ball";
      if(secondball == 0){
      ballx2 = 300; 
      bally2 = 300;
    }
     secondball = 1; 
     ballstart2 = 1;
    }
    if(activ == 5){
      PU = "Paddle Speed Up";
      if(bpu == 2){
        paddlespeed2 = paddlespeed2 + 3;
      }
      if(bpu == 1){
        paddlespeed1 = paddlespeed1 + 3;
      }
}
    if(activ == 6){
      PU = "Paddle Speed Down";
      if(bpu == 2){
        paddlespeed2 = paddlespeed2 - 2;
      }
      if(bpu == 1){
        paddlespeed1 = paddlespeed1 - 2;
      }
    }
text_op = 255;
}
}

}//else
}//boxtimer
textAlign(CENTER);
textSize(30);
text_op = text_op - 2;

    ellipse(ballx, bally, 60, 60);
  rect(paddle1x, paddle1y - lengthpu1/2, 30, 150 + lengthpu1);
  rect(paddle2x, paddle2y - lengthpu2/2, 30, 150 + lengthpu2);
  if(secondball == 1){
  ellipse(ballx2, bally2, 60, 60);

  }
 fill(0, text_op);
text(PU, 300, 220);
fill(255, 255);
 
  if(p2u == 1){
    paddle2y = paddle2y - 5 - paddlespeed2;
}
if(p2d == 1){
  paddle2y = paddle2y + 5 + paddlespeed2;
}
if(p1u == 1){
 paddle1y = paddle1y - 5 - paddlespeed1;
}
if(p1d == 1){
  paddle1y = paddle1y + 5 + paddlespeed1;
}
if(paddle1y < 0 + lengthpu1/2){
  paddle1y = 0 + lengthpu1/2;
}
if(paddle1y > 449 - lengthpu1/2){
  paddle1y = 449 - lengthpu1/2;
}
if(paddle2y < 0 + lengthpu2/2){
  paddle2y = 0 + lengthpu2/2 ;
}
if(paddle2y > 449 - lengthpu2/2){
  paddle2y = 449 - lengthpu2/2;
}
if(timer > 0){
  timer--;
}
else{
  go = 1;
}
if(go == 1){
  if(bd == 1){
    ballx = ballx - 4 - ballspu;
    bally = bally + 7.5 + ballspu;
  }
 if(bd == 2){
    ballx = ballx - 5 - ballspu;
    bally = bally + 5 + ballspu;
  }
 if(bd == 3){
    ballx = ballx - 5 - ballspu;
    bally = bally + 2.5 + ballspu;
  }
 if(bd == 4){
    ballx = ballx - 6.5 - ballspu;
  }
  if(bd == 5){
    ballx = ballx - 5 - ballspu;
    bally = bally -2.5 - ballspu;
  }
 if(bd == 6){
    ballx = ballx - 5 - ballspu;
    bally = bally - 5 - ballspu;
  }
 if(bd == 7){
    ballx = ballx - 4 - ballspu;
    bally = bally - 7.5 - ballspu;
  }
  if(bd == 8){
    ballx = ballx + 4 + ballspu;
    bally = bally + 7.5 + ballspu;
  }
 if(bd == 9){
    ballx = ballx + 5 + ballspu;
    bally = bally + 5 + ballspu;
  }
 if(bd == 10){
    ballx = ballx + 5 + ballspu;
    bally = bally + 2.5 + ballspu;
  }
 if(bd == 11){
    ballx = ballx + 6.5 + ballspu;
  }
  if(bd == 12){
    ballx = ballx + 5 + ballspu;
    bally = bally -2.5 - ballspu;
  }
 if(bd == 13){
    ballx = ballx + 5  + ballspu;
    bally = bally - 5 - ballspu;
  }
 if(bd == 14){
    ballx = ballx + 4  + ballspu;
    bally = bally - 7.5 - ballspu;
  }
  if(ballx < 60 && bally >= paddle1y+130 && bally < paddle1y+170 + lengthpu1/2){
  bd = 8;
}
  if(ballx < 60 && bally >= paddle1y+110 && bally < paddle1y+130){
  bd = 9;
}
  if(ballx < 60 && bally >= paddle1y+90 && bally < paddle1y+110){
  bd = 10;
}
if(ballx < 60 && bally > paddle1y+60 && bally < paddle1y+90){
  bd = 11;
}
  if(ballx < 60 && bally > paddle1y+40 && bally <= paddle1y+60){
  bd = 12;
}
 if(ballx < 60 && bally > paddle1y+20 && bally <= paddle1y+40){
  bd = 13;
}
  if(ballx < 60 && bally > paddle1y-20- lengthpu1/2 && bally <= paddle1y+20){
  bd = 14;
}
  if(ballx > 540 && bally >= paddle2y+130 && bally < paddle2y+170 + lengthpu2/2){
  bd = 1;
}
  if(ballx > 540 && bally >= paddle2y+110 && bally < paddle2y+130){
  bd = 2;
}
  if(ballx > 540 && bally >= paddle2y+90 && bally < paddle2y+110){
  bd = 3;
}
if(ballx > 540 && bally > paddle2y+60 && bally < paddle2y+90){
  bd = 4;
}
  if(ballx > 540 && bally > paddle2y+40 && bally <= paddle2y+60){
  bd = 5;
}
  if(ballx > 540 && bally > paddle2y+20 && bally <= paddle2y+40){
  bd = 6;
}
  if(ballx > 540 && bally > paddle2y-20 - lengthpu2/2 && bally <= paddle2y+20){
  bd = 7;
}
if(bally <= 27){
  if(bd == 5){
 bd = 3;
  }
 if(bd == 6){
bd = 2;
  }
 if(bd == 7){
bd = 1;
  }
  if(bd == 12){
   bd = 10;
  }
 if(bd == 13){
   bd = 9;
  }
 if(bd == 14){
bd = 8;
  }
  
}
if(bally >= 573){

if(bd == 1){
bd = 7;
  }
 if(bd == 2){
bd = 6;
  }
 if(bd == 3){
bd = 5;
  }
    if(bd == 8){
bd = 14;
  }
 if(bd == 9){
  bd = 13;
  }
 if(bd == 10){
  bd = 12;
  }
}
if(ballstart2 == 1){
if(secondball == 1 && timer4 > 0){
 timer4--; 
}
else{
  bd2 = random(1,15);
  bd2 = int(bd2);
  ballstart2 = 0;
}
}
if (secondball == 1){
  if(bd2 == 1){
    ballx2 = ballx2 - 4 - ballspu;
    bally2 = bally2 + 7.5 + ballspu;
  }
 if(bd2 == 2){
    ballx2 = ballx2 - 5 - ballspu;
    bally2 = bally2 + 5 + ballspu;
  }
 if(bd2 == 3){
    ballx2 = ballx2 - 5 - ballspu;
    bally2 = bally2 + 2.5 + ballspu;
  }
 if(bd2 == 4){
    ballx2 = ballx2 - 8 - ballspu;
  }
  if(bd2 == 5){
    ballx2 = ballx2 - 5 - ballspu;
    bally2 = bally2 -2.5 - ballspu;
  }
 if(bd2 == 6){
    ballx2 = ballx2 - 5 - ballspu;
    bally2 = bally2 - 5 - ballspu;
  }
 if(bd2 == 7){
    ballx2 = ballx2 - 4 - ballspu;
    bally2 = bally2 - 7.5 - ballspu;
  }
  if(bd2 == 8){
    ballx2 = ballx2 + 4 + ballspu;
    bally2 = bally2 + 7.5 + ballspu;
  }
 if(bd2 == 9){
    ballx2 = ballx2 + 5 + ballspu;
    bally2 = bally2 + 5 + ballspu;
  }
 if(bd2 == 10){
    ballx2 = ballx2 + 5 + ballspu;
    bally2 = bally2 + 2.5 + ballspu;
  }
 if(bd2 == 11){
    ballx2 = ballx2 + 8 + ballspu;
  }
  if(bd2 == 12){
    ballx2 = ballx2 + 5 + ballspu;
    bally2 = bally2 -2.5 - ballspu;
  }
 if(bd2 == 13){
    ballx2 = ballx2 + 5  + ballspu;
    bally2 = bally2 - 5 - ballspu;
  }
 if(bd2 == 14){
    ballx2 = ballx2 + 4  + ballspu;
    bally2 = bally2 - 7.5 - ballspu;
  }
  if(ballx2 < 60 && bally2 >= paddle1y+130 && bally2 < paddle1y+170 + lengthpu1/2){
  bd2 = 8;
}
  if(ballx2 < 60 && bally2 >= paddle1y+110 && bally2 < paddle1y+130){
  bd2 = 9;
}
  if(ballx2 < 60 && bally2 >= paddle1y+90 && bally2 < paddle1y+110){
  bd2 = 10;
}
if(ballx2 < 60 && bally2 > paddle1y+60 && bally2 < paddle1y+90){
  bd2 = 11;
}
  if(ballx2 < 60 && bally2 > paddle1y+40 && bally2 <= paddle1y+60){
  bd2 = 12;
}
 if(ballx2 < 60 && bally2 > paddle1y+20 && bally2 <= paddle1y+40){
  bd2 = 13;
}
  if(ballx2 < 60 && bally2 > paddle1y-20- lengthpu1/2 && bally2 <= paddle1y+20){
  bd2 = 14;
}
  if(ballx2 > 540 && bally2 >= paddle2y+130 && bally2 < paddle2y+170 + lengthpu2/2){
  bd2 = 1;
}
  if(ballx2 > 540 && bally2 >= paddle2y+110 && bally2 < paddle2y+130){
  bd2 = 2;
}
  if(ballx2 > 540 && bally2 >= paddle2y+90 && bally2 < paddle2y+110){
  bd2 = 3;
}
if(ballx2 > 540 && bally2 > paddle2y+60 && bally2 < paddle2y+90){
  bd2 = 4;
}
  if(ballx2 > 540 && bally2 > paddle2y+40 && bally2 <= paddle2y+60){
  bd2 = 5;
}
  if(ballx2 > 540 && bally2 > paddle2y+20 && bally2 <= paddle2y+40){
  bd2 = 6;
}
  if(ballx2 > 540 && bally2 > paddle2y-20 - lengthpu2/2 && bally2 <= paddle2y+20){
  bd2 = 7;
}
if(bally2 <= 27){
  if(bd2 == 5){
 bd2 = 3;
  }
 if(bd2 == 6){
bd2 = 2;
  }
 if(bd2 == 7){
bd2 = 1;
  }
  if(bd2 == 12){
   bd2 = 10;
  }
 if(bd2 == 13){
   bd2 = 9;
  }
 if(bd2 == 14){
bd2 = 8;
  }
  
}
if(bally2 >= 573){

if(bd2 == 1){
bd2 = 7;
  }
 if(bd2 == 2){
bd2 = 6;
  }
 if(bd2 == 3){
bd2 = 5;
  }
    if(bd2 == 8){
bd2 = 14;
  }
 if(bd2 == 9){
  bd2 = 13;
  }
 if(bd2 == 10){
  bd2 = 12;
  }
} 
}// bar for secondball = 1
} //bar for go
if(ballx < -10 || ballx > 610){
  start = 3;
}
if(ballx2 < -10 || ballx2 > 610){
  start = 3;
}
} //bar for start 2
if(start == 3){
  if (timer2 > 0){
    timer2--;
  }
  else{
  background(255);
  image(gameover, 100, 230, 400, 100);
     if(ballx <= 10 || ballx2 <= 10){ 
   image(P2W, 250, 174, 100, 40); 
 }
     if(ballx >= 590 || ballx2 >= 590) { 
     image(P1W, 250, 174, 100, 40); 
   }
  if(keyCode == 32){
    start = 1;
}
  }
} //bar for start 3
} //bar for draw

void keyPressed(){
  if(key == 'w'){
   p1u = 1; 
  }
  if(key == 's'){
    p1d = 1;
  }
  if(keyCode == UP){
    p2u = 1;
  }
  if(keyCode == DOWN){
    p2d = 1;
  }
}
void keyReleased(){
 if(key == 'w'){
   p1u = 0;
}
  if(key == 's'){
    p1d = 0;
  }
  if(keyCode == UP){
    p2u = 0;
  }
  if(keyCode == DOWN){
    p2d = 0;
  }
}
