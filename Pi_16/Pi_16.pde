/*
Copyright 2015, Mike Stebbins
*/
//---------------------------------------------------------------------------------------------------------------------
// USER SETTINGS - CHANGE AT WILL
//---------------------------------------------------------------------------------------------------------------------
int i = -1;  // starting point for output, use -1 unless debugging
//int i = 9980;  // starting point for output, use -1 unless debugging

int startupDelayTime = 3000; // time between character for initial 3.14
long scrollingTime = 10;  // time between characters (msecs)
int scrollingPauseTime = 1000;  // time to delay at highlighted characters
int initialFinalDelayTime = 2000; // time to pause at the beginning and end of sequence

//String[] textfile = loadStrings("C:/Users/Mike/Dropbox/Mike/Pi_Day_2015_celebration/PROCESSING_code/Pi_14/pi.txt");
String[] textfile = loadStrings("C:/Users/mstebbins/Dropbox/Mike/pi_day_2015_celebration/processing_code/Pi_16/pi.txt");

//---------------------------------------------------------------------------------------------------------------------
// VARIABLES - DON'T CHANGE UNLESS YOU KNOW WHAT YOU'RE DOING
//---------------------------------------------------------------------------------------------------------------------
float littleFontSize = 10.9; // sizes for scrolling font, font at bottom, center font
float mediumFontSize = 20.0;
float largeFontSize = 200.0;

float xGap = 7.3;  // Pstn the scrolling text and the space between each character
float yGap = 11.4;
float border = 8;

int TeagueXPstn = 1215;   // Pstn the text at the bottom of the screen
int DesignThisDayYPostn = 27;  // how far up (greater number = further up) the Design This Day logo
int DesignThisDayH = 61;  // height in pixels of Design this day logo
int DesignThisDayW = 75;  // height in pixels of Design this day logo

int PiLogoHeight = 550;  // width of the pi image over the black background
int PiLogoVertOffset = -25;  // pixels that pi logo is shifted (negative = up direction)

String[] DtDText = {
  "D","E","S","I","G","N",
  "T","H","I","S",
  "D","A","Y","."};
String[] DtDAscii = {
  "68","69","83","73","71",
  "78","84","72","73",
  "83","68","65","89","46"};
int[] DtDPstn = {
  607, 1475, 1977, 2409, 
  3171, 4020, 4772, 5546, 
  6629, 7197, 7706, 8467, 
  9215, 9953};

//---------------------------------------------------------------------------------------------------------------------
// CONSTANTS - DON'T CHANGE
//---------------------------------------------------------------------------------------------------------------------
PImage bg;
PImage teague;
PImage dtd00;
PImage dtd01;
PImage dtd02;
PImage dtd03;
PImage dtd04;
PImage dtd05;
PImage dtd06;
PImage dtd07;
PImage dtd08;
PImage dtd09;
PImage dtd10;
PImage dtd11;
PImage dtd12;
PImage dtd13;
PImage dtd14;

PFont littleFont;
PFont mediumFont;
PFont bigFont;

color pink = color(255, 0, 150);  // font colors, straight from Branding doc.
color aqua = color(0, 200, 200);
color black = color(0, 0, 0);
color yellow = color(255, 255, 0);
color darkGray = color(119, 120, 123);
color lightGray = color(200, 200, 200);
color white = color(255, 255, 255);
color darkDarkGray = color(64);

long timePrevious = 0;  // time keepers
int tmpCount = 0;

String s = textfile[0];                                 

//---------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------
void setup() {
  
  print ("length of variable s = " + s.length());
  
  size(1280, 720);
  
  bg = loadImage("PiBackground_trans.png");  // Load the image into the program
  teague = loadImage("TeagueLogoWHITE.bmp");
  dtd00 = loadImage("Design This Day_Logo_PINK_NO_BG_00_small-01.png");
  dtd01 = loadImage("Design This Day_Logo_PINK_NO_BG_01_small-01.png");
  dtd02 = loadImage("Design This Day_Logo_PINK_NO_BG_02_small-01.png");
  dtd03 = loadImage("Design This Day_Logo_PINK_NO_BG_03_small-01.png");
  dtd04 = loadImage("Design This Day_Logo_PINK_NO_BG_04_small-01.png");
  dtd05 = loadImage("Design This Day_Logo_PINK_NO_BG_05_small-01.png");
  dtd06 = loadImage("Design This Day_Logo_PINK_NO_BG_06_small-01.png");
  dtd07 = loadImage("Design This Day_Logo_PINK_NO_BG_07_small-01.png");
  dtd08 = loadImage("Design This Day_Logo_PINK_NO_BG_08_small-01.png");
  dtd09 = loadImage("Design This Day_Logo_PINK_NO_BG_09_small-01.png");
  dtd10 = loadImage("Design This Day_Logo_PINK_NO_BG_10_small-01.png");
  dtd11 = loadImage("Design This Day_Logo_PINK_NO_BG_11_small-01.png");
  dtd12 = loadImage("Design This Day_Logo_PINK_NO_BG_12_small-01.png");
  dtd13 = loadImage("Design This Day_Logo_PINK_NO_BG_13_small-01.png");
  dtd14 = loadImage("Design This Day_Logo_PINK_NO_BG_14_small-01.png");
     
  // Create the fonts
  printArray(PFont.list());
  littleFont = loadFont("NeubauGrotesk-Nor-10.vlw");
  mediumFont = loadFont("NeubauGrotesk-Nor-20.vlw");
  bigFont = loadFont("NeubauGrotesk-Sch-200.vlw");

   // Set the initial background
   imageMode(CENTER);
   background(black); 
   image(bg, width/2, height/2 + PiLogoVertOffset);
   bg.resize(0,PiLogoHeight);
   image(teague,TeagueXPstn,(height - DesignThisDayYPostn/2));
  
   textFont(bigFont);   
 }

//---------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------
void draw() {
  
 if ((millis() -  timePrevious) >= scrollingTime)  { 
   
//---------------------------------------------------------------------------------------------------------------------
 // non-changing background with images  
   imageMode(CENTER);
   background(black); 
   image(bg, width/2, height/2 + PiLogoVertOffset);
   bg.resize(0,PiLogoHeight);
   image(teague,TeagueXPstn,(height - DesignThisDayYPostn/2));
 
 //---------------------------------------------------------------------------------------------------------------------
 // current digit BIG, front and center
 textFont(bigFont);
 textSize(largeFontSize);
 textAlign(CENTER);
// fill(darkDarkGray);

     if (
     (i == 0) || (i == 1) || (i == 2) ||  // 3.1415 highlighted in pink
     (i == 3) || (i == 4) || (i == 5) ||     
     (i == DtDPstn[0]-1)||(i == DtDPstn[0])||
     (i == DtDPstn[1]-1)||(i == DtDPstn[1])||
     (i == DtDPstn[2]-1)||(i == DtDPstn[2])||
     (i == DtDPstn[3]-1)||(i == DtDPstn[3])||
     (i == DtDPstn[4]-1)||(i == DtDPstn[4])||
     (i == DtDPstn[5]-1)||(i == DtDPstn[5])||
     (i == DtDPstn[6]-1)||(i == DtDPstn[6])||
     (i == DtDPstn[7]-1)||(i == DtDPstn[7])||
     (i == DtDPstn[8]-1)||(i == DtDPstn[8])||
     (i == DtDPstn[9]-1)||(i == DtDPstn[9])||
     (i == DtDPstn[10]-1)||(i == DtDPstn[10])||
     (i == DtDPstn[11]-1)||(i == DtDPstn[11])||
     (i == DtDPstn[12]-1)||(i == DtDPstn[12])||
     (i == DtDPstn[13]-1)||(i == DtDPstn[13]))     
     {
         fill(pink);         
     } 
     else  
     {
       fill(darkDarkGray);
     }

 if ((i==-1)||(i==0)||(i==2)||(i==4))  {;}
// else if (i == 0)  {text(s.charAt(i),width/2,height/2);  }
 else if (i >= s.length()-1)  {;}
 else if (i == 1)  { 
//   fill(pink);
   text("3.",width/2, height/2);
//   fill(darkDarkGray);
 }
 else if (i == 3)  { 
//   fill(pink);
   text("14",width/2, height/2);
//   fill(darkDarkGray);
 }
 else if (i == 5)  {
//   fill(pink); 
   text("15",width/2, height/2);
//   fill(darkDarkGray);
 }
 else  {text(s.charAt(i),width/2,height/2);  }
 
  //---------------------------------------------------------------------------------------------------------------------
  // running digits
  textFont(littleFont);
  textSize(littleFontSize);
  textAlign(LEFT);
  
 tmpCount = 0;
 
 if ( (i == 0) || (i == 2) || (i == 4))  {;}
 else if ( (i >= 0) && (i < s.length()) )  {
   
 for (float y = 2.0*border; y < height-border; y += yGap) {
   for (float x = 1.0*border; x < width-border; x += xGap) {
   
     if (
     (tmpCount == 0) || (tmpCount == 1) || (tmpCount == 2) ||  // 3.1415 highlighted in pink
     (tmpCount == 3) || (tmpCount == 4) || (tmpCount == 5) ||     
     (tmpCount == DtDPstn[0]-1)||(tmpCount == DtDPstn[0])||
     (tmpCount == DtDPstn[1]-1)||(tmpCount == DtDPstn[1])||
     (tmpCount == DtDPstn[2]-1)||(tmpCount == DtDPstn[2])||
     (tmpCount == DtDPstn[3]-1)||(tmpCount == DtDPstn[3])||
     (tmpCount == DtDPstn[4]-1)||(tmpCount == DtDPstn[4])||
     (tmpCount == DtDPstn[5]-1)||(tmpCount == DtDPstn[5])||
     (tmpCount == DtDPstn[6]-1)||(tmpCount == DtDPstn[6])||
     (tmpCount == DtDPstn[7]-1)||(tmpCount == DtDPstn[7])||
     (tmpCount == DtDPstn[8]-1)||(tmpCount == DtDPstn[8])||
     (tmpCount == DtDPstn[9]-1)||(tmpCount == DtDPstn[9])||
     (tmpCount == DtDPstn[10]-1)||(tmpCount == DtDPstn[10])||
     (tmpCount == DtDPstn[11]-1)||(tmpCount == DtDPstn[11])||
     (tmpCount == DtDPstn[12]-1)||(tmpCount == DtDPstn[12])||
     (tmpCount == DtDPstn[13]-1)||(tmpCount == DtDPstn[13]))     
     {
         fill(pink);         
     } 
     else  
     {
       fill(white);
     }
     
     if (tmpCount > i)  
     {
       break;
     }  
     
     if (tmpCount >= s.length())  {text(s.charAt(s.length()-1), x, y);}
     else  
     {
     text(s.charAt(tmpCount), x, y);
     }
     tmpCount++;
     
   }
   if (tmpCount == i)  {
     break;
     } 
   } 
 }

 //---------------------------------------------------------------------------------------------------------------------
 // corner digit counter code
 int counter = 0;
  if (i < 2)  {counter = 0;}
  else {counter = (i - 1);}

 textFont(mediumFont);
 textSize(mediumFontSize);
 textAlign(LEFT);
 fill(white);
 
// print(i);
  if ( (i <= 1) || (i >= s.length()) )  {text("# ", border, height-border); }
 //else if (i >= s.length()) {text("# " + (counter-1), border, height-border);}
 else  {text("# " + counter, border, height-border);}
 
 //---------------------------------------------------------------------------------------------------------------------
  // "design this day." spelled out using vector artwork

// if ((i < DtDPstn[0]) || (i >= s.length()-8))  {
  if (i < DtDPstn[0])  {
   image(dtd00, width/2, height - DesignThisDayYPostn, DesignThisDayW, DesignThisDayH);
 }
 if ((i >= DtDPstn[0]) && (i < DtDPstn[1]))  {
   image(dtd01, width/2, height - DesignThisDayYPostn, DesignThisDayW, DesignThisDayH);
 }
 if ((i >= DtDPstn[1]) && (i < DtDPstn[2]))  {
   image(dtd02, width/2, height - DesignThisDayYPostn, DesignThisDayW, DesignThisDayH);
 }
 if ((i >= DtDPstn[2]) && (i < DtDPstn[3]))  {
   image(dtd03, width/2, height - DesignThisDayYPostn, DesignThisDayW, DesignThisDayH);
 }
 if ((i >= DtDPstn[3]) && (i < DtDPstn[4]))  {
   image(dtd04, width/2, height - DesignThisDayYPostn, DesignThisDayW, DesignThisDayH);
 }
 if ((i >= DtDPstn[4]) && (i < DtDPstn[5]))  {
   image(dtd05, width/2, height - DesignThisDayYPostn, DesignThisDayW, DesignThisDayH);
 }
 if ((i >= DtDPstn[5]) && (i < DtDPstn[6]))  {
   image(dtd06, width/2, height - DesignThisDayYPostn, DesignThisDayW, DesignThisDayH);
 }
if ((i >= DtDPstn[6]) && (i < DtDPstn[7]))  {
   image(dtd07, width/2, height - DesignThisDayYPostn, DesignThisDayW, DesignThisDayH);
 }
 if ((i >= DtDPstn[7]) && (i < DtDPstn[8]))  {
   image(dtd08, width/2, height - DesignThisDayYPostn, DesignThisDayW, DesignThisDayH);
 }
 if ((i >= DtDPstn[8]) && (i < DtDPstn[9]))  {
   image(dtd09, width/2, height - DesignThisDayYPostn, DesignThisDayW, DesignThisDayH);
 }
 if ((i >= DtDPstn[9]) && (i < DtDPstn[10]))  {
   image(dtd10, width/2, height - DesignThisDayYPostn, DesignThisDayW, DesignThisDayH);
 }
 if ((i >= DtDPstn[10]) && (i < DtDPstn[11]))  {
   image(dtd11, width/2, height - DesignThisDayYPostn, DesignThisDayW, DesignThisDayH);
 }
 if ((i >= DtDPstn[11]) && (i < DtDPstn[12]))  {
   image(dtd12, width/2, height - DesignThisDayYPostn, DesignThisDayW, DesignThisDayH);
 }
 if ((i >= DtDPstn[12]) && (i < DtDPstn[13]))  {
   image(dtd13, width/2, height - DesignThisDayYPostn, DesignThisDayW, DesignThisDayH);
 }
 if ((i >= DtDPstn[13]) && (i <= s.length()-1)) {
   image(dtd14, width/2, height - DesignThisDayYPostn, DesignThisDayW, DesignThisDayH);
 }

//---------------------------------------------------------------------------------------------------------------------
//Delay frame
 
 // initial startup slowdown
 if (
 (i == 2)||(i == 4)||(i == 6))
 {delay(startupDelayTime);}
 
 if (
 ( i == 0) || ( i == s.length()))
 {delay(initialFinalDelayTime);}
 
 // Design This Day letter emphasis delay
 if (
 (i == DtDPstn[0]+DtDAscii[0].length()-1) || 
 (i == DtDPstn[1]+DtDAscii[1].length()-1) || 
 (i == DtDPstn[2]+DtDAscii[2].length()-1) || 
 (i == DtDPstn[3]+DtDAscii[3].length()-1) || 
 (i == DtDPstn[4]+DtDAscii[4].length()-1) || 
 (i == DtDPstn[5]+DtDAscii[5].length()-1) || 
 (i == DtDPstn[6]+DtDAscii[6].length()-1) || 
 (i == DtDPstn[7]+DtDAscii[7].length()-1) || 
 (i == DtDPstn[8]+DtDAscii[8].length()-1) || 
 (i == DtDPstn[9]+DtDAscii[9].length()-1) || 
 (i == DtDPstn[10]+DtDAscii[10].length()-1) || 
 (i == DtDPstn[11]+DtDAscii[11].length()-1) || 
 (i == DtDPstn[12]+DtDAscii[12].length()-1) ||
 (i == DtDPstn[13]+DtDAscii[13].length()-1))
 {
 delay(scrollingPauseTime);
 }

 //---------------------------------------------------------------------------------------------------------------------
 //loop over and start again
 if (i <= s.length()-1)  {i++;}

// Uncomment the bottom of the following two to make the screen hold on the last iteration for review,
// otherwise uncomment the top to loop the video
// else  {i = -1; delay(initialFinalDelayTime);}
 else  {while(true);}

 timePrevious = millis();

// Uncomment the following to output each frame to the output folder for creating a video file 
 saveFrame("/output/seq-######.tga");
  }
}


  

