 //<>// //<>//
PShape p1;
public class Generator{
  private final float reduce=200;
  private final float lb=192/reduce, m2b=60/reduce, mb=77/reduce, hb=13/reduce, mh=506/reduce, lh=451/reduce, hh=155/reduce, w=297/reduce;
  private final float bratio=0.21;
  private PShape shape;
  private float xtemp, htemp, xtemp2, htemp2;
  private PVector c1;
  private boolean lightOn;
  
  public PVector liaison1, liaison2, liaison3, liaison4, liaison5, liaison6, liaison7, liaison8, liaison9, liaison10, liaison11, liaison12, liaison13;//Les pofloats de liaison avec les files
  
  public Generator(){
    shape=createShape();
    lightOn=false;
    c1=new PVector(255, 0, 0);
    liaison1=new PVector(0, 0, 0);
    liaison2=new PVector(0, 0, 0);
    liaison3=new PVector(0, 0, 0);
    liaison4=new PVector(0, 0, 0);
    liaison5=new PVector(0, 0, 0);
    liaison6=new PVector(0, 0, 0);
    liaison7=new PVector(0, 0, 0);
    liaison8=new PVector(0, 0, 0);
    liaison9=new PVector(0, 0, 0);
    liaison10=new PVector(0, 0, 0);
    liaison11=new PVector(0, 0, 0);
    liaison12=new PVector(0, 0, 0);
    liaison13=new PVector(0, 0, 0);
  }
  public float getXtemp(){return xtemp;}
  public float getHtemp(){return htemp;}
  public float getXtemp2(){return xtemp2;}
  public float getHtemp2(){return htemp2;}
  
  public void updateLights(float frmCount){
     c1.x=55*cos(frameCount/20.0)+200;
  }
  
  public void allumer(){lightOn=true;};
  public void eteigner(){lightOn=false;}
  
  private void createBaseFace(){
    shape.beginShape(LINES);
    shape.strokeWeight(1);
    //v.1
    xtemp=(lb-mb)/2;
    htemp=(float) sqrt(pow(lh, 2) - 2*pow(xtemp, 2));
    shape.vertex(0, 0, 0);
    shape.vertex(xtemp, xtemp, htemp);
    
    //v.2
    shape.vertex(0, lb, 0); 
    shape.vertex(xtemp, lb-xtemp, htemp); 
    
    //h.3
    shape.vertex(xtemp, lb-xtemp, htemp);
    shape.vertex(xtemp, xtemp, htemp);

    //h.1
    //thales applicaiton
    xtemp=xtemp*bratio;
    htemp=htemp*bratio;
    shape.vertex(xtemp, xtemp, htemp);
    shape.vertex(xtemp, lb-xtemp, htemp); 
    
    
    //h.2
    xtemp=xtemp*(1+bratio)/(2*bratio);
    htemp=htemp*(1+bratio)/(2*bratio);
    
    shape.vertex(xtemp, xtemp, htemp);
    shape.vertex(xtemp, lb-xtemp, htemp); 

    //x.1
    final float bxratio=7.5/(7.5+5);
    float xtemp2=xtemp*bxratio;
    float htemp2=htemp*bxratio;
    shape.vertex(0, 0, 0);
    shape.vertex(xtemp2, lb-xtemp2, htemp2);
    
    //x.3
    shape.vertex(xtemp2, lb-xtemp2, htemp2);
    shape.vertex(xtemp, xtemp, htemp);
    
    //x.4
    shape.vertex(xtemp, lb-xtemp, htemp);
    shape.vertex(xtemp2, xtemp2, htemp2);
    
    //x2
    shape.vertex(xtemp2, xtemp2, htemp2);
    shape.vertex(0, lb, 0);
    
    //x1+4
    htemp2=(lh+htemp)/2;
    xtemp2=(float)(xtemp*htemp2/htemp);
    shape.vertex(xtemp2, lb-xtemp2, htemp2);
    shape.vertex(xtemp, xtemp, htemp);
    
    //x.4+4
    shape.vertex(xtemp, lb-xtemp, htemp);
    shape.vertex(xtemp2, xtemp2, htemp2);
    
    //x2+4
    xtemp=(lb-mb)/2;
    htemp=(float) sqrt(pow(lh, 2) - 2*pow(xtemp, 2));
    shape.vertex(xtemp2, xtemp2, htemp2);
    shape.vertex(xtemp, lb-xtemp, htemp);
    
    //x.3+4
    shape.vertex(xtemp2, lb-xtemp2, htemp2);
    shape.vertex(xtemp, xtemp, htemp);
    
    shape.endShape();
  }
  
