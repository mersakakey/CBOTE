class beam{
int x;//beamのｘ
int y;//beamのｙ
int fx;//ｘ初期位置
int fy;//y初期位置
float ark;//自機を狙う時の角度
boolean shooted = false;//うってるか否か
boolean setup;//リロード判定
int shooting = 0;//リロードまでの時間


//コンストラクターーーーーー
  beam(int x,int y){
    this.x=x;
    this.y=y;

  }
//ーーーーーーーーーーーーー
//描画処理
void display(){
 
  if(setup==false){
   setup=true;fx=x;fy=y; //リロード
  }
  
  if(dist(x,y,positionX,positionY)<50)death=true;//ボールあたったとき
  
  shooting = shooting+ 1;//リロード時間
  if(shooted == false){
  shooted = true;//撃つ
     ark=atan2(-y+positionY,-x+positionX);//自機を狙う
   }
  

    if(shooting>300){//ボールの後処理
  x=fx;
y=fy;
shooting=0;
shooted = false;
}
  
   if(x<2000 && y<1000 && x>=0 && y>=0 && death==false){
  
       fill(255);
   ellipse(x/20*4+5,y/10*2+height-205,8,8);//マップ上表記
     }

     x=int(x+cos(ark)*12);//追尾(ｘ)
   
 
   y=int(y+sin(ark)*12);//追尾（ｙ）

fill(0,200,255,150);
pushMatrix();

translate(x-positionX+x0,y-positionY+y0);//ビームの描画
sphere(15);


popMatrix();
   
}



}
