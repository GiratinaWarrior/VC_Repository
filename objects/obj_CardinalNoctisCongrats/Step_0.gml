/// @description Insert description here
// You can write your code in this editor

//show_debug_message("Lavender X: {0}", Lavender_NoctisCity_Podium.x);

with (Lavender_NoctisCity_Podium)
{
	x = floor(x);
	y = floor(y);
}

//The Stages of the Cardinal Ceremony
switch(CardinalNoctisCongrats_State)
{
	//Lavender Greeting Stage: Lavender greets the player, and starts the cutscene
	case CARDINALNOCTISCONGRATS.LAVENDER_GREETING:
		
		#region Lavender Greeting
		
			var _text = 
			[
				"Ah, there you are Rose-darling, about time you showed",
				"No time to waste, time to get started"
			]
		
			if (!CardinalNoctisCongrats_LavenderGreeting_TalkStarted)
			{
				CutsceneText(_text, "Lavender", TEXTBOX_POS.BOTTOM, ft_Silver);
				CardinalNoctisCongrats_LavenderGreeting_TalkStarted = true;
			}
			else if (!instance_exists(obj_Text))
			{
				CardinalNoctisCongrats_State = CARDINALNOCTISCONGRATS.LAVENDER_ASCEND;
			}
			
		#endregion
		
		break;//end Lavender Greeting Stage
		
	//Lavender Ascend Stage: Lavender flies up to a higher podium
	case CARDINALNOCTISCONGRATS.LAVENDER_ASCEND:
		
		#region Lavender Ascend
		
			if (!CardinalNoctisCongrats_LavenderAscend_SequenceCreated)
			{
				CardinalNoctisCongrats_LavenderAscend_Sequence = layer_sequence_create(layer, 416, 578, seq_CardinalNoctisCongrats_LavenderAscend);
				Lavender_NoctisCity_Podium.visible = false;
				CardinalNoctisCongrats_LavenderAscend_SequenceCreated = true;
			}
		
			else if (layer_sequence_is_finished(CardinalNoctisCongrats_LavenderAscend_Sequence))
			{
				//CardinalNoctisCongrats_LavenderSprite = layer_sprite_create(layer, 352, 320, spr_Lavender_Idle);
				Lavender_NoctisCity_Podium.visible = true;
				Lavender_NoctisCity_Podium.x = 352;
				Lavender_NoctisCity_Podium.y = 320;
				layer_sequence_destroy(CardinalNoctisCongrats_LavenderAscend_Sequence);
				CardinalNoctisCongrats_State = CARDINALNOCTISCONGRATS.LAVENDER_CALL_ASSEMBLY
			}
			else
			{
				with (obj_Camera)
				{
					follow = noone;
					xTo = 495;
					yTo = 526;
				}
			}
			
			
		#endregion
		
		break;//end Lavender Ascend Stage;
		
	//Lavender Call Assembly Stage
	case CARDINALNOCTISCONGRATS.LAVENDER_CALL_ASSEMBLY:
	
		#region Lavender Call Assembly
	
			var _text = 
			[
				"Attention, all Residents of Noctis City, come forth for it is time",
				"It is time to begin",
				"The Cardinal Inauguration Ceremony"
			];
		
			if (!CardinalNoctisCongrats_LavenderCallAssembly_TalkStarted)
			{
				CutsceneText(_text, "Lavender", TEXTBOX_POS.BOTTOM, ft_Silver);
				CardinalNoctisCongrats_LavenderCallAssembly_TalkStarted = true;
			}
			else if (!instance_exists(obj_Text))
			{
				CardinalNoctisCongrats_State = CARDINALNOCTISCONGRATS.AUDIENCE_ASSEMBLE;
			}
			
		#endregion
		
		break;//end Lavender Call Assembly Stage
		
	//Audience Assemble Stage
	case CARDINALNOCTISCONGRATS.AUDIENCE_ASSEMBLE:
		
		#region Audience Assemble
		
		#endregion
		
		break;//end Audience Assemble
		
}//end Cardinal Ceremony Stage machine


