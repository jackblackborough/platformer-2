//get contols
get_controls();
if !instance_exists(oHeart)
{
instance_create_depth(x+30, y, 50, oHeart);
}




oHeart.image_index = playerHealth;
//moving
moveDir = rightKey - leftKey;

if moveDir != 0{face = moveDir;}

xspd = moveDir*moveSpd;



// x collisions
		var _subPixel = .5;
		if place_meeting(x + xspd, y, oWall)
		{
	
                     
					 if !place_meeting(x + xspd, y - abs(xspd)-1, oWall)
					 {
					 
						while place_meeting(x + xspd, y, oWall){y -= _subPixel}
					 }else{
					 
					 if !place_meeting(x + xspd, y + abs(xspd)+1, oWall)
					 {
						 while place_meeting(x + xspd, y , oWall){y += _subPixel;}
					 }
					 
			var _pixelCheck = _subPixel * sign(xspd);
			while !place_meeting(x + _pixelCheck, y, oWall)
			{
			  x += _pixelCheck;	
			}
	
			xspd = 0;
		
				//if yspd < 0{jumpHoldTimer = 0;}
			}			 }

   if yspd  >=0 && !place_meeting(x + xspd, y +1 , oWall) && place_meeting(x + xspd, y + _subPixel , oWall)
   {   
		while !place_meeting(x + xspd, y + abs(xspd)+1, oWall){y += _subPixel;};
   }
		x += xspd;
		
		
	
		//gravity
		yspd += grav;
		
		
		//reset jumping varibles
		
		if onGround{
			
		jumpCount = 0;	
		}else{
		if jumpCount == 0{jumpCount = 1; };	
		}
		//jump
		
	if jumpKeyBuffered && jumpCount < jumpMax
	{
	jumpKeyBuffered = false;
	jumpKeyBufferTimer = 0;
	jumpCount++;


     jumpHoldTimer = jumpHoldFrames;
	}
	
	if!jumpKey 
	{
	jumpHoldTimer = 0;	
	}
	
	
	
	if jumpHoldTimer > 0
	{
		
	yspd = jumpSpd;
	jumpHoldTimer--;
		
	}
	
if yspd > termVel{yspd = termVel}
			
	var _subPixel = .5;
	if place_meeting(x ,y + yspd, oWall)
	{
	var _pixelCheck = _subPixel * sign(yspd);
	while !place_meeting(x, y + _pixelCheck, oWall)
	    {
		   y += _pixelCheck;	
		}
	
	
	   yspd = 0;
	}
	
	if !instance_exists(oFlightCoin)
	{
	   jumpHoldFrames = 6000;	
	}
	
	
	
	if yspd >= 0 && place_meeting(x, y+1, oWall)
	{	
	onGround = true;	
	}else{
	onGround = false;
	if jumpCount == 0{jumpCount = 1; };	
	}
	y += yspd;
	
    
	
	if abs(xspd) > 0{sprite_index = walkSpr}
	
	if xspd == 0{sprite_index = idleSpr;}
	
	if y != -1{
	if !place_meeting(x, y +15, oWall)
	{
	
	 {sprite_index = jumpSpr;}
	
	}
	
	}
	mask_index = idleSpr;
	
	
	if keyboard_check(ord("H") )
	{
          sprite_index = sPlayerCrouch;
		  mask_index = sPlayerCrouch;
		
	}
	
	var _playerHealth = playerHealth
	
	
	
	
	if playerHealth = 0
	{
	instance_destroy();
	draw_text(x, y, "you lose");
game_restart()
	}
	
	if playerHealth = playerMaxHealth
	{
	playerHealth = playerMaxHealth;	
	}
	

	