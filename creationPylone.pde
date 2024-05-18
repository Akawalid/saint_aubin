/**
  créer le ième pylone sur la droite -10.75 * x + 315.0
**/
public class PyloneWorldCoordinate {
  
  private float angle=PI+(float)Math.atan(-10.75);
  private float x,y,z;
  private PShape pylone;
  private int i;
  
  public PyloneWorldCoordinate(int i, Generator g){
      this.i = i;
      x = 20 + (20.0/24.0)*i; //x entre 20 et 40
      y = -10.75 * x + 315.0; // equation de la droite sur laquelle mettre les pylons
      z = getZ(x,y);
     
     g.createPylon();
     
     
     pylone = g.getShape();
     //la rotation du pylon est pour le mettre perpendiculaire sur la trajectoire des pylones qui a un coefficient d'inclainison de -10.75, donc on prend le complement à PI de l'angle de cette inclinaison, pour bien positionner 
     //le pylon, Avant la rotation le pylon s'affiche sur le plan (y, z), c'est visualisé dans le rapport (une image dans le rapport).
     pylone.rotateZ(PI+(float)Math.atan(-10.75));
     pylone.translate(x,y,z);
    
  }
  
  PShape getPylone (){
          
      return pylone;
  }
  /**
   retourne les coordonnées sur le trrain du point d'attache spécifié en argument 
  **/
  PVector getAttacheDePylone(PVector attacheLocal ){
    return new PVector(-attacheLocal.y*sin(angle)+attacheLocal.x*cos(angle) + x ,attacheLocal.y*cos(angle)+attacheLocal.x*sin(angle) + y,attacheLocal.z + z);
  }

}
