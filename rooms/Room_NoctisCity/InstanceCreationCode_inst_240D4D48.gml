
sprite_index = spr_DavidOdisho;

Name = "Ref Sound 66";

Speech = 
[
	"if (Rose == 'Nearby') Initiate talkFunction()",
	"talkFunction() called",
	"Error: ParameterMismatchException",
	"Expected type 'Cool'",
	"Recieved type 'Loser'",
	"Rebooting System...",
	"Terminating Conversation.",
	"Conversation Terminated."
];

EntityAdditionFunc = function()
{
	NPC_Movement();

	if (instance_exists(myTextbox))
	{
		if (global.Key_Talk) && (myTextbox.TextBox_Page + 1 >= array_length(myTextbox.TextBox_Text)) && (myTextbox.TextBox_CharCount >= string_length(myTextbox.TextBox_Text[myTextbox.TextBox_Page]))
		{
			//Give the player control back
			with (obj_Player)
			{
				hascontrol = true;
			}//end give player control
			
		
			//Make the camera follow the player
			obj_Camera.follow = obj_Player; 
			
			instance_destroy(myTextbox);
			instance_destroy();
		}
	}

	if (instance_exists(myTextbox)) && (myTextbox.TextBox_CharCount >= string_length(myTextbox.TextBox_Text[myTextbox.TextBox_Page]))
	{
		image_speed = 0;
		image_index = 0;
	}
	else
	{
		image_speed = 1;
		image_angle = random_range(0, 360);
	}

}