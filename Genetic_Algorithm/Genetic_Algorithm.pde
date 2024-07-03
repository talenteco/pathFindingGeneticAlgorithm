
Herd herd;
Goal goal;

int sizeScreenx = 400;
int sizeScreeny = 400;



void setup(){
size(600, 600);
herd = new Herd(3000);
goal = new Goal(300, 10);

}



void draw(){
background(255);
fill(0,255,0);
ellipse(goal.x, goal.y, 10, 10);

fill(255,0,0);
rect(0, 450, 400, 40);
rect(200, 200, 400, 40);



if (herd.checkAllDead()){
 print("Calculation Phase Start \n");
 herd.calculateFitness();
 herd.naturalSelection();
 herd.mutationOfSheeps();
print("Calculation Phase End \n");
}

else{
 print("Testing Phase \n");
herd.Update();
herd.Show();



}



}
