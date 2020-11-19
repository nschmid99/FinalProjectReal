class ColorPalatte{
color[] blues;
color[] reds;
color c;
//color c2;
ColorPalatte(){
for(int i=0;i<25;i++){
blues=new color[i];
reds=new color[i];
}
setBlue();
setRed();
}

void setBlue(){
 blues[0]=color(17,30,108);  //Royal
 blues[1]=color(0,0,128);  //Navy
 blues[2]=color(0,128,255);  //Azure
 blues[3]=color(101,147,245);  //Cornflower
 blues[4]=color(115,194,215);  //Maya
 blues[5]=color(87,160,211);  //Carolina
 blues[6]=color(137,207,240);  //Baby
 blues[7]=color(149,200,216);  //Sky  
 blues[8]=color(29,41,81);  //Space
 blues[9]=color(14,77,146);  //Yale
 blues[10]=color(15,82,186);  //Sapphire
 blues[11]=color(76,81,109);  //Independence
 blues[12]=color(114,133,165);  //Pigeon
 blues[13]=color(70,130,180);  //Steel
 blues[14]=color(88,139,174);  //AirForcce
 blues[15]=color(176,223,229);  //Powder
 blues[16]=color(0,49,82);  //Prussian
 blues[17]=color(16,52,166);  //egyptian
 blues[18]=color(0,142,204);  //olympic
 blues[19]=color(0,128,129);  //teal
 blues[20]=color(129,151,163);  //turkish blue
 blues[21]=color(129,216,208);  //tiffany blue
 blues[22]=color(126,249,255); //electric blue
 blues[23]=color(63,224,208);  //turqoise
  
}

void setRed()
{
  reds[0]=color(250,128,114);  //salmon
  reds[1]=color(255,36,0);  //scarlet 
  reds[2]=color(124,10,2);  //barn
  reds[3]=color(237,41,57);  //imperial
  reds[4]=color(205,92,92);  //pale red 
  reds[5]=color(194,24,7);  //chilli
  reds[6]=color(224,17,95);  //no name(hot pink)
  reds[7]=color(178,34,34);  //fire brick
  reds[8]=color(150,0,24);  //carmine
  reds[9]=color(128,0,0);  //maroon
  reds[10]=color(164,90,82);  //redwood
  reds[11]=color(234,60,83);  //desire
  reds[12]=color(126,25,27);  //vermillion
  reds[13]=color(255,8,0);  //candy apple
  reds[14]=color(180,55,87);  //hibiscus
  reds[15]=color(210,31,60);  //raspberry
  reds[16]=color(202,52,51);  //persion
  reds[17]=color(191,10,48);  //US flag
  reds[18]=color(255,40,0);  //red orange
  reds[19]=color(66,13,9);  //mahogany
  reds[20]=color(184,15,10);  //crimson
  reds[21]=color(94,25,20);  //sangria
  reds[22]=color(141,2,31);  //burgundy
  reds[23]=color(147,58,22);  //rust
  
 }
 
int changeWarm(){
color c=reds[(int)random(reds.length)];
return c;
 }
 
color changeCool(){
 
color c2=blues[(int)random(blues.length)];
 return c2;
 }

}
