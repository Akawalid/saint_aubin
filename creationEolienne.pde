/**
  Permet d'afficher une eolienne aux coordonées spécifiés en arguments avec la fonction displayEolienne()
  le PShape récupéré avec getEolienne n'est pas positionné sur le terrain parce que la translation doit etre faite 
  après g.animate()et cela se fait dans displayEolienne()
**/

public class EolienneWorldCoordinate {
   private eolienneGenerator g;
   private float x,y,z; // coordonnées de l'eolienne
   private PShape eolienne;
  
   private PVector attache;
  
  public EolienneWorldCoordinate(float x, float y, float z){
    this.g = new eolienneGenerator();
    g.scalee(0.005);
    this.eolienne = g.getShape();
    this.x = x;
    this.y = y ;
    this.z = z;
    
    PVector attacheLocale = g.getLiaison();
    
    attache = new PVector(x + attacheLocale.x , y + attacheLocale.y ,getZ(x,y) + attacheLocale.z);

    

  }
  
  PShape getEolienne (){
          
      return this.eolienne;
  }
  /**
   retourne les coordonnées sur le trrain du point d'attache 
  **/
  PVector getAttache( ){
    return attache;
  }
  
  /**
  affiche l'eolienne sur l'écrans en faisant les transformations necessaire
  **/
  void displayEolienne(){
    this.g.animate(PI/16);
    this.eolienne.translate(x, y,z);
    shape(this.eolienne);
    this.eolienne.translate(-x, -y,-z);
  }

}
