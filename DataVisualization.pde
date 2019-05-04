// DELCARING UNIVERSAL VARIABLES
color[] dessert = {#9F9694, #791F33, #BA3D49, #F1E6D4, #E2E1DC};
color[] palette = dessert;

Table t1;
int rowCount;

Table t2;
int rowCount2;

Table t3;
int rowCount3;

int YY = 900;

color fillVal = color(126);
/*****************************************************************************
******************************************************************************/
void setup(){
  // canvas 
  size (1900, 900);
  smooth();
  
  //load table and verify table reading is appropriate 
  
  // TABLE 1 
  t1 = new Table("TableOne.tsv");
  rowCount  = t1.getRowCount();
  println("rowCount = " + rowCount); 
  
  // TABLE 2
  t2 = new Table("Table3.tsv");
  rowCount2 = t2.getRowCount();
  println("rowCount2 = " + rowCount2);
  
  // TABLE 3
  t3 = new Table("Last2.tsv");
  rowCount3 = t3.getRowCount();
  println("rowCount3 = " + rowCount3);
  
  //stroke(255);
  frameRate(2.6);
}
/*****************************************************************************
******************************************************************************/
int x = 300;
int y = 70; 

void draw(){
  background(0);   // Clear the screen with a black background
  line(0, YY, width/2, YY); 
  line(YY, 333, width/3, YY);
  
  for (int i = 0; i < width; i++) {
    float r = random(255);
    stroke(r);
    line(i, 0, i, height);
  }
  
  textSize(50);
  textAlign(CENTER);
  fill(palette[1]);
  text("To reveal the data, press your mouse",width/2,y);
  y = y + 40;
  
 // fill(fillVal);
  //rect(225, 225, 150, 150);

}
void mousePressed(){
  stroke (45);
  ellipse(200,200,50,50);
  rect(700,700,40,40);
  
  background (palette[0]);
  
  /********************************** TABLE 1 ***********************/
  //Aesthetics 
  stroke (palette[3]);
  fill (palette[3]);
  textAlign(CENTER);
  textSize(20);
  text("World Wide R.E Production Percentage", width/4, 100);
  
  //DRAW CARTESIAN PLANE
  //x Axis 
  stroke (3);
  textAlign (CENTER);
  line (100, 400, 890, 400);
  text ("Years", 450, 445);
  //Y Axis
  stroke (3);
  textAlign (RIGHT);
  textSize(15);
  line (100, 50, 100, 400);
  text("Percentage", 90, 250);
  
  //READ DATA FROM TABLE 1
  //Non Dynamic to Dynamic data variables 
  int Width = 120;
  int th = 420;
  
  //Get the Data 
  for (int row = 0; row < rowCount; row ++){
    String dates = t1.getString(row, 0);
    float height = t1.getFloat(row, 1);
    String H = t1.getString(row, 1);
    println(dates + " " + height);
    height = height*10.9; // since my data values are so close from each other, I'm increasing their distance ratio
    //Draw the Data 
    ellipseMode (CENTER);
    fill (palette[1]);
    stroke (12);
    ellipse (Width, (height - (height*2))+600, 9, 15); // math formula to be able to place the values in the right position
    
    textAlign(CENTER);
    textSize(10);
    text (dates, Width, th);
    textSize(10);
    text (H, Width,((height - (height*2))+600)-17 ); // same as above 
 
    Width = Width + 30; //Re-declaring the variable Width, so it can space out my shapes from each other
  }
    /********************************** TABLE 2 ***********************/
    //Aesthetics
    stroke (palette[3]);
    fill (palette[3]);
    textAlign (CENTER);
    textSize(20);
    text("G7 Comparison: Year 2015", width/4, 570);
    
    //DRAW CARTESIAN PLANE 
    // X Axis 
    stroke (3);
    textAlign (CENTER);
    line (100, 800, 860, 800);
    // Y Axis 
    stroke (3);
    textAlign (RIGHT);
    textSize (15);
    line (100, 800, 100, 590);
    text("Percentage", 90, 710);
    
    //GET DATA FROM TABLE 2
    //non dynamic to dynamic variables 
    int x = 150;
    
    //Get Data 
    for (int row = 0; row < rowCount2; row++){
      String dates = t2.getString(row, 0);
      float height = t2.getFloat(row, 1);
      String H = t2.getString(row, 1);
      println (dates + " " + height);
      
      //variables needed to draw 
      int y = 800;
      int width = 80;
      
      // Draw the data 
      rect(x, y, width, height-(height*2));
      /*the subtraction from the line above what it does it to position the rectangle 
      in a regular postion. Computer coordinates are a 4th plane of a cartesian coordinate
      so the calculation above translate the rectangle from being on a 4th plane to 1st plane*/
      textSize(20);
      text(dates, x+50, 840);
      text(H, x+50, 720);
      x = x + 100; // increase the spacing of the graphs 
    }
    
    /********************************** TABLE 2 ***********************/
    //Draw Cartesian Lines
    line (1000, 704, 1680, 704);
    line (1000, 704, 1000, 300);
    
    //GET DATA FOR TABLE THREE
    // non dynamic to dynamic variables 
    int xx = 1050;
    int X = 1100;
    
    //Get Data 
    for (int row = 0; row < rowCount3; row++){
      String continent = t3.getString(row, 0);
      float height = t3.getFloat(row, 1); //2015
      String H = t3.getString(row, 1); //2015
      String H2 = t3.getString(row, 2); //2000
      String H3 = t3.getString(row, 3); //1990
      float height2 = t3.getFloat(row, 2); //2000
      float height3 = t3.getFloat(row, 3); //1990
      
      //recalculate numbers to be able to display in this grid 
      height = height /1000;
      height2 = height2 /1000;
      height3 = height3 /1000;
      
      println(continent + " " + H + " " + H2 + " " + H3);
      
      //DRAW DATA 
      //static to dynamic values to draw the data 
      int yy = 700;
      int width = 80;
      //2015
      fill(#ff8f00);
      rect(xx, yy, width, height-(height*2));
      //2000
      fill(#2b3a42);
      rect(xx, yy, width, height2-(height2*2)); // math formula to position rectangles in the right spot 
      //1990
      fill(#f0f0df);
      rect(xx, yy, width, height3-(height3*2));
      xx = xx +100; //increase the spacing of the graphs
      //add labels to the graphs 
      //continent
      textAlign(CENTER);
      textSize(12);
      text(continent, X, yy+20);
      //2015
      fill(#ff8f00);
      textSize(20);
      text(H,X,yy-390);
      //2000
      fill(#2b3A42);
      text(H2,X,yy-370);
      //1990
      fill(#f0f0df);
      text(H3,X,yy-350);
      X = X+100; // adds spacing to the text
      
      //add the years manually because theyre not provided in my data file 
      fill(#f0f0df);
      text("1990",1200,780);
      fill(#2b3a42);
      text("2000",1300,780);
      fill(#ff8f00);
      text("2015", 1400, 780);
      // add label because it was not provided in data file
      fill(palette[3]);
      text("Electricity Supply Per Continent", 1300, 200);  
    }
  noLoop(); // this will make the void Draw() function only run once

}

/*
void keyPressed(){
  if (key == CODED) {
    if (keyCode == UP) {
      fillVal = 255;
    } else if (keyCode == DOWN) {
      fillVal = 0;
    } 
  } else {
    fillVal = 126;
  }
  
}
*/
