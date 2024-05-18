// pylones et lignes sont des PShape GROUP, et pylonesAvecLigne est un groupe qui contient pylones et lignes ( pylones, lignes,)
PShape terrain,pylonesAvecLigne;
PShader ligneNiveauShaders;
Generator [] listeGen;
ArrayList<EolienneWorldCoordinate> eoliennesObjects = new ArrayList<>();
ArrayList<PShape> ligneEolienne = new ArrayList<>();
ArrayList<PShape> eoliennesPShapes = new ArrayList<>();

boolean afficherModelePylones = true, afficherModeleLignes = true;


float xPosCam = 0, yPosCam = 50, zposCam = -170;
float zDirCam = zposCam - 20; // mm en dezoomant le vecteur direction camera regarde vers le terrain

void setup() {
  size(1500, 1100, P3D);
  terrain = loadShape("hypersimple.obj");
  
  ligneNiveauShaders = loadShader("fragmentShader.glsl", 
               "vertexShader.glsl");

  listeGen = new Generator[25];
  pylonesObject = new PyloneWorldCoordinate[25];
   
                    
  perspective(PI/3.0, width/height, 1, 1500);
 
  pylonesAvecLigne = CreateModelePylonesEtLignes();
  ////// Création des 6 éoliennes
  EolienneWorldCoordinate eolienneObject = new EolienneWorldCoordinate(40, -25.4,getZ(40,-25.4));
  EolienneWorldCoordinate eolienneObject2 = new EolienneWorldCoordinate(45, -25.4,getZ(45,-25.4));
  EolienneWorldCoordinate eolienneObject3 = new EolienneWorldCoordinate(45, -30.4,getZ(45,-30.4));
  EolienneWorldCoordinate eolienneObject4 = new EolienneWorldCoordinate(50, 75,getZ(50,75));
  EolienneWorldCoordinate eolienneObject5 = new EolienneWorldCoordinate(55, 80,getZ(55,80));
  EolienneWorldCoordinate eolienneObject6 = new EolienneWorldCoordinate(50, 85,getZ(50,85));
  
  eoliennesObjects.add(eolienneObject);
  eoliennesObjects.add(eolienneObject2);
  eoliennesObjects.add(eolienneObject3);
  eoliennesObjects.add(eolienneObject4);
  eoliennesObjects.add(eolienneObject5);
  eoliennesObjects.add(eolienneObject6);
  
  eoliennesPShapes.add(eolienneObject.getEolienne());
  eoliennesPShapes.add(eolienneObject2.getEolienne());
  eoliennesPShapes.add(eolienneObject3.getEolienne());
  eoliennesPShapes.add(eolienneObject4.getEolienne());
  eoliennesPShapes.add(eolienneObject5.getEolienne());
  eoliennesPShapes.add(eolienneObject6.getEolienne());
  ////////////
  
  /// point d'attache avec lequel sera lié l'eolinne (on choisit la liaison 1) pour le 14 ieme pylones 
  PVector attachePylone14Terrain = pylonesObject[13].getAttacheDePylone(listeGen[0].liaison1);
  /// point d'attache avec lequel sera lié l'eolinne (on choisit la liaison 1) pour le 4 ieme pylones 
  PVector attachePylone4Terrain = pylonesObject[3].getAttacheDePylone(listeGen[0].liaison1);
  int i = 0;
  // liaison entre pylone et eolienne
  for (EolienneWorldCoordinate eolienneObj : eoliennesObjects){ 
      PVector attacheEolienneTerrain = eolienneObj.getAttache();
      LigneWorldCoordinate ligne;
      if (i < 3){
         ligne = new LigneWorldCoordinate(attachePylone14Terrain,attacheEolienneTerrain);
        i++;
      }else {
         ligne = new LigneWorldCoordinate(attachePylone4Terrain,attacheEolienneTerrain);
      }
      ligneEolienne.add(ligne.getLigne());
   }
    
      
  frameRate(20);
  
  
}

void draw() {
  
  shader(ligneNiveauShaders);
  
  background(100);
  strokeWeight(1);
  translate (width/2, height/2);


  camera(xPosCam, yPosCam, zposCam, 0, -1, zDirCam, 0, 0, -1);
  
  drawAxes();
  if (afficherModelePylones){
    shape(pylonesAvecLigne.getChild(0));
  }
  for (EolienneWorldCoordinate eolienneObj : eoliennesObjects){
    eolienneObj.displayEolienne();
  }
  
  if (afficherModeleLignes){
    shape(pylonesAvecLigne.getChild(1));
    for (PShape file : ligneEolienne){ 
      shape(file);
    }  
  }
  
  shape(terrain);
}

  

/**
*  fonction qui dessine les axe du repère sur le terrain pour mieux se reperer
*/
void drawAxes(){
    
  pushMatrix();
  
  beginShape(LINES);
  // translation du centre ver le terrin (en bas dans le z vers les -200)
  translate(0,0,-195); //une bonne valeur pour que les trois axes soit visible sur le terrin
  
  // axe Y en rouge
  stroke(255,0,0);
  vertex(0,-height/2/10,0);
  vertex(0,height/2/10,0);
  
  // axe X en vert
  stroke(0,255,0);
  vertex(-height/2/10,0,0);
  vertex(height/2/10,0,0);
  
  // axe Z en bleu
  stroke(0,0,255);
  vertex(0,0,-height/2/10);
  vertex(0,0,height/2/10);
  
  endShape();
  
  popMatrix();
}
