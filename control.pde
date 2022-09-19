boolean left,right,tackle;
int window;

void mousePressed()

{
if (mouseButton == LEFT){
  if(overheat==1){
tackle=true;}

left=true; }
if (mouseButton == RIGHT){right=true; }

}

void mouseReleased()

{
  if(left == true){left =  false;}

if (mouseButton == RIGHT){right=false; }
}
