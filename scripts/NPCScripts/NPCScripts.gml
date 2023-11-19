/// @description NPC_Movement()
/* 
This function runs the movement code for the NPCs, where they will move around as normal
*/
function NPC_Movement(){

	if (myTextbox == noone)
	{

		#region Movement

			ySpeed += Gravity;

			Wall_FallOn();
			Wall_SwitchRun();

			x += xSpeed * NPC_MoveSpeed;

			if (xSpeed != 0)
			{
				image_xscale = -sign(xSpeed);
			}


			if (NPC_CanFloat == true)
			{	
				NPC_360Count += NPC_MoveSpeed;
				y = ystart + NPC_BounceDistance * sin(NPC_360Count / NPC_BounceTime);
			}
			else
			{
				y += ySpeed * NPC_MoveSpeed;
			}
			
			
			x = clamp(x, 0, room_width);
			y = clamp(y, 0, room_height);

		#endregion
	
		TextBox_Text = Speech;
		
	}

}
	
function NPC_Jest_Function()
{
	NPC_Movement();
	
	if (myTextbox != noone)
	{
		if (myTextbox.TextBox_CharCount == 0)
		{
			//audio_play_sound(choose(sound_JestHuhuhu, sound_JestLaugh), 200, false);
		}
	}
}

function NPC_Lavender_Function()
{
	NPC_Movement();
}