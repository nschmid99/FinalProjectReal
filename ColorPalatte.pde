//Natasha Schmid
//Dec 3 2020
//Color palatte class which gives both warm and cool colors. Had to separate colors by RGB values because fluids take each value separately
//colors taken from grafix palette
//https://graf1x.com/shades-of-blue-color-palette/
//https://graf1x.com/shades-of-red-color-palette-hex-rgb-code/

class ColorPalatte{
//creates an array for each RGB value for each palatte
int[]bluesR;
int[] redsR;
int[]bluesG;
int[] redsG;
int[]bluesB;
int[] redsB;

ColorPalatte(){
//instantiates arrays
for(int i=0;i<15;i++){
bluesR=new int[i];
redsR=new int[i];
bluesG=new int[i];
redsG=new int[i];
bluesB=new int[i];
redsB=new int[i];
}
//fills arrays with values
setBlueR();
setBlueG();
setBlueB();
setRedR();
setRedG();
setRedB();
}

//sets blue r value
void setBlueR(){
bluesR[0]=int(17);  //Royal
bluesR[1]=int(0);  //Navy
bluesR[2]=int(0);  //Azure
bluesR[3]=int(101);  //Cornflower
bluesR[4]=int(115);  //Maya
bluesR[5]=int(87);  //Carolina
bluesR[6]=int(137);  //Baby
bluesR[7]=int(149);  //Sky  
bluesR[8]=int(29);  //Space
bluesR[9]=int(14);  //Yale
bluesR[10]=int(15);  //Sapphire
bluesR[11]=int(76);  //Independence
bluesR[12]=int(114);  //Pigeon
bluesR[13]=int(70);  //Steel

}

//sets blue g value
void setBlueG(){
 bluesG[0]=int(30);  //Royal
 bluesG[1]=int(0);  //Navy
 bluesG[2]=int(128);  //Azure
 bluesG[3]=int(147);  //Cornflower
 bluesG[4]=int(194);  //Maya
 bluesG[5]=int(160);  //Carolina
 bluesG[6]=int(207);  //Baby
 bluesG[7]=int(200);  //Sky  
 bluesG[8]=int(41);  //Space
 bluesG[9]=int(77);  //Yale
 bluesG[10]=int(82);  //Sapphire
 bluesG[11]=int(81);  //Independence
 bluesG[12]=int(133);  //Pigeon
 bluesG[13]=int(130);  //Steel
  
}

//sets blue b value
void setBlueB(){
 bluesB[0]=int(108);  //Royal
 bluesB[1]=int(128);  //Navy
 bluesB[2]=int(255);  //Azure
 bluesB[3]=int(245);  //Cornflower
 bluesB[4]=int(215);  //Maya
 bluesB[5]=int(211);  //Carolina
 bluesB[6]=int(240);  //Baby
 bluesB[7]=int(216);  //Sky  
 bluesB[8]=int(81);  //Space
 bluesB[9]=int(146);  //Yale
 bluesB[10]=int(186);  //Sapphire
 bluesB[11]=int(109);  //Independence
 bluesB[12]=int(165);  //Pigeon
 bluesB[13]=int(180);  //Steel
 
}

//sets red r value
void setRedR()
{
  redsR[0]=int(250);  //salmon
  redsR[1]=int(255);  //scarlet 
  redsR[2]=int(124);  //barn
  redsR[3]=int(237);  //imperial
  redsR[4]=int(205);  //pale red 
  redsR[5]=int(194);  //chilli
  redsR[6]=int(224);  //no name(hot pink)
  redsR[7]=int(178);  //fire brick
  redsR[8]=int(150);  //carmine
  redsR[9]=int(128);  //maroon
  redsR[10]=int(164);  //redwood
  redsR[11]=int(234);  //desire
  redsR[12]=int(126);  //vermillion
  redsR[13]=int(255);  //candy apple
 
}

//sets red g value
void setRedG()
{
  redsG[0]=int(128);  //salmon
  redsG[1]=int(36);  //scarlet 
  redsG[2]=int(10);  //barn
  redsG[3]=int(41);  //imperial
  redsG[4]=int(92);  //pale red 
  redsG[5]=int(24);  //chilli
  redsG[6]=int(17);  //no name(hot pink)
  redsG[7]=int(34);  //fire brick
  redsG[8]=int(0);  //carmine
  redsG[9]=int(0);  //maroon
  redsG[10]=int(90);  //redwood
  redsG[11]=int(60);  //desire
  redsG[12]=int(25);  //vermillion
  redsG[13]=int(8);  //candy apple

 }
 
 //sets red b value
 void setRedB()
{
  redsB[0]=int(114);  //salmon
  redsB[1]=int(0);  //scarlet 
  redsB[2]=int(2);  //barn
  redsB[3]=int(57);  //imperial
  redsB[4]=int(92);  //pale red 
  redsB[5]=int(7);  //chilli
  redsB[6]=int(95);  //no name(hot pink)
  redsB[7]=int(34);  //fire brick
  redsB[8]=int(24);  //carmine
  redsB[9]=int(0);  //maroon
  redsB[10]=int(82);  //redwood
  redsB[11]=int(83);  //desire
  redsB[12]=int(27);  //vermillion
  redsB[13]=int(0);  //candy apple
  
 }
  
 
//function call to get a random color from the array and set the value
int bR(){
int br=bluesR[(int)random(bluesR.length)];
 return br;
 }
int bG(){
 
int bg=bluesG[(int)random(bluesG.length)];
 return bg;
 }
 
 int bB(){
 
int bb=bluesB[(int)random(bluesB.length)];
 return bb;
 }
 
 int rR(){
 
int rr=redsR[(int)random(redsR.length)];
 return rr;
 }
int rG(){
 
int rg=redsG[(int)random(redsG.length)];
 return rg;
 }
 
 int rB(){
 
int rb=redsB[(int)random(redsB.length)];
 return rb;
 }
}
