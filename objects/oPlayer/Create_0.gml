function setOnGround(_val = true)
{
     if _val == true
	 {
	      onGround = true	 

	 }
}

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

grav = .255;
termVel = 4;
jumpSpd = -8.5;
jumpMax = 1;
jumpCount = 0;
jumpHoldTimer = 0;
jumpHoldFrames = 3;
onGround = true;

coyoteHangFrames = 2
coyoteHangTimer = 0;

coyoteJumpFrames = 4;
coyoteJumpTimer = 0;

playerHealth = 5;
playerMaxHealth = 10;
timer1 = 0; 

// Moving platforms
myFloorPlat = noone;
moveplatXspd = 0;