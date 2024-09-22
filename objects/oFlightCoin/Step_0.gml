/// @description Insert description here
// You can write your code in this editor
if place_meeting(x, y, oPlayer)
{
	audio_play_sound(sCoin, 60, false)
	instance_destroy();
}

timer++;

if timer = 300{instance_create_depth(x, y, 50, oCoin)timer = 0;}