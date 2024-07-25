function ControlSetup()
{

bufferTime = 3;
jumpKeyBuffered = false;
jumpKeyBufferTimer = 0;

}


function get_controls()
{
//direction inputs
rightKey = keyboard_check(vk_right) +  gamepad_button_check(0, gp_padr);
rightKey = clamp(rightKey, 0, 1); 
leftKey = keyboard_check(vk_left) + gamepad_button_check(0, gp_padl);
leftKey = clamp(leftKey, 0, 1);

//action inputs
jumpKeyPressed = keyboard_check_pressed(vk_space) + gamepad_button_check_pressed(0,  gp_face1);
jumpKeyPressed = clamp(jumpKeyPressed, 0, 1);

jumpKey = keyboard_check(vk_space) + gamepad_button_check(0,  gp_face1);
jumpKey = clamp(jumpKey, 0, 1);


            //jump key buffereing

			if jumpKeyPressed
			{	
			jumpKeyBufferTimer = bufferTime;		
			}
            if  jumpKeyBufferTimer > 0
            {
			jumpKeyBuffered = true;
			jumpKeyBufferTimer--;
			}else{
            jumpKeyBuffered = 0;
			}



}