import gab.opencv.*;

//adapted from runway processing library. basic example from archived library
//https://github.com/runwayml/processing/blob/master/posenet/posenet.pde

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress remoteLocation;

final String POSENET_ADDRESS = "/pose";

String runwayHost = "127.0.0.1";
int runwayPort = 57100;
JSONObject  data;
JSONArray humans;
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

Paint mypaint;

void setup(){
size(600,400);
background(255);
OscProperties properties = new OscProperties();
properties.setRemoteAddress("127.0.0.1",57200);
properties.setListeningPort(57200);
properties.setSRSP(OscProperties.ON);
oscP5 = new OscP5(this, properties);
remoteLocation = new NetAddress(runwayHost,runwayPort);
connect();
mypaint = new Paint();
}

void  connect(){
  OscMessage m = new OscMessage("/server/connect");
  oscP5.send(m,remoteLocation);
}

void oscEvent(OscMessage msg){

if(!msg.addrPattern().equals("/data")) return;
String dataString = msg.get(0).stringValue();
data = parseJSONObject(dataString);
//println(data);
}



void draw(){


if (data != null) {
    humans = data.getJSONArray("poses");
    for(int h = 0; h < humans.size(); h++) {
      JSONArray keypoints = humans.getJSONArray(h);
      
      //nose
        JSONArray point1 = keypoints.getJSONArray(0);
        float xhng;
        float yhnng;
        xhng=x1;
        yhnng=y1;
        
        
            x1 = point1.getFloat(0);
        y1 = point1.getFloat(1);
        
  
       float dif1=dist(x1,y1,xhng,yhnng);
       println(dif1,"dif1");
       
        mypaint.display(x1*width,y1*height);
       // println("nose");
       
        //right wrist
        JSONArray point2 = keypoints.getJSONArray(6);
        float xhng2;
        float yhnng2;
        xhng2=x2;
        yhnng2=y2;
       x2 = point2.getFloat(0);
        y2 = point2.getFloat(1);
        
        float dif2=dist(x2,y2,xhng2,yhnng2);
       println(dif2,"dif2");
        mypaint.display(x2*width,y2*height);
          // println("rwrisst");
          
        //left wrist
        JSONArray point3 = keypoints.getJSONArray(9);
        float xhng3;
        float yhnng3;
        xhng3=x3;
        yhnng3=y3;
        
        x3 = point3.getFloat(0);
        y3 = point3.getFloat(1);
        
      float dif3=dist(x3,y3,xhng3,yhnng3);
       println(dif3,"dif3");
       mypaint.display(x3*width,y3*height);
          // println("lwrist");
          
          
        //right ankle
        JSONArray point4 = keypoints.getJSONArray(13);
        float xhng4;
        float yhnng4;
        xhng4=x4;
        yhnng4=y4;
        
        x4 = point4.getFloat(0);
         y4 = point4.getFloat(1);
           float dif4=dist(x4,y4,xhng4,yhnng4);
       println(dif4,"dif4");
        mypaint.display(x4*width,y4*height);
          // println("rankle");
          
          
        //left  ankle
        JSONArray point5 = keypoints.getJSONArray(15);
        float xhng5;
        float yhnng5;
        xhng5=x5;
        yhnng5=y5;
      x5 = point5.getFloat(0);
        y5 = point5.getFloat(1);
         float dif5=dist(x5,y5,xhng5,yhnng5);
       println(dif5,"dif5");
        mypaint.display(x5*width,y5*height);
        
        if(dif1>0.05){
        mypaint.resetColor();}
   
    }
  }
}
