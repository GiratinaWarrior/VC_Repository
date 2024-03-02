/// @description

var p = TEXTBOX_POS.TOP - 20;
var c = c_white;
var s = blanksprite;
var n = "SG";

var _skippable = true;

var _skipFunc = function()
{
	audio_stop_sound(sound_LightsOn);
	with (obj_Camera)
	{
		sprite_index = noone;
		image_alpha = 1;
		follow = noone;
		x = 480; //-350 ==== 130
		y = 270; //+118 ==== 388
	}
	if !(ShrineArenaBossIntro_DoorsCreated)
	{
		ShrineArenaBossIntro_EntranceWall = instance_create_layer(928, 416, "Platforms", obj_Wall);
		ShrineArenaBossIntro_ExitWall = instance_create_layer(32, 416, "Platforms", obj_Wall);
		layer_set_visible("Floortiles_Closed", true);
		layer_set_visible("Floortiles_FullOpen", false);
		ShrineArenaBossIntro_DoorsCreated = true;
	}
	instance_destroy(obj_Text);
	
	#region TimeSource Stop
	
		if (ShrineArenaBossIntro_TimeSource != noone)
		{
			time_source_destroy(ShrineArenaBossIntro_TimeSource);
			ShrineArenaBossIntro_TimeSource = noone;
		}
	
		if (layer_sequence_exists("Jest", ShrineArenaBossIntro_GeneralEnter_Sequence))
		{
			layer_sequence_destroy(ShrineArenaBossIntro_GeneralEnter_Sequence);
		}
	
	#endregion
	
	ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.BATTLE_START;
}

if (global.Key_Skip) && (_skippable) && 
(ShrineArenaBossIntro_State >= SHRINEARENABOSSINTRO.CAMERA_PAN &&
ShrineArenaBossIntro_State < SHRINEARENABOSSINTRO.BATTLE_START)
{
	_skipFunc();
}

//Stage Machine
switch(ShrineArenaBossIntro_State)
{
	
	//Off Stage
	case SHRINEARENABOSSINTRO.SET_UP:
	
		#region Off
			
			if !(ShrineArenaBossIntro_IdleCreated)
			{
				ShrineArenaBossIntro_AudienceIdle1 = layer_sequence_create("Audience", -32, 272, seq_ShrineGeneralBossIntro_AudienceIdle);
				ShrineArenaBossIntro_AudienceIdle2 = layer_sequence_create("Audience", -64, 208, seq_ShrineGeneralBossIntro_AudienceIdle);
				ShrineArenaBossIntro_JestIdle = layer_sequence_create("Jest", 0, 0, seq_ShrineGeneralBossIntro_JestIdle);
				layer_sequence_speedscale(ShrineArenaBossIntro_JestIdle, 0);
				ShrineArenaBossIntro_IdleCreated = true;
			}
			
		#endregion
		
		break;//end Off Stage
	
	//Camera Pan Stage
	case SHRINEARENABOSSINTRO.CAMERA_PAN:
		
		#region Camera Pan
		
			var _cameraTargetX = 480;
			
			with (obj_Camera)
			{
				follow = noone;
				xTo = _cameraTargetX;
				yTo = 270;
			}
			
			if (ShrineArenaBossIntro_TimeSource == noone)
			{
				var _func = function()
				{
					ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.JEST_OFF_TALK;
					time_source_destroy(ShrineArenaBossIntro_TimeSource);
					ShrineArenaBossIntro_TimeSource = noone;
				}
				ShrineArenaBossIntro_TimeSource = TimeSourceCreateAndStart(110, _func);
			}
			
		
		#endregion
		
		break;//end Camera Pan Stage
		
	//Jest Off Talk Stage
	case SHRINEARENABOSSINTRO.JEST_OFF_TALK:
		
		#region Jest Off Talk
		
			var _text = 
			[
				"Huhuhuuu....",
				"Looks like our newest victim has fallen for our trap...",
			]
			
			var _voice = 
			[
				sound_Jest_Laugh_HAhaha,
				sound_Jest_Talk_halezaDIZEna
			]
			
			if !(ShrineArenaBossIntro_JestOffTalk_TalkStarted)
			{
				CutsceneText(_text, "???", p, ft_Jest, c, s);
				obj_Text.TextBox_Voices = _voice;
				ShrineArenaBossIntro_JestOffTalk_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.LIGHTS_ON;
			}
			else
			{
				SkipTextOption();
				with (obj_Text)
				{
					if (TextBox_CharCount < string_length(TextBox_Text[TextBox_Page]))
					{
						layer_sequence_speedscale(other.ShrineArenaBossIntro_JestIdle, 1);
					}
					else
					{
						layer_sequence_speedscale(other.ShrineArenaBossIntro_JestIdle, 0);
					}
				}
			}
		
		#endregion
		
		break;//end Jest Off Talk
	
	//Lights On Stage
	case SHRINEARENABOSSINTRO.LIGHTS_ON:
		
		#region Lights On
			
			if (ShrineArenaBossIntro_TimeSource == noone)
			{
				var _func = function()
				{
					with(obj_Camera)
					{
						image_alpha -= 0.25;
						
						if (image_alpha >= 0)
						{
							audio_play_sound(sound_LightsOn, 100, false, 0.6);
						}
					}
					
				}
				ShrineArenaBossIntro_TimeSource = TimeSourceCreateAndStart(60, _func, [], -1);
			}
			
			if (obj_Camera.image_alpha <= 0)
			{
				ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.JEST_ENTER_TALK;
				time_source_destroy(ShrineArenaBossIntro_TimeSource);
				ShrineArenaBossIntro_TimeSource = noone;
			}
		
		#endregion
		
		break;//end Lights On Stage
	
	//Jest Enter Talk Stage
	case SHRINEARENABOSSINTRO.JEST_ENTER_TALK:
		
		#region Jest Enter Talk
			
			SetRoomAudio_Music_Default(music_JestEncounterTheme)
			
			var _text = 
			[
				"Huhuhello everyone!",
				"Welcome to the SHRINE ARENA BATTLEGROUNDS!",
				"For the first timers of this game",
				"(Which is everyone)",
				"The rules are simple",
				"The two fighters in the ring will fight 'til they fall!",
				"The last one standing will be our grand champion!",
				"ARE YOU ALL READY!!!!!"
			];
			
			var _voice = 
			[
				sound_Jest_Laugh_HAhaha,
				sound_Jest_Talk_halezaDIZEna,
				sound_Jest_Talk_halakazanadi,
				blanksound,
				sound_Jest_Talk_haleKIzena,
				sound_Jest_Dark_Rilakanazhi,
				sound_Jest_Dark_Harakivabaja,
				sound_Jest_Dark_Vishkana
			]
			
			if !(ShrineArenaBossIntro_JestEnterTalk_TalkStarted)
			{
				CutsceneText(_text, "Jest", p, ft_Jest, c, s);
				obj_Text.TextBox_Voices = _voice;
				ShrineArenaBossIntro_JestEnterTalk_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.AUDIENCE_CHEER_JEST;
			}
			else
			{
				SkipTextOption();
				with (obj_Text)
				{
					if (TextBox_CharCount < string_length(TextBox_Text[TextBox_Page]))
					{
						layer_sequence_speedscale(other.ShrineArenaBossIntro_JestIdle, 1);
					}
					else
					{
						layer_sequence_speedscale(other.ShrineArenaBossIntro_JestIdle, 0);
					}
				}
			}
		
		#endregion
		
		break;//end Jest Enter Talk Stage
	
	//Audience Cheer Jest Stage
	case SHRINEARENABOSSINTRO.AUDIENCE_CHEER_JEST:
		
		#region Audience Cheer Jest 
		
			var _text = 
			[
				"YEEEEEEEAAAAAAA!!!"
			];
				
			var _voice = 
			[
				sound_Applause
			]
			
			if !(ShrineArenaBossIntro_AudienceCheerJest_TalkStarted)
			{
				CutsceneText(_text, "", p, ft_NPC, c, s);
				obj_Text.TextBox_Voices = _voice;
			//	audio_play_sound(sound_Applause, 100, false, 1);
				ShrineArenaBossIntro_AudienceCheerJest_TalkStarted = true;
			}
			
			else if !(instance_exists(obj_Text))// || !audio_is_playing(sound_Applause)
			{
				ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.JEST_INTRODUCE_ROSE;
				with (obj_Text)
				{
					instance_destroy();
				}
			}
			else
			{
				SkipTextOption();
			}
		
		#endregion
		
		break;//end Audience Cheer Jest Stage
	
	//Jest Introduce Rose Stage
	case SHRINEARENABOSSINTRO.JEST_INTRODUCE_ROSE:
		
		#region Jest Introduces Rose
		
			var _text = 
			[
				"THAT'S THE SPIRIT!",
				"Now then, it's time to introduce our competitors!",
				"In the right corner..!", 
				"We have the one to become the next Cardinal of Nox!",
				"As graceful like a feather. As beautiful as a clear sky!",
				"Rosey-, LADY ROSE!!!!"
			]
			
			var _voice = 
			[
				sound_Jest_Laugh_HAhaha,
				sound_Jest_Talk_halakazanadi,
				sound_Jest_Talk_haleKIzena,
				sound_Jest_Serious_Shabarura,
				sound_Jest_Talk_Volapachi_Halaka,
				sound_Jest_Laugh_Hah,
			]
			
			if !(ShrineArenaBossIntro_JestIntroduceRose_TalkStarted)
			{
				CutsceneText(_text, "Jest", p, ft_Jest, c, s);
				obj_Text.TextBox_Voices = _voice;
				ShrineArenaBossIntro_JestIntroduceRose_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.AUDIENCE_CHEER_ROSE;
			}
			else
			{
				SkipTextOption();
				with (obj_Text)
				{
					if (TextBox_CharCount < string_length(TextBox_Text[TextBox_Page]))
					{
						layer_sequence_speedscale(other.ShrineArenaBossIntro_JestIdle, 1);
					}
					else
					{
						layer_sequence_speedscale(other.ShrineArenaBossIntro_JestIdle, 0);
					}
				}
			}
			
		#endregion
		
		break;//end Jest Introduce Rose Stage
		
	//Audience Cheer Rose Stage
	case SHRINEARENABOSSINTRO.AUDIENCE_CHEER_ROSE:
			
		#region Audience Cheer Rose
		
			var _text = 
			[
				"WOOOOOOOOOH!!",
				"YOU CAN DO IT LADY ROSE!!",
				"I LOVE YOU LADY ROSE!!",
				"LADY ROSE! LADY ROSE! LADY ROSE!"
			];
				
			var _voice = 
			[
				sound_Applause,
				blanksound,
				blanksound,
				blanksound
			]
			
			if !(ShrineArenaBossIntro_AudienceCheerRose_TalkStarted)
			{
				CutsceneText(_text, "", p, ft_NPC, c, s);
				obj_Text.TextBox_Voices = _voice;
			//	audio_play_sound(sound_Applause, 100, false, 1);
				ShrineArenaBossIntro_AudienceCheerRose_TalkStarted = true;
			}
			
			else if !(instance_exists(obj_Text))// && !audio_is_playing(sound_Applause)
			{
				ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.JEST_INTRODUCE_GENERAL;
				with (obj_Text)
				{
					instance_destroy();
				}
			}
			else
			{
				SkipTextOption();
			}
		
		#endregion
		
		break;//end Audience Cheer Rose Stage
		
	//Jest Introduce General Stage
	case SHRINEARENABOSSINTRO.JEST_INTRODUCE_GENERAL:
	
		#region Jest Introduce General 
		
			var _text = 
			[
				"And in the left corner!",
				"We have the great leader of the Shrine Soldiers",
				"He's STRONGER!", 
				"TOUGHER!",
				"SMARTER!",
				"AND EVEN LOOKS COOLER!",
				"He is the great...",
				"SHRINE GENERAL!!!"
			];
			
			var _voice = 
			[
				sound_Jest_Talk_haleKIzena,
				sound_Jest_Talk_Volapachi_Halaka,
				sound_Jest_Laugh_Hah,
				sound_Jest_Laugh_Hah,
				sound_Jest_Laugh_Hah,
				sound_Jest_Laugh_Hah,
				sound_Jest_Dark_Vishkana,
				sound_Jest_Laugh_HAhaha,
			]
			
			if !(ShrineArenaBossIntro_JestIntroduceGeneral_TalkStarted)
			{
				CutsceneText(_text, "Jest", p, ft_Jest, c, s);
				obj_Text.TextBox_Voices = _voice;
				ShrineArenaBossIntro_JestIntroduceGeneral_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.LIGHTS_OFF;
			}
			else
			{
				SkipTextOption()
				with (obj_Text)
				{
					if (TextBox_CharCount < string_length(TextBox_Text[TextBox_Page]))
					{
						layer_sequence_speedscale(other.ShrineArenaBossIntro_JestIdle, 1);
					}
					else
					{
						layer_sequence_speedscale(other.ShrineArenaBossIntro_JestIdle, 0);
					}
				}
			}
		
		#endregion
		
		break;//end Jest Introduce General Stage
	
	//Lights Off Stage
	case SHRINEARENABOSSINTRO.LIGHTS_OFF:
		
		#region Lights Off
			
			SetRoomAudio_Music_Default();
			
			if (ShrineArenaBossIntro_TimeSource == noone)
			{
				var _func = function()
				{
					with(obj_Camera)
					{
						image_alpha += 0.25;
						
						if (image_alpha <= 1)
						{
							audio_play_sound(sound_LightsOn, 100, false, 0.6);
						}
						
					}
					
				}
				ShrineArenaBossIntro_TimeSource = TimeSourceCreateAndStart(60, _func, [], -1);
			}
			
			if (obj_Camera.image_alpha >= 0.8)
			{
				ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.GENERAL_ENTER;
				time_source_destroy(ShrineArenaBossIntro_TimeSource);
				ShrineArenaBossIntro_TimeSource = noone;
			}	
			
		#endregion
		
		break;//end Lights Off Stage
	
	//General Enter Stage
	case SHRINEARENABOSSINTRO.GENERAL_ENTER:
	
		#region General Enter
		
			if !(ShrineArenaBossIntro_GeneralEnter_SequenceCreated)
			{
				if (ShrineArenaBossIntro_TimeSource == noone)
				{
					var _func = function()
					{
						ShrineArenaBossIntro_GeneralEnter_Sequence = layer_sequence_create("Jest", 0, 0, seq_ShrineGeneralBossIntro_GeneralEnter);
						time_source_destroy(ShrineArenaBossIntro_TimeSource);
						ShrineArenaBossIntro_TimeSource = noone;
					}
					ShrineArenaBossIntro_TimeSource = TimeSourceCreateAndStart(60, _func);
					
				}
				ShrineArenaBossIntro_GeneralEnter_SequenceCreated = true;
			}
			else if (layer_sequence_exists("Jest", ShrineArenaBossIntro_GeneralEnter_Sequence)) && (layer_sequence_is_finished(ShrineArenaBossIntro_GeneralEnter_Sequence))
			{
				ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.GENERAL_ENTER_TALK;
			}
			else
			{
				SkipCutsceneOption(ShrineArenaBossIntro_GeneralEnter_Sequence);
			}
		
		#endregion
		
		break;//end General Enter Stage
	
	//General Enter Talk Stage
	case  SHRINEARENABOSSINTRO.GENERAL_ENTER_TALK:
		
		#region General Enter Talk
			
			var _text = 
			[
				"Humpharumph...",
				"So you have arrived, Rose..."
			]
			
			if !(ShrineArenaBossIntro_GeneralEnterTalk_TalkStarted)
			{
				CutsceneText(_text, n, p, ft_NPC, c, s);	
				ShrineArenaBossIntro_GeneralIdle = layer_sprite_create("ShrineGeneral", obj_Camera.x - 350, obj_Camera.y + 118, spr_ShrineGeneral_FullBody_PhaseOne);
				layer_sprite_speed(ShrineArenaBossIntro_GeneralIdle, 0);
				layer_sequence_destroy(ShrineArenaBossIntro_GeneralEnter_Sequence);
				ShrineArenaBossIntro_GeneralEnterTalk_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.LIGHTS_BACK_ON;
			}
			else
			{
				SkipTextOption();
			}
		
		#endregion
		
		break;//end General Enter Talk Stage
		
	//Lights Back On Stage
	case SHRINEARENABOSSINTRO.LIGHTS_BACK_ON:
		
		#region Lights Back On
			
			if (ShrineArenaBossIntro_TimeSource == noone)
			{
				var _func = function()
				{
					with(obj_Camera)
					{
						image_alpha -= 0.25;
						
						if (image_alpha >= 0)
						{
							audio_play_sound(sound_LightsOn, 100, false, 0.6);
						}
					}
					
				}
				ShrineArenaBossIntro_TimeSource = TimeSourceCreateAndStart(20, _func, [], -1);
			}
			
			if (obj_Camera.image_alpha <= -1)
			{
				ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.GENERAL_CHALLENGE;
				time_source_destroy(ShrineArenaBossIntro_TimeSource);
				ShrineArenaBossIntro_TimeSource = noone;
			}
		
		#endregion
		
		break;//end Lights Back On Stage
	
	//General Challenge Stage
	case SHRINEARENABOSSINTRO.GENERAL_CHALLENGE:
		
		#region General Challenge
			
			SetRoomAudio_Music_Default(music_JestEncounterTheme);
			
			var _text = 
			[
				"HARMPHA HARMPHA HAR HAR!",
				"You sure took your time!",
				"Finally! It is time to DUEL!",
				"Do not dare hold back!"
			]
			
			if !(ShrineArenaBossIntro_GeneralChallenge_TalkStarted)
			{
				CutsceneText(_text, n, p, ft_NPC, c, s);
				ShrineArenaBossIntro_GeneralChallenge_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				
				if (ShrineArenaBossIntro_TimeSource == noone)
				{
					var _func = function()
					{
						ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.ARENA_ENCLOSE;
						time_source_destroy(ShrineArenaBossIntro_TimeSource);
						ShrineArenaBossIntro_TimeSource = noone;
					}
					ShrineArenaBossIntro_TimeSource = TimeSourceCreateAndStart(40, _func);
				}
				
			}
			else
			{
				SkipTextOption();
			}
			
			
		#endregion
		
		break;//end General Challenge
		
	//Arena Enclose Stage
	case SHRINEARENABOSSINTRO.ARENA_ENCLOSE:
		
		#region Arena Enclose
		
			SetRoomAudio_Music(blanksound, 0, 500);
		
			if !(ShrineArenaBossIntro_DoorsCreated)
			{
				ShrineArenaBossIntro_EntranceWall = instance_create_layer(928, 416, "Platforms", obj_Wall);
				ShrineArenaBossIntro_ExitWall = instance_create_layer(32, 416, "Platforms", obj_Wall);
				layer_set_visible("Floortiles_Closed", true);
				layer_set_visible("Floortiles_FullOpen", false);
				ShrineArenaBossIntro_DoorsCreated = true;
			}
			
			if (ShrineArenaBossIntro_TimeSource == noone)
			{
				var _func = function()
				{
					ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.JEST_COUNTDOWN;
					time_source_destroy(ShrineArenaBossIntro_TimeSource);
					ShrineArenaBossIntro_TimeSource = noone;
				}
				ShrineArenaBossIntro_TimeSource = TimeSourceCreateAndStart(50, _func);
			}
			
		#endregion
		
		break;//end Arena Enclose
	
	//Jest Countdown Stage
	case SHRINEARENABOSSINTRO.JEST_COUNTDOWN:
		
		#region Jest Countdown
			
			var _text = 
			[
				"Now that both competitors have been introduced...",
				"It's time to begin...!",
				"THE COUNTDOWN!",
				"The battle will start when I say 'go'.",
				"Ready!",
				"3!",
				"2!",
				"1!",
				"GOOOOOOOOOOOOO!!"
			]
			
			var _voice = 
			[
				sound_Jest_Talk_halezaDIZEna,
				sound_Jest_Dark_Vishkana,
				sound_Jest_Talk_Volapachi_Halaka,
				sound_Jest_Dark_Rilakanazhi,
				sound_Jest_Laugh_Hah,
				blanksound,
				blanksound,
				blanksound,
				sound_Jest_Laugh_HAhaha,
			]
			
			if !(ShrineArenaBossIntro_JestCountdown_TalkStarted)
			{
				CutsceneText(_text, "Jest", p, ft_Jest, c, s);
				obj_Text.TextBox_Voices = _voice;
				ShrineArenaBossIntro_JestCountdown_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.BATTLE_START;
			}
			else
			{
				SkipTextOption();
				with (obj_Text)
				{
					if (TextBox_CharCount < string_length(TextBox_Text[TextBox_Page]))
					{
						layer_sequence_speedscale(other.ShrineArenaBossIntro_JestIdle, 1);
					}
					else
					{
						layer_sequence_speedscale(other.ShrineArenaBossIntro_JestIdle, 0);
					}
				}
			}
		
		#endregion
		
		break;//end Jest Countdown Stage
	
	//Battle Start Stage
	case SHRINEARENABOSSINTRO.BATTLE_START:
		
		#region Battle Start
			
			PlayerFullHeal();
			
			SetRoomAudio_Music_Default(music_ShrineGeneralTheme);
			
			//Create the ShrineGeneral
			if !(instance_exists(obj_ShrineGeneral_Main_PhaseOne))
			{
				//instance_create_layer(layer_sprite_get_x(ShrineArenaBossIntro_GeneralIdle), layer_sprite_get_y(ShrineArenaBossIntro_GeneralIdle), "ShrineGeneral", obj_ShrineGeneral_Main_PhaseOne);
				instance_create_layer(130, 388, "ShrineGeneral", obj_ShrineGeneral_Main_PhaseOne);
				
				layer_sprite_destroy(ShrineArenaBossIntro_GeneralIdle);
				ShrineArenaBossIntro_GeneralIdle = noone;
			}
			
			obj_Player.hascontrol = true;
			
			ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.IN_BATTLE;
			
			layer_sequence_speedscale(ShrineArenaBossIntro_JestIdle, 1);

			
		#endregion
		
		break;//end Battle Start Stage
	
	//In Battle Stage
	case SHRINEARENABOSSINTRO.IN_BATTLE:
		
		#region In Battle 
		
			obj_Camera.x = 480;
			obj_Camera.y = 270;
			
		#endregion
		
		break;//end In Battle Stage
		
	//Battle End Stage
	case SHRINEARENABOSSINTRO.BATTLE_END:
		
		#region Battle End
		
			SetRoomAudio_Music_Default(blanksound);
			
			with (obj_Player)
			{
				hascontrol = false;
				
				if (other.ShrineArenaBossIntro_GeneralIdle != noone)
				{
					image_xscale = sign(layer_sprite_get_x(other.ShrineArenaBossIntro_GeneralIdle) - x);
				}
			}

			instance_destroy(obj_ShrineGeneral_Main_PhaseOne);
			
			if (ShrineArenaBossIntro_TimeSource == noone)
			{
				var _func = function()
				{
					ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.GENERAL_DEFEAT_TALK;
					time_source_destroy(ShrineArenaBossIntro_TimeSource);
					ShrineArenaBossIntro_TimeSource = noone;
				}
				ShrineArenaBossIntro_TimeSource = TimeSourceCreateAndStart(60, _func);
			}

		#endregion
		
		break;//end Battle End Stage
	
	//General Defeat Talk Stage
	case SHRINEARENABOSSINTRO.GENERAL_DEFEAT_TALK:
		
		#region General Defeat Talk
			
			var _text = 
			[
				"I-I-I-I-I-I'v-v-v-v-v-v-v-v",
				"I lo-lo-los-los-los-lost-t-t",
				"to-to a-a k-k-ki-kid...",
				"I-",
				"I've something urgent to do."
			]
			
			if !(ShrineArenaBossIntro_GeneralDefeatTalk_TalkStarted)
			{
				CutsceneText(_text, n, p, ft_NPC, c, s);
				obj_Text.TextBox_TextSkippable = false;
				ShrineArenaBossIntro_GeneralDefeatTalk_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.GENERAL_EXIT;
			}
			else
			{
				SkipTextOption();
			}
			
		#endregion 
		
		break;//end General Defeat Talk Stage
		
	//General Exit Stage
	case SHRINEARENABOSSINTRO.GENERAL_EXIT:
		
		#region General Exit
		
			if (layer_sprite_get_x(ShrineArenaBossIntro_GeneralIdle) > -700)
			{
				layer_sprite_x(ShrineArenaBossIntro_GeneralIdle, layer_sprite_get_x(ShrineArenaBossIntro_GeneralIdle) - (10 * (1 + global.Key_SpeedUp)));
				layer_sprite_xscale(ShrineArenaBossIntro_GeneralIdle, -1);
			}
			
			else
			{
				layer_sprite_destroy(ShrineArenaBossIntro_GeneralIdle);
				ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.JEST_ANNOUNCE_WINNER;
			}
		
		#endregion
		
		break;//end General Exit Stage
		
	//Jest Announce Winner Stage
	case SHRINEARENABOSSINTRO.JEST_ANNOUNCE_WINNER:
		
		#region Jest Announce Winner
			
			var _text = 
			[
				"oh...",
				"*ahem*",
				"LADIES AND GENTLENOXIANS!", 
				"That was an amazing match, and it's now over!",
				"THE WINNER!",
				"IS!",
				"LADY ROSEY-DARLING!!!",
				"LET'S ALL GIVE HER YOUR LOUDEST CHEERS!!!"
			]
			
			var _voice = 
			[
				sound_Jest_Talk_Huh,
				blanksound,
				sound_Jest_Talk_halezaDIZEna,
				sound_Jest_Talk_halakazanadi,
				sound_Jest_Laugh_Hah,
				sound_Jest_Laugh_HAhaha,
				sound_Jest_Talk_Volapachi_Halaka,
				sound_Jest_Talk_halezaDIZEna
			];
			
			if !(ShrineArenaBossIntro_JestAnnounceWinner_TalkStarted)
			{
				CutsceneText(_text, "Jest", p, ft_Jest, c, s);
				obj_Text.TextBox_Voices = _voice;
				ShrineArenaBossIntro_JestAnnounceWinner_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.AUDIENCE_APPLAUD;
			}
			else
			{
				SkipTextOption();
				with (obj_Text)
				{
					
					if (TextBox_Page > 1)
					{
						SetRoomAudio_Music_Default(music_JestEncounterTheme);
					}
					
					if (TextBox_CharCount < string_length(TextBox_Text[TextBox_Page]))
					{
						layer_sequence_speedscale(other.ShrineArenaBossIntro_JestIdle, 1);
					}
					else
					{
						layer_sequence_speedscale(other.ShrineArenaBossIntro_JestIdle, 0);
					}
				}
		
			}
			
			
		#endregion
			
		break;//end Jest Announce Winner
		
	//Audience Applaud Stage
	case SHRINEARENABOSSINTRO.AUDIENCE_APPLAUD:
		
		#region Audience Applaud
			
			var _text = 
			[
				"WOOOOOOOOOH!!",
				"ROSEY-DARLING! ROSEY-DARLING!",
				"(wait we might get terminated)",
				"LADY ROSE! LADY ROSE! LADY ROSE!"
			];
				
			var _voice = 
			[
				sound_Applause,
				blanksound,
				blanksound,
				blanksound
			]
			
			if !(ShrineArenaBossIntro_AudienceApplaud_TalkStarted)
			{
				CutsceneText(_text, "", p, ft_NPC, c, s);
				obj_Text.TextBox_Voices = _voice;
			//	audio_play_sound(sound_Applause, 100, false, 1);
				ShrineArenaBossIntro_AudienceApplaud_TalkStarted = true;
			}
			
			else if !(instance_exists(obj_Text)) //&& !audio_is_playing(sound_Applause)
			{
				ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.JEST_DISMISS;
				with (obj_Text)
				{
					instance_destroy();
				}
			}
		
			else
			{
				SkipTextOption();
			}
		
		#endregion
		
		break;//end Audience Applaud Stage
		
	//Jest Dismiss Stage
	case SHRINEARENABOSSINTRO.JEST_DISMISS:
		
		#region Jest Dismiss
			
			var _text = 
			[
				"Now then ladies and gentlenoxians!",
				"It's been a wonderful day", 
				"But all good things must come to an end!",
				"I shall see you all next time!",
				"On the SHRINE ARENA BATTLEGROUNDS!",
				"So goodbye everyone!",
				"......",
				".....",
				"....",
				"...",
				"That means leave."
			]
			
			var _voice = 
			[
				sound_Jest_Laugh_HAhaha,
				sound_Jest_Talk_haleKIzena,
				sound_Jest_Talk_halakazanadi,
				sound_Jest_Talk_halezaDIZEna,
				sound_Jest_Talk_Volapachi_Halaka,
				sound_Jest_Talk_jaravajikaraZHAna,
				blanksound,
				blanksound,
				blanksound,
				blanksound,
				sound_Jest_Talk_jaravajikaraZHAna,
			]
			
			if !(ShrineArenaBossIntro_JestDismiss_TalkStarted)
			{
				CutsceneText(_text, "Jest", p, ft_Jest, c, s);
				obj_Text.TextBox_Voices = _voice;
				ShrineArenaBossIntro_JestDismiss_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.AUDIENCE_EXIT;
			}
			else
			{
				SkipTextOption();
				with (obj_Text)
				{
					if (TextBox_CharCount < string_length(TextBox_Text[TextBox_Page]))
					{
						layer_sequence_speedscale(other.ShrineArenaBossIntro_JestIdle, 1);
					}
					else
					{
						layer_sequence_speedscale(other.ShrineArenaBossIntro_JestIdle, 0);
					}
				}
			}
		
		#endregion
		
		break;//end Jest Dismiss Stage
	
	//Audience Exit Stage
	case SHRINEARENABOSSINTRO.AUDIENCE_EXIT:
		
		#region Audience Exit Stage
			
			if (layer_sequence_get_x(ShrineArenaBossIntro_AudienceIdle1) <= 1000)
			{
				layer_sequence_x(ShrineArenaBossIntro_AudienceIdle1, layer_sequence_get_x(ShrineArenaBossIntro_AudienceIdle1) + (5 * (1 + global.Key_SpeedUp)));
				layer_sequence_x(ShrineArenaBossIntro_AudienceIdle2, layer_sequence_get_x(ShrineArenaBossIntro_AudienceIdle2) + (5 * (1 + global.Key_SpeedUp)));
			}
			else
			{
				layer_sequence_destroy(ShrineArenaBossIntro_AudienceIdle1);
				layer_sequence_destroy(ShrineArenaBossIntro_AudienceIdle2);
				ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.JEST_EXIT_TALK;
			}
		
		#endregion
		
		break;//end Audience Exit Stage
		
	//Jest Exit Talk Stage
	case SHRINEARENABOSSINTRO.JEST_EXIT_TALK:
		
		#region Jest Exit Talk
		
			var _text = 
			[
				"Huhuhuuu....",
				"Looks like it's time for me to take my leave.",
				"See you later Rosey-darling!",
			]
			
			var _voice = 
			[
				sound_Jest_Laugh_HAhaha,
				sound_Jest_Talk_haleKIzena,
				sound_Jest_Talk_jaravajikaraZHAna,
			]
			
			if !(ShrineArenaBossIntro_JestExitTalk_TalkStarted)
			{
				CutsceneText(_text, "Jest", p, ft_Jest, c, s);
				obj_Text.TextBox_Voices = _voice;
				ShrineArenaBossIntro_JestExitTalk_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.JEST_EXIT;
			}
			else
			{
				SkipTextOption()
				with (obj_Text)
				{
					if (TextBox_CharCount < string_length(TextBox_Text[TextBox_Page]))
					{
						layer_sequence_speedscale(other.ShrineArenaBossIntro_JestIdle, 1);
					}
					else
					{
						layer_sequence_speedscale(other.ShrineArenaBossIntro_JestIdle, 0);
					}
				}
			}
		
		#endregion
		
		break;//end Jest Exit Talk Stage
		
	//Jest Exit Stage
	case SHRINEARENABOSSINTRO.JEST_EXIT:
	
		#region Jest Exit
			
			if !(ShrineArenaBossIntro_JestExit_SequenceCreated)
			{
				ShrineArenaBossIntro_JestExit_Sequence = layer_sequence_create("Jest", 0, 0, seq_ShrineGeneralBossIntro_JestExit);
				layer_sequence_destroy(ShrineArenaBossIntro_JestIdle);
				ShrineArenaBossIntro_JestExit_SequenceCreated = true;
			}
			else if (layer_sequence_is_finished(ShrineArenaBossIntro_JestExit_Sequence))
			{
				layer_sequence_destroy(ShrineArenaBossIntro_JestExit_Sequence);
				ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.CUTSCENE_END;
			}
			else
			{
				SkipCutsceneOption(ShrineArenaBossIntro_JestExit_Sequence);
			}
			
		#endregion
		
		break;//end Jest Exit Stage
		
	//Cutscene End Stage
	case SHRINEARENABOSSINTRO.CUTSCENE_END:
		
		#region Cutscene End
			
			SetRoomAudio_Music_Default();
			
			layer_set_visible("Floortiles_Closed", false);
			layer_set_visible("Floortiles_FullOpen", true);
			
			instance_destroy(ShrineArenaBossIntro_EntranceWall)
			instance_destroy(ShrineArenaBossIntro_ExitWall);
			
			obj_Camera.follow = obj_Player;
			
			obj_Player.hascontrol = true;
			
			PlayerFullHeal();
			
			global.ShrineGeneral_Defeated = true;
			
			SetSpawnpoint(obj_Player.x, obj_Player.y);
			
			SaveGame();
			
			instance_destroy();
			
		#endregion
		
		break;//end Cutscene End Stage
		
}//end stage machine








