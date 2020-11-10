class Paint{
float r;
float g;
float b;
float xpos;
float ypos;


Paint(){
  r=random(0,255);
  g=random(0,255);
  b=random(0,255);
//fill(r,g,b);
//xpos=x;
//ypos=y;
}

void display(float x, float y){
fill(r,g,b);
//fill(255,0,0);
//noStroke();
strokeWeight(10);
    stroke(r, g, b, 60);
xpos=x;
ypos=y;
ellipse(xpos,ypos,30,30);
}

void resetColor() 
{
  r=random(0, 255);
  g=random(0, 255);
  b=random(0, 255);
}}
