//get contols
get_controls();


//moving
moveDir = rightKey - leftKey;

if moveDir != 0 { 
	face = moveDir;
}

xspd = moveDir*moveSpd;

// x collisions
var _subPixel = .5;

if place_meeting(x + xspd, y, oWall) 
{
	
	if !place_meeting(x + xspd, y - abs(xspd)-1, oWall)
	{				 
		while place_meeting(x + xspd, y, oWall){y -= _subPixel}
	} 
	else 
	{
					 
		if !place_meeting(x + xspd, y + abs(xspd)+1, oWall)
		{
			while place_meeting(x + xspd, y , oWall){y += _subPixel;}
		}
					 
		var _pixelCheck = _subPixel * sign(xspd);
		while !place_meeting(x + _pixelCheck, y, oWall){x += _pixelCheck;}
	
			x += _pixelCheck;	
		
	
		xspd = 0;
	}			 
}

if yspd  >=0 && !place_meeting(x + xspd, y +1 , oWall) && place_meeting(x + xspd, y + _subPixel , oWall)
{   
	while !place_meeting(x + xspd, y + abs(xspd)+1, oWall){y += _subPixel;};
}

x += xspd;
		
//gravity


if coyoteHangTimer > 0
{

coyoteHangTimer--;	
	
}else{
	
	yspd += grav;
	
	setOnGround(false)
	
}


		
if onGround 
{
	jumpCount = 0;	
	coyoteJumpTimer = coyoteJumpFrames;
	jumpHoldTimer = 0;
}
else
{
	coyoteJumpTimer--;
	if jumpcount == 0 & coyoteJumpTimer <= 0 {jumpCount = 1;}
}
		
if jumpKeyBuffered && jumpCount < jumpMax
{
	jumpKeyBuffered = false;
	jumpKeyBufferTimer = 0;
	jumpCount++;

    jumpHoldTimer = jumpHoldFrames;
}
	
if !jumpKey 
{
	jumpHoldTimer = 0;	
}
	
if jumpHoldTimer > 0
{
	yspd = jumpSpd;
	jumpHoldTimer--;
}
	
	yspd += grav;
	
	
if yspd > termVel { yspd = termVel }
		
var _subPixel = .5;
		
if yspd < 0 && place_meeting(x, y + yspd , oWall)
{
	var _slopeSlide = false
			     
	if moveDir == 0 && !place_meeting( x - abs(yspd)-1, y + yspd, oWall)
	{
		while place_meeting(x, y + yspd, oWall) { x -= 1; }; 
		_slopeSlide = true;
	} 
				 
	if moveDir == 0 && !place_meeting( x - abs(yspd)+1, y + yspd, oWall)
	{
		while place_meeting(x, y + yspd, oWall) { x += 1; }; 
		_slopeSlide = true;
	} 
				 
	if ! _slopeSlide
	{
		var _pixelCheck = _subPixel* sign(yspd)
		while ! place_meeting(x, y + _pixelCheck, oWall)
		{
			y += _pixelCheck
		}
	} 
	
	yspd = 0;
}
		
// Floor y collision
// Check for solid and semisolid platforms under me
var _clampYspd = max(0 , yspd);
var _list = ds_list_create();
var _array = array_create(0);
array_push(_array, oWall, oSemiSolidWall);

// Do the actual check and add objects to list
instance_place_list(x, y + 1 + _clampYspd + termVel, _array, _list, false);


y += yspd;
		
if abs(xspd) > 0{sprite_index = walkSpr}
	
if xspd == 0{sprite_index = idleSpr;}
	
if y != -1
{
	if !place_meeting(x, y +15, oWall)
	{
		sprite_index = jumpSpr;	
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

if !instance_exists(oHeart)
{
	instance_create_depth(x+30, y, 50, oHeart);
}

oHeart.image_index = playerHealth;