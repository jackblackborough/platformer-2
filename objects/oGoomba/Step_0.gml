/// @description Insert description here
// You can write your code in this editor
xspd = moveDir*moveSpd;
		x += xspd;
		
		
		if place_meeting(x, y, oWall_3)
		{
			moveDir = -1
		}
		
		if place_meeting(x, y, oWall_1)
		{
			moveDir = 1
		}
		
		if place_meeting(x, y, oPlayer)
	     {
	
	       oPlayer.playerHealth -- ;
		instance_destroy();
	      }
		  