/**
créer une ligne électrique entre deux point d'attache attache1 et attache2
 getLigne () retourne un PShape dans le repre du monde (terrain) donc qui directement bien placé
**/
public class LigneWorldCoordinate {
  
  private PShape file;


  public LigneWorldCoordinate(PVector attache1,PVector attache2){
    

      // disntance entre les points d'attaches
      //on prend la distance sur le plan (x, y) entre les deux pylones pour générer l'équation du file, car la courbe elle dépende de la distance entre les deux pylones (en 2D, pas en 3D)
      float distanceL1L2 = dist(attache1.x,attache1.y,0, attache2.x,attache2.y,0); 
      // le sol est a -202.09592
      float h1 = attache1.z - (-202.09592);
      float h2 = attache2.z - (-202.09592);
      //on génére un file avec la hauteure h1, h2, distanceL1L2 (en 2D) qui est la distance entre deux pylones, et dist(attache1.x,attache1.y,attache1.z, attache2.x,attache2.y,attache2.z)*1.05 qui represente la longueure du file qui nous permet d'avoir une visualisaiton réalistique
      File fileObject = new File(h1, h2, distanceL1L2, dist(attache1.x,attache1.y,attache1.z, attache2.x,attache2.y,attache2.z)*1.05);
       
      file = fileObject.generateShape();    
      // coef directeur pour la droite qui passe par les points d'attache
      float coef = (attache2.y - attache1.y) / (attache2.x - attache1.x);
      
      /*
        Pour chqaue pylone crée on fait une translation et une rotation.
        Les trois lignes en bas servent à créer deux point de liaison d'un file entre deux pylones, ces point de liaison sont simplement
        situé dans la meme position que les pylones plus le déplacement des cordonnée (0, 0, 0) du pylone vers les cordonnées des points de liaison qui correspondent liaisonXX
        mais avant on a fait une rotation de type cos(theta) + i* sin(theta) sur le plan (x y) pour les pylones, donc on fait la meme chose pour se positionner sur la position exacte de spoints de liaison
        la nouvelle position des points de liaison sont (x+ xPrécédent*rotationSurX, y+yPrécédent*rotationSurY, z reste le meme)
      */                                                                                      
      file.translate(distanceL1L2/2.0, 0, 0);
      file.rotateZ((float)Math.atan(coef)); 
      file.translate(attache1.x,attache1.y,-202.09592);
    
  }
  
  PShape getLigne (){
          
      return file;
  }


}