  private void createMiddleFace(){
      shape.beginShape(LINES);
      shape.strokeWeight(1);
      //v.1
      shape.vertex(0, 0, 0);
      shape.vertex(0, 0, mh);
      
      //v.2
      shape.vertex(0, mb, 0);
      shape.vertex(0, mb, mh);
      
     //h.1
     shape.vertex(0, mb, 0);
     shape.vertex(0, 0, 0);
     for(float i=0; i<3; i++){ 
        //x.1
        shape.vertex(0, 0, i*mh/3);
        shape.vertex(0, mb, mh/6+i*mh/3);
        
        //x.2
        shape.vertex(0, mb, i*mh/3);
        shape.vertex(0, 0, mh/6+i*mh/3);
        
        //x.3
        shape.vertex(0, 0, mh/6+i*mh/3);
        shape.vertex(0, mb, 2*mh/6+i*mh/3);
        
        //x.4
        shape.vertex(0, mb, mh/6+i*mh/3);
        shape.vertex(0, 0, 2*mh/6+i*mh/3);
     }
     //last h.1
     shape.vertex(0, mb, mh);
     shape.vertex(0, 0, mh);
     
     //triangle en dessus
     xtemp=(mb-hb)/2;
     htemp=(float) sqrt(pow(hh, 2)-2*pow(xtemp, 2));
     //v.2
     shape.vertex(0, mb, mh);
     shape.vertex(xtemp, mb-xtemp, mh+htemp);
     
     //v.1
     shape.vertex(0, 0, mh);
     shape.vertex(xtemp, xtemp, mh+htemp);
     
     //h.1
     shape.vertex(xtemp, mb-xtemp, mh+htemp);
     shape.vertex(xtemp, xtemp, mh+htemp);   
  
     //x.1
     xtemp2=xtemp/3;
     htemp2=htemp/3;
     for(float i=0; i<3; i++){
       shape.vertex(xtemp2*i, xtemp2*i, mh+i*htemp2);
       shape.vertex(xtemp2*(i+1), mb-xtemp2*(i+1), mh+htemp2*(i+1));  
    
       //x.2
       shape.vertex(xtemp2*i, mb-xtemp2*i, mh+htemp2*i);
       shape.vertex(xtemp2*(i+1), xtemp2*(i+1), mh+htemp2*(i+1));
     }
     shape.endShape();
  }
  
  private void createHolder1(){
    shape.beginShape(LINES);
    //Base
    shape.vertex(0, 0, 0);
    shape.vertex(0, w, 0);
    
    shape.vertex(mb, 0, 0);
    shape.vertex(mb, w, 0);  
    
    shape.vertex(0, 0, 0);
    shape.vertex(mb, 0, 0);
    
    shape.vertex(0, w, 0);
    shape.vertex(mb, w, 0);
    
    xtemp=(w-mb)/2;
    //lower middle holders
    shape.vertex(0, w-xtemp, 0);
    shape.vertex(mb, w-xtemp, 0);
    
    shape.vertex(0, xtemp, 0);
    shape.vertex(mb, xtemp, 0);
    
    //Higher middel holders
    
    shape.vertex(0, w-xtemp, mh/6);
    shape.vertex(mb, w-xtemp, mh/6);
    
    shape.vertex(0, xtemp, mh/6);
    shape.vertex(mb, xtemp, mh/6);
    
    //Etalic lines
    shape.vertex(mb, 0, 0);
    shape.vertex(mb, xtemp, mh/6);
    
    shape.vertex(0, 0, 0);
    shape.vertex(0, xtemp, mh/6);
    
    shape.vertex(mb, w, 0);
    shape.vertex(mb, xtemp+mb, mh/6);
    
    shape.vertex(0, w, 0);
    shape.vertex(0, xtemp+mb, mh/6);
    
    //middle middle lines
    xtemp/=2;
    shape.vertex(0, xtemp, 0);
    shape.vertex(0, xtemp, mh/6/2);
    
    shape.vertex(mb, xtemp, 0);
    shape.vertex(mb, xtemp, mh/6/2);
    
    shape.vertex(mb, xtemp, mh/6/2);
    shape.vertex(0, xtemp, mh/6/2);
    
    shape.vertex(mb, xtemp, mh/6/2);
    shape.vertex(mb, 2*xtemp, 0);
    
    shape.vertex(0, xtemp, mh/6/2);
    shape.vertex(0, 2*xtemp, 0);
    
    
    
    shape.vertex(0, w-xtemp, 0);
    shape.vertex(0, w-xtemp,mh/6/2);
    
    shape.vertex(mb, w-xtemp, 0);
    shape.vertex(mb, w-xtemp, mh/6/2);
    
    shape.vertex(mb, w-xtemp, mh/6/2);
    shape.vertex(0, w-xtemp, mh/6/2);
    
    shape.vertex(mb, w-xtemp, mh/6/2);
    shape.vertex(mb, w-2*xtemp, 0);
    
    shape.vertex(0, w-xtemp, mh/6/2);
    shape.vertex(0, w-2*xtemp, 0);
    shape.endShape();  
  }
  
