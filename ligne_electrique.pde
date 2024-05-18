public class File{
  private double h1, h2, l, fl, POINTS_COUNT=30.0, beta, ro, g, alpha, lambda, eps=0.001;
  public File(double h1, double h2, double l, double fl){
    this.h1=h1;
    this.h2=h2;
    this.l=l;
    this.fl=fl;
    beta=atanh((h2-h1)/fl);
    ro=0.1;
    g=9.81;
    alpha=newtonRaphson(l/10.0);
    lambda= alpha* Math.cosh(-ro * g * l/(2*alpha) + beta) - h1*ro*g;
  }
  
  private double atanh(double x){
    assert x>-1 && x <1;
    return 0.5 * Math.log((1+x)/(1-x));
 }

  private double func(double x){
     return alpha/(ro*g) * Math.cosh(ro*g*x/alpha + beta) - lambda/(ro*g);
  }
  
  private double funcAlpha(double x){
  
      return fl - 2*x/(ro*g) * Math.sinh(ro*g*l/(2*x)) *  Math.cosh(beta) ;
  }
  
  private double derivFuncAlpha(double x){
    return -2/(ro*g) * Math.cosh(beta) * (Math.sinh(ro*g*l/(2*x)) - ro * g * l/(2 * x) * Math.cosh(ro*g*l/(2*x)));
  }
  
  // Function to find the root
  private double newtonRaphson(double x){
      
      double h = funcAlpha(x) / derivFuncAlpha(x);
      while (Math.abs(h) >= eps)
      {
          h = funcAlpha(x)/derivFuncAlpha(x);
    
          // x(i+1) = x(i) - f(x) / f'(x)  
          x = x - h;
      }
   
      return x;
  }
  
  public PShape generateShape(){

    PShape file=createShape();
    file.beginShape(LINES);
    file.stroke(0);
    for(int i=0; i<POINTS_COUNT; i++){
      double x = i * l/POINTS_COUNT - l/2;
      float z = (float) func(x);
      //print("x = " + x + " z = " + z);
      file.vertex((float)x, 0, z);
      x = (i+1) * l/POINTS_COUNT - l/2;
      file.vertex((float)x, 0, (float) func(x));
    }
    file.endShape();
    
    return file;
  }
}

/*
=========================== Documentation ===================================
Le file s'affiche sur le plan (x, z)
les pylones sont en direction z+
le premier pylone est sur (-l/2, 0), 
le deuxieme pylon est sur (l/2, 0),
h1:  la hauteur du pylon au (-l/2, 0)
h2: la hauteur du pylon au (l/2, 0)
l: la distance entre les deux pylons
fl: la longeure du pylon

Si tu veux changer la masse du file, change 'ro', (ro=masse/longeur_file)
=========================== exemple du setup =================================
  File f = new File(50, 150, 100, 600);
  PShape shape = f.generateShape();
  //appliquer les rotations, translations, ...
  Shape(shape);

*/
