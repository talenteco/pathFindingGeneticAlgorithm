

class Sheep{

  PVector pos;
  PVector vel;
  PVector acc;
  SheepBrain sheepBrain;
  
  boolean dead = false;
  boolean reachedGoal = false;
  float fitness =0;
  
  Sheep(){  //Constructor to initialise the Sheep's position, velocity and acceleration
  
  pos = new PVector(width/2, height-20);
  vel = new PVector(0,0);
  acc= new PVector(0,0);
  sheepBrain = new SheepBrain(400);
  
  }
  
  void Show(){ //How the sheep appear on the screen
  fill(0);
  ellipse(pos.x, pos.y, 4, 4);
  
  }
  
  void Move(){  //Changing the velocity according to the forces applied and, then the position according to the current velocity
    
    if (sheepBrain.directions.length> sheepBrain.step){
    acc = sheepBrain.directions[sheepBrain.step];
    sheepBrain.step++;
    } else {
      dead = true; 
    }    
    vel.add(acc);
    vel.limit(5); //setting max speed
    pos.add(vel);
  }
  
  void Update(){
    if(!dead && !reachedGoal){
      Move();
  
      if(pos.x<2 || pos.y<2 || pos.x>width-2 || pos.y>height-2){
      dead = true;  
      } else if(dist(pos.x, pos.y, goal.x, goal.y)<5){
      reachedGoal = true;
      } else if(pos.x<400 && pos.y<490 && pos.y>450){
      
        dead = true;
      }else if(pos.x>200 && pos.y>200 && pos.y<240){
      
        dead = true;
      } 
      
    }
  }
  
  void calculateFitnessFunction(){
  
    if(reachedGoal){
    
    fitness =1/16.0  + 10000.0/(float)(sheepBrain.step*sheepBrain.step);
    
    
    }
    
    
    
  else{float distanceFromTheGoal = dist(pos.x, pos.y, goal.x, goal.y);
  
  fitness = 1/(distanceFromTheGoal * distanceFromTheGoal);
  }
  }
  
  Sheep getBaby(){
  
    Sheep baby =  new Sheep();
    baby.sheepBrain = sheepBrain.clone();
    return baby;
  
  }



}
