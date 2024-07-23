/// @description Insert description here
// You can write your code in this editor
rightKey = keyboard_check(vk_right);
leftKey = keyboard_check(vk_left);
jumpKeyPressed = keyboard_check_pressed(vk_space);


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
		
		if yspd > termVel{yspd = termVel}
		
		
		//jump
		
	if jumpKeyPressed&&place_meeting(x, y+1, oWall)	
	{
	yspd = jumpSpd;	
	}
		
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
	
	y += yspd;