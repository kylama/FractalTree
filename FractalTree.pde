private double fractionLength = .8; 
private int smallestBranch = 6; 
private double branchAngle = .5;  

public void setup() 
{   
  size(640,480);    
  noLoop(); 
} 

public void draw() 
{   
  background(0);
  stroke(155,85,5);
  line(320,480,320,380);   
  drawBranches(320,380,100,3*Math.PI/2,155,85,5);
} 

public void drawBranches(int x,int y, double branchLength, double angle, int r, int g, int b) 
{ 
  if(branchLength < 30){
    r = (int)(Math.random()*101+205); //255;
    g = (int)(Math.random()*101+105); //155;
    b = (int)(Math.random()*101+170); //220;
  }
  else{
    r = 155;
    g = 85;
    b = 5;
  }
  
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  
  branchLength *= fractionLength;
  
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  
  stroke(r,g,b);
  line(x,y,endX1,endY1);
  line(x,y,endX2,endY2);
  
  if(branchLength > smallestBranch){
    drawBranches(endX1, endY1, branchLength, angle1, r, g, b);
    drawBranches(endX2, endY2, branchLength, angle2, r, g, b);
  }
}
