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
      
        JSONArray point = keypoints.getJSONArray(0);
        float x = point.getFloat(0);
        float y = point.getFloat(1);
        mypaint.display(x*width,y*height);
        //ellipse(x * width, y * height, 10, 10);
     // }
    }
  }
}
