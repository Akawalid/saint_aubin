

interface Scalable{
  void scalee(float value);
  void update();
}
class Holder implements Scalable{
  private PShape p;
  public float lb=80, hb=20, h=2000,  c1=20, xtp;
  public Holder(){
    update();
  }
  
  public void scalee(float rate){
    lb*=rate;
    hb*=rate;
    h*=rate;
    c1*=rate;
    update();
  }
  public void update(){
    p=createShape();
    p.beginShape();
    p.stroke(200);
    p.strokeWeight(0.2);
    p.vertex(0, 0, 0);
    xtp=(lb-hb)/sqrt(2.0);
    p.quadraticVertex(xtp - c1, xtp - c1, h/2, xtp, xtp, h);
    p.vertex(xtp, lb-xtp, h);
    p.quadraticVertex(xtp - c1, lb - xtp + c1, h/2,0, lb, 0);
    
    
    p.vertex(lb, lb, 0);
    p.quadraticVertex(lb - xtp + c1, lb - xtp + c1, h/2, lb- xtp, lb-xtp, h);
    p.vertex(lb - xtp, xtp, h);
    p.quadraticVertex(lb - xtp + c1, xtp - c1, h/2, lb, 0, 0);
    p.endShape();
  }
  
  
  public PShape getShape(){return p;}
}

class Wing implements Scalable{
  PShape p;
  private float scaler;
  public Wing(){
    scaler=1;
    update();
  }
  
  public void scalee(float rate){
    scaler=rate;
    update();
  }
  
  public PShape getShape(){return p;}
  
  public void update(){
    p=createShape();
    p.beginShape();
      p.stroke(200);
      p.strokeWeight(0.2);
      p.vertex(0, 0, 0);
      p.bezierVertex(-5*scaler, 5*scaler, 70*scaler, -10*scaler, 10*scaler, 60*scaler , -20*scaler, 10*scaler, 50*scaler);
      p.bezierVertex(-30*scaler, 15*scaler, 40*scaler, -40*scaler, 25*scaler, 50*scaler , -50*scaler, 20*scaler, 70*scaler);
      p.quadraticVertex(-45*scaler, -5*scaler, 250*scaler, -40*scaler, -10*scaler, 400*scaler);
      p.vertex(-40*scaler, -20*scaler, 400*scaler);
      p.bezierVertex(-35*scaler, -22*scaler, 400*scaler, -30*scaler, -25*scaler, 390*scaler, -20*scaler, -30*scaler, 70*scaler);
      p.quadraticVertex(-10*scaler, -25*scaler, 50*scaler, 0*scaler, -10*scaler, 0*scaler);
    p.endShape();
  }
}

class Head implements Scalable{
  PShape p;
  public float hhead=80, rhead=50, c2=0.1, c3=hhead/20.0, c4=10.0, hhead2=40, c5=0.2, c6=0.4, tempX, tempY;
  public Head(){
    update();
  }
  
  public void scalee(float scaler){
    hhead*=scaler;
    rhead*=scaler;
    c2*=scaler;
    c3*=scaler;
    //c4*=scaler;
    hhead2*=scaler;
    c5*=scaler;
    c6*=scaler;
    update();
    
    //p.scale(scaler);
  }
  
  public PShape getShape(){return p;}
  
  public void update(){
    this.p=createShape(GROUP);
    for(int i = 0; i < 50; i++){
      PShape tmp = this.part();
      tmp.rotateZ(2*PI*i/50);
      this.p.addChild(tmp);
    }
  }
  
  private PShape part(){
        PShape p;
    p=createShape();
    p.beginShape();
    p.stroke(200);
    p.strokeWeight(0.2);
    int i = 0;
      p.vertex(0, 0, 0);
      tempX=rhead * cos(2 * i * PI/50.0);
      tempY=rhead * sin(2 * i * PI/50.0);
      p.quadraticVertex(tempX/c4, tempY/c4, 0, tempX/2.0, tempY/2.0, hhead/2.0);
      float xt2=0.6*tempX, yt2=0.6*tempY;
      p.bezierVertex(xt2, yt2, 0.5*hhead, xt2, yt2, 0.57*hhead, xt2*0.8, yt2*0.8, 0.6*hhead);
      p.vertex(xt2*0.2, yt2*0.2, 0.6*hhead);
      xt2=0.8*tempX;
      yt2=0.8*tempY;
      p.vertex(xt2*0.2, yt2*0.2, 0.8*hhead);
      xt2=0.9*tempX;
      yt2=0.9*tempY;
      p.bezierVertex(xt2*0.9, yt2*0.9, 0.85*hhead, xt2*0.8, yt2*0.8, 0.87*hhead, xt2, yt2, 0.9*hhead);
      p.bezierVertex(tempX*(1+c2), tempY*(1+c2), hhead-c3, tempX*(1+c2*0.75), tempY*(1+0.75*c2) , hhead-0.75*c3,  tempX, tempY, hhead);
 
      p.bezierVertex(tempX*(1-c6), tempY*(1-c6), hhead, tempX*c5*0.8, tempY*c5*0.8 , hhead+hhead2,  0, 0, hhead+hhead2);
      tempX=rhead * cos(2 * (i+1) * PI/50.0);
      tempY=rhead * sin(2 * (i+1) * PI/50.0);
      xt2=0.9*tempX;
      yt2=0.9*tempY;
      p.vertex(0, 0, hhead+hhead2);
      p.bezierVertex(tempX*c5*0.8, tempY*c5*0.8 , hhead+hhead2, tempX*(1-c6), tempY*(1-c6), hhead, tempX, tempY, hhead);
      p.bezierVertex(tempX*(1+c2*0.75), tempY*(1+0.75*c2) , hhead-0.75*c3, tempX*(1+c2), tempY*(1+c2), hhead-c3, xt2, yt2, 0.9*hhead);
      p.bezierVertex(xt2*0.8, yt2*0.8, 0.87*hhead, xt2*0.9, yt2*0.9, 0.85*hhead,0.8*tempX*0.2, 0.8*tempY*0.2, 0.8*hhead);       
        
      xt2=0.6*tempX;
      yt2=0.6*tempY;
      p.vertex(xt2*0.2, yt2*0.2, 0.6*hhead);
      p.vertex(xt2*0.8, yt2*0.8, 0.6*hhead);
      p.bezierVertex(xt2, yt2, 0.57*hhead, xt2, yt2, 0.5*hhead, tempX/2.0, tempY/2.0, hhead/2.0);
      p.quadraticVertex(tempX/c4, tempY/c4, 0, 0, 0, 0);
  
    
    p.endShape(CLOSE);
    return p;
  }
}



public class eolienneGenerator implements Scalable{
  PShape shape;
  Holder holder;
  Wing wing0, wing1, wing2, wing3;
  Head head;
  
  public eolienneGenerator(){
    shape=createShape();
    holder= new Holder();
    PShape pholder=holder.getShape();
    
    head = new Head();
    PShape phead=head.getShape();
    phead.rotateY(PI/2);
    phead.translate(-0.3*head.hhead+holder.lb/2, holder.lb/2, holder.h);
    
    wing0 = new Wing();
    PShape pwing0=wing0.getShape();
    pwing0.translate(head.hhead * 0.7+holder.lb/2, holder.lb/2, head.tempX*0.2+holder.h);
    
    wing1 = new Wing();
    PShape pwing1=wing1.getShape();
    pwing1.rotateX(PI/2);
    pwing1.translate(head.hhead * 0.7+holder.lb/2, holder.lb/2, head.tempX*0.2+holder.h);
    
    wing2 = new Wing();
    PShape pwing2=wing2.getShape();
    pwing2.rotateX(PI);
    pwing2.translate(head.hhead * 0.7+holder.lb/2, holder.lb/2, head.tempX*0.2+holder.h);
    
    wing3 = new Wing();
    PShape pwing3=wing3.getShape(); 
    pwing3.rotateX(-PI/2);
    pwing3.translate(head.hhead * 0.7+holder.lb/2, holder.lb/2, head.tempX*0.2+holder.h);
    
    shape=createShape(GROUP);
    shape.addChild(phead);
    shape.addChild(pholder);
    shape.addChild(pwing0);
    shape.addChild(pwing1);
    shape.addChild(pwing2);
    shape.addChild(pwing3);
  }
   
  public void animate(float anim){
    
    wing0.getShape().translate(-holder.lb/2, -holder.lb/2, -holder.h);
    wing0.getShape().rotateX(anim);
    wing0.getShape().translate(holder.lb/2, holder.lb/2, holder.h);
    
    wing1.getShape().translate(-holder.lb/2, -holder.lb/2, -holder.h);
    wing1.getShape().rotateX(anim);
    wing1.getShape().translate(holder.lb/2, holder.lb/2, holder.h);
    
    wing2.getShape().translate(-holder.lb/2, -holder.lb/2, -holder.h);
    wing2.getShape().rotateX(anim);
    wing2.getShape().translate(holder.lb/2, holder.lb/2, holder.h);
    
    wing3.getShape().translate(-holder.lb/2, -holder.lb/2, -holder.h);
    wing3.getShape().rotateX(anim);
    wing3.getShape().translate(holder.lb/2, holder.lb/2, holder.h);
  }
  public PShape getShape(){return shape;}
  public void scalee(float rate){
    holder.scalee(rate);
    wing0.scalee(rate);
    wing1.scalee(rate);
    wing2.scalee(rate);
    wing3.scalee(rate);
    head.scalee(rate);
    update();
  }
  
  public void update(){
    PShape pholder=holder.getShape();
    
    PShape phead=head.getShape();
    phead.rotateY(PI/2);
    phead.translate(-0.3*head.hhead+holder.lb/2, holder.lb/2, holder.h);
    
    PShape pwing0=wing0.getShape();
    pwing0.translate(head.hhead * 0.7+holder.lb/2, holder.lb/2, head.tempX*0.2+holder.h);
    
    PShape pwing1=wing1.getShape();
    pwing1.rotateX(PI/2);
    pwing1.translate(head.hhead * 0.7+holder.lb/2, holder.lb/2, head.tempX*0.2+holder.h);
    
    PShape pwing2=wing2.getShape();
    pwing2.rotateX(PI);
    pwing2.translate(head.hhead * 0.7+holder.lb/2, holder.lb/2, head.tempX*0.2+holder.h);

    PShape pwing3=wing3.getShape(); 
    pwing3.rotateX(-PI/2);
    pwing3.translate(head.hhead * 0.7+holder.lb/2, holder.lb/2, head.tempX*0.2+holder.h);
    
    shape=createShape(GROUP);
    shape.addChild(head.getShape());
    shape.addChild(holder.getShape());
    shape.addChild(wing0.getShape());
    shape.addChild(wing1.getShape());
    shape.addChild(wing2.getShape());
    shape.addChild(wing3.getShape());
  }
  
  public PVector getLiaison(){
    return new PVector(-0.3*head.hhead+holder.lb/2, holder.lb/2, holder.h);
  }
}
