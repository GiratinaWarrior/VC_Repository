/// @description Insert description here
// You can write your code in this editor

#region Gravity

y = y + ySpeed;

if (place_meeting(x, y + ySpeed, obj_WallPlatform)){
	
	while(!place_meeting(x, y + sign(ySpeed), obj_WallPlatform))
	{
		y = y + sign(ySpeed);
	}
	
	ySpeed = 0;
}

if (CanFloat == 1)
{
	y += bouncespeed;

	if (y >= midpoint + amplitude) || (y <= midpoint - amplitude) 
	{
		bouncespeed *= -1;
	}
}

x += walkspeed;

if (x >= middlepoint + distlimit) || (y <= middlepoint - distlimit)
{
	walkspeed *= -1;
}

if (walkspeed != 0)
{
	
	image_xscale = -sign(walkspeed);
	
}

if (place_meeting(x + walkspeed, y, obj_WallPlatform)){
	
	while(!place_meeting(x + sign(walkspeed), y, obj_WallPlatform))
	{
		x = x + sign(walkspeed);
	}

	walkspeed *= -1;

}


image_angle += SpinSpeed;

#endregion

#region Text

//DrawSetText(c_white, ft_NPC, fa_left, fa_top);
//draw_text(x, y + 60, PauseFloat);

if (instance_exists(obj_Player))
{

if (point_in_circle(obj_Player.x, obj_Player.y, x, y, TalkRange)) //&& (!instance_exists(obj_NPCTextBox))
{
	
	if (mouse_check_button_pressed(mb_right)){
		
		if (myTextbox = noone)
		{
			
			CanFloat = 0;
			walkspeed = 0;
		
			TextBoxWidth = sprite_get_width(spr_NPCTextBox);
		
			myTextbox = instance_create_layer(x - TextBoxWidth/2, y - 80, layer, obj_NPCTextBox)
		
			with (myTextbox) 
			{
				Text = other.Speech;					
				length = string_length(Text);
			}
			
			with (obj_Camera)
			{
				follow = other.id;
			}
	
		}//if myTextbox is empty

		
	}//end mouse right button pressed
	
}//end if nearby

else 
{
	if (myTextbox != noone)
	{
		instance_destroy(myTextbox);
		myTextbox = noone;
		obj_Camera.follow = obj_Player;
		obj_Player.hascontrol = true;
	}
	
	CanFloat = PauseFloat;
	
}

}

#endregion