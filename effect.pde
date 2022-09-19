class effect{

int x,y;
int latex,latey;
float Sp=0,Dp=10;
float rd =radians(random(360));
int laterC=0;
float [] later = new float [30];
//コンストラクターーーーーーーーーーー

effect(){
}
//-------------------------------------
void display(float x,float y){
 if(laterC<61) laterC++;
  if(laterC<60){later[laterC%30]=Sp;
     
 
  Dp=Dp+Dp/8;
  Sp=Sp+150/Dp;
for(int i=0;i<30;i++){
 pushMatrix();
translate(x,y);
rotate(rd);
stroke(150,i*20);
  star(later[i],later[i]);
  popMatrix();
 
}}else{
Dp=10;
Sp=0;
}

}
}
