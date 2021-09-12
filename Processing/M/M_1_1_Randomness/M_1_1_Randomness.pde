/**
 * draws a random chart and shows how to use randomSeed.
 * 
 * MOUSE
 * click               : new random line
 * 
 * KEYS
 * p                   : save pdf
 * s                   : save png
 */
 
import processing.pdf.*;
import java.util.Calendar;


boolean savePDF = false;
int actRandomSeed = 33;

void setup(){
  size(1024,256);
  smooth();
}

//String 首字大写
//格式化时间函数
String timestamp(){
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS",now);
}

void draw() {
  // 开始录制pdf
  if (savePDF) beginRecord(PDF,timestamp()+".pdf");
  background(0);
  //----------------------------------------------------------------
  //线条:颜色，粗细，连接点，填充，端头
    //strokeCap();          SQUARE, PROJECT, and ROUND
    // 
  stroke(0, 130, 164);
  strokeWeight(1);
  strokeJoin(ROUND);        //MITER, BEVEL, and ROUND
  noFill();
  
  randomSeed(actRandomSeed);
  // 开始绘制形状
  beginShape();
  for(int x = 0; x < width; x+=10){
    float y = random(0,height);
    //shape绘图使用vertex
    vertex(x, y);
  }
  endShape();
  
  randomSeed(actRandomSeed);
  // 绘制点
  noStroke();
  fill(#FC1792);
  for(int x = 0; x < width; x+=10){
    float y = random(0,height);
    ellipse(x,y,3,3);
  }
  //---------------------------------------------------------------
  //结束录制pdf
  if (savePDF){
    savePDF = false;
    //结束无参数
    endRecord();
  }
}

//创建事件函数,每次点击鼠标的时候seed变化
void mouseReleased(){
  actRandomSeed = (int) random(100000);
}

// 事件函数
// 按下s键保存图片
// 按下p键设置保存pdf的控制参数为true
void keyReleased(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
  if(key == 'p' || key =='P') savePDF = true;
}
