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
println(data);
}

void draw(){


if (data != null) {
    humans = data.getJSONArray("poses");
    for(int h = 0; h < humans.size(); h++) {
      JSONArray keypoints = humans.getJSONArray(h);
      
      //nose
        JSONArray point1 = keypoints.getJSONArray(0);
        float x1 = point1.getFloat(0);
        float y1 = point1.getFloat(1);
        mypaint.display(x1*width,y1*height);
        println("nose");
        //right wrist
        JSONArray point2 = keypoints.getJSONArray(6);
        float x2 = point2.getFloat(0);
        float y2 = point2.getFloat(1);
        mypaint.display(x2*width,y2*height);
           println("rwrisst");
        //left wrist
        JSONArray point3 = keypoints.getJSONArray(9);
        float x3 = point3.getFloat(0);
        float y3 = point3.getFloat(1);
        mypaint.display(x3*width,y3*height);
           println("lwrist");
        //right ankle
        JSONArray point4 = keypoints.getJSONArray(13);
        float x4 = point4.getFloat(0);
        float y4 = point4.getFloat(1);
        mypaint.display(x4*width,y4*height);
           println("rankle");
        //left  ankle
        JSONArray point5 = keypoints.getJSONArray(15);
        float x5 = point5.getFloat(0);
        float y5 = point5.getFloat(1);
        mypaint.display(x5*width,y5*height);
           println("lankle");
  
     // }
    }
  }
}
