ControlSetup();

idleSpr = sPlayerIdle;
walkSpr = sPlayerWalk;
jumpSpr = sPlayerJump;
runSpr = sPlayerRun;
face = 1;

moveDir = 0;
moveSpd = 2;
xspd = 0;
yspd = 0;

grav = .325;
termVel = 6;
jumpSpd = -5.5;
jumpMax = 1;
jumpCount = 0;
jumpHoldTimer = 0;
jumpHoldFrames = 3;
onGround = true;

playerHealth = 5;
playerMaxHealth = 10;
timer1 = 0; 

// Moving platforms
myFloorPlat = noone;
moveplatXspd = 0;

