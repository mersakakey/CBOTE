class boss {
  float x;//x座標
  float y;//ｙ座標
  int n;
  float xS;//回転制御
        float KX=0;//破壊時の拡散状態のｘ
        float KY=0;//破壊時の拡散状態のy
  boolean broken=false;
  boolean feared=false;
  //コンストラクタ---------------
    boss(float x,float y){
    this.x=x;
    this.y=y;
  }
  //------------------------------
  void Bdisplay(){
    
          if(death==false && x<2000 && broken == false){
    fill(255,100,100);
    ellipse(205,height-205+100,16,16);//MAP上表記
    }
    
    xS++;   
  if(Enemys[47].broken==true &&Enemys[48].broken==true&&Enemys[49].broken==true&&Enemys[50].broken==true)feared=true;

  noStroke();
  pushMatrix();
  translate(x-positionX+x0,y-positionY+y0,0);
  rotateZ(radians(45-xS/4));
  
  
if(textsize<75){
fill(255,100+xS*5%56,100+xS*13%56,textsize*2);
}else{
fill(255,100+xS*5%56,100+xS*13%56,150);
}
if(feared==true)fill(255,0,200,150);

    if(dist(positionX,positionY,x,y)<=220 && broken== false &&textsize>70 )  {
      if(tackle==true && overheat == 1 && death==false && feared==true){
      broken=true;
           //  SEbroken.play();
      }else {
        death=true;
  }
    }
    
    
    if(broken==false){
pointLight(155,155,155,0,0,200);
  


beginShape();
vertex(0,0,50);
vertex(37,37,0);
vertex(50,25,0);
vertex(50,-25,0);
vertex(37,-37,0);
endShape(CLOSE);

beginShape();
vertex(0,0,50);
vertex(-37,37,0);
vertex(-50,25,0);
vertex(-50,-25,0);
vertex(-37,-37,0);
endShape(CLOSE);

beginShape();
vertex(0,0,50);
vertex(37,37,0);
vertex(25,50,0);
vertex(-25,50,0);
vertex(-37,37,0);
endShape(CLOSE);

beginShape();
vertex(0,0,50);
vertex(37,-37,0);
vertex(25,-50,0);
vertex(-25,-50,0);
vertex(-37,-37,0);
endShape(CLOSE);

//一段目
beginShape();
vertex(0,0,75);
vertex(50,50,0);
vertex(75,37,0);
vertex(75,-37,0);
vertex(50,-50,0);
endShape(CLOSE);

beginShape();
vertex(0,0,75);
vertex(-50,50,0);
vertex(-75,37,0);
vertex(-75,-37,0);
vertex(-50,-50,0);
endShape(CLOSE);

beginShape();
vertex(0,0,75);
vertex(50,50,0);
vertex(37,75,0);
vertex(-37,75,0);
vertex(-50,50,0);
endShape(CLOSE);

beginShape();
vertex(0,0,75);
vertex(50,-50,0);
vertex(37,-75,0);
vertex(-37,-75,0);
vertex(-50,-50,0);
endShape(CLOSE);



//ここまでまんなか 
  rotateZ(radians(xS*3));

beginShape();
vertex(0,0,0);
vertex(-150,-90,0);
vertex(-150,-150,10);
endShape(CLOSE);

beginShape();
vertex(-90,-150,0);
vertex(-150,-150,10);
vertex(0,0,0);
endShape(CLOSE);

beginShape();
vertex(-90,-150,0);
vertex(-150,-90,0);
vertex(0,0,0);
endShape(CLOSE);

beginShape();
vertex(-90,-150,0);
vertex(-150,-90,0);
vertex(-150,-150,10);
endShape(CLOSE);

//ここまでひだりうえ

  
beginShape();
vertex(0,0,0);
vertex(150,-90,0);
vertex(150,-150,10);
endShape(CLOSE);

beginShape();
vertex(90,-150,0);
vertex(150,-150,10);
vertex(0,0,0);
endShape(CLOSE);

beginShape();
vertex(90,-150,0);
vertex(150,-90,0);
vertex(0,0,0);
endShape(CLOSE);

beginShape();
vertex(90,-150,0);
vertex(150,-90,0);
vertex(150,-150,10);
endShape(CLOSE);


//ここまでうえみぎ


beginShape();
vertex(0,0,0);
vertex(150,90,0);
vertex(150,150,10);
endShape(CLOSE);

beginShape();
vertex(90,150,0);
vertex(150,150,10);
vertex(0,0,0);
endShape(CLOSE);

beginShape();
vertex(90,150,0);
vertex(150,90,0);
vertex(0,0,0);
endShape(CLOSE);

beginShape();
vertex(90,150,0);
vertex(150,90,0);
vertex(150,150,10);
endShape(CLOSE);



//ここまでみぎした

beginShape();
vertex(0,0,0);
vertex(-150,90,0);
vertex(-150,150,10);
endShape(CLOSE);

beginShape();
vertex(-90,150,0);
vertex(-150,150,10);
vertex(0,0,0);
endShape(CLOSE);

beginShape();
vertex(-90,150,0);
vertex(-150,90,0);
vertex(0,0,0);
endShape(CLOSE);

beginShape();
vertex(-90,150,0);
vertex(-150,90,0);
vertex(-150,150,10);
endShape(CLOSE);
//ここまで
  
  
  rotateZ(radians(xS*-10));
  beginShape();
vertex(0,0,0);
vertex(-150,-90,0);
vertex(-150,-150,10);
endShape(CLOSE);

beginShape();
vertex(-90,-150,0);
vertex(-150,-150,10);
vertex(0,0,0);
endShape(CLOSE);

beginShape();
vertex(-90,-150,0);
vertex(-150,-90,0);
vertex(0,0,0);
endShape(CLOSE);

beginShape();
vertex(-90,-150,0);
vertex(-150,-90,0);
vertex(-150,-150,10);
endShape(CLOSE);

//ここまでひだりうえ

  
beginShape();
vertex(0,0,0);
vertex(150,-90,0);
vertex(150,-150,10);
endShape(CLOSE);

beginShape();
vertex(90,-150,0);
vertex(150,-150,10);
vertex(0,0,0);
endShape(CLOSE);

beginShape();
vertex(90,-150,0);
vertex(150,-90,0);
vertex(0,0,0);
endShape(CLOSE);

beginShape();
vertex(90,-150,0);
vertex(150,-90,0);
vertex(150,-150,10);
endShape(CLOSE);


//ここまでうえみぎ


beginShape();
vertex(0,0,0);
vertex(150,90,0);
vertex(150,150,10);
endShape(CLOSE);

beginShape();
vertex(90,150,0);
vertex(150,150,10);
vertex(0,0,0);
endShape(CLOSE);

beginShape();
vertex(90,150,0);
vertex(150,90,0);
vertex(0,0,0);
endShape(CLOSE);

beginShape();
vertex(90,150,0);
vertex(150,90,0);
vertex(150,150,10);
endShape(CLOSE);



//ここまでみぎした

beginShape();
vertex(0,0,0);
vertex(-150,90,0);
vertex(-150,150,10);
endShape(CLOSE);

beginShape();
vertex(-90,150,0);
vertex(-150,150,10);
vertex(0,0,0);
endShape(CLOSE);

beginShape();
vertex(-90,150,0);
vertex(-150,90,0);
vertex(0,0,0);
endShape(CLOSE);

beginShape();
vertex(-90,150,0);
vertex(-150,90,0);
vertex(-150,150,10);
endShape(CLOSE);
//ここまで
    }else{
    KX++;KY++;
      
      fill(255,60,60,255-KX);
   

      noStroke();
      KX=KX+1;KY=KY+1;
  pushMatrix();
              translate(x-positionX+KX,y-positionY+KY,0);
                rotateY(radians(KY));
       box(70,70,70);
       beginShape();
vertex(0,0,0);
vertex(-150,90,0);
vertex(-150,150,10);
endShape(CLOSE);

beginShape();
vertex(-90,150,0);
vertex(-150,150,10);
vertex(0,0,0);
endShape(CLOSE);

beginShape();
vertex(-90,150,0);
vertex(-150,90,0);
vertex(0,0,0);
endShape(CLOSE);

beginShape();
vertex(-90,150,0);
vertex(-150,90,0);
vertex(-150,150,10);
endShape(CLOSE);
         popMatrix();
           pushMatrix();
              translate(x-positionX-KX,y-positionY+KY,0);
                     rotateY(radians(-KY));
       box(50,50,50);
       beginShape();
vertex(0,0,0);
vertex(150,-90,0);
vertex(150,-150,10);
endShape(CLOSE);

beginShape();
vertex(90,-150,0);
vertex(150,-150,10);
vertex(0,0,0);
endShape(CLOSE);

beginShape();
vertex(90,-150,0);
vertex(150,-90,0);
vertex(0,0,0);
endShape(CLOSE);

beginShape();
vertex(90,-150,0);
vertex(150,-90,0);
vertex(150,-150,10);
endShape(CLOSE);
         popMatrix();
           pushMatrix();
              translate(x-positionX+KX,y-positionY-KY,0);
                     rotateY(radians(KY));
       box(30,30,30);
       beginShape();
vertex(0,0,75);
vertex(50,50,0);
vertex(37,75,0);
vertex(-37,75,0);
vertex(-50,50,0);
endShape(CLOSE);

beginShape();
vertex(0,0,75);
vertex(50,-50,0);
vertex(37,-75,0);
vertex(-37,-75,0);
vertex(-50,-50,0);
endShape(CLOSE);
         popMatrix();
           pushMatrix();
              translate(x-positionX-KX,y-positionY-KY,0);
                     rotateY(radians(-KY/2));
       box(60,60,60);
       beginShape();
vertex(0,0,50);
vertex(37,37,0);
vertex(50,25,0);
vertex(50,-25,0);
vertex(37,-37,0);
endShape(CLOSE);

beginShape();
vertex(0,0,50);
vertex(-37,37,0);
vertex(-50,25,0);
vertex(-50,-25,0);
vertex(-37,-37,0);
endShape(CLOSE);

beginShape();
vertex(0,0,50);
vertex(37,37,0);
vertex(25,50,0);
vertex(-25,50,0);
vertex(-37,37,0);
endShape(CLOSE);

    popMatrix();
    pushMatrix();
    beginShape();
vertex(0,0,50);
vertex(37,-37,0);
vertex(25,-50,0);
vertex(-25,-50,0);
vertex(-37,-37,0);
endShape(CLOSE);

beginShape();
vertex(0,0,50);
vertex(-37,37,0);
vertex(-50,25,0);
vertex(-50,-25,0);
vertex(-37,-37,0);
endShape(CLOSE);

beginShape();
vertex(0,0,50);
vertex(37,37,0);
vertex(25,50,0);
vertex(-25,50,0);
vertex(-37,37,0);
endShape(CLOSE);

beginShape();
vertex(0,0,50);
vertex(37,-37,0);
vertex(25,-50,0);
vertex(-25,-50,0);
vertex(-37,-37,0);
endShape(CLOSE);

//一段目
beginShape();
vertex(0,0,75);
vertex(50,50,0);
vertex(75,37,0);
vertex(75,-37,0);
vertex(50,-50,0);
endShape(CLOSE);

beginShape();
vertex(0,0,75);
vertex(-50,50,0);
vertex(-75,37,0);
vertex(-75,-37,0);
vertex(-50,-50,0);
endShape(CLOSE);

beginShape();
vertex(0,0,75);
vertex(50,50,0);
vertex(37,75,0);
vertex(-37,75,0);
vertex(-50,50,0);
endShape(CLOSE);

beginShape();
vertex(0,0,75);
vertex(50,-50,0);
vertex(37,-75,0);
vertex(-37,-75,0);
vertex(-50,-50,0);
endShape(CLOSE);
    
    popMatrix();
    
    

    
    
    }

popMatrix();

  }//Bdisplayおわり
}
