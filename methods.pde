void star(float x,float y){//星を描く関数
  line(x-1,y,x+1,y);
  line(x,y-1,x,y+1);
  noStroke();
  }
  
    void hibana(float x,float y){//死んだときのえふぇくと
    for(int i=0; i<30;i++){
Ef[i].display(x,y);}
  }
  
  void UAV(float x,float y){
    for(int i=0;i<30;i++){

  stroke(100,250,100,i*8);
line((x+i+frameCount*3)%(400+x),y,(x+i+frameCount*3)%(400+x),y+200);
  
}
  mapU=int((x+frameCount*3)%(400+x));
  }
  
 
void wavecheck(int n){//WAVEが始まった時の処理
  if(textsize < 220){//WAVEの文字の縮小
  textSize(110-float(textsize)/2);
  
    text("WAVE",370+textsize,150);
    text(n,830-textsize,150);
  }  
  textsize=textsize+1;

}

void tale(int x){//尾っぽ描画
  noStroke();
  bftaleX[frameCount%x]=int(positionX);//尾っぽのxを配列に代入
    bftaleY[frameCount%x]=int(positionY);//y
    
    for(int i=0;i<x;i++){
      if(frameCount%x+i<x){
     taleX[i]=bftaleX[frameCount%x+i];
       taleY[i]=bftaleY[frameCount%x+i];
      }else{
            taleX[i]=bftaleX[i+frameCount%x-x];
       taleY[i]=bftaleY[i+frameCount%x-x];
      }
    }
    
    
    for(int i=0;i<x;i++){
      fill(200*boost+(1-overheat)*200,200-(1-overheat)*117,
    255-(boost-1)*255-(1-overheat)*364,i*4);
      ellipse(taleX[i]-positionX+width/2,taleY[i]-positionY+height/2,70-deathing+i,70-deathing+i);
    }
    
    
    fill(255);
stroke(255);
}

void clearcheck(){//n番目のWAVEのクリアーを判定し、次のWAVEに進める関数 
  switch(difficult){
    case 1:
  switch(wave){
    case 1:
  
  if( Enemys[0].broken == true
  && Enemys[1].broken == true
  &&  Enemys[2].broken == true
  ){
    cleared =true;
  }
  if(cleared==true){
    waiting=waiting+1;
    if(waiting>450){

  rts();
  
  break;

 }
}



case 2:

 if( Enemys[4].broken == true
  && Enemys[5].broken == true
  &&  Enemys[6].broken == true
    && Enemys[7].broken == true
  &&  Enemys[3].broken == true
   && Enemys[30].broken == true
    ){
    cleared =true;
  }
  if(cleared==true){
    waiting=waiting+1;
    if(waiting>450){
 rts();
 break;
  }
}

case 3:

 if( Enemys[8].broken == true
  && Enemys[9].broken == true
  &&  Enemys[10].broken == true
    && Enemys[11].broken == true
  &&  Enemys[12].broken == true
    &&  Enemys[13].broken == true
    && Enemys[14].broken == true
     && Enemys[31].broken == true
      && Enemys[32].broken == true
            && Enemys[40].broken == true

    ){
    cleared =true;
  }
  if(cleared==true){
    waiting=waiting+1;
    if(waiting>450){
 rts();
 break;
 
  }
}

case 4:
 if( Enemys[15].broken == true
  && Enemys[16].broken == true
  &&  Enemys[17].broken == true
    && Enemys[18].broken == true
  &&  Enemys[19].broken == true
    &&  Enemys[20].broken == true
    && Enemys[21].broken == true
        &&  Enemys[22].broken == true
    && Enemys[23].broken == true
    && Enemys[41].broken == true
    && Enemys[42].broken == true
    && Enemys[43].broken == true

    ){
    cleared =true;
  }
  if(cleared==true){
    waiting=waiting+1;
    if(waiting>450){
 rts();
 break;
 }
  }
  
  case 5:
   if( Enemys[24].broken == true
  && Enemys[25].broken == true
  &&  Enemys[26].broken == true
    && Enemys[27].broken == true
  &&  Enemys[28].broken == true
    &&  Enemys[29].broken == true
        && Enemys[44].broken == true
    && Enemys[45].broken == true
    && Enemys[46].broken == true
    && Enemys[33].broken == true
    && Enemys[34].broken == true    
    ){
    cleared =true;
  }
  if(cleared==true){
    waiting=waiting+1;
    if(waiting>450){
 rts();
 break;
 }
  
  }
    case 6:
 if( Boss.broken==true )
 {
    cleared =true;
  }
  if(cleared==true){
    waiting=waiting+1;
    if(waiting>450){
 rts();
 break;
 }
  }
 













  }
  break ;
  
  case 0:
  
    switch(wave){
    case 1:
  
  if( Enemys[0].broken == true
  && Enemys[1].broken == true
  &&  Enemys[2].broken == true
  ){
    cleared =true;
  }
  if(cleared==true){
    waiting=waiting+1;
    if(waiting>450){

  rts();
  
  break;

 }
}



case 2:

 if( Enemys[4].broken == true
  && Enemys[5].broken == true
  &&  Enemys[6].broken == true
    && Enemys[7].broken == true
  &&  Enemys[3].broken == true
   && Enemys[30].broken == true
    ){
    cleared =true;
  }
  if(cleared==true){
    waiting=waiting+1;
    if(waiting>450){
 rts();
 break;
  }
}

case 3:

 if( Enemys[8].broken == true
  && Enemys[9].broken == true
  &&  Enemys[10].broken == true
    && Enemys[11].broken == true
  &&  Enemys[12].broken == true
            && Enemys[40].broken == true

    ){
    cleared =true;
  }
  if(cleared==true){
    waiting=waiting+1;
    if(waiting>450){
 rts();
 break;
 
  }
}

case 4:
 if( Enemys[15].broken == true
  && Enemys[16].broken == true
  &&  Enemys[17].broken == true
    && Enemys[18].broken == true
  &&  Enemys[19].broken == true
    && Enemys[20].broken == true
  &&  Enemys[21].broken == true
    && Enemys[22].broken == true
    && Enemys[34].broken == true
    && Enemys[32].broken == true

    ){
    cleared =true;
  }
  if(cleared==true){
    waiting=waiting+1;
    if(waiting>450){
 rts();
 break;
 }
  }
  
  case 5:
   if( Enemys[24].broken == true
  && Enemys[25].broken == true
  &&  Enemys[26].broken == true
    && Enemys[45].broken == true
    && Enemys[41].broken == true
    && Enemys[35].broken == true
 )
    {
    cleared =true;
  }
  if(cleared==true){
    waiting=waiting+1;
    if(waiting>450){
 rts();
 break;
 }
  
  }
  
  case 6:
 if( Boss.broken==true )
 {
    cleared =true;
  }
  if(cleared==true){
    waiting=waiting+1;
    if(waiting>450){
 rts();
 break;
 }
  }
  
  
}
  break ;
  }
}
//-------------------
void rts (){//関数clearcheck内の処理用
 textsize = 0; 
   cleared = false;
  waiting=0;
  wave=wave+1;
}
  
  //--------------------
  