    private void createHolder2(float x, float y){
    shape.beginShape(LINES);
    //Base
    shape.vertex(0, 0, 0);
    shape.vertex(0, w, 0);
    
    shape.vertex(mb, 0, 0);
    shape.vertex(mb, w, 0);  
    
    shape.vertex(0, 0, 0);
    shape.vertex(mb, 0, 0);
    
    shape.vertex(0, w, 0);
    shape.vertex(mb, w, 0);
    
    xtemp=(w-mb)/2;
    //lower middle holders
    shape.vertex(0, w-xtemp, 0);
    shape.vertex(mb, w-xtemp, 0);
    
    shape.vertex(0, xtemp, 0);
    shape.vertex(mb, xtemp, 0);
    
        //Etalic lines
    float a=y/x;
    htemp=mh/6;
    xtemp2= (float) (a*xtemp/(a-htemp/xtemp));
    htemp2= (float) (a*xtemp2 - a*xtemp);
    
    shape.vertex(mb, 0, 0);
    shape.vertex(mb-xtemp2+xtemp, xtemp2, htemp2);
    
    shape.vertex(0, 0, 0);
    shape.vertex(xtemp2-xtemp, xtemp2, htemp2);
    
    shape.vertex(mb, w, 0);
    shape.vertex(mb-xtemp2+xtemp, w-xtemp2, htemp2);
    
    shape.vertex(0, w, 0);
    shape.vertex(xtemp2-xtemp, w-xtemp2, htemp2);
    
    //middle middle lines
    xtemp/=2;
    shape.vertex(0, xtemp, 0);
    shape.vertex(0, xtemp, mh/6/2);
    
    shape.vertex(mb, xtemp, 0);
    shape.vertex(mb, xtemp, mh/6/2);
    
    shape.vertex(mb, xtemp, mh/6/2);
    shape.vertex(0, xtemp, mh/6/2);
    
    shape.vertex(mb, xtemp, mh/6/2);
    shape.vertex(mb, 2*xtemp, 0);
    
    shape.vertex(0, xtemp, mh/6/2);
    shape.vertex(0, 2*xtemp, 0);
    
    
    
    shape.vertex(0, w-xtemp, 0);
    shape.vertex(0, w-xtemp,mh/6/2);
    
    shape.vertex(mb, w-xtemp, 0);
    shape.vertex(mb, w-xtemp, mh/6/2);
    
    shape.vertex(mb, w-xtemp, mh/6/2);
    shape.vertex(0, w-xtemp, mh/6/2);
    
    shape.vertex(mb, w-xtemp, mh/6/2);
    shape.vertex(mb, w-2*xtemp, 0);
    
    shape.vertex(0, w-xtemp, mh/6/2);
    shape.vertex(0, w-2*xtemp, 0);
    
    shape.endShape();  
  }
  
