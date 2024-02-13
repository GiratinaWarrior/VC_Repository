
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