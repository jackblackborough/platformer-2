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
} else {
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
	if jumpCount == 0 && coyoteJumpTimer <= 0 { jumpCount = 1; }
}
		
if jumpKeyBuffered && jumpCount < jumpMax
{
	jumpKeyBuffered = false;
	jumpKeyBufferTimer = 0;
	jumpCount++;

    jumpHoldTimer = jumpHoldFrames;
	setOnGround(false)
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
var _listSize = instance_place_list(x, y + 1 + _clampYspd + moveplatMaxYspd, _array, _list, false);

// Loop through the colliding instances and only return this instance if the top is below the player

var playerBottom = bbox_bottom

for (var _i = 0; _i < _listSize; _i++)
{
	// Get an instance of oWall or oSemiSolidWall from this list
	var _listInst = _list[| _i];
	
	// Avoid magnetism
	if (
		(_listInst.yspd <= yspd || instance_exists(myFloorPlat)) && 
		(_listInst.yspd > 0 || place_meeting(x, y + 1 + _clampYspd, _listInst))
	)
	{
		if (
			_listInst.object_index == oWall || 
			object_is_ancestor(_listInst.object_index, oWall) ||
			floor(bbox_bottom) <= ceil(_listInst.bbox_top - _listInst.yspd)
		)
		{
			// Return the "highest" wall object
			if (
				!instance_exists(myFloorPlat) ||
				_listInst.bbox_top + _listInst.yspd <= myFloorPlat.bbox_top + myFloorPlat.yspd || 
				_listInst.bbox_top + _listInst.yspd <= bbox_bottom 
			) 
			{
				myFloorPlat = _listInst;
			}	
		}
	}
}

// Destroy the ds list
ds_list_destroy(_list);

// One last check to make sure the floor platform is actually below us
if (
	instance_exists(myFloorPlat) && 
	!place_meeting(x, y + moveplatMaxYspd, myFloorPlat)
)
{
	myFloorPlat = noone;
}

// Land on the ground platform if there is one
if (instance_exists(myFloorPlat)) 
{
	var _subPixel = 0.5;
	while (!place_meeting(x, y + _subPixel, myFloorPlat) && !place_meeting(x, y, oWall)) 
	{
		y += _subPixel;
	}
	
	if (myFloorPlat.object_index = oSemiSolidWall || object_is_ancestor(myFloorPlat.object_index, oSemiSolidWall))
	{
		while (place_meeting(x, y, myFloorPlat)) 
		{
			y -= _subPixel;	
		}
	}
	
	y = floor(y);
	
	// Collide with the ground
	yspd = 0;
	setOnGround(true);
}
	

y += yspd;
		

if abs(xspd) > 0{sprite_index = walkSpr}

if xspd == 0{sprite_index = idleSpr;}
	
if (yspd < 0 && onGround == false) 
{
	sprite_index = jumpSpr;	
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