  public void createPylon(){
    Generator base1 = new Generator();
    base1.createBaseFace();
    PShape pbase1=base1.getShape();
    
    Generator base2 = new Generator();
    base2.createBaseFace();
    PShape pbase2=base2.getShape();
    
    Generator base3 = new Generator();
    base3.createBaseFace();
    PShape pbase3=base3.getShape();
    
    Generator base4 = new Generator();
    base4.createBaseFace();
    PShape pbase4=base4.getShape();
    
    pbase2.rotateZ(PI/2);
    pbase2.translate(lb, 0, 0);
    
    pbase3.rotateZ(PI);
    pbase3.translate(lb, lb, 0);    
    
    pbase4.rotateZ(-PI/2);
    pbase4.translate(0, lb, 0);
  
    PShape base = createShape(GROUP);
    base.addChild(pbase1);
    base.addChild(pbase2);
    base.addChild(pbase3);
    base.addChild(pbase4);
    
    Generator middle1 = new Generator();
    middle1.createMiddleFace();
    PShape pmiddle1=middle1.getShape();
    
    Generator middle2 = new Generator();
    middle2.createMiddleFace();
    PShape pmiddle2=middle2.getShape();
    
    Generator middle3 = new Generator();
    middle3.createMiddleFace();
    PShape pmiddle3=middle3.getShape();
    
    Generator middle4 = new Generator();
    middle4.createMiddleFace();
    PShape pmiddle4=middle4.getShape();
    
    pmiddle2.rotateZ(PI/2);
    pmiddle2.translate(mb, 0, 0);
    
    pmiddle3.rotateZ(PI);
    pmiddle3.translate(mb, mb, 0);    
    
    pmiddle4.rotateZ(-PI/2);
    pmiddle4.translate(0, mb, 0);
    
    PShape middleCorps=createShape(GROUP);
    middleCorps.addChild(pmiddle1);
    middleCorps.addChild(pmiddle2);
    middleCorps.addChild(pmiddle3);
    middleCorps.addChild(pmiddle4);
    
    xtemp=base1.getXtemp();
    htemp=base1.getHtemp();
    
    middleCorps.translate(xtemp, xtemp, htemp);
    liaison1.x=xtemp+middle1.getXtemp();
    liaison1.y=xtemp+middle1.getXtemp();
    liaison1.z=htemp+middle1.getHtemp()+mh;
    PShape t = createShape();
    
    t.beginShape(LINE);
    t.stroke(255, 0, 0);
    t.vertex(liaison1.x, liaison1.y, liaison1.z);
      t.vertex(liaison1.x, liaison1.y, liaison1.z+200);
    t.endShape();
    middleCorps.addChild(t);
    Generator holder1 = new Generator();
    holder1.createHolder1();
    Generator holder2 = new Generator();
    holder2.createHolder1();
    Generator holder3 = new Generator();
    holder3.createHolder2(middle1.getXtemp(), middle1.getHtemp());
    
    PShape ph1=holder1.getShape();
    PShape ph2=holder2.getShape();
    PShape ph3=holder3.getShape();
    xtemp2=holder1.getXtemp();
    ph1.translate(xtemp, xtemp-2*xtemp2, htemp+mh/3);
    liaison2.x=xtemp;
    liaison2.y=xtemp-2*xtemp2;
    liaison2.z=htemp+mh/3;
    
    liaison3.x=xtemp+mb;
    liaison3.y=xtemp-2*xtemp2;
    liaison3.z=htemp+mh/3;
    
    liaison4.x=xtemp;
    liaison4.y=xtemp-2*xtemp2+w;
    liaison4.z=htemp+mh/3;
    
    liaison5.x=xtemp+mb;
    liaison5.y=xtemp-2*xtemp2+w;
    liaison5.z=htemp+mh/3;
    
    ph2.translate(xtemp, xtemp-2*xtemp2, htemp+2*mh/3);
    liaison6.x=xtemp;
    liaison6.y=xtemp-2*xtemp2;
    liaison6.z=htemp+2*mh/3;
    
    liaison7.x=xtemp+mb;
    liaison7.y=xtemp-2*xtemp2;
    liaison7.z=htemp+2*mh/3;
    
    liaison8.x=xtemp;
    liaison8.y=xtemp-2*xtemp2+w;
    liaison8.z=htemp+2*mh/3;
    
    liaison9.x=xtemp+mb;
    liaison9.y=xtemp-2*xtemp2+w;
    liaison9.z=htemp+2*mh/3;
    ph3.translate(xtemp, xtemp-2*xtemp2, htemp+mh);
    liaison10.x=xtemp;
    liaison10.y=xtemp-2*xtemp2;
    liaison10.z=htemp+mh;
    
    liaison11.x=xtemp+mb;
    liaison11.y=xtemp-2*xtemp2;
    liaison11.z=htemp+mh;
    
    liaison12.x=xtemp;
    liaison12.y=xtemp-2*xtemp2+w;
    liaison12.z=htemp+mh;
    
    liaison13.x=xtemp+mb;
    liaison13.y=xtemp-2*xtemp2+w;
    liaison13.z=htemp+mh;
    
    shape = createShape(GROUP);
    shape.addChild(base);
    shape.addChild(middleCorps);
    shape.addChild(ph1);
    shape.addChild(ph2);
    shape.addChild(ph3);
    
  }
  
  public PShape getShape(){return shape;}
}
