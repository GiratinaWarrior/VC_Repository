/// @description Insert description here
// You can write your code in this editor

var _skippable = true;

var _skipButton = keyboard_check_pressed(ord("C"));

var _skipFunction = function()
{
	VoizatiaBossIntro_State = VOIZATIABOSSINTRO.BATTLE_START;
	layer_sequence_destroy(VoizatiaBossIntro_VoizatiaIdle); 
	instance_destroy(obj_Text);
}

//Stage machine for the Voizatia Boss Intro cutscene
switch(VoizatiaBossIntro_State)
{
	
	//Off Stage
	case VOIZATIABOSSINTRO.OFF:
		
		#region Off
		
			if !(VoizatiaBossIntro_IdleCreated)
			{
				VoizatiaBossIntro_VoizatiaIdle = layer_sequence_create("VoizatiaBossIntroCutscene_Voizatia", 0, 0, seq_VoizatiaBossIntro_VoizatiaIdle);
				VoizatiaBossIntro_LavenderIdle = layer_sprite_create(layer, 832, 352, spr_Lavender_Down_RougeSpear);
				VoizatiaBossIntro_IdleCreated = true;
			}
		
		#endregion
		
		break;//end Off Stage
	
	//Camera Pan Stage
	case VOIZATIABOSSINTRO.CAMERA_PAN:
		
		#region Camera Pan
			
			SetRoomAudio_Music_Default();
			
			var _cameraTargetX = 960;
			var _cameraTargetY = 270;
			
			with (obj_Camera)
			{
				follow = noone;
				xTo = _cameraTargetX;
				yTo = _cameraTargetY;
			}
			
			var _func = function()
			{
				if (VoizatiaBossIntro_State < VOIZATIABOSSINTRO.BATTLE_START)
				{
					VoizatiaBossIntro_State = VOIZATIABOSSINTRO.VOIZATIA_TALK_LAVENDER;
				}
				
			}
			
			TimeSourceCreateAndStart(110, _func, [], 1);
			
			if (_skippable) && (_skipButton)
			{
				_skipFunction();
			}
		
		#endregion
	
		break;//end Camera Pan Stage
	
	//Voizatia Talk Lavender Stage
	case VOIZATIABOSSINTRO.VOIZATIA_TALK_LAVENDER:
		
		#region Voizatia Talk Lavender
			
			SetRoomAudio_Music_Default(music_VoizatiaEncounterThemeV2);
			
			var _text = 
			[
				"This is the maximum power level that the Noxians are capable of?",
				"Thats one hell of a low bar, it's a miracle that no ones tripped over it yet.",
				"Wouldn't you agree Rose?",
			];
		
			if !(VoizatiaBossIntro_VoizatiaTalkLavender_TalkStarted)
			{
				CutsceneText(_text, "Voziatia", TEXTBOX_POS.BOTTOM, ft_Voizatia);
				VoizatiaBossIntro_VoizatiaTalkLavender_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				var _func = function()
				{
					VoizatiaBossIntro_State = VOIZATIABOSSINTRO.VOIZATIA_TELEPORT_ROSE;
				}
				
				TimeSourceCreateAndStart(30, _func, [], 1);
			}


		#endregion
		
		break;//end Voizatia Talk Lavender Stage
	
	//Voizatia Teleport Rose Stage
	case VOIZATIABOSSINTRO.VOIZATIA_TELEPORT_ROSE:
	
		#region Voizatia Teleport Rose
		
			if !(VoizatiaBossIntro_VoizatiaTeleportRose_SequenceCreated)
			{
				VoizatiaBossIntro_VoizatiaTeleportRose_Sequence = layer_sequence_create("VoizatiaTeleport", 0, 0, seq_VoizatiaBossIntro_VoizatiaTeleport)
				//layer_sequence_x(VoizatiaBossIntro_VoizatiaIdle, 256);
				VoizatiaBossIntro_VoizatiaTeleportRose_SequenceCreated = true;
			}
			
			else if (layer_sequence_is_finished(VoizatiaBossIntro_VoizatiaTeleportRose_Sequence))
			{
				//show_debug_message("Voizatia Teleported");
				VoizatiaBossIntro_State = VOIZATIABOSSINTRO.VOIZATIA_TALK_ROSE;
				layer_sequence_x(VoizatiaBossIntro_VoizatiaIdle, 256);
				//show_debug_message("Voizatia Teleported");
			}
		
		#endregion
	
		break;//end Voizatia Teleport Rose Stage
	
	//Voizatia Talk Rose Stage
	case VOIZATIABOSSINTRO.VOIZATIA_TALK_ROSE:
	
		#region Voizatia Talk Rose
			
			var _text = 
			[
				"You're different from these people aren't you? I can tell. There's something about you, something familiar.",
				"I could tell the moment I saw you, and the fact that you're here means you beat Malvalia, as expected.",
				"I hope you weren't to rough with her, she may be rude, reckless, and sassy, but she's still my little sister.",
				"Though I guess I can't really ask that since I roughed up your 'mother'."
			];
			
			if !(VoizatiaBossIntro_VoizatiaTalkRose_TalkStarted)
			{
				layer_sequence_destroy(VoizatiaBossIntro_VoizatiaTeleportRose_Sequence);
				CutsceneText(_text, "Voizatia", TEXTBOX_POS.BOTTOM, ft_Voizatia);
				//obj_Player.image_xscale = 1;
				VoizatiaBossIntro_VoizatiaTalkRose_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				var _func = function()
				{
					VoizatiaBossIntro_State = VOIZATIABOSSINTRO.VOIZATIA_PROPOSAL;
				}
				TimeSourceCreateAndStart(120, _func, [], 1);
			}
		
		#endregion
	
		break;//end Voizatia Talk Rose Stage\
		
	//Voizatia Proposal Stage
	case VOIZATIABOSSINTRO.VOIZATIA_PROPOSAL:
	
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
			
			if !(VoizatiaBossIntro_VoizatiaProposal_TalkStarted)
			{
				CutsceneText(_text, "Voizatia", TEXTBOX_POS.BOTTOM, ft_Voizatia);
				VoizatiaBossIntro_VoizatiaProposal_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				VoizatiaBossIntro_State = VOIZATIABOSSINTRO.VOIZATIA_HOSTAGE;
			}
		
		#endregion
	
		break;//end Voizatia Proposal Stage
	
	//Voizatia Hostage Stage
	case VOIZATIABOSSINTRO.VOIZATIA_HOSTAGE:
	
		#region Voizatia Hostage
		
			if !(VoizatiaBossIntro_VoizatiaHostage_SequenceCreated)
			{
				VoizatiaBossIntro_VoizatiaHostage_Sequence = layer_sequence_create("VoizatiaTeleport", 0, 0, seq_VoizatiaBossIntro_VoizatiaHostage)
				layer_sequence_destroy(VoizatiaBossIntro_VoizatiaIdle);
				VoizatiaBossIntro_VoizatiaHostage_SequenceCreated = true;
			}
			else if (layer_sequence_is_finished(VoizatiaBossIntro_VoizatiaHostage_Sequence))
			{
				VoizatiaBossIntro_VoizatiaIdle = layer_sequence_create("VoizatiaTeleport", 0, 0, seq_VoizatiaBossIntro_VoizatiaThreaten);
				layer_sequence_destroy(VoizatiaBossIntro_VoizatiaHostage_Sequence);
				VoizatiaBossIntro_State = VOIZATIABOSSINTRO.VOIZATIA_THREATEN_LAVENDER;
			}
			
		#endregion
	
		break;//end Voizatia Hostage Stage
	
	//Voizatia Threaten Lavender Stage
	case VOIZATIABOSSINTRO.VOIZATIA_THREATEN_LAVENDER:
	
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
		
			if !(VoizatiaBossIntro_VoizatiaThreatenLavender_TalkStarted)
			{
				CutsceneText(_text, "Voizatia", TEXTBOX_POS.BOTTOM, ft_Voizatia);
				obj_Player.image_xscale = -1;
				VoizatiaBossIntro_VoizatiaThreatenLavender_TalkStarted = true;
			}
		
			else if !(instance_exists(obj_Text))
			{
				var _func = function()
				{
					VoizatiaBossIntro_State = VOIZATIABOSSINTRO.VOIZATIA_CHALLENGE_ROSE;
				}
				TimeSourceCreateAndStart(90, _func, [], 1);
			}
		
		#endregion
	
		break;//end Voizatia Threaten Lavender
		
	//Voizatia Challenge Rose Stage
	case VOIZATIABOSSINTRO.VOIZATIA_CHALLENGE_ROSE:
		
		#region Voizatia Challenge Rose
		
			var _text = 
			[
				"That's what I thought.",
				"Or so I would say, but I bet you're thinking that you're hot stuff just because you're Cardinal and all, don't ya?",
				"You think that you can fight me on equal footing, even defeat me don't ya?",
				"Defeating me here will solve all of your problems won't it? There's no point in my deal is there?",
				"Then how about this?",
			];
		
			if !(VoizatiaBossIntro_VoizatiaChallengeRose_TalkStarted)
			{
				CutsceneText(_text, "Voizatia", TEXTBOX_POS.BOTTOM, ft_Voizatia);
				VoizatiaBossIntro_VoizatiaChallengeRose_TalkStarted = true;
			}
			
			else if !(instance_exists(obj_Text))
			{
				VoizatiaBossIntro_State = VOIZATIABOSSINTRO.VOIZATIA_ASCEND;
			}
		
		#endregion
		
		break;//end Voizatia Challenge Rose
	
	//Voizatia Ascend Stage
	case VOIZATIABOSSINTRO.VOIZATIA_ASCEND:
	
		#region Voizatia Ascend
		
			if !(VoizatiaBossIntro_VoizatiaAscend_SequenceCreated)
			{
				layer_sequence_destroy(VoizatiaBossIntro_VoizatiaIdle);
				VoizatiaBossIntro_VoizatiaIdle = noone;
				VoizatiaBossIntro_VoizatiaAscend_Sequence = layer_sequence_create("VoizatiaTeleport", 0, 0, seq_VoizatiaBossIntro_VoizatiaAscend);
				VoizatiaBossIntro_VoizatiaAscend_SequenceCreated = true;
			}
			
			else if (layer_sequence_is_finished(VoizatiaBossIntro_VoizatiaAscend_Sequence))
			{
				VoizatiaBossIntro_VoizatiaIdle = layer_sequence_create("VoizatiaTeleport", 0, 0, seq_VoizatiaBossIntro_VoizatiaLevitate);
				layer_sequence_destroy(VoizatiaBossIntro_VoizatiaAscend_Sequence);
				VoizatiaBossIntro_State = VOIZATIABOSSINTRO.VOIZATIA_PROVOKE;
			}
		
		#endregion
	
		break;//end Voizatia Ascend Stage
		
	//Voizatia Provoke Stage
	case VOIZATIABOSSINTRO.VOIZATIA_PROVOKE:
	
		#region Voizatia Provoke
		
			var _text = ["COME AT ME!"];
			
			if !(VoizatiaBossIntro_VoizatiaProvoke_TalkStarted)
			{
				CutsceneText(_text, "Voizatia", TEXTBOX_POS.BOTTOM, ft_Voizatia);
				VoizatiaBossIntro_VoizatiaProvoke_TalkStarted = true;
			}
		
			else if !(instance_exists(obj_Text))
			{
				VoizatiaBossIntro_State = VOIZATIABOSSINTRO.BATTLE_START;
			}
		
		#endregion
	
		break;//end Voizatia Provoke Stage
	
	//Battle Start Stage
	case VOIZATIABOSSINTRO.BATTLE_START:
	
		#region Battle Start
		
			SetRoomAudio_Music_Default(music_VlastelTheme);
		
			if (VoizatiaBossIntro_VoizatiaBoss == noone)
			{
				VoizatiaBossIntro_VoizatiaBoss = instance_create_layer(905, 204, layer, obj_VoizatiaBoss_Prologue);
				layer_sequence_destroy(VoizatiaBossIntro_VoizatiaIdle);
			}
			
			obj_Player.hascontrol = true;
			obj_Player.Player_ForcedToLose = true;
			
			VoizatiaBossIntro_State = VOIZATIABOSSINTRO.IN_BATTLE;
		
		#endregion
	
		break;//end Battle Start
	
	//In Battle Stage
	case VOIZATIABOSSINTRO.IN_BATTLE:
	
		#region In Battle
	
			with (obj_Player) 
			{
				LockEntityInSight(id, 32, 32, 16, 16);
			}
		
			obj_Camera.x = 960;
			obj_Camera.y = 270;
			
		#endregion
	
		break;//end In Battle
	
}//end stage machine






