//get contols
get_controls();


//moving
moveDir = rightKey - leftKey;


xspd = moveDir*moveSpd;

// x collisions
		var _subPixel = .5;
		if place_meeting(x + xspd, y, oWall)
		{
	
	
			var _pixelCheck = _subPixel * sign(xspd);
			while !place_meeting(x + _pixelCheck, y, oWall)
			{
			  x += _pixelCheck;	
			}
	
			xspd = 0;
		}

		x += xspd;
		
		
	
		//gravity
		yspd += grav;
		
		
		//reset jumping varibles
		
		if onGround{
			
		jumpCount = 0;	
		}else{
		if jumpCount == 0{jumpCount = 1; };	#
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
	
	
	
	if yspd >= 0 && place_meeting(x, y+1, oWall)
	{	
	onGround = true;	
	}else{
	onGround = false;
	if jumpCount == 0{jumpCount = 1; };	
	}
	y += yspd;