class enemy {
  float x;//x座標
  float y;//ｙ座標
  float xS;//回転制御
  float yS;//回転制御
  float zS;//回転制御
  int Mcolor=155;//mapでの透明度
  int dx=7, dy=3;//ボスコアのはやさ
  float spx=0, spy=0, fbspx=0, fbspy=0;
  int py=0;//class2の追尾管理
  float z= 60;//class3の大きさ
  float KX=0;//破壊時の拡散状態のｘ
  float KY=0;//破壊時の拡散状態のy
  int beam;
  int enemyclass; //種類

  boolean broken;//破壊判定
  //-----------------------
  //コンストラクタ
  enemy(float x, float y, int enemyclass, int beam) {
    this.x=x;
    this.y=y;
    this.enemyclass=enemyclass;
    this.beam=beam;
  }
  //----------------------
  //描画処理
  void Edisplay() {


    if (dist(positionX, positionY, x+spx, y+spy)<=65+py && broken== false &&textsize>50) {
      if (tackle==true && overheat == 1 && death==false) {
        broken=true;
       // SEbroken.play();
      } else {
        death=true;
      }
    }


    switch(enemyclass) {

    case 1:

      if (KX<90) {
        if (xS<400) {
          noFill();
          stroke(255, 255-xS-KX-deathing);
          ellipse(x-positionX+x0, y-positionY+y0, xS*2+50, xS*2+50);
        }

        if (broken != true) {//描画



          if (death==false) {
            
            if(x/20*4+1<mapU &&mapU<x/20*4+7)Mcolor=305;
            
            
            Mcolor=Mcolor-2;
            stroke(255,Mcolor);
            fill(255, 255, 0,Mcolor);
            ellipse(x/20*4+5, y/10*2+height-205, 8, 8);//MAP上表記
          }
  stroke(255, 255-xS-KX-deathing);

          translate(x0, y0, 0);


          pushMatrix();//（０，０）座標保存
          translate(x-positionX, y-positionY);//座標軸変更
          fill(100+xS*3%156, 100+yS*5%156, 100+zS*13%156, 150);//色の変化
          rotateX(xS/12);//回転制御
          rotateY(yS/12);
          rotateZ(zS/12);  //ここまで
          if (textsize<60) {
            box(textsize);//描画(出現時)
          } else {
            box(60, 60, 60);
          }//描画(通常)
          popMatrix();//座標元に戻す

          xS++;
          yS++;
          zS++;
          noStroke();
        } else {

          translate(x0, y0, 0);

          fill(100, 100, 100, 255-KX*3);


          noStroke();
          KX=KX+1;
          KY=KY+1;
          pushMatrix();
          translate(x-positionX+KX, y-positionY+KY, 0);
          rotateX(radians(KX)*3);
          rotateY(radians(KY)*2);
          box(30, 30, 30);
          popMatrix();
          pushMatrix();
          translate(x-positionX-KX, y-positionY+KY, 0);
          rotateX(radians(KX*4));
          rotateY(radians(-KY));
          box(30, 30, 30);
          popMatrix();
          pushMatrix();
          translate(x-positionX+KX, y-positionY-KY, 0);
          rotateX(radians(-KX*3));
          rotateY(radians(KY*2));
          box(30, 30, 30);
          popMatrix();
          pushMatrix();
          translate(x-positionX-KX, y-positionY-KY, 0);
          rotateX(radians(-KX));
          rotateY(radians(-KY*3));
          box(30, 30, 30);
          popMatrix();
         
        }
        translate(-x0, -y0, 0);
      }
      break;
    case 2:

      py=68;

      fbspx=spx;//ひとつ前の位置
      fbspy=spy;

      if (death == false && broken == false) {
        int px=int(fbspx+cos(atan2(-y+positionY-spy, -x+positionX-spx))*3);//追尾(ｘ)


        int py=int(fbspy+sin(atan2(-y+positionY-spy, -x+positionX-spx))*3);//追尾（ｙ）

        spx=px;//位置置換
        spy=py;
      }

      if (KX<90) {
        if (xS<400) {
          noFill();
          stroke(255, 255-xS-KX-deathing);
          ellipse(x-positionX+x0, y-positionY+y0, xS*2+50, xS*2+50);
        }

        if (broken != true) {//描画

          if (death==false) {

       if((x+spx)/20*4+1<mapU &&mapU<(x+spx)/20*4+7)Mcolor=305;
            
            
            Mcolor=Mcolor-2;
            stroke(255,Mcolor);
            fill(0,0,255,Mcolor);
            ellipse((x+spx)/20*4+5, (y+spy)/10*2+height-205, 8, 8);//MAP上表記
          }
            stroke(255, 255-xS-KX-deathing);
          translate(spx, spy);


          translate(x-positionX+x0, y-positionY+y0);//座標軸変更



          if (textsize<55) {

            pushMatrix();

            stroke(255, 255-xS);


            fill(100+yS*3%155, 100+yS*5%155, 100+yS*4%155, 150);
            rotateZ(atan2(-y+positionY-spy, -x+positionX-spx)-radians(90));

            beginShape();

            vertex(xS, 0, 0);
            vertex(0, 0, xS);
            vertex(-xS, 0, 0);
            vertex(0, 0, -xS);
            vertex(0, xS, 0);
            endShape(CLOSE);

            beginShape();
            vertex(0, 0, -xS); 
            vertex(xS, 0, 0);
            vertex(0, xS*1.8, 0);
            endShape(CLOSE);

            beginShape();

            vertex(0, 0, xS); 
            vertex(-xS, 0, 0);
            vertex(0, xS*1.8, 0);
            endShape(CLOSE);


            popMatrix();
            //描画(出現時)
          } else {


            pushMatrix();




            fill(100+yS*3%155, 100+yS*5%155, 100+yS*4%155, 150);

            beginShape();


            rotateZ(atan2(-y+positionY-spy, -x+positionX-spx)-radians(90));

            vertex(55, 0, 0);
            vertex(0, 0, 55);
            vertex(-55, 0, 0);
            vertex(0, 0, -55);
            vertex(0, 55, 0);
            endShape(CLOSE);

            beginShape();

            vertex(0, 0, -55); 
            vertex(55, 0, 0);
            vertex(0, 100, 0);
            endShape(CLOSE);

            beginShape();

            vertex(0, 0, 55); 
            vertex(-55, 0, 0);
            vertex(0, 100, 0);
            endShape(CLOSE);

            popMatrix();
          }//描画(通常)


          xS++;
          yS++;
          zS++;
          noStroke();
        } else {


          translate(x0, y0, 0);

          fill(100, 100, 100, 255-KX*3);
          noStroke();
          KX=KX+1;
          KY=KY+1;
          pushMatrix();
          translate(x-positionX+KX+spx, y-positionY+KY+spy, 0);
          rotateX(radians(KX));
          rotateY(radians(KY));
          box(30, 30, 30);
          beginShape();
          vertex(55, 0, 0);
          vertex(0, 0, 55);
          vertex(-55, 0, 0);
          vertex(0, 0, -55);
          vertex(0, 55, 0);
          endShape();
          popMatrix();
          pushMatrix();
          translate(x-positionX-KX+spx, y-positionY+KY+spy, 0);
          rotateX(radians(KX));
          rotateY(radians(-KY));
          box(30, 30, 30);
          beginShape();
          vertex(0, 0, -55); 
          vertex(55, 0, 0);
          vertex(0, 100, 0);
          endShape(CLOSE);
          popMatrix();
          pushMatrix();
          translate(x-positionX+KX+spx, y-positionY-KY+spy, 0);
          rotateX(radians(-KX));
          rotateY(radians(KY));
          box(30, 30, 30);
          beginShape();

          vertex(0, 0, 55); 
          vertex(-55, 0, 0);
          vertex(0, 100, 0);
          endShape(CLOSE);


          popMatrix();
          pushMatrix();
          translate(x-positionX-KX+spx, y-positionY-KY+spy, 0);
          rotateX(radians(-KX));
          rotateY(radians(-KY));
          box(30, 30, 30);
          popMatrix();
        }
        translate(-x0, -y0, 0);

        translate(-spx, -spy);
      }
      break;

    case 3:


      if (textsize>120 && broken==false) {
        Beam[beam].display();
      }//ビーム発射
      py=40;

      if (KX<90) {
        if (xS<400) {
          noFill();
          stroke(255, 255-xS-KX*3-deathing*2);
          ellipse(x-positionX+x0, y-positionY+y0, xS*2+50, xS*2+50);
        }
          stroke(255, 255-xS-KX*3-deathing*2);
          
        if (broken != true) {//描画

          if (death==false && x<2000) {
       if(x/20*4+1<mapU &&mapU<x/20*4+7)Mcolor=305;
            
            
            Mcolor=Mcolor-2;
            stroke(255,Mcolor);
            fill(255, 0, 0,Mcolor);
            ellipse(x/20*4+5, y/10*2+height-205, 8, 8);//MAP上表記
          }
            stroke(255, 255-xS-KX-deathing);
          translate(x0, y0, 0);


          pushMatrix();//（０，０）座標保存
          translate(x-positionX, y-positionY);//座標軸変更
          fill(100+xS*3%156, 100+yS*5%156, 100+zS*13%156, 150);//色の変化
          rotateY(yS/12);//回転制御
          if (textsize<60) {
            stroke(255, 255-xS);


            fill(100+yS*3%155, 100+yS*5%155, 100+yS*4%155, 80);

            rotateY(radians(yS));

            beginShape();
            vertex(textsize, 0, 0);
            vertex(0, 0, textsize);
            vertex(0, 100, 0);
            endShape();

            beginShape();
            vertex(-textsize, 0, 0);
            vertex(0, 0, -textsize);
            vertex(0, 100, 0);
            endShape();

            beginShape();
            vertex(-textsize, 0, 0);
            vertex(0, 0, textsize);
            vertex(0, 100, 0);
            endShape();

            beginShape();
            vertex(textsize, 0, 0);
            vertex(0, 0, -textsize);
            vertex(0, 100, 0);
            endShape();

            beginShape();
            vertex(textsize, 0, 0);
            vertex(0, 0, textsize);
            vertex(0, -100, 0);
            endShape();

            beginShape();
            vertex(-textsize, 0, 0);
            vertex(0, 0, -textsize);
            vertex(0, -100, 0);
            endShape();

            beginShape();
            vertex(-textsize, 0, 0);
            vertex(0, 0, textsize);
            vertex(0, -100, 0);
            endShape();

            beginShape();
            vertex(textsize, 0, 0);
            vertex(0, 0, -textsize);
            vertex(0, -100, 0);
            endShape();

            rotateY(radians(-yS*8));
            rotateX(radians(yS/3));
            rotateZ(radians(yS/3));

            pushMatrix();
            translate(-textsize, 0, 0);
            sphere(10);
            popMatrix();

            pushMatrix();
            translate(0, 0, textsize);
            sphere(10);
            popMatrix();

            pushMatrix();
            translate(0, 0, -textsize);
            sphere(10);
            popMatrix();

            pushMatrix();
            translate(textsize, 0, 0);
            sphere(10);
            popMatrix();
          }//描画(出現時)
          else {




            fill(100+yS*3%155, 100+yS*5%155, 100+yS*4%155, 150);

            rotateY(radians(yS/1.5));

            beginShape();
            vertex(z, 0, 0);
            vertex(0, 0, z);
            vertex(0, 100, 0);
            endShape();

            beginShape();
            vertex(-z, 0, 0);
            vertex(0, 0, -z);
            vertex(0, 100, 0);
            endShape();

            beginShape();
            vertex(-z, 0, 0);
            vertex(0, 0, z);
            vertex(0, 100, 0);
            endShape();

            beginShape();
            vertex(z, 0, 0);
            vertex(0, 0, -z);
            vertex(0, 100, 0);
            endShape();

            beginShape();
            vertex(z, 0, 0);
            vertex(0, 0, z);
            vertex(0, -100, 0);
            endShape();

            beginShape();
            vertex(-z, 0, 0);
            vertex(0, 0, -z);
            vertex(0, -100, 0);
            endShape();//

            beginShape();
            vertex(-z, 0, 0);
            vertex(0, 0, z);
            vertex(0, -100, 0);
            endShape();

            beginShape();
            vertex(z, 0, 0);
            vertex(0, 0, -z);
            vertex(0, -100, 0);
            endShape();

            rotateY(radians(-yS*14));
            rotateX(radians(yS/2));
            rotateZ(radians(yS/2));

            pushMatrix();
            translate(-90, 0, 0);
            sphere(10);
            popMatrix();

            pushMatrix();
            translate(0, 0, 90);
            sphere(10);
            popMatrix();

            pushMatrix();
            translate(0, 0, -90);
            sphere(10);
            popMatrix();

            pushMatrix();
            translate(90, 0, 0);
            sphere(10);
            popMatrix();
          }//描画(通常)
          popMatrix();//座標元に戻す

          xS++;
          yS++;
          zS++;
          noStroke();
        } else {

          translate(x0, y0, 0);

          fill(100, 100, 100, 255-KX*3);
          noStroke();
          KX=KX+1;
          KY=KY+1;
          pushMatrix();
          translate(x-positionX+KX, y-positionY+KY, 0);
          rotateX(radians(KX));
          rotateY(radians(KX));
          box(30, 30, 30);
          beginShape();
          vertex(z, 0, 0);
          vertex(0, 0, z);
          vertex(0, 100, 0);
          endShape();
          popMatrix();
          pushMatrix();
          translate(x-positionX-KX, y-positionY+KY, 0);
          rotateX(radians(KX));
          rotateY(radians(-KY));
          box(30, 30, 30);
          beginShape();
          vertex(-z, 0, 0);
          vertex(0, 0, -z);
          vertex(0, 100, 0);
          endShape();
          popMatrix();
          pushMatrix();
          translate(x-positionX+KX, y-positionY-KY, 0);
          rotateX(radians(-KX));
          rotateY(radians(KY));
          box(30, 30, 30);
          beginShape();
          vertex(z, 0, 0);
          vertex(0, 0, z);
          vertex(0, -100, 0);
          endShape();
          popMatrix();
          pushMatrix();
          translate(x-positionX-KX, y-positionY-KY, 0);
          rotateX(radians(-KX));
          rotateY(radians(-KY));
          box(30, 30, 30);
          beginShape();
          vertex(-z, 0, 0);
          vertex(0, 0, -z);
          vertex(0, -100, 0);
          endShape();
          popMatrix();
        }
        translate(-x0, -y0, 0);
      }

      break;

    case 4:



      if (KX<90) {
        if (xS<400) {
          noFill();
          stroke(255, 255-xS-KX-deathing);
          ellipse(x-positionX+x0, y-positionY+y0, xS*2+50, xS*2+50);
        }

        if (broken != true) {//描画

          if (x<0) {
            dx=7;
          } else if (x>2000) {
            dx=-7;
          }
          x=x+dx;
          if (death==false) {
       if(x/20*4+1<mapU &&mapU<x/20*4+7)Mcolor=305;
            
            
            Mcolor=Mcolor-2;
            stroke(255,Mcolor);
            fill(255, 255, 0,Mcolor);
            ellipse(x/20*4+5, y/10*2+height-205, 8, 8);//MAP上表記
          }
          stroke(255, 255-xS-KX*3-deathing*2);

          translate(x0, y0, 0);


          pushMatrix();//（０，０）座標保存
          translate(x-positionX, y-positionY);//座標軸変更
          fill(255, 10+yS*5%156, 10+zS*13%156, 150);//色の変化
          rotateX(xS/12);//回転制御
          rotateY(yS/12);
          rotateZ(zS/12);  //ここまで
          if (textsize<60) {
            box(textsize);//描画(出現時)
          } else {
            box(60, 60, 60);
          }//描画(通常)
          popMatrix();//座標元に戻す

          xS++;
          yS++;
          zS++;
          noStroke();
        } else {

          translate(x0, y0, 0);

          fill(255, 60, 60, 255-KX*3);


          noStroke();
          KX=KX+1;
          KY=KY+1;
          pushMatrix();
          translate(x-positionX+KX, y-positionY+KY, 0);
          rotateX(radians(KX)*3);
          rotateY(radians(KY)*2);
          box(30, 30, 30);
          popMatrix();
          pushMatrix();
          translate(x-positionX-KX, y-positionY+KY, 0);
          rotateX(radians(KX*4));
          rotateY(radians(-KY));
          box(30, 30, 30);
          popMatrix();
          pushMatrix();
          translate(x-positionX+KX, y-positionY-KY, 0);
          rotateX(radians(-KX*3));
          rotateY(radians(KY*2));
          box(30, 30, 30);
          popMatrix();
          pushMatrix();
          translate(x-positionX-KX, y-positionY-KY, 0);
          rotateX(radians(-KX));
          rotateY(radians(-KY*3));
          box(30, 30, 30);
          popMatrix();
        }
        translate(-x0, -y0, 0);
      }
      break;
    }
  }
}
