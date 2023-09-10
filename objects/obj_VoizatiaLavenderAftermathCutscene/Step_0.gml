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
				VoizatiaLavenderAftermath_LavenderIdle = layer_sprite_create(layer, 832, 352, spr_Lavender_Down_RougeSpear);
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
			
			var _func = function()
			{
				VoizatiaLavenderAftermath_State = VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_TALK_LAVENDER;
			}
			
			TimeSourceCreateAndStart(110, _func, [], 1);
			
		
		#endregion
	
		break;//end Camera Pan Stage
	
	//Voizatia Talk Lavender Stage
	case VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_TALK_LAVENDER:
		
		#region Voizatia Talk Lavender
			
			SetRoomAudio_Music_Default(music_VoizatiaEncounterTheme);
			
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
				
				TimeSourceCreateAndStart(30, _func, [], 1);
			}
		
		#endregion
		
		break;//end Voizatia Talk Lavender Stage
	
	//Voizatia Teleport Rose Stage
	case VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_TELEPORT_ROSE:
	
		#region Voizatia Teleport Rose
		
			if !(VoizatiaLavenderAftermath_VoizatiaTeleportRose_SequenceCreated)
			{
				VoizatiaLavenderAftermath_VoizatiaTeleportRose_Sequence = layer_sequence_create("VoizatiaTeleport", 0, 0, seq_VoizatiaLavenderAftermath_VoizatiaTeleport)
				//layer_sequence_x(VoizatiaLavenderAftermath_VoizatiaIdle, 256);
				VoizatiaLavenderAftermath_VoizatiaTeleportRose_SequenceCreated = true;
			}
			else if (layer_sequence_is_finished(VoizatiaLavenderAftermath_VoizatiaTeleportRose_Sequence))
			{
				show_debug_message("Voizatia Teleported");
				VoizatiaLavenderAftermath_State = VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_TALK_ROSE;
				layer_sequence_x(VoizatiaLavenderAftermath_VoizatiaIdle, 256);
				show_debug_message("Voizatia Teleported");
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
				layer_sequence_destroy(VoizatiaLavenderAftermath_VoizatiaTeleportRose_Sequence);
				CutsceneText(_text, "Voizatia", TEXTBOX_POS.BOTTOM, ft_Voizatia);
				//obj_Player.image_xscale = 1;
				VoizatiaLavenderAftermath_VoizatiaTalkRose_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				var _func = function()
				{
					VoizatiaLavenderAftermath_State = VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_PROPOSAL;
				}
				TimeSourceCreateAndStart(120, _func, [], 1);
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
				"You will attempt to track down and kill them, growing stronger as you go.",
				"Then you will come back to Valnyx Shrine when you're strong enough to fight me.",
				"You WILL do this.",
				"Or do you prefer you and your mother dying right here and right now?"
			];
		
			if !(VoizatiaLavenderAftermath_VoizatiaThreatenLavender_TalkStarted)
			{
				CutsceneText(_text, "Voizatia", TEXTBOX_POS.BOTTOM, ft_Voizatia);
				obj_Player.image_xscale = -1;
				VoizatiaLavenderAftermath_VoizatiaThreatenLavender_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				var _func = function()
				{
					VoizatiaLavenderAftermath_State = VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_CHALLENGE_ROSE;
				}
				TimeSourceCreateAndStart(90, _func, [], 1);
			}
		
		#endregion
	
		break;//end Voizatia Threaten Lavender
		
	//Voizatia Challenge Rose Stage
	case VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_CHALLENGE_ROSE:
		
		#region Voizatia Challenge Rose
		
			var _text = 
			[
				"That's what I thought.",
				"Or so I would say, but I bet you're thinking that you're hot stuff just because you're Cardinal and all, don't ya?",
				"You think that you can fight me on equal footing, even defeat me don't ya?",
				"Defeating me here will solve all of your problems won't it? There's no point in my deal is there?",
				"Then how about this?",
				"COME AT ME!"
			];
		
			if !(VoizatiaLavenderAftermath_VoizatiaChallengeRose_TalkStarted)
			{
				CutsceneText(_text, "Voizatia", TEXTBOX_POS.BOTTOM, ft_Voizatia);
				VoizatiaLavenderAftermath_VoizatiaChallengeRose_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				VoizatiaLavenderAftermath_State = VOIZATIALAVENDERAFTERMATHCUTSCENE.PLAYER_FREE;
			}
		
		#endregion
		
		break;//end Voizatia Challenge Rose
	
	//Player Free Stage
	case VOIZATIALAVENDERAFTERMATHCUTSCENE.PLAYER_FREE:
		
		#region Player Free
		
			obj_Player.hascontrol = true;
		
			if !(VoizatiaLavenderAftermath_PlayerFree_PlayerMoved)
			{
				if (obj_Player.xSpeed != 0 || obj_Player.ySpeed != 0)
				{
					var _func = function()
					{
						VoizatiaLavenderAftermath_State = VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_STRIKE;
					}
					TimeSourceCreateAndStart(1, _func, [], 1);
					VoizatiaLavenderAftermath_PlayerFree_PlayerMoved = true;
				}
			}
		
		
		#endregion
		
		break;//end Player Free Stage
	
	//Voizatia Strike Stage
	case VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_STRIKE:
		
		#region Voizatia Strike
		
			if !(VoizatiaLavenderAftermath_VoizatiaStrike_SequenceCreated)
			{
				VoizatiaLavenderAftermath_VoizatiaStrike_Sequence = layer_sequence_create("VoizatiaTeleport", -0, 0, seq_VoizatiaLavenderAftermath_VoizatiaStrike);
				with (obj_Player)
				{
					hascontrol = false;
					if (instance_exists(obj_LunarCannon))
					{
						instance_destroy(obj_LunarCannon);
					}
					PlayerState = PLAYERSTATE.NEUTRAL;
					PlayerNeutralState = PLAYERSTATE_NEUTRAL.GROUND;
					x = 1152;
					y = 338;
					image_xscale = -1;
				}
				VoizatiaLavenderAftermath_VoizatiaStrike_SequenceCreated = true;
			}
			else if (layer_sequence_is_finished(VoizatiaLavenderAftermath_VoizatiaStrike_Sequence))
			{
				VoizatiaLavenderAftermath_State = VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_MOCK;
			}
		
		#endregion
		
		break;//end Voizatia Strike Stage
		
	//Voizatia Mock Stage
	case VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_MOCK:
	
		#region Voizatia Mock
		
			var _text = 
			[
				"HAH! The look on your face makes taunting you worth it. What a loser!",
				"*Ahem*",
				"Moving on now that we are on the same page of 'Defying me means Death'",
				"I will repeat your orders.",
				"Go and hunt down my comrades who possess the Carvaline Orbs",
				"Once you do so, come back in order to be killed gloriously by me.",
				"What? It's better than the death thats inches in front of you."
			];
		
			if !(VoizatiaLavenderAftermath_VoizatiaMock_TalkStarted)
			{
				CutsceneText(_text, "Voizatia", TEXTBOX_POS.BOTTOM, ft_Voizatia);
				VoizatiaLavenderAftermath_SpearsIdle = layer_sequence_create("VoizatiaLavenderCutscene", 0, 0, seq_VoizatiaLavenderAftermath_SpearIdle);
				layer_sequence_destroy(VoizatiaLavenderAftermath_VoizatiaStrike_Sequence);
				VoizatiaLavenderAftermath_VoizatiaMock_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				VoizatiaLavenderAftermath_State = VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_FLY;
			}
		
		#endregion
	
		break;//end Voizatia Mock Stage
		
	//Voizatia Fly Stage
	case VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_FLY:
	
		#region Voizatia Fly
		
			if !(VoizatiaLavenderAftermath_VoizatiaFly_SequenceCreated)
			{
				VoizatiaLavenderAftermath_VoizatiaFly_Sequence = layer_sequence_create("VoizatiaLavenderCutscene", 0, 0, seq_VoizatiaLavenderAftermath_VoizatiaRise);
				layer_sequence_destroy(VoizatiaLavenderAftermath_VoizatiaIdle);
				VoizatiaLavenderAftermath_VoizatiaFly_SequenceCreated = true;
			}
			else if (layer_sequence_is_finished(VoizatiaLavenderAftermath_VoizatiaFly_Sequence))
			{
				layer_sequence_destroy(VoizatiaLavenderAftermath_VoizatiaFly_Sequence);
				VoizatiaLavenderAftermath_VoizatiaIdle = noone;
				VoizatiaLavenderAftermath_State = VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_FLY_TALK;
			}
		
		#endregion
		
		break;//end Voizatia Fly Stage
		
	//Voizatia Fly Exit Stage
	case VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_FLY_TALK:
		
		#region Voizatia Fly Exit
		
			var _text = 
			[
				"I sure can't wait for the next time we meet.",
				"We're going to have one hell of a time",
			];
			
			if !(VoizatiaLavenderAftermath_VoizatiaFlyTalk_TalkStarted)
			{
				CutsceneText(_text, "Voizatia", TEXTBOX_POS.BOTTOM, ft_Voizatia);
				VoizatiaLavenderAftermath_VoizatiaIdle = layer_sequence_create(layer, 0, 0, seq_VoizatiaLavenderAftermath_VoizatiaFloat);
				VoizatiaLavenderAftermath_VoizatiaFlyTalk_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				var _func = function()
				{
					VoizatiaLavenderAftermath_State = VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_EXIT;
				}
				TimeSourceCreateAndStart(50, _func, [], 1);
			}	
		
		#endregion
		
		break;//end Voizatia Fly Exit Stage
		
	//Voizatia Exit Stage
	case VOIZATIALAVENDERAFTERMATHCUTSCENE.VOIZATIA_EXIT:
	
		#region Voizatia Exit
		
			SetRoomAudio_Music_Default(blanksound);
		
			if !(VoizatiaLavenderAftermath_VoizatiaExit_SequenceCreated)
			{
				VoizatiaLavenderAftermath_VoizatiaExit_Sequence = layer_sequence_create("VoizatiaTeleport", 0, 0, seq_VoizatiaLavenderAftermath_VoizatiaExit);
				layer_sequence_destroy(VoizatiaLavenderAftermath_SpearsIdle);
				layer_sequence_destroy(VoizatiaLavenderAftermath_VoizatiaIdle);
				layer_sprite_destroy(VoizatiaLavenderAftermath_LavenderIdle);
				VoizatiaLavenderAftermath_VoizatiaExit_SequenceCreated = true;
			}
			else if (layer_sequence_is_finished(VoizatiaLavenderAftermath_VoizatiaExit_Sequence))
			{
				var _func = function()
				{
					VoizatiaLavenderAftermath_State = VOIZATIALAVENDERAFTERMATHCUTSCENE.CUTSCENE_END;
				}
				TimeSourceCreateAndStart(100, _func, [], 1);
			}
		
		#endregion
		
		break;//end Voizatia Exit Stage
		
	//Cutscene End Stage
	case VOIZATIALAVENDERAFTERMATHCUTSCENE.CUTSCENE_END:
	
		#region Cutscene End
			
			global.VoizatiaLavenderAftermath_Cutscene_Seen = true;
			global.ValnyxShrineUnderAttack_Active = false;
			
			SetSpawnpoint();
			
			SaveGame();
			
			obj_Player.hascontrol = true;
			obj_Camera.follow = obj_Player;
		
		#endregion
	
		break;//end Cutscene End Stage
	
	
}//end Stage machine






