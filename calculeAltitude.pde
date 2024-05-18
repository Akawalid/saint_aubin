/**
* @param x : un point sur l'axe x du terrain
* @param y : un point sur l'axe y du terrain
* retourne l'altitude du point x,y sur le terrin, vu que x ey et y donné en parametre ne vont pas forcément être parmis un des sommets des milliers de triangles
* qui forment le terrin, une interpolation entre les z du triangle auquel appartient (x,y) est la meilleur façon de positionner nos pylons parceque le (0,0,0) du pylone n'est pas au centre
*/
float getZ (float x, float y){ // point P
  // le premier de res est indice (int) du vertex plus proche, le deuxieme et le z interpolé
  //float [] res = new float [2];
  
  PShape triangleDeP = getTriangle(x,y);
  float sumZ = 0.0;
  //PVector vertexPproche = triangleDeP.getVertex(0);
  //float distanceMin = sqrt(pow(vertexPproche.x - x,2)+pow(vertexPproche.y - y,2));  
  for (int i = 0; i<3;i++){
      PVector vertexCourant = triangleDeP.getVertex(i);
      //float distanceCourante = sqrt(pow(vertexCourant.x - x,2)+pow(vertexCourant.y - y,2));
      sumZ += vertexCourant.z;
     
  }
  
  
  return sumZ/3.0;
  
}

/**
* @param x : un point sur l'axe x du terrain
* @param y : un point sur l'axe y du terrain
* retourne le triangle auquel appartient le point (x,y,0) sur le terrin, avec ce triangle recupéré on pourra calculer l'altitude z
* de ce point sur le terrain.
* précondition : le x et y est dans la limite du terrain
*/
PShape getTriangle (float x, float y){
  
  int nbChildTerrain = terrain.getChildCount();
  PVector p = new PVector(x,y,0.0);
  
  for (int i = 0; i < nbChildTerrain; i++){
    PShape child = terrain.getChild(i);
    if (pointInChild (p , child)){
        return child;
      }
      
    }
   
   return null;

  }
  
/**
* @param p : un vertex
* @param triangle : Pshape composé de trois vertex (triangle) 
* La fonction vérifie si un vertex p appartient au triangle "triangle"
*/

boolean pointInChild (PVector p , PShape triangle){
  
  // on porjete tous sur x, y (z=0) parcequ'on a pas l'information sur le Z
  PVector t0 = new PVector(triangle.getVertex(0).x,triangle.getVertex(0).y,0.0);
  PVector t1 = new PVector(triangle.getVertex(1).x,triangle.getVertex(1).y,0.0);
  PVector t2 = new PVector(triangle.getVertex(2).x,triangle.getVertex(2).y,0.0);
  
  PVector pXy = new PVector(p.x,p.y,0);
  // on translate le triangle pour que p devienne son origine
  PVector a = PVector.sub(t0,pXy);
  PVector b = PVector.sub(t1, pXy);
  PVector c = PVector.sub(t2, pXy);
  
  // on calcule les vecteurs normaux des faces PBC, PCA, PAB
  PVector nbc = b.cross(c); 
  PVector nca = c.cross(a);
  PVector nab = a.cross(b);
  
  // maintenant si deux vecteurs normaux ont des directions opposées alors p n'appartient pas au triangle  
  if (nbc.dot(nca) < 0.0){
    return false;
  }
  
  if (nbc.dot(nab) < 0.0){
    return false;
  }
  
  return true;
  
  
}
