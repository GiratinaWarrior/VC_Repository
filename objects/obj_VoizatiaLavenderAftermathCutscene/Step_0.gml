/// @description

//Stage machine for this cutscene
switch (VoizatiaLavenderAftermath_State)
{
	
	//Off Stage
	case VOIZATIALAVENDERAFTERMATHCUTSCENE.OFF:
		
		#region Off
		
			if !(VoizatiaLavenderAftermath_IdleCreated)
			{
				VoizatiaLavenderAftermath_VoizatiaIdle = layer_sequence_create(layer, 0, 0, seq_VoizatiaLavenderAftermath_VoizatiaIdle);
				VoizatiaLavenderAftermath_LavenderIdle = layer_sprite_create(layer, room_width - 126, room_height + 16, spr_Lavender_Down);
				VoizatiaLavenderAftermath_IdleCreated = true;
			}
		
		#endregion
		
		break;//end Off Stage
	
	//Camera Pan Stage
	case VOIZATIALAVENDERAFTERMATHCUTSCENE.CAMERA_PAN:
		
		#region Camera Pan
			
			var _cameraTargetX = 960;
			
			with (obj_Camera)
			{
				follow = noone;
				xTo = _cameraTargetX;
			}
			
			if (obj_Camera.x == _cameraTargetX)
			{
				VoizatiaLavenderAftermath_State = VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_TALK_LAVENDER;
			}
		
		#endregion
	
		break;//end Camera Pan Stage
	
	//Voizatia Talk Lavender Stage
	case VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_TALK_LAVENDER:
		
		#region Voizatia Talk Lavender
			
			var _text = 
			[
				"This is the maximum power level that the Noxians are capable of?",
				"Thats one hell of a low bar, it's a miracle that no ones tripped over it yet.",
				"Wouldn't you agree Rose?",
			];
		
			if !(VoizatiaLavenderAftermath_VoizatiaTalkLavender_TalkStarted)
			{
				CutsceneText(_text, "Voziatia", TEXTBOX_POS.BOTTOM, ft_Voizatia);
				VoizatiaLavenderAftermath_VoizatiaTalkLavender_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				var _func = function()
				{
					VoizatiaLavenderAftermath_State = VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_TELEPORT_ROSE;
				}
				
				TimeSourceCreateAndStart(60, _func, [], 1);
			}
		
		#endregion
		
		break;//end Voizatia Talk Lavender Stage
	
	//Voizatia Teleport Rose Stage
	case VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_TELEPORT_ROSE:
	
		#region Voizatia Teleport Rose
		
			if !(VoizatiaLavenderAftermath_VoizatiaTeleportRose_SequenceCreated)
			{
				VoizatiaLavenderAftermath_VoizatiaTeleportRose_Sequence = layer_sequence_create("VoizatiaTeleport", 0, 0, seq_VoizatiaLavenderAftermath_VoizatiaTeleport)
				layer_sequence_x(VoizatiaLavenderAftermath_VoizatiaIdle, 256);
				VoizatiaLavenderAftermath_VoizatiaTeleportRose_SequenceCreated = true;
			}
			else if (layer_sequence_is_finished(VoizatiaLavenderAftermath_VoizatiaTeleportRose_Sequence))
			{
				layer_sequence_destroy(VoizatiaLavenderAftermath_VoizatiaTeleportRose_Sequence);
				VoizatiaLavenderAftermath_VoizatiaTeleportRose_Sequence = noone;
				VoizatiaLavenderAftermath_State = VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_TALK_ROSE;
			}
		
		#endregion
	
		break;//end Voizatia Teleport Rose Stage
	
	//Voizatia Talk Rose Stage
	case VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_TALK_ROSE:
	
		#region Voizatia Talk Rose
			
			var _text = 
			[
				"You're different from these people aren't you? I can tell. There's something about you, something familiar.",
				"I could tell the moment I saw you, and the fact that you're here means you beat Malvalia, as expected.",
				"I hope you weren't to rough with her, she may be rude, reckless, and sassy, but she's still my little sister.",
				"Though I guess I can't really ask that since I roughed up your 'mother'."
			];
			
			if !(VoizatiaLavenderAftermath_VoizatiaTalkRose_TalkStarted)
			{
				CutsceneText(_text, "Voizatia", TEXTBOX_POS.BOTTOM, ft_Voizatia);
				VoizatiaLavenderAftermath_VoizatiaTalkRose_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				var _func = function()
				{
					VoizatiaLavenderAftermath_State = VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_PROPOSAL;
				}
				TimeSourceCreateAndStart(60, _func, [], 1);
			}
		
		#endregion
	
		break;//end Voizatia Talk Rose Stage\
		
	//Voizatia Proposal Stage
	case VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_PROPOSAL:
	
		#region Voizatia Proposal
		
			var _text = 
			[
				"Say, winning this way is a bit anti-climactic don't ya think?",
				"One thing I love more than anything is a good old battle to the death.",
				"The fragility of life shows itself along with the blood, the power of vallen, and the story that it tells.",
				"Everything about is wonderful, and it's something that our people instinctively desire.",
				"All I'm saying is that those Carvaline Orbs only feel earned after a strong fight, which I didn't get.",
				"So here's the deal...",
			];
			
			if !(VoizatiaLavenderAftermath_VoizatiaProposal_TalkStarted)
			{
				CutsceneText(_text, "Voizatia", TEXTBOX_POS.BOTTOM, ft_Voizatia);
				VoizatiaLavenderAftermath_VoizatiaProposal_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				VoizatiaLavenderAftermath_State = VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_HOSTAGE;
			}
		
		#endregion
	
		break;//end Voizatia Proposal Stage
	
	//Voizatia Hostage Stage
	case VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_HOSTAGE:
	
		#region Voizatia Hostage
		
			if !(VoizatiaLavenderAftermath_VoizatiaHostage_SequenceCreated)
			{
				VoizatiaLavenderAftermath_VoizatiaHostage_Sequence = layer_sequence_create("VoizatiaTeleport", 0, 0, seq_VoizatiaLavenderAftermath_VoizatiaHostage)
				layer_sequence_destroy(VoizatiaLavenderAftermath_VoizatiaIdle);
				VoizatiaLavenderAftermath_VoizatiaHostage_SequenceCreated = true;
			}
			else if (layer_sequence_is_finished(VoizatiaLavenderAftermath_VoizatiaHostage_Sequence))
			{
				VoizatiaLavenderAftermath_VoizatiaIdle = layer_sequence_create(layer, 0, 0, seq_VoizatiaLavenderAftermath_VoizatiaThreaten);
				layer_sequence_destroy(VoizatiaLavenderAftermath_VoizatiaHostage_Sequence);
				VoizatiaLavenderAftermath_State = VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_THREATEN_LAVENDER;
			}
			
		#endregion
	
		break;//end Voizatia Hostage Stage
	
	//Voizatia Threaten Lavender Stage
	case VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_THREATEN_LAVENDER:
	
		#region Voizatia Threaten Lavender
			
			var _text = 
			[
				"I've given the Carvaline Orbs to my comrades, one orb for each of them.",
				"They're likely going around Nox having fun with the new power they've been granted.",
				"You will hunt and kill them, growing stronger as you go.",
				"Then you will come back when you're strong enough to fight me"
			];
		
			if !(VoizatiaLavenderAftermath_VoizatiaThreatenLavender_TalkStarted)
			{
				CutsceneText(_text, "Voizatia", TEXTBOX_POS.BOTTOM, ft_Voizatia);
				VoizatiaLavenderAftermath_VoizatiaThreatenLavender_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				
			}
		
		#endregion
	
		break;//end Voizatia Threaten Lavender
	
}//end Stage machine






