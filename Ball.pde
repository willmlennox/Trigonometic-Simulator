class Ball {
 
  int x1, r, g, b, amp, period, h;
  float y1, xv, yc, x, theta, deltat;
  float[] yv;
  String sct;
  color colour;
  int num; 
  int counter = 0;
  
  //Constructor class
  Ball(float y, String s, int a, int p, int rc, int gc, int bc, int n){
   
    this.y1 = y;
    this.sct = s;
    this.colour = color(this.r,this.g,this.b);
    this.r = rc;
    this.g = gc;
    this.b = bc;
    this.amp = a;
    this.period = p;
    this.yc = 0;
    this.yv = new float[numBalls];
    this.num = n;
    this.x = 0;
    this.theta = 0;
    this.deltat = 0.01;
    
  }
  
  //Draws all balls to create lines
  void drawLine(float y2){
    if(this.num == 1 && y2 >= 0 && y2<= 300 || this.num == 2 && y2 <= 900 && y2 >= 600 || this.num == 3 && y2 <= 600 && y2 >= 300){
      noStroke();
      fill(this.r,this.g,this.b);
      ellipse(this.xv, y2, 10, 10);
      outputValues(y2);
    }
  }
  
  //Class to calculate y values
  void createBalls(){
    
    this.theta += this.deltat;
    this.x = theta;
    
    for (int i = 0; i < numBalls; i ++) {
      
      //Sin or cos wave
      if(this.sct.equals("sin") || this.sct.equals("cos")){
        this.yv[i] = sin(x) * this.amp + this.y1;
        this.xv = i * xspace;
        drawLine(this.yv[i]);
        x += (TWO_PI / this.period) * xspace;
      }
      //Tan wave
      else if(this.sct.equals("tan")){
        this.yv[i] = tan(x) * this.amp + this.y1;
        this.xv = i * xspace;
        drawLine(this.yv[i]);
        x += (TWO_PI / this.period) * xspace;
      }
      //Csc or sec wave
      else if(this.sct.equals("csc") || this.sct.equals("sec")){
        this.yv[i] = 1/sin(x) * this.amp + this.y1;
        this.xv = i * xspace;
        drawLine(this.yv[i]);
        x += (TWO_PI / this.period) * xspace;
      }
      //Cot wave
      else if(this.sct.equals("cot")){
        this.yv[i] = 1/tan(x) * this.amp + this.y1;
        this.xv = i * xspace;
        drawLine(this.yv[i]);
        x += (TWO_PI / this.period) * xspace;
      }
      //Middle line
      else{
        this.xv = i * xspace;
        h = i;
        middleFunc();
        x += (TWO_PI / this.period) * xspace;
      }
      
    }
    
  }
  
  void middleFunc(){
    
    //Calls to different functions depending on what the user selects
    if(this.sct.equals("Addition")){
      addFunc();
    }
    else if(this.sct.equals("Subtraction")){
      subFunc();
    }
    else if(this.sct.equals("Multiplication")){
      multiplyFunc();
    }
    else if(this.sct.equals("Division")){
      divideFunc();
    }
    else if(this.sct.equals("Composite line1(line2)")){
      compositeFunc1();
    }
    else if(this.sct.equals("Composite line2(line1)")){
      compositeFunc2();
    }
    
  }
  
  //Adds y values of top line and bottom line
  void addFunc(){
    this.yc = this.y1 + ((l.yv[h] - l.y1) + (k.yv[h] - k.y1));
    drawLine(this.yc);
  }
  
  //Subtracts y values of top line and bottom line
  void subFunc(){
    this.yc = this.y1 + ((l.yv[h] - l.y1) - (k.yv[h] - k.y1));
    drawLine(this.yc);
  }
  
  //Multiplies y values of top line and bottom line
  void multiplyFunc(){
    this.yc = this.y1 + ((l.yv[h] - l.y1) * (k.yv[h] - k.y1));
    drawLine(this.yc);
  }
  
  //Divides y values of top line and bottom line
  void divideFunc(){
    this.yc = this.y1 + ((l.yv[h] - l.y1) / (k.yv[h] - k.y1));
    drawLine(this.yc);
  }
  
  //Takes y value from bottom line and puts it into the function of the top line
  void compositeFunc1(){
    
    if(l.sct.equals("sin")){
      this.yc = this.y1 + ((sin(k.yv[h] - k.y1) * (k.amp + l.amp)/2));
      drawLine(this.yc);
    }
    else if(l.sct.equals("cos")){
      this.yc = this.y1 + ((cos(k.yv[h] - k.y1) * (k.amp + l.amp)/2));
      drawLine(this.yc);
    }
    else if(l.sct.equals("tan")){
      this.yc = this.y1 + ((tan(k.yv[h] - k.y1) * (k.amp + l.amp)/2));
      drawLine(this.yc);
    }
    else if(l.sct.equals("csc")){
      this.yc = this.y1 + ((1/sin(k.yv[h] - k.y1) * (k.amp + l.amp)/2));
      drawLine(this.yc);
    }
    else if(l.sct.equals("sec")){
      this.yc = this.y1 + ((1/cos(k.yv[h] - k.y1) * (k.amp + l.amp)/2));
      drawLine(this.yc);
    }
    else if(l.sct.equals("cot")){
      this.yc = this.y1 + ((1/tan(k.yv[h] - k.y1) * (k.amp + l.amp)/2));
      drawLine(this.yc);
    }
    
  }
  
  //Takes y value from top line and puts it into the function of the bottom line
  void compositeFunc2(){
    
    if(k.sct.equals("sin")){
      this.yc = this.y1 + ((sin(l.yv[h] - l.y1) * (k.amp + l.amp)/2));
      drawLine(this.yc);
    }
    else if(k.sct.equals("cos")){
      this.yc = this.y1 + ((cos(l.yv[h] - l.y1) * (k.amp + l.amp)/2));
      drawLine(this.yc);
    }
    else if(k.sct.equals("tan")){
      this.yc = this.y1 + ((tan(l.yv[h] - l.y1) * (k.amp + l.amp)/2));
      drawLine(this.yc);
    }
    else if(k.sct.equals("csc")){
      this.yc = this.y1 + ((1/sin(l.yv[h] - l.y1) * (k.amp + l.amp)/2));
      drawLine(this.yc);
    }
    else if(k.sct.equals("sec")){
      this.yc = this.y1 + ((1/cos(l.yv[h] - l.y1) * (k.amp + l.amp)/2));
      drawLine(this.yc);
    }
    else if(k.sct.equals("cot")){
      this.yc = this.y1 + ((1/tan(l.yv[h] - l.y1) * (k.amp + l.amp)/2));
      drawLine(this.yc);
    }
    
  }
  
  //Prints x and y values for each line into a text document
  void outputValues(float y){
    
    counter ++;
    if(counter % 120 == 0){ 
      textdoc.println(this.num + ": " + this.xv + ", " + y);
      counter ++;
    }
    
  }
  
}