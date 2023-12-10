/// @description Insert description here
// You can write your code in this editor

var _skippable = false;

var _skipButton = global.Key_Skip;

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
				VoizatiaBossIntro_LavenderIdle = instance_create_layer(832, 352, "Player", obj_LavenderDeathCutscene);//layer_sprite_create(layer, 832, 352, spr_Lavender_Down);
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
					time_source_destroy(VoizatiaBossIntro_TimeSource);
					VoizatiaBossIntro_TimeSource = noone;
				}
				
			}
			
			if (VoizatiaBossIntro_TimeSource == noone) VoizatiaBossIntro_TimeSource = TimeSourceCreateAndStart(110, _func, [], 1);
			
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
				"Is this really as strong as the Noxians get?",
				"Thats one hell of a low bar, it's a miracle that no ones tripped over it yet.",
				"Wouldn't you agree Rose?",
			];
			
			var _voice = 
			[
				sound_Voizatia_Laugh_Tthuhuhuhu,
				sound_Voizatia_Light_Orkazna,
				sound_Voizatia_Light_ValaSHImana,
			]
		
			if !(VoizatiaBossIntro_VoizatiaTalkLavender_TalkStarted)
			{
				CutsceneText(_text, "Voizatia", TEXTBOX_POS.BOTTOM, ft_Voizatia);
				obj_Text.TextBox_Voices = _voice;
				VoizatiaBossIntro_VoizatiaTalkLavender_TalkStarted = true;
			}
			
			else if !(instance_exists(obj_Text))
			{
				var _func = function()
				{
					VoizatiaBossIntro_State = VOIZATIABOSSINTRO.VOIZATIA_TELEPORT_ROSE;
					time_source_destroy(VoizatiaBossIntro_TimeSource);
					VoizatiaBossIntro_TimeSource = noone;
				}
				
				if (VoizatiaBossIntro_TimeSource == noone) VoizatiaBossIntro_TimeSource = TimeSourceCreateAndStart(30, _func, [], 1);
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
				"You're different from these people aren't you? I can tell.", 
				"There's something about you, something familiar.",
				"I could tell the moment I saw you, and the fact that you're here means you beat Malvalia, as expected.",
				"I hope you weren't to rough with her, she may be rude, reckless, and sassy, but she's still my little sister.",
				"Though I guess I can't really ask that since I roughed up your...mother."
			];
			
			var _voice = 
			[
				sound_Voizatia_Light_Kaaah,
				sound_Voizatia_Light_Yaramah,
				sound_Voizatia_Light_ShihaGAla,
				sound_Voizatia_Light_ValaSHImana,
				sound_Voizatia_Light_SHIhalaga
			]
			
			if !(VoizatiaBossIntro_VoizatiaTalkRose_TalkStarted)
			{
				layer_sequence_destroy(VoizatiaBossIntro_VoizatiaTeleportRose_Sequence);
				CutsceneText(_text, "Voizatia", TEXTBOX_POS.BOTTOM, ft_Voizatia);
				obj_Text.TextBox_Voices = _voice;
				VoizatiaBossIntro_VoizatiaTalkRose_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				var _func = function()
				{
					VoizatiaBossIntro_State = VOIZATIABOSSINTRO.VOIZATIA_PROPOSAL;
					time_source_destroy(VoizatiaBossIntro_TimeSource);
					VoizatiaBossIntro_TimeSource = noone;
				}
				if (VoizatiaBossIntro_TimeSource == noone) VoizatiaBossIntro_TimeSource = TimeSourceCreateAndStart(120, _func, [], 1);
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
				"The thrill of not knowing whether you'll die or not. ", 
				"The sight of blood spilling and vallen spells being launched",
				"The relief of a well-earned victory",
				"Everything about is wonderful, and it's something I desire more than anything.",
				"What I'm saying is that those Carvaline Orbs only feel earned after a strong fight, which I didn't get.",
				"So here's the deal...",
			];
			
			var _voice = 
			[
				sound_Voizatia_Light_Kaaah,
				sound_Voizatia_Light_Orkazna,
				sound_Voizatia_Serious_KorKilimamya,
				sound_Voizatia_Serious_KorKENZmanya,
				sound_Voizatia_Light_SHIhalaga,
				sound_Voizatia_Light_ValaSHImana,
				sound_Voizatia_Light_Yaramah,
				sound_Voizatia_Light_ShihaGAla
			]
			
			if !(VoizatiaBossIntro_VoizatiaProposal_TalkStarted)
			{
				CutsceneText(_text, "Voizatia", TEXTBOX_POS.BOTTOM, ft_Voizatia);
				obj_Text.TextBox_Voices = _voice;
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
		
			var _voice = 
			[
				sound_Voizatia_Light_Orkazna,
				sound_Voizatia_Light_ShihaGAla,
				sound_Voizatia_Light_ValaSHImana,
				sound_Voizatia_Serious_KorKilimamya,
				sound_Voizatia_Serious_KorKENZmanya,
				sound_Voizatia_Serious_Movialio,
			]
		
			if !(VoizatiaBossIntro_VoizatiaThreatenLavender_TalkStarted)
			{
				CutsceneText(_text, "Voizatia", TEXTBOX_POS.BOTTOM, ft_Voizatia);
				obj_Text.TextBox_Voices = _voice;
				obj_Player.image_xscale = -1;
				VoizatiaBossIntro_VoizatiaThreatenLavender_TalkStarted = true;
			}
		
			else if !(instance_exists(obj_Text))
			{
				var _func = function()
				{
					VoizatiaBossIntro_State = VOIZATIABOSSINTRO.VOIZATIA_CHALLENGE_ROSE;
					time_source_destroy(VoizatiaBossIntro_TimeSource);
					VoizatiaBossIntro_TimeSource = noone;
				}
				if (VoizatiaBossIntro_TimeSource == noone) VoizatiaBossIntro_TimeSource = TimeSourceCreateAndStart(90, _func, [], 1);
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
			
			var _voice = 
			[
				sound_Voizatia_Laugh_Tthuhuhuhu,
				sound_Voizatia_Serious_Movialio,
				sound_Voizatia_Serious_KorKENZmanya,
				sound_Voizatia_Serious_KorKilimamya,
				sound_Voizatia_Serious_Mezhovalaka,
			]
		
			if !(VoizatiaBossIntro_VoizatiaChallengeRose_TalkStarted)
			{
				CutsceneText(_text, "Voizatia", TEXTBOX_POS.BOTTOM, ft_Voizatia);
				obj_Text.TextBox_Voices = _voice;
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
			
			var _voice = [sound_Voizatia_Attack_Vyakai];
			
			if !(VoizatiaBossIntro_VoizatiaProvoke_TalkStarted)
			{
				CutsceneText(_text, "Voizatia", TEXTBOX_POS.BOTTOM, ft_Voizatia);
				obj_Text.TextBox_Voices = _voice;
				obj_Text.TextBox_TextSkippable = false;
				obj_Text.TextBox_TextColor = c_red;
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
			
			VoizatiaBossIntro_TimeSource = noone;
			
			VoizatiaBossIntro_State = VOIZATIABOSSINTRO.IN_BATTLE;
		
		#endregion
	
		break;//end Battle Start
	
	//In Battle Stage
	case VOIZATIABOSSINTRO.IN_BATTLE:
	
		#region In Battle
		
			//show_debug_message("IN BATTLE");
		
			with (obj_Player) 
			{
				LockEntityInSight(id, 32, 32, 16, 16);
			}
		
			obj_Camera.x = 960;
			obj_Camera.y = 270;
			
			if (PlayerDefeated(false))
			{
				SetRoomAudio_Music_Default();
				
				with (VoizatiaBossIntro_VoizatiaBoss)
				{
					instance_destroy(parent_EnemyAttack);
					part_system_destroy(VoizatiaBossPrologue_SinEruption_ConjureParticle);
					instance_change(obj_VoizatiaUndefeated, true);
					if (obj_PlayerDefeated.image_index == obj_PlayerDefeated.image_number - 1)
					{
						obj_PlayerDefeated.image_speed = 0;
						obj_PlayerDefeated.image_index = obj_PlayerDefeated.image_number - 1
						other.VoizatiaBossIntro_State = VOIZATIABOSSINTRO.BATTLE_END;
					}
				}
			}
			
			
		#endregion
	
		break;//end In Battle
		
	//Battle End Stage
	case VOIZATIABOSSINTRO.BATTLE_END:
		
		#region Battle End
			
			//show_debug_message("END BATTLE");
			
			obj_Camera.sprite_index = spr_BlackScreen;
			
			VoizatiaBossIntro_VoizatiaBoss.x = 905;
			VoizatiaBossIntro_VoizatiaBoss.y = 204;
			
			var _func = function()
			{
				with (obj_PlayerDefeated)
				{
					image_xscale = 1;
					x = 640;
				}
				obj_Camera.sprite_index = noone;
				VoizatiaBossIntro_State = VOIZATIABOSSINTRO.VOIZATIA_MOCK;
				time_source_destroy(VoizatiaBossIntro_TimeSource);
				VoizatiaBossIntro_TimeSource = noone;
			}
			
			if (VoizatiaBossIntro_TimeSource == noone) VoizatiaBossIntro_TimeSource = TimeSourceCreateAndStart(120, _func);
		
		#endregion
	
		break;//end Battle End
		
	//Voizatia Mock Stage
	case VOIZATIABOSSINTRO.VOIZATIA_MOCK:
		
		#region Voizatia Mock
		
		//	SetRoomAudio_Music_Default(music_VoizatiaEncounterThemeV2);
			
			var _text = 
			[
				"Hehehehehe",
				"HAHAHAHAHAHAHAHAHAHAHAHAHAHAHAAAAAAAAAAAAAA!",
				"THIS IS JUST TOO MUCH!",
				"YOUR FACE! YOUR FACE LOOKED SO STUPID! LIKE YOU JUST REGRETTED YOUR ENTIRE WORTHLESS LIFE UNTIL NOW!",
				"Haaaa, man."
			];
			
			var _voice = 
			[
				sound_Voizatia_Laugh_Tthuhuhuhu,
				sound_Voizatia_Laugh_AHAHAHAHA,
				sound_Voizatia_Laugh_AHAHAHAHA,
				sound_Voizatia_Laugh_AHAHAHAHA,
				sound_Voizatia_Light_Kaaah
			]
			
			if !(VoizatiaBossIntro_VoizatiaMock_TalkStarted)
			{
				CutsceneText(_text, "Voizatia", TEXTBOX_POS.BOTTOM, ft_Voizatia);
				obj_Text.TextBox_Voices = _voice;
				VoizatiaBossIntro_VoizatiaMock_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				var _func = function()
				{
					VoizatiaBossIntro_State = VOIZATIABOSSINTRO.LAVENDER_DEATH_SEQUENCE;
					time_source_destroy(VoizatiaBossIntro_TimeSource);
					VoizatiaBossIntro_TimeSource = noone;
				}
				if (VoizatiaBossIntro_TimeSource == noone) VoizatiaBossIntro_TimeSource = TimeSourceCreateAndStart(40, _func);
			}
		
		#endregion
		
		break;//end Voizatia Mock
	
	//Lavender Death Sequence: This will contain a sequence of events leading to Lavender's death
	case VOIZATIABOSSINTRO.LAVENDER_DEATH_SEQUENCE:
		
		#region Lavender Death Sequence
			
			if !(VoizatiaBossIntro_LavenderDeath_Activated)
			{
				VoizatiaBossIntro_LavenderIdle.LavenderDeathCutscene_State = LAVENDERDEATH_CUTSCENE.LAVENDER_RISE;
				VoizatiaBossIntro_LavenderDeath_Activated = true;
			}
			else if !(instance_exists(VoizatiaBossIntro_LavenderIdle))
			{
				VoizatiaBossIntro_State = VOIZATIABOSSINTRO.VOIZATIA_ORDERS;
			}
			
		#endregion
		
		break;//end Lavender Death Sequence
	
	//Voizatia Orders Stage
	case VOIZATIABOSSINTRO.VOIZATIA_ORDERS:
		
		#region Voizatia Orders
		
			var _text = 
			[
				"Now that that interruption has been dealt with...",
				"I will repeat your orders.",
				"Go and hunt down my comrades who possess the Carvaline Orbs",
				"Once you do so, come back in order to be killed gloriously by me.",
				"You must do this alone, you may not accept help from anyone, not even your brother.",
				"What? It's better than the way your mother died."
			];
		
			var _voice = 
			[
				sound_Voizatia_Light_ShihaGAla,
				sound_Voizatia_Serious_Mezhovalaka,
				sound_Voizatia_Serious_Movialio,
				sound_Voizatia_Serious_KorKENZmanya,
				sound_Voizatia_Serious_KorKilimamya,
				sound_Voizatia_Light_ValaSHImana,
			]
		
			if !(VoizatiaBossIntro_VoizatiaOrders_TalkStarted)
			{
				CutsceneText(_text, "Voizatia", TEXTBOX_POS.BOTTOM, ft_Voizatia);
				obj_Text.TextBox_Voices = _voice;
				VoizatiaBossIntro_VoizatiaOrders_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				var _func = function()
				{
					VoizatiaBossIntro_State = VOIZATIABOSSINTRO.VOIZATIA_FLY;	
					time_source_destroy(VoizatiaBossIntro_TimeSource);
					VoizatiaBossIntro_TimeSource = noone;
				}
				if (VoizatiaBossIntro_TimeSource == noone) VoizatiaBossIntro_TimeSource = TimeSourceCreateAndStart(30, _func);
			}
			
		#endregion
	
		break;//end Voizatia Orders Stage
	
	//Voizatia Fly Stage
	case VOIZATIABOSSINTRO.VOIZATIA_FLY:
		
		#region Voizatia Fly
			
			with (VoizatiaBossIntro_VoizatiaBoss)
			{
				y = max(100, y - 2);
			
				if (y == 100)
				{
					with (other)
					{
						var _func = function()
						{
							VoizatiaBossIntro_State = VOIZATIABOSSINTRO.VOIZATIA_FLY_TALK;
							time_source_destroy(VoizatiaBossIntro_TimeSource);
							VoizatiaBossIntro_TimeSource = noone;
						}
						if (VoizatiaBossIntro_TimeSource == noone) VoizatiaBossIntro_TimeSource = TimeSourceCreateAndStart(30, _func);
					}
				}
			
			}	
		
		#endregion
		
		break;//end Voizatia Fly
		
	//Voizatia Fly Talk Stage
	case VOIZATIABOSSINTRO.VOIZATIA_FLY_TALK:
		
		#region Voizatia Fly Talk
			
			var _text =
			[
				"Rose.",
				"Your mother raised you to be a pampered weakling.",
				"I won't allow that. I will make sure you become strong.",
				"Hahaha",
				"I sure can't wait for the next time we meet.",
				"We're going to have one hell of a time",
			];
			
			var _voice = 
			[
				sound_Voizatia_Light_Kaaah,
				sound_Voizatia_Light_Yaramah,
				sound_Voizatia_Light_Orkazna,
				sound_Voizatia_Laugh_Tthuhuhuhu,
				sound_Voizatia_Light_SHIhalaga,
				sound_Voizatia_Laugh_Tthuhuhuhu
			]
				
			if !(VoizatiaBossIntro_VoizatiaFlyTalk_TalkStarted)
			{
				CutsceneText(_text, "Voizatia", TEXTBOX_POS.BOTTOM, ft_Voizatia);
				obj_Text.TextBox_Voices = _voice;
				VoizatiaBossIntro_VoizatiaFlyTalk_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				VoizatiaBossIntro_State = VOIZATIABOSSINTRO.VOIZATIA_EXIT;
			}
		
		#endregion
		
		break;//end Voizatia Fly Talk Stage
		
	//Voizatia Exit Stage
	case VOIZATIABOSSINTRO.VOIZATIA_EXIT:
		
		#region Voizatia Exit
			
			SetRoomAudio_Music_Default();
			
			obj_Camera.sprite_index = spr_BlackScreen;
			
			instance_destroy(VoizatiaBossIntro_VoizatiaBoss);
			//layer_sequence_destroy(VoizatiaBossIntro_LavenderIdle);
			
			var _func = function()
			{
				obj_Camera.sprite_index = noone;
				obj_Camera.follow = obj_PlayerDefeated;
				VoizatiaBossIntro_State = VOIZATIABOSSINTRO.PLAYER_AWAKEN;
				time_source_destroy(VoizatiaBossIntro_TimeSource);
				VoizatiaBossIntro_TimeSource = noone;
			}
			
			if (VoizatiaBossIntro_TimeSource == noone) VoizatiaBossIntro_TimeSource = TimeSourceCreateAndStart(40, _func);
			
		#endregion
		
		break;//end Voizatia Exit Stage
	
	//Player Awaken Stage
	case VOIZATIABOSSINTRO.PLAYER_AWAKEN:
	
		#region Player Awaken
		
			PlayerFullHeal();
		
			//round(obj_Camera.x) == (obj_Camera.follow).x && round(obj_Camera.y) == (obj_Camera.follow).y
		
			if (VoizatiaBossIntro_PlayerAwaken_Timer++ > VoizatiaBossIntro_PlayerAwaken_TimerLimit) 
			{
				
				//show_debug_message("Arise Player");
				
				with (obj_PlayerDefeated)
				{
					//show_debug_message("Access Defeated Player");
						
					with (instance_create_layer(obj_PlayerDefeated.x, obj_PlayerDefeated.y, "Player", obj_PlayerRise))
					{
						//show_debug_message("Create Player Rise");
						image_index = 0;
						image_speed = 1;
						image_xscale = other.image_xscale;
						obj_Camera.follow = obj_PlayerRise;
					}
					instance_destroy(obj_PlayerDefeated);
				}
				
				if (PlayerAlive())
				{
					obj_Player.hascontrol = false;
					
					var _func = function()
					{
						VoizatiaBossIntro_State = VOIZATIABOSSINTRO.CUTSCENE_END;
						time_source_destroy(VoizatiaBossIntro_TimeSource);
						VoizatiaBossIntro_TimeSource = noone;
					}
					
					if (VoizatiaBossIntro_TimeSource == noone) VoizatiaBossIntro_TimeSource = TimeSourceCreateAndStart(20, _func);
					
					
				}
				
			}
			
			
			
		#endregion
		
		break;//end Player Awaken Stage
	
	//Cutscene End Stage
	case VOIZATIABOSSINTRO.CUTSCENE_END:
		
		#region Cutscene End
		
			obj_Player.hascontrol = true;
		
			//SetRoomAudio_Music_Default(music_ShrineMemoryTheme);
		
			global.VoizatiaLavenderAftermath_Cutscene_Seen = true;
		
			SetSpawnpoint(obj_Player.x, obj_Player.y);
		
			SaveGame();
		
			instance_destroy();
		
		#endregion
		
		break;//end Cutscene End Stage
	
}//end stage machine






