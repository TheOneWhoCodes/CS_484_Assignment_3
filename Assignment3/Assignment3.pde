// Christian Garcia
// CS 484
// Assignment 3
// Fedruary 23, 2018

// Global variables
PImage img;

String ampm;
boolean showLogin;
boolean showMenu;
boolean showBalance;
boolean showWithdraw;
boolean showDeposit;
int balance;

void setup() {
  size(1000, 1000);
  noStroke();
  noLoop();
  
  // Import image
  img = loadImage("../img/chase.png");
  
  ampm = " AM";
  showLogin = true;
  showMenu = false;
  showBalance = false;
  showWithdraw = false;
  showDeposit = false;
  balance = 500;
}

void draw() {
  background(38);
  
  // Place current time in top-left corner
  fill(255);
  textSize(32);
  if(hour() > 11) {
    ampm = " PM";
  }
  
  if(hour( ) - 12 > 0) {
    if(minute() < 10) {
      text((hour() - 12) + ":0" + minute() + ampm, 25, 50);
    } else {
      text((hour() - 12) + ":" + minute() + ampm, 25, 50);
    }
  } else {
    if(minute() < 10) {
      text((hour()) + ":0" + minute() + ampm, 25, 50);
    } else {
      text((hour()) + ":" + minute() + ampm, 25, 50);
    }
  }
  
  // Help button
  fill(0, 144, 255);
  rect(50, 900, 150, 75, 12, 12, 12, 12);
  fill(255);
  textSize(32);
  text("HELP?", 80, 950);
  
  // Draw login screen
  if(showLogin == true) { //<>//
    drawLogin();
  }
  
  // Draw menu screen
  else if(showMenu == true) {
    drawMenu();
  }
  
  // Draw balance screen
  else if(showBalance == true) {
    drawBalance();
  }
  
  // Draw withdraw screen
  else if(showWithdraw == true) {
    drawWithdraw();
  }
  
  // Draw deposit screen
  else if(showDeposit == true) {
    drawDeposit();
  }
}

void drawLogin() {

  // Bank logo
  image(img, 305, 400, 400,75);
  
  fill(0, 144, 255);
  rect(350, 500, 300, 75, 12, 12, 12, 12);
  fill(255);
  textSize(32);
  text("LOGIN", 450, 550);
}

void drawMenu() {
  
  // Bank logo
  image(img, 850, 25, 125, 25);
  
  fill(255);
  textSize(64);
  text("Welcome, Christian", 200, 350);
  
  fill(0, 144, 255);
  rect(350, 450, 300, 75, 12, 12, 12, 12);
  fill(255);
  textSize(32);
  text("BALANCE", 430, 500);
  
  fill(0, 144, 255);
  rect(350, 550, 300, 75, 12, 12, 12, 12);
  fill(255);
  textSize(32);
  text("WITHDRAW", 415, 600);
  
  fill(0, 144, 255);
  rect(350, 650, 300, 75, 12, 12, 12, 12);
  fill(255);
  textSize(32);
  text("DEPOSIT", 435, 700);
  
  fill(255);
  rect(800, 900, 150, 75, 12, 12, 12, 12);
  fill(0);
  textSize(32);
  text("LOGOUT", 810, 950);
}

void drawBalance() {
  
  // Bank logo
  image(img, 850, 25, 125, 25);
  
  fill(255);
  textSize(64);
  text("BALANCE: $" + balance, 250, 500);
  
  fill(0, 144, 255);
  rect(418, 600, 150, 75, 12, 12, 12, 12);
  fill(255);
  textSize(32);
  text("BACK", 450, 650);
}

void drawWithdraw() {
  
  // Bank logo
  image(img, 850, 25, 125, 25);
  
  fill(255);
  textSize(64);
  text("WITHDRAW", 325, 325);
  
  drawFigures();
}

void drawDeposit() {
  
  // Bank logo
  image(img, 850, 25, 125, 25);
  
  fill(255);
  textSize(64);
  text("DEPOSIT", 368, 325);

  drawFigures();
}

