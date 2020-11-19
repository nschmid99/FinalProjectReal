class ColorPalatte{
int[]bluesR;
int[] redsR;
int[]bluesG;
int[] redsG;
int[]bluesB;
int[] redsB;

ColorPalatte(){
for(int i=0;i<25;i++){
bluesR=new int[i];
redsR=new int[i];
bluesG=new int[i];
redsG=new int[i];
bluesB=new int[i];
redsB=new int[i];
}
setBlueR();
setBlueG();
setBlueB();
setRedR();
setRedG();
setRedB();
}

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
bluesR[14]=int(88);  //AirForcce
bluesR[15]=int(176);  //Powder
bluesR[16]=int(0);  //Prussian
bluesR[17]=int(16);  //egyptian
bluesR[18]=int(0);  //olympic
bluesR[19]=int(0);  //teal
bluesR[20]=int(129);  //turkish blue
bluesR[21]=int(129);  //tiffany blue
bluesR[22]=int(126); //electric blue
bluesR[23]=int(63);  //turqoise 
}
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
 bluesG[14]=int(139);  //AirForcce
 bluesG[15]=int(223);  //Powder
 bluesG[16]=int(49);  //Prussian
 bluesG[17]=int(52);  //egyptian
 bluesG[18]=int(142);  //olympic
 bluesG[19]=int(128);  //teal
 bluesG[20]=int(151);  //turkish blue
 bluesG[21]=int(216);  //tiffany blue
 bluesG[22]=int(249); //electric blue
 bluesG[23]=int(224);  //turqoise
  
}

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
 bluesB[14]=int(174);  //AirForcce
 bluesB[15]=int(229);  //Powder
 bluesB[16]=int(82);  //Prussian
 bluesB[17]=int(166);  //egyptian
 bluesB[18]=int(204);  //olympic
 bluesB[19]=int(129);  //teal
 bluesB[20]=int(163);  //turkish blue
 bluesB[21]=int(208);  //tiffany blue
 bluesB[22]=int(255); //electric blue
 bluesB[23]=int(208);  //turqoise
  
}

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
  redsR[14]=int(180);  //hibiscus
  redsR[15]=int(210);  //raspberry
  redsR[16]=int(202);  //persion
  redsR[17]=int(191);  //US flag
  redsR[18]=int(255);  //red orange
  redsR[19]=int(66);  //mahogany
  redsR[20]=int(184);  //crimson
  redsR[21]=int(94);  //sangria
  redsR[22]=int(141);  //burgundy
  redsR[23]=int(147);  //rust
}
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
  redsG[14]=int(55);  //hibiscus
  redsG[15]=int(31);  //raspberry
  redsG[16]=int(52);  //persion
  redsG[17]=int(10);  //US flag
  redsG[18]=int(40);  //red orange
  redsG[19]=int(13);  //mahogany
  redsG[20]=int(15);  //crimson
  redsG[21]=int(25);  //sangria
  redsG[22]=int(2);  //burgundy
  redsG[23]=int(58);  //rust
  
 }
 
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
  redsB[14]=int(87);  //hibiscus
  redsB[15]=int(60);  //raspberry
  redsB[16]=int(51);  //persion
  redsB[17]=int(48);  //US flag
  redsB[18]=int(0);  //red orange
  redsB[19]=int(9);  //mahogany
  redsB[20]=int(10);  //crimson
  redsB[21]=int(20);  //sangria
  redsB[22]=int(31);  //burgundy
  redsB[23]=int(22);  //rust
  
 }
  
 

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
