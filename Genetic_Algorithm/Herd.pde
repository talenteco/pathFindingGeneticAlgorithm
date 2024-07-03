

// class to heandle multiple Sheep objects

class Herd{

  Sheep[] sheeps;
  int generation =1;
  
  
  float fitnessSum;
  Herd(int size){
    
    sheeps = new Sheep[size];
    for(int i=0; i<size; i++){
    sheeps[i] = new Sheep();
    
    } 
  }

  void Show(){
  
  for(int i = 0; i<sheeps.length;i++){
  
    sheeps[i].Show();
  }
  
  }
 
  void Update(){
  
    for(int i=0; i<sheeps.length;i++){
    
    sheeps[i].Update();
    } 
  }
  
  
  boolean checkAllDead(){
  
  for(int i =0; i<sheeps.length; i++){
    if(!sheeps[i].dead && !sheeps[i].reachedGoal)
    {
    return false;
  } }
  return true; 
 }
  
  void calculateFitness(){
   for(int i =0; i<sheeps.length; i++){
   sheeps[i].calculateFitnessFunction();     
 } 
}

  void naturalSelection(){
  
    Sheep[] newSheeps = new Sheep[sheeps.length];
  calculateFitnessSum();
  
  for(int i = 0; i< newSheeps.length; i++){
  
  //selecting parent based on fitness score
  Sheep parent = selectParent();
  //getting baby from them
   
  newSheeps[i] = parent.getBaby();  
 
  
  }
  
  sheeps = newSheeps.clone();
  generation++;
  
  }
  
  void calculateFitnessSum(){
    fitnessSum=0;
  for(int i = 0; i< sheeps.length; i++){
  fitnessSum+=sheeps[i].fitness;
  }
  }
  
  Sheep selectParent(){
  
    float rand = random(fitnessSum);
    float current =0;
    
    for(int i =0; i<sheeps.length;i++){
    current+=sheeps[i].fitness;
    
    if(current>rand){
    return sheeps[i];
    
    }
    }
    
    return null;
  }
  
  
  
  void mutationOfSheeps(){
  for(int i =0; i< sheeps.length; i++){
  
    sheeps[i].sheepBrain.mutate();
  
  }
  
  
  
  
  }

}
