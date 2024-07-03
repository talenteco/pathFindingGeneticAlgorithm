
//Responsible for adding Force(acceleration) to the sheep
class SheepBrain{

   PVector[] directions;
   int step = 0;
   
   SheepBrain(int size){
     directions = new PVector[size];
     randomise();
   
   
   }
   
   void randomise(){  //Initialising random acceleration vectors
   for(int i =0; i<directions.length; i++){
     
     //float randomAngle = random(2+PI);
     //print(randomAngle);
     //print("Here");
     directions[i] = PVector.random2D();
     //print(directions[i]);
     //int a =1/0;
     
     }
  }
   
   SheepBrain clone(){
   
     SheepBrain clone = new SheepBrain(directions.length);
     
     for(int i=0; i<directions.length; i++){
     clone.directions[i] = directions[i].copy();
     
     }
     return clone;
     
   }
   
   void mutate(){
   float mutationRate=0.01;
   
   for(int i=0; i<directions.length; i++){
   float rand = random(1);
   if(rand<mutationRate){
   float randomAngle = random(2+PI);
   directions[i] = PVector.fromAngle(randomAngle);
     
   }
   
   }
     
   }



}
