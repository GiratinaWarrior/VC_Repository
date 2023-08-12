/// @description The Cardinal Inauguration Cutscene

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
					xTo = 0;
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
				"The Cardinal Inauguration Ceremony!"
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
		
			if !(CardinalNoctisCongrats_AudienceAssemble_SequenceCreated)
			{
				CardinalNoctisCongrats_AudienceAssemble_Sequence = layer_sequence_create("Residents", 560, 530, seq_CardinalNoctisCongrats_AudienceAssemble);	
				obj_Player.image_xscale = 1;
				CardinalNoctisCongrats_AudienceAssemble_SequenceCreated = true;
			} 
			else if (layer_sequence_is_finished(CardinalNoctisCongrats_AudienceAssemble_Sequence))
			{
				layer_sequence_destroy(CardinalNoctisCongrats_AudienceAssemble_Sequence);
				if (CardinalNoctisCongrats_AudienceIdleSequence == noone) 
					{
						CardinalNoctisCongrats_AudienceIdleSequence = layer_sequence_create("Residents", 560, 530, seq_CardinalNoctisCongrats_AudienceIdle);
					}
				CardinalNoctisCongrats_State = CARDINALNOCTISCONGRATS.LAVENDER_SPEECH;
			}
		
		#endregion
		
		break;//end Audience Assemble Stage
		
	//Lavender Speech Stage
	case CARDINALNOCTISCONGRATS.LAVENDER_SPEECH:
	
		#region Lavender Speech
		
			var _text = 
			[
				"My children of Nox, during my time as Cardinal, our life together has been wonderful and filled with peace", 
				"We did not have worry about starving, suffering from illness, and falling in war, and we could spend our days doing pointless things like knitting clothes, lazing around in the moonlight, and planting flowers.",
				"The only reason such fun could ever exist was because of the struggles of the previous Cardinals who fought for peace so that we could have it easy, and you know...",
				"I have been recently starting to think that it is about time I took it even easier, and as we all know, there is only one way to go about this.", 
				"Rose!", 
				"She who stands before you has successfully completed our onerous tests, and is ready to succeed the will of me and my predecessors",
				"I ask you to welcome my beautiful daughter as your new guardian figure, but much more importantly, as our friend"

			];
		
			if (!CardinalNoctisCongrats_LavenderSpeech_TalkStarted)
			{
				CutsceneText(_text, "Lavender", TEXTBOX_POS.BOTTOM, ft_Silver);
				CardinalNoctisCongrats_LavenderSpeech_TalkStarted = true;
			}
			else if (!instance_exists(obj_Text))
			{
				CardinalNoctisCongrats_State = CARDINALNOCTISCONGRATS.AUDIENCE_CHEER;
			}
			
		#endregion
		
		break;//end Lavender Speech Stage
		
	//Audience Cheer Stage
	case CARDINALNOCTISCONGRATS.AUDIENCE_CHEER:
		
		#region Audience Cheer
		
			var _text = 
			[
				"WOOOOOOOOOOHOOOOOOOOOOOOOOO",
				"ROSE! ROSE! CARDINAL ROSE! ROSE! ROSE! CARDINAL ROSE!",
				"WOOOOOOOOOOHOOOOOOOOOOOOOOO"
			];
		
			if (!CardinalNoctisCongrats_AudienceCheer_TalkStarted)
			{
				CutsceneText(_text, "Noxians", TEXTBOX_POS.BOTTOM, ft_NPC);
				CardinalNoctisCongrats_AudienceCheer_TalkStarted = true;
			}
			else if (!instance_exists(obj_Text))
			{
				CardinalNoctisCongrats_State = CARDINALNOCTISCONGRATS.LAVENDER_END_SPEECH;
			}
		
		#endregion
		
		break;//end Audience Cheer Stage
	
	//Lavender End Speech Stage
	case CARDINALNOCTISCONGRATS.LAVENDER_END_SPEECH:
		
		#region Lavender End Speech
		
			var _text = 
			[
				"Ahem, now that my thesaurus-petting speech is finished, it is time for us to"	
			];
		
			if (!CardinalNoctisCongrats_LavenderEndSpeech_TalkStarted)
			{
				CutsceneText(_text, "Lavender", TEXTBOX_POS.BOTTOM, ft_Silver);
				CardinalNoctisCongrats_LavenderEndSpeech_TalkStarted = true;
			}
			else if (!instance_exists(obj_Text))
			{
				CardinalNoctisCongrats_State = CARDINALNOCTISCONGRATS.SHRINE_EXPLOSION;
			}
			else
			{
				with (obj_Text)
				{
					if (TextBox_CharCount >= string_length(TextBox_Text[TextBox_Page]))
					{
						other.CardinalNoctisCongrats_State = CARDINALNOCTISCONGRATS.SHRINE_EXPLOSION;
					}
				}
			}
		
		#endregion
		
		break;//end Lavender End Speech Stage
		
	//Shrine Explosion Stage
	case CARDINALNOCTISCONGRATS.SHRINE_EXPLOSION:
	
		#region Shrine Explosion
		
		#endregion
		
		break;//end Shrine Explosion Stage
		
}//end Cardinal Ceremony Stage machine


