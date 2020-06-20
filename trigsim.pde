//Declaring global values
import g4p_controls.*;
int xspace, numBalls, amp1, amp2,  amp3, period1, period2, period3;
Ball l, k, lk;
PrintWriter textdoc;

void setup() { 

  //Set base values
  size(1200, 900);
  createGUI();
  
  //Periods for all lines
  period1 = 400;
  period2 = 400;
  period3 = 400;
  
  //Amplitudes for all lines
  amp1 = 75;
  amp2 = 50;
  amp3 = 50;
  
  //Thickness of line and spacing
  numBalls = 748;
  xspace = 1;
  
  //Setting up lines
  l = new Ball(125, "sin", amp1, period1, 255, 0, 0, 1);
  k = new Ball(750, "sin", amp2, period2, 0, 0, 255, 2);
  lk = new Ball(450, "Addition", amp3, period3, 0, 255, 0, 3);
  
  textdoc = createWriter("coordinates.txt");
  
}

void draw() {

  //Drawing everything on screen
  background(211);
  l.createBalls();
  k.createBalls();
  
  //Make colour of middle line average of other two
  lk.r = (l.r + k.r)/2;
  lk.g = (l.g + k.g)/2;
  lk.b = (l.b + k.b)/2;
  lk.createBalls();
  
  //Creating boundary lines
  stroke(255);
  line(0,300,750,300);
  line(0,600,750,600);
  line(750,0,750,900);
  
}

//Set values for demos
void setControllerValues( int period1v, int period2v, int amp1v, int amp2v, float spd1, float spd2, int sct1v, int sct2v, int sct3v ) {
  periodslider1.setValue( period1v );
  periodslider2.setValue( period2v );
  ampslider1.setValue( amp1v );
  ampslider2.setValue( amp2v );
  l.deltat = spd1;
  k.deltat = spd2;
  dropList1.setSelected( sct1v );
  dropList2.setSelected( sct2v );
  dropList3.setSelected( sct3v );
}

//Get values from called demo
void getControllerValues() {
  l.period = periodslider1.getValueI();
  k.period = periodslider2.getValueI();
  l.amp = ampslider1.getValueI();
  k.amp = ampslider2.getValueI();
  l.sct = dropList1.getSelectedText();
  k.sct = dropList2.getSelectedText();
  lk.sct = dropList3.getSelectedText();
}