/*
Natasha Schmid
Dec 3 2020
This code is for my final project for CRCP 5350 Motion Capture
This code uses PoseNet via Runway and utilizes the PixelFlow library on processing to create virtual paintings
based on the detected position of the nose, wrists, and ankles of a dancer
*/

import com.thomasdiewald.pixelflow.java.*;
import com.thomasdiewald.pixelflow.java.accelerationstructures.*;
import com.thomasdiewald.pixelflow.java.antialiasing.FXAA.*;
import com.thomasdiewald.pixelflow.java.antialiasing.GBAA.*;
import com.thomasdiewald.pixelflow.java.antialiasing.SMAA.*;
import com.thomasdiewald.pixelflow.java.dwgl.*;
import com.thomasdiewald.pixelflow.java.flowfieldparticles.*;
import com.thomasdiewald.pixelflow.java.fluid.*;
import com.thomasdiewald.pixelflow.java.geometry.*;
import com.thomasdiewald.pixelflow.java.imageprocessing.*;
import com.thomasdiewald.pixelflow.java.imageprocessing.filter.*;
import com.thomasdiewald.pixelflow.java.render.skylight.*;
import com.thomasdiewald.pixelflow.java.rigid_origami.*;
import com.thomasdiewald.pixelflow.java.sampling.*;
import com.thomasdiewald.pixelflow.java.softbodydynamics.*;
import com.thomasdiewald.pixelflow.java.softbodydynamics.constraint.*;
import com.thomasdiewald.pixelflow.java.softbodydynamics.particle.*;
import com.thomasdiewald.pixelflow.java.softbodydynamics.softbody.*;
import com.thomasdiewald.pixelflow.java.utils.*;

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress remoteLocation;

final String POSENET_ADDRESS = "/pose";

String runwayHost = "127.0.0.1";  //Computer IP Address
int runwayPort = 57100;
JSONObject  data; 
JSONArray humans;
//position x and y in current frame for keypoints 1-5
float x1;
float y1;
float x2;
float y2;
float x3;
float y3;
float x4;
float y4;
float x5;
float y5;

/
float max=0.05;

float [] diff=new float [5];

//position x and y in previous frame for keypoints 1-5
float xhng;
float yhnng;
float xhng2;
float yhnng2;
float xhng3;
float yhnng3;
float xhng4;
float yhnng4;
float xhng5;
float yhnng5;

//values to save rgb values
float red;
float blue;
float green;

//threshold used to change color from cool to warm tones
float snap=0.15;


String[][] connections={
  //7,10,14,16
  {"nose", "leftEye"}, 
  {"leftEye", "leftEar"}, 
  {"nose", "rightEye"}, 
  {"rightEye", "rightEar"}, 
  {"rightShoulder", "rightElbow"}, 
  {"rightElbow", "rightWrist"}, 
  {"leftShoulder", "leftElbow"}, 
  {"leftElbow", "leftWrist"}, 
  {"rightHip", "rightKnee"}, 
  {"rightKnee", "rightAnkle"}, 
  {"leftHip", "leftKnee"}, 
  {"leftKnee", "leftAnkle"}
};

// fluid simulation
DwFluid2D fluid;

// render target
PGraphics2D pg_fluid;

//Creates color array 
ColorPalatte myColorPalatte;
float blueRed;
float blueGreen;
float blueBlue;
float redRed;
float redGreen;
float redBlue;

public void setup() {
  size(516, 640, P2D);  //size of runway screen, must say P2D for fluids
  background(0);
  
  //set up OSC to recieve PoseNet information from Runway
  OscProperties properties = new OscProperties();  
  properties.setRemoteAddress("127.0.0.1", 57200);
  properties.setListeningPort(57200);
  properties.setSRSP(OscProperties.ON);
  oscP5 = new OscP5(this, properties);
  remoteLocation = new NetAddress(runwayHost, runwayPort);
  connect();

  //create color pallate 
  myColorPalatte=new ColorPalatte();

  // library context
  DwPixelFlow context = new DwPixelFlow(this);

  // fluid simulation
  fluid = new DwFluid2D(context, width, height, 1);

  // some fluid parameters
  fluid.param.dissipation_velocity = 0.70f;
  fluid.param.dissipation_density  = 0.99f;

  // adding data to the fluid simulation
  fluid.addCallback_FluiData(new  DwFluid2D.FluidData() {
    public void update(DwFluid2D fluid) {
      
      //cycle through array and only draw when the difference between the current frame and previous frame isn't 0, meaning movement is detected
      for (int i=0; i<5; i++) {
        if (diff[i]>0) {
          
          //set positions and velocity for each detected keypoint
          //nose
          float px     = x1*width;
          float py     = y1*height;
          float vx     = xhng*width;
          float vy     = yhnng*height;
          //right wrist
          float px2     = x2*width;
          float py2     = y2*height;
          float vx2     = xhng2*width;
          float vy2     = yhnng2*height;
          //left wrist
          float px3     = x3*width;
          float py3     = y3*height;
          float vx3     = xhng3*width;
          float vy3     = yhnng3*height;
          //right ankle
          float px4     = x4*width;
          float py4    = y4*height;
          float vx4     = xhng4*width;
          float vy4     = yhnng4*height;
          //left ankle
          float px5     = x5*width;
          float py5     = y5*height;
          float vx5     = xhng5*width;
          float vy5     = yhnng5*height;
          
          //add velocities and densities for each keypoint
          fluid.addVelocity(px, py, 14, px-vx, px-vy);
          fluid.addVelocity(px2, py2, 14, px2-vx2, py2-vy2);
          fluid.addVelocity(px3, py3, 14, px3-vx3, py3-vy3);
          fluid.addVelocity(px4, py4, 14, px4-vx4, vy4-vy4);
          fluid.addVelocity(px5, py5, 14, px5-vx5, py5-vy5);
          fluid.addDensity (px, py, diff[0]*100, red, green, blue, 1.0f);
          fluid.addDensity (px2, py2, diff[1]*100, red, green, blue, 1.0f);
          fluid.addDensity (px3, py3, diff[2]*100, red, green, blue, 1.0f);
          fluid.addDensity (px4, py4, diff[3]*100, red, green, blue, 1.0f);
          fluid.addDensity (px5, py5, diff[4]*100, red, green, blue, 1.0f);
          //x,y,radius,r,g,b,opacity
        }
      }
    }
  }
  );

  //creates the fluid
  pg_fluid = (PGraphics2D) createGraphics(width, height, P2D);
}

//connect to osc
void  connect() {
  OscMessage m = new OscMessage("/server/connect");
  oscP5.send(m, remoteLocation);
}

//recieve osc message
void oscEvent(OscMessage msg) {

  if (!msg.addrPattern().equals("/data")) return;
  String dataString = msg.get(0).stringValue();
  data = parseJSONObject(dataString);
}


public void draw() {    

  if (data != null) {
    humans = data.getJSONArray("poses");
    
    //get data and save data related to the keypoints used in code
    for (int h = 0; h < humans.size(); h++) {
      JSONArray keypoints = humans.getJSONArray(h);

      //nose
      JSONArray point1 = keypoints.getJSONArray(5); 
      xhng=x1;
      yhnng=y1;
      x1 = point1.getFloat(0);
      y1 = point1.getFloat(1);
      diff[0]=dist(x1, y1, xhng, yhnng);
     // println("diff0", dist(x1, y1, xhng, yhnng));

     //right wrist
      JSONArray point2 = keypoints.getJSONArray(6);   
      xhng2=x2;
      yhnng2=y2;
      x2 = point2.getFloat(0);
      y2 = point2.getFloat(1); 
      diff[1]=dist(x2, y2, xhng2, yhnng2);
     // println("diff1", dist(x2, y2, xhng2, yhnng2));

      //left wrist
      JSONArray point3 = keypoints.getJSONArray(9);
      xhng3=x3;
      yhnng3=y3; 
      x3 = point3.getFloat(0);
      y3 = point3.getFloat(1);
      diff[2]=dist(x3, y3, xhng3, yhnng3);
      //println("diff2", dist(x3, y3, xhng3, yhnng3));

      //right ankle
      JSONArray point4 = keypoints.getJSONArray(13);
      xhng4=x4;
      yhnng4=y4;
      x4 = point4.getFloat(0);
      y4 = point4.getFloat(1);
      diff[3]=dist(x4, y4, xhng4, yhnng4);
      //println("diff3", dist(x4, y4, xhng4, yhnng4));

      //left  ankle
      JSONArray point5 = keypoints.getJSONArray(15);
      xhng5=x5;
      yhnng5=y5;
      x5 = point5.getFloat(0);
      y5 = point5.getFloat(1);
      diff[4]=dist(x5, y5, xhng5, yhnng5);
      //println("diff4", dist(x5, y5, xhng5, yhnng5));
    }
  }

  // update simulation
  fluid.update();
  // clear render target

  //draw fluids
  pg_fluid.beginDraw();
  pg_fluid.fill(255, 0, 0);
  pg_fluid.background(0);
  pg_fluid.endDraw();

  // render fluid stuff
  fluid.renderFluidTextures(pg_fluid, 0);

  // display
  image(pg_fluid, 0, 0);
  
  //check difference threshold to decide if color is cool or warm
  for (int i=0; i<5; i++) {
    if (diff[i]<snap) { ///change color to cool palatte
      updateBR();
      updateBB();
      updateBG();
    }

    if (diff[i]>snap) { //change color to warm palatte 
      updateRR();
      updateRB();
      updateRG();
    }
  }
}

//get RGB values and sets them to float red, green, and blue. Must divide by 255 because the fluids look at color values from 0-1 not 0-255
void updateBR() {
  float br=myColorPalatte.bR();
  red=br/255;
  //println(blueRed,"br");
}
void updateBG() {
  float bg=myColorPalatte.bG();
  green=bg/255;
  //println(blueGreen,"bg");
}
void updateBB() {
  float bb=myColorPalatte.bB();
  blue=bb/255;
  // println(blueBlue,"bb");
}

void updateRR() {
  float rr=myColorPalatte.rR();
  red=rr/255;
  //println(redRed,"rr");
}
void updateRG() {
  float rg=myColorPalatte.rG();
  green=rg/255;
  // println(redGreen,"rg");
}
void updateRB() {
  float rb=myColorPalatte.rB();
 blue=rb/255;
  //println(redBlue,"rb");
}
