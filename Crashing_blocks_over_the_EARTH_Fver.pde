//このプログラムはsoundライブラリを使用しています
//実行する際はsoundライブラリをインストールしてから実行してください

//soundライブラリがバージョンの関係でアレなんでいらないです


//import processing.sound.*;//Soundライブラリをインポート

/*SoundFile BGMdeardragon, //Sound変数の定義
  BGMtitle, 
  SEbroken, 
  SEalarm, 
  SEstarted, 
  SEwave, 
  SEchoice;//ここまで
  */


int energy=300; //エネルギー
int wave =0;//現在のウェーブ
int first =0;//最初の間
int textsize = 0;//ウェーブ開始時からのカウント
int title=0;//タイトル画面か否か
int titleblack=0;//タイトル画面の暗転用
int waiting=0; //WAVE間待機時間
int deathing=0;//死んでる時の処理用
int difficult=0;//難易度
  int mapU;//map上での点滅
boolean death;//死んでるか否か
boolean started=false; //始まってるか否か
boolean cleared =false;//WAVEクリア判定

  float x0=650,y0=350;

float n, //マウスの位置
  positionX=1000, //現在地のx座標
  positionY=500, //現在地のy座標a
  boost=1, //加速時の倍率
  zikan=0, //時間計測
  mapx, //マップのx
  mapy, //マップのｙ
  lagx, //マップ範囲の縮小
  lagy, //同上

  tackling=0, //タックル制御用

  overheat, //オーバーヒート時の速度倍率
  overheating, //オーバーヒート待機時間

  eyex, //red point x
  eyey;//red point y

PImage  EARTH ;//イメージをインポート


enemy[] Enemys=new enemy[55];//５３個のブロックのclassを生成

beam [] Beam=new beam[11];//びーむ


boss Boss;//新たなbossクラスを定義



void setup() {
  size(1300, 700, P3D);
  frameRate(60);//frameRate変更用

  /*SEbroken = new SoundFile(this, "broken.wav");//SEインポート
  SEstarted = new SoundFile(this, "started.mp3");
  SEchoice = new SoundFile(this, "choice.mp3");
  BGMdeardragon = new SoundFile(this, "deardragon.mp3");//ここまで
  BGMtitle= new SoundFile(this, "tomoshibi.mp3");
  SEalarm=new SoundFile(this, "alarm.mp3");
  SEwave=new SoundFile(this, "wave.mp3");
  */


  for (int i=0; i<30; i++) {
    Ef[i]=new effect();//エフェクトクラス生成
  }

  Boss = new boss(1000, 500);
  for (int i=0; i<1000; i=i+1) { //星の座標設定
    starsX[i] = int (random(6000));
    starsY[i] = int (random(3000));//ここまで
  }

  PFont myFont = loadFont("Popstarregular-48.vlw");//フォントインポート
  textFont(myFont);//font


  EARTH = loadImage("EARTH.png");//地球読み取り

  Beam[0] = new beam(1000, 500); //ビーム座標
  Beam[1] = new beam(1800, 200);
  Beam[2] = new beam(200, 200);
  Beam[3] = new beam(1000, 850);
  Beam[4] = new beam(1800, 850);
  Beam[5] = new beam(200, 850);
  Beam[6] = new beam(1000, 150);
  Beam[7] = new beam(2200, -200);
  Beam[8] = new beam(-200, 1200);
  Beam[9] = new beam(-200, -200);
  Beam[10] = new beam(2200, 1200);  //ここまで



  for (int i=0; i<40; i++) { //ブロック生成


    if (i<30) { //ふつうのブロックのインスタンスを生成
      Enemys[i] = new enemy(random(100, 1900), random(50, 950), 1, 11);
    }//ここまで

    Enemys[30] = new enemy(100, 100, 2, 11);//さんかくブロックのインスタンスを生成
    Enemys[31] = new enemy(100, 100, 2, 11);
    Enemys[32] = new enemy(1900, 950, 2, 11);
    Enemys[33] = new enemy(1900, 100, 2, 11);
    Enemys[34] = new enemy(100, 950, 2, 11);
    Enemys[35] = new enemy(1000, 900, 2, 11);//ここまで

    if (i>=36 && i<40) {
      Enemys[i] = new enemy(random(100, 1900), random(50, 950), 2, 11);
    }
  }
  Enemys[40] = new enemy(1000, 500, 3, 0);//ぷりずむブロックのインスタンスを生成
  Enemys[41] = new enemy(1800, 200, 3, 1);
  Enemys[42] = new enemy(200, 200, 3, 2);
  Enemys[43] = new enemy(1000, 850, 3, 3);
  Enemys[44] = new enemy(1800, 850, 3, 4);
  Enemys[45] = new enemy(200, 850, 3, 5);
  Enemys[46] = new enemy(1000, 150, 3, 6);//ここまで

  Enemys[47]=new enemy(100, 200, 4, 11);//ぼすこあブロックのインスタンス生成
  Enemys[48]=new enemy(1800, 400, 4, 11);
  Enemys[49]=new enemy(1300, 600, 4, 11);
  Enemys[50]=new enemy(500, 800, 4, 11);//ここまで


  Enemys[51]=new enemy(2200, -200, 3, 7);//ボス面ぷりずむブロックのインスタンスを生成
  Enemys[52]=new enemy(-200, 1200, 3, 8); 
  Enemys[53]=new enemy(-200, -200, 3, 9);  
  Enemys[54]=new enemy(2200, 1200, 3, 10); //ここまで
}//敵インスタンス生成ここまで


void draw() {

  background(0);
  switch(title) {

  case 0:
    //if (frameCount<2)BGMtitle.play();
    textSize(110);
    fill(255, 255, 255, frameCount-50);//タイトル
    text("Crashing", 100, 120);
    fill(255, 255, 255, frameCount-80);
    text("Brocks", 240, 205);
    fill(255, 255, 255, frameCount-110);
    text("Over", 410, 290);
    fill(255, 255, 255, frameCount-140);
    text("The", 500, 375);    
    tint( 255, 255, 255, frameCount-170 );
    stroke(20, 50, 255, frameCount-170);
    noFill();//ここまでタイトル
    for (int i=0; i<30; i++) {
      if (frameCount<425) {
        stroke(20, 50, 255, frameCount-170-sqrt(i)*50-titleblack);//暗転
      } else {
        stroke(20, 50, 255, 255-sqrt(i)*50-titleblack);//地球光用
      }

      ellipse(995, 220, 350+i, 350+i);//地球の周りのわっか
    }
    image(EARTH, 820, 45, 350, 350);//ここまで
    
    pushMatrix();
    stroke(255);
    translate(250,300,50);
    if(frameCount<250){
              fill(100+frameCount%156, 100+frameCount*5%156, 100+frameCount*13%156, frameCount-100);//色の変化
    }else{
                  fill(100+frameCount%156, 100+frameCount*5%156, 100+frameCount*13%156, 150);//色の変化(変化後)
    }
          rotateX(radians(frameCount));//回転制御
          rotateY(radians(frameCount));
          rotateZ(radians(frameCount));  //ここまで
          if(titleblack<80){
            box(80-titleblack);//タイトルのブロックを描画
          }
            noStroke();
            popMatrix();




    if (mouseX>530&&mouseX<750&&mouseY>515&&mouseY<550||started==true) {//スタート
      fill(255, 255, 0);
      textSize(60);
      text("START", 500, 555);//マウス乗ってる時
      if (left==true) {
        started=true;
      }
    } else {         
      fill(55, 55, 255);//マウス乗ってないとき
      textSize(50);
      text("START", 525, 550);
    }

    if (difficult==0) {
      textSize(45);
      fill(255);
      text("normal", 408, 590);//難易度表示
      fill(255, 80);
      text("hard", 660, 590);
    } else {
      textSize(45);
      fill(255, 80);
      text("normal", 408, 590);
      fill(255);
      text("hard", 660, 590);//ここまで
    }
    if (left == true && difficult==0 && started==false 
      && mouseX>660 && mouseX<840 && mouseY < 590 && mouseY>560
      ) {
      difficult=1;
      //SEchoice.play();//難易度設定時(ハード)
    }
    if (left==true && difficult==1 && started==false 
      && mouseY < 590 && mouseY>560  && mouseX>408 && mouseX <678
      ) {
      difficult=0;
      //SEchoice.play();//難易度設定時(ノーマル)
    }



    if (started==true) {//暗転処理
      //if (titleblack<1)SEstarted.play();
      titleblack=titleblack+1;
      fill(0, titleblack*2);
      rect(-10, -10, width+20, height+20);  
      if (titleblack>255) {
        title=1;
       // BGMtitle.stop();
      }
    }





    fill(255);
    break;
  case 1://ゲーム開始

   // if (zikan<1)BGMdeardragon.play();//BGM開始
    if (wave!=7) {
      zikan=zikan+1;//タイムアタック用時間表示の変数
    }

    noStroke();

    hint(DISABLE_DEPTH_TEST);//奥行きの設定を一時取り消し



    for (int i=0; i<1000; i=i+1) {//星の描画
      stroke(255);

      if (dist(int((starsX[i]-positionX)/(2+i%4)), (starsY[i]-positionY)/(2+i%4), (5000-positionX)/5+512, (2700-positionY)/5+512)>512) {

          star(int(starsX[i]-positionX)/(2+i%4), int(starsY[i]-positionY)/(2+i%4));//星を描画
        }}
        noStroke();
    //ここまで





    image(EARTH, (5000-positionX)/5, (2700-positionY)/5);//地球の描写

    for (int i=0; i<60; i++) {
      noFill();
      stroke(80, 100, 205, 255-sqrt(i)*35);
      ellipse((5000-positionX)/5+512, (2700-positionY)/5+512, 1024+i, 1024+i);//周りのわっか
    }
    noTint();//戻す



    n=sqrt((mouseX-x0)*(mouseX-x0)+(mouseY-y0)*(mouseY-y0));//マウス位置計算
    eyex=(mouseX-x0)/n*35+x0;//赤点の x
    eyey=(mouseY-y0)/n*35+y0;//赤点の y

    fill(255);
    //

    if (energy>0) {//オーバーヒートしてないとき
      overheat=1;
      overheating=0;
      if (right==true && death == false) {//ブースト判定-------|
        boost=2; 
        energy=energy-2;
      } else if (death != true) {          //|
        boost=1;                           //|
        if (energy<300)energy=energy+1;    //|
      } else {
        boost=0;
      }//ブースト判定ここまで-
    } else {//オーバーヒートしたとき
      boost=1;
      overheat=0.3;
      overheating++;
      //if (overheating==1)SEalarm.play();

      fill(255, 0, 0, 255-overheating*15%255);//点滅の色指定
      rect(width-80, 20, 60, 168, 10);//ゲージ点滅
      fill(255);
      if (overheating>120) { 
        energy=300;//エネルギー復活
      //  SEalarm.stop();//SEalarm
      }


      if (death== true)boost=0;//しんだとき
    }//ここまで

    if (positionX<2000 && positionY<1000 && positionX>=0 && positionY>=0
      && (mouseX!=x0 || mouseY != y0) ) {
      positionX=int(positionX+(eyex-x0)/6*boost*overheat);  //ｘ座標の進行
      positionY=int(positionY+(eyey-y0)/6*boost*overheat); //ｙ座標の進行

      if (tackle == true && energy >0 && death==false) { //タックル

        if (tackling<3) {
          positionX=positionX+(eyex-x0)*1.8;//タックル時x速度
          positionY=positionY+(eyey-y0)*1.8;//タックル時y速度
          tackling=tackling+1;
          energy=energy-40;
        } else {
          tackling=0;

          tackle=false;
        }
      }
    }//ここまで


    if (positionX <= 0) {
      positionX=positionX+10;
    }//壁に当たった時の処理ここから
    if (positionY <= 0) {
      positionY=positionY+10;
    }
    if (positionX >= 2000) {
      positionX=positionX-10;
    }
    if (positionY >= 1000) {
      positionY=positionY-10;
    }//ここまで

    if (positionY<y0+30) {//上壁

      for (int i=0; i<30; i++) {
        stroke(255, 0, 0, 255-8*i);
        line(0, y0-60-positionY+i, width,y0-60-positionY+i);
      }

      for (int i=0; i<30; i++) {
        stroke(255, 0, 0, 255-8*i);
        line(0, y0-60-positionY-i, width, y0-60-positionY-i);
        stroke(255);
      }
    }//ここまで

    if (positionY>1000-30-y0) {//下壁

      for (int i=0; i<30; i++) {
        stroke(255, 0, 0, 255-8*i);
        line(0, 1060+y0-positionY+i, width, 1060+y0-positionY+i);
      }

      for (int i=0; i<30; i++) {
        stroke(255, 0, 0, 255-8*i);
        line(0, 1060+y0-positionY-i, width, 1060+y0-positionY-i);
        stroke(255);
      }
    }//ここまで

    if (positionX<x0+30)//左壁

      for (int i=0; i<30; i++) {
        stroke(255, 0, 0, 255-8*i);
        line(x0-60-positionX+i, 0, x0-60-positionX+i,height);
        stroke(255);

        stroke(255, 0, 0, 255-8*i);
        line(x0-60-positionX-i, 0, x0-60-positionX-i,height);
      }//ここまで

    if (positionX>2000-x0-30) {//右壁

      for (int i=0; i<30; i++) {
        stroke(255, 0, 0, 255-8*i);
        line(x0+2060-positionX-i, 0, x0+2060-positionX-i,height);
      }
      for (int i=0; i<30; i++) {
        stroke(255, 0, 0, 255-8*i);
        line(x0+2060-positionX+i, 0, x0+2060-positionX+i,height);
        stroke(255);
      }
    }//ここまで



    stroke(34, 34, 255);//map本体
    fill(100, 100, 100, 150);
    rect(5, height-205, 400, 200);
    UAV(5,height-205);//mapのみどりのやつ
    stroke(255, 0, 0);//ここまで

    if ((positionX-400)*0.2 < 0) {//map端判定 (x)
      mapx=6;
      lagx=(positionX-400)*-0.2;
    } else if ((positionX-400)*0.2 > 240) {
      mapx=(positionX-400)*0.2 +5;
      lagx=(positionX-400)*0.2-240;
    } else {
      mapx=(positionX-400)*0.2+5;
      lagx=0;
    }//ここまで


    if ((positionY-300)*0.2 < 0) {//map端判定 (y)
      mapy=height-205;
      lagy=(positionY-300)*-0.2;
    } else if ((positionY-300)*0.2 > 80) {
      mapy=(positionY-300)*0.2 +height-205;
      lagy=(positionY-300)*0.2-80;
    } else {
      mapy=(positionY-300)*0.2+height-205;
      lagy=0;
    }//ここまで


    rect(mapx, mapy, 160-lagx, 120-lagy);//マップ描画
    fill(0, 0, 255);

    ellipse(positionX/20*4+5, positionY/10*2+height-205, 8, 8);//マップ内の自機




    noFill();
    for (int i=0; i<energy; i++) {//エネルギー残量
      stroke(100+(150-i), 50+i, 0);
      line(width-75, 186-i/1.85, width-25, 186-i/1.85);
    }  //ここまで
    for (int i=0; i<8; i++) {//エネルギータンクの描写
      stroke(255-i*50);
      rect(width-80+i, 20+i, 60-i*2, 168-i*2, 10);
    }



    fill(255);
    hint(ENABLE_DEPTH_TEST);

    for (int i=0; i<15; i++) {//自機回りの輪っか
      stroke(80*boost+(1-overheat)*200, //色指定
        80-(1-overheat)*117, 
        255-(boost-1)*255-(1-overheat)*364, 255-sqrt(i)*65);//ここまで
      noFill();
      if (deathing<80) ellipse(width/2, height/2, 81+i-deathing, 81+i-deathing); 
      stroke(255);
      fill(255);//ここまで
    }

    if (deathing <= 15) {
      tale(15);//しっぽ
    }




    pointLight(190, 190, 190, 370, 270, 100); //自機の描画
    if (death == false) {//死亡していないとき
      pointLight(
        80*boost+(1-overheat)*200, //R
        80-(1-overheat)*160, //G
        255-(boost-1)*255-(1-overheat)*510, //
        mouseX, mouseY, 100
        );
    }
    ambientLight(50, 50, 50);
    noStroke();
    pushMatrix();
    translate(width/2, height/2, 0);
    shininess(15.0);
    if (deathing<84)sphere(40-deathing/2);
    popMatrix();
    ;
    noStroke();//ここまで

    switch(difficult) {
    case 1://難易度hard

      switch(wave) {//ここから各WAVE設定

      case 0:
        textSize(80);
        pointLight(255, 0, 0, 320+first, 150, 100);
        text("READY?", 450, 150);

        first=first+1;

        if (first>200) {//最初の待機時間
          wave=1;
        }
        break;

      case 1:

        wavecheck(1);//WAVEの最初の処理をする関数

        for (int i=0; i<3; i++) {
          Enemys[i].Edisplay();//普通のブロック三体
        }


        clearcheck();//クリアしているかをチェックする関数


        break;
      case 2:
        wavecheck(2);

        for (int i=3; i<8; i++) {
          Enemys[i].Edisplay();//普通のブロック5体
        }
        pushMatrix();
        Enemys[30].Edisplay();//さんかくブロック
        popMatrix();
        clearcheck();

        break;

      case 3:
        wavecheck (3);
        for (int i=8; i<15; i++) {//普通のブロック7体
          Enemys[i].Edisplay();
        }
        pushMatrix();
        Enemys[40].Edisplay();//ぷりずむブロック
        popMatrix();
        pushMatrix();
        Enemys[31].Edisplay();//さんかくブロック一体目
        popMatrix();
        pushMatrix();
        Enemys[32].Edisplay();//さんかくブロック二体目
        popMatrix();
        clearcheck();

        break;
      case 4:
        wavecheck (4);

        for (int i=15; i<24; i++) {//普通のブロック9体
          Enemys[i].Edisplay();
        }
        pushMatrix();
        Enemys[41].Edisplay();//ぷりずむブロック一体目
        popMatrix();
        pushMatrix();
        Enemys[42].Edisplay();//ぷりずむブロック二体目
        popMatrix();
        pushMatrix();
        Enemys[43].Edisplay();//ぷりずむブロック三体目
        popMatrix();

        clearcheck();

        break;

      case 5:
        wavecheck (5);

        for (int i=24; i<30; i++) {//普通のブロック6体
          Enemys[i].Edisplay();
        }
        pushMatrix();
        Enemys[44].Edisplay();//ぷりずむブロック一体目
        popMatrix();
        pushMatrix();
        Enemys[45].Edisplay();//ぷりずむブロック二体目
        popMatrix();
        pushMatrix();
        Enemys[46].Edisplay();//ぷりずむブロック三体目
        popMatrix();

        pushMatrix();
        Enemys[34].Edisplay();//さんかくブロック一体目
        popMatrix();
        pushMatrix();
        Enemys[33].Edisplay();//さんかくブロック二体目
        popMatrix();

        clearcheck();
        break;

      case 6:
        wavecheck (6);

        Boss.Bdisplay();

        Enemys[47].Edisplay();//コアブロック一体目

        Enemys[48].Edisplay();//コアブロック一体目

        Enemys[49].Edisplay();//コアブロック一体目

        Enemys[50].Edisplay();//コアブロック一体目
        if (cleared==false) {
          Enemys[51].Edisplay();//画面外のぷりずむブロック一体目
          Enemys[53].Edisplay();//画面外のぷりずむブロック二体目
        }

        clearcheck();
        break;

      case 7://ここでクリア
        textSize(80);
        text("clear", 400, 150);
        textSize(20);
        text("clear time", 410, 180);
        text(zikan/60, 570, 180);//タイム表示
      }
      break;

    case 0://難易度normal

      switch(wave) {//ここから各WAVE設定

      case 0:
        textSize(80);
        pointLight(255, 0, 0, 320+first, 150, 100);
        text("READY?", 450, 150);

        first=first+1;

        if (first>200) {
          wave=1;
        }
        break;

      case 1:

        wavecheck(1);

        for (int i=0; i<3; i++) {//ふつうのブロック3体
          Enemys[i].Edisplay();
        }


        clearcheck();


        break;
      case 2:
        wavecheck(2);

        for (int i=3; i<8; i++) {//ふつうのブロック5体
          Enemys[i].Edisplay();
        }
        pushMatrix();
        Enemys[30].Edisplay();//さんかくブロック
        popMatrix();
        clearcheck();

        break;

      case 3:
        wavecheck (3);
        for (int i=8; i<13; i++) {//ふつうのブロック5体
          Enemys[i].Edisplay();
        }
        pushMatrix();
        Enemys[40].Edisplay();//ぷりずむブロック
        popMatrix();

        clearcheck();

        break;
      case 4:
        wavecheck (4);

        for (int i=15; i<23; i++) {//ふつうのブロック
          Enemys[i].Edisplay();
        }
        pushMatrix();
        Enemys[32].Edisplay();//さんかくブロック一体目
        popMatrix();
        pushMatrix();
        Enemys[34].Edisplay();//さんかくブロック二体目
        popMatrix();


        clearcheck();

        break;

      case 5:
        wavecheck (5);

        for (int i=24; i<27; i++) {//ふつうのブロック3体
          Enemys[i].Edisplay();
        }
        pushMatrix();
        Enemys[41].Edisplay();//ぷりずむブロック一体目
        popMatrix();
        pushMatrix();
        Enemys[45].Edisplay();//ぷりずむブロック二体目
        popMatrix();
        pushMatrix();
        Enemys[35].Edisplay();//さんかくブロック
        popMatrix();


        clearcheck();

        break;

      case 6:
        wavecheck (6);

        Boss.Bdisplay();//ぼすブロック

        Enemys[47].Edisplay();//コアブロック一体目

        Enemys[48].Edisplay();//コアブロック二体目

        Enemys[49].Edisplay();//コアブロック三体目

        Enemys[50].Edisplay();//コアブロック四体目

        clearcheck();
        break;

      case 7://ここからクリア
        textSize(120);
        text("clear", x0, y0-200);
        textSize(40);
        text("clear time", x0+10, y0-140);
        text(zikan/60, 950, y0-140);//タイム表示
      }
      break;
    }
    textSize(12);


    if (death == true) {//死んでる時の処理
      deathing++;

      if (deathing>90) {
        textSize(30);
        fill(255, 0, 0, deathing-90);
        rect(-10, -10, width+20, height+20);
        fill(255, 255, 255, deathing-345);
        text("GAME OVER", 100, y0);
        if (deathing>600) {
         // BGMdeardragon.stop();
          exit();
        }//ここまで
      } else hibana(x0, y0);
    }

    break;
  }
}
