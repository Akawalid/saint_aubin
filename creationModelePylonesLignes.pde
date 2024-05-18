
/* 
- l'equation de la droite sur laquelle on va placer nos pylones : y = ax+b
  y = -10.75x + b en remplaçant on obtient : y = -10.75x + 315 (on definit l'intervale x c [20,40])
  
  du coup en considerons qu'on avance sur x on placera un pylon chaque 0.8 (20/25)

*/
/**
créer les 25 pylones et les lignes electrique qui les relie et renvoi tout dans un PShape 

**/
HashMap mapingLiaions;
PyloneWorldCoordinate []  pylonesObject;

PShape CreateModelePylonesEtLignes(){
  // lignes est le groupe qui contient 7 files electrique qui lie i a i+1
  PShape res,ligne,lignes,pylones;
  res = createShape(GROUP);
  pylones =  createShape(GROUP);
  lignes = createShape(GROUP);
  
  Generator g;
  
  PyloneWorldCoordinate pyloneTerrainCourant ;

  
  for (int i =0; i<24; i++){
   ligne = createShape(GROUP);
   g = new Generator(); 
   listeGen[i] = g;
   
   pyloneTerrainCourant = new PyloneWorldCoordinate(i, g); //P1
   pylonesObject[i] = pyloneTerrainCourant;
   PyloneWorldCoordinate pyloneTerrain = new PyloneWorldCoordinate(i+1, g); //P2
   
   pylones.addChild(pyloneTerrainCourant.getPylone());
        
   mapingLiaions = mapingLiaison(g);
   for (Object l1 : mapingLiaions.keySet()){
      
      PVector attache1 = pyloneTerrainCourant.getAttacheDePylone((PVector) l1);
      PVector attache2 = pyloneTerrain.getAttacheDePylone((PVector) mapingLiaions.get((PVector) l1));
      
      ligne.addChild(new LigneWorldCoordinate( attache1, attache2).getLigne());
    }
    
    lignes.addChild(ligne);
    
  }
      
  g = new Generator(); 
  listeGen[24] = g;
  
  pyloneTerrainCourant = new PyloneWorldCoordinate(24, g);
  pylonesObject[24] = pyloneTerrainCourant;
  pylones.addChild(pyloneTerrainCourant.getPylone());
  
  res.addChild(pylones);
  res.addChild(lignes);
  return res;
  
}


/**
* map les liason relier par les files
*
*/
HashMap<PVector, PVector> mapingLiaison(Generator g){
  
  HashMap<PVector, PVector> res = new HashMap<>();
  res.put(g.liaison10,g.liaison11);
  res.put(g.liaison12,g.liaison13);
  res.put(g.liaison6,g.liaison7);
  res.put(g.liaison8,g.liaison9);
  res.put(g.liaison2,g.liaison3);
  res.put(g.liaison4,g.liaison5);
  res.put(g.liaison1,g.liaison1);
  
  return res;
}
 