// Used for withdraw/deposit views
void drawFigures() {
  fill(0, 144, 255);
  rect(350, 450, 300, 75, 12, 12, 12, 12);
  fill(255);
  textSize(32);
  text("$20", 465, 500);
  
  fill(0, 144, 255);
  rect(350, 550, 300, 75, 12, 12, 12, 12);
  fill(255);
  textSize(32);
  text("$40", 465, 600);
  
  fill(0, 144, 255);
  rect(350, 650, 300, 75, 12, 12, 12, 12);
  fill(255);
  textSize(32);
  text("$80", 465, 700);
  
  fill(0, 144, 255);
  rect(350, 750, 300, 75, 12, 12, 12, 12);
  fill(255);
  textSize(32);
  text("$100", 455, 800);
  
  fill(0, 144, 255);
  rect(418, 900, 150, 75, 12, 12, 12, 12);
  fill(255);
  textSize(32);
  text("BACK", 450, 950);
}

// Handle button clicks
void mouseClicked() {
  if (mouseX >= 350 && mouseX <= 650 && mouseY >= 500 && mouseY <= 575 && showMenu == false) {
    showLogin = false;
    showMenu = true;
  }
  
  else if (mouseX >= 800 && mouseX <= 950 && mouseY >= 900 && mouseY <= 975 && showMenu == true) {
    showLogin = true;
    showMenu = false;
  }
  
  else if (mouseX >= 350 && mouseX <= 650 && mouseY >= 450 && mouseY <= 525 && showMenu == true) {
    showBalance = true;
    showMenu = false;
  }
  
  else if (mouseX >= 418 && mouseX <= 568 && mouseY >= 600 && mouseY <= 675 && showBalance == true) {
    showBalance = false;
    showMenu = true;
  }
  
  else if (mouseX >= 350 && mouseX <= 650 && mouseY >= 550 && mouseY <= 625 && showMenu == true) {
    showWithdraw = true;
    showMenu = false;
  }
  
  else if (mouseX >= 418 && mouseX <= 568 && mouseY >= 900 && mouseY <= 975 && showWithdraw == true) {
    showWithdraw = false;
    showMenu = true;
  }
  
  else if (mouseX >= 350 && mouseX <= 650 && mouseY >= 650 && mouseY <= 725 && showMenu == true) {
    showDeposit = true;
    showMenu = false;
  }
  
  else if (mouseX >= 418 && mouseX <= 568 && mouseY >= 900 && mouseY <= 975 && showDeposit == true) {
    showDeposit = false;
    showMenu = true;
  }
  
  // WITHDRAW
  else if (mouseX >= 350 && mouseX <= 650 && mouseY >= 450 && mouseY <= 525 && showWithdraw == true) {
    balance -= 20;
  }
  
  else if (mouseX >= 350 && mouseX <= 650 && mouseY >= 550 && mouseY <= 625 && showWithdraw == true) {
    balance -= 40;
  }
  
  else if (mouseX >= 350 && mouseX <= 650 && mouseY >= 650 && mouseY <= 725 && showWithdraw == true) {
    balance -= 80;
  }
  
  else if (mouseX >= 350 && mouseX <= 650 && mouseY >= 750 && mouseY <= 825 && showWithdraw == true) {
    balance -= 100;
  }
  
  // DEPOST
  else if (mouseX >= 350 && mouseX <= 650 && mouseY >= 450 && mouseY <= 525 && showDeposit == true) {
    balance += 20;
  }
  
  else if (mouseX >= 350 && mouseX <= 650 && mouseY >= 550 && mouseY <= 625 && showDeposit == true) {
    balance += 40;
  }
  
  else if (mouseX >= 350 && mouseX <= 650 && mouseY >= 650 && mouseY <= 725 && showDeposit == true) {
    balance += 80;
  }
  
  else if (mouseX >= 350 && mouseX <= 650 && mouseY >= 750 && mouseY <= 825 && showDeposit == true) {
    balance += 100;
  }
  
  redraw(); //<>//
}