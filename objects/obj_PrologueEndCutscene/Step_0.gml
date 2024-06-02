/// @description Insert description here
// You can write your code in this editor

var p = TEXTBOX_POS.BOTTOM;

//Stage machine for the cutscene
switch (PrologueEndCutscene_Stage)
{
	//Off Stage: When the cutscene hasn't officially started
	case PROLOGUE_END_CUTSCENE.OFF:
		
		#region Off
			
			if (!global.MidTransition)
			{
				time_source_start(PrologueEndCutscene_Off_TimeSource);
			}
		
		#endregion
		
		break;//end Off Stage
		
	//Voizatia Enter Stage: 
	case PROLOGUE_END_CUTSCENE.VOIZATIA_ENTER:
		
		#region Voizatia Enter
		
			if !(PrologueEndCutscene_VoizatiaEnter_SequenceCreated)
			{
				PrologueEndCutscene_VoizatiaEnter_Sequence = layer_sequence_create(layer, x, y, seq_PrologueEndCutscene_VoizatiaEnter);
				PrologueEndCutscene_VoizatiaEnter_SequenceCreated = true;
			}
			else if (layer_sequence_is_finished(PrologueEndCutscene_VoizatiaEnter_Sequence))
			{
				PrologueEndCutscene_VoizatiaIdle = layer_sequence_create(layer, x, y, seq_PrologueEndCutscene_VoizatiaIdle);
				layer_sequence_destroy(PrologueEndCutscene_VoizatiaEnter_Sequence);
				var _func = function()
				{
					PrologueEndCutscene_Stage = PROLOGUE_END_CUTSCENE.VOIZATIA_ENTER_TALK;
					time_source_destroy(PrologueEndCutscene_TimeSource);
					PrologueEndCutscene_TimeSource = noone;
				}
				if (PrologueEndCutscene_TimeSource == noone)
				{
					PrologueEndCutscene_TimeSource = TimeSourceCreateAndStart(30, _func);
				}
			}
		
		#endregion
		
		break;//end Voizatia Enter Stage
		
	//Voizatia Enter Talk Stage
	case PROLOGUE_END_CUTSCENE.VOIZATIA_ENTER_TALK:
	
		#region Voizatia Enter Talk
		
			SetRoomAudio_Music_Default(music_VoizatiaEncounterThemeV2);
		
			var _text = 
			[
				"Now then, what to do now?",
				"Rose should be on her way to where Phantom Lance is right about now, so I should find something to do.",
				"Perhaps I should read some of this Shrines books.",
				"It's been a while, I wonder if they've updated their inventory.",
				"Or maybe I could go on a decimation rampage in Noctis City, give Rose a little more motivation.",
				"Or better yet..."
			];
		
			var _voice = 
			[
				sound_Voizatia_Light_Kaaah,
				sound_Voizatia_Light_Yaramah,
				sound_Voizatia_Light_ShihaGAla,
				sound_Voizatia_Light_ValaSHImana,
				sound_Voizatia_Serious_KorKilimamya,
				sound_Voizatia_Light_Orkazna,
			]
		
			if !(PrologueEndCutscene_VoizatiaEnterTalk_TalkStarted)
			{
				PrologueEndCutscene_VoizatiaEnterTalk_Talk = CutsceneText(_text, "Voizatia", p, ft_Voizatia);
				PrologueEndCutscene_VoizatiaEnterTalk_Talk.TextBox_Voices = _voice;
				PrologueEndCutscene_VoizatiaEnterTalk_TalkStarted = true;
			}
			
			else if !(instance_exists(obj_Text))
			{
				if (PrologueEndCutscene_TimeSource == noone) PrologueEndCutscene_TimeSource = TimeSourceCreateAndStart(60, function(){PrologueEndCutscene_Stage = PROLOGUE_END_CUTSCENE.VOIZATIA_NOTICE_MALVALIA; time_source_destroy(PrologueEndCutscene_TimeSource); PrologueEndCutscene_TimeSource = noone;});
			}
		
		#endregion
	
		break;//end Voizatia Enter Talk Stage
		
	//Voizatia Notice Malvalia Stage
	case PROLOGUE_END_CUTSCENE.VOIZATIA_NOTICE_MALVALIA:
	
		#region Voizatia Notice Malvalia
		
			var _text = 
			[
				"Do something about you.",
				"Man, you really have it hard, don't ya?",
				"Malvalia."
			];
			
			var _voice = 
			[
				sound_Voizatia_Light_Kaaah,
				sound_Voizatia_Light_Yaramah,
				sound_Voizatia_Light_Orkazna,
			]
		
			if !(PrologueEndCutscene_VoizatiaNoticeMalvalia_TalkStarted)
			{
				PrologueEndCutscene_VoizatiaNoticeMalvalia_Talk = CutsceneText(_text, "Voizatia", p, ft_Voizatia);
				PrologueEndCutscene_VoizatiaNoticeMalvalia_Talk.TextBox_Voices = _voice;
				PrologueEndCutscene_VoizatiaNoticeMalvalia_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				PrologueEndCutscene_Stage = PROLOGUE_END_CUTSCENE.MALVALIA_ENTER;
			}
		
		#endregion
	
		break;//end Voizatia Notice Malvalia
		
	//Malvalia Enter Stage
	case PROLOGUE_END_CUTSCENE.MALVALIA_ENTER:
		
		#region Malvalia Enter
			
			if !(PrologueEndCutscene_MalvaliaEnter_SequenceCreated)
			{
				PrologueEndCutscene_MalvaliaEnter_Sequence = layer_sequence_create(layer, x, y, seq_PrologueEndCutscene_MalvaliaEnter);				
				PrologueEndCutscene_MalvaliaEnter_SequenceCreated = true;
			}	
			else if (layer_sequence_is_finished(PrologueEndCutscene_MalvaliaEnter_Sequence))
			{
				PrologueEndCutscene_MalvaliaIdle = layer_sequence_create(layer, x, y, seq_PrologueEndCutscene_MalvaliaIdleAngry);
				layer_sequence_destroy(PrologueEndCutscene_MalvaliaEnter_Sequence);
				PrologueEndCutscene_Stage = PROLOGUE_END_CUTSCENE.MALVALIA_ENTER_TALK;
			}	
			
		#endregion
		
		break;//end Malvalia Enter Stage
		
	//Malvalia Enter Talk Stage
	case PROLOGUE_END_CUTSCENE.MALVALIA_ENTER_TALK:
	
		#region Malvalia Enter Talk
			
			var _text = 
			[
				"DAMN IT ALL! DAMN IT ALL! DAMN ALL OF IT!",
				"THAT DAMN GIRL! I SWEAR I'LL KILL HER NEXT TIME I SEE HER!",
				"PLEASE LET ME KILL THAT BITCH IN THE MOST PAINFUL WAY POSSIBLE!",
				"I CAN'T LIVE WITH THIS HUMILIATION!"
			];
			
			var _voice = 
			[
				sound_Malvalia_Angry_Spickovick,
				sound_Malvalia_Angry_Kenzolomo,
				sound_Malvalia_Angry_Karass,
				sound_Malvalia_Angry_Oroma,
			]
			
			if !(PrologueEndCutscene_MalvaliaEnterTalk_TalkStarted)
			{
				PrologueEndCutscene_MalvaliaEnterTalk_Talk = CutsceneText(_text, "Malvalia", p, ft_Malvalia);
				PrologueEndCutscene_MalvaliaEnterTalk_Talk.TextBox_Voices = _voice;
				PrologueEndCutscene_MalvaliaEnterTalk_TalkStarted = true;
			}
			
			else if !(instance_exists(obj_Text))
			{
				if (PrologueEndCutscene_TimeSource == noone) PrologueEndCutscene_TimeSource = TimeSourceCreateAndStart(20, function(){PrologueEndCutscene_Stage = PROLOGUE_END_CUTSCENE.VOIZATIA_CALM_MALVALIA; time_source_destroy(PrologueEndCutscene_TimeSource); PrologueEndCutscene_TimeSource = noone;});
			}
		
		#endregion
		
		break;//end Malvalia Enter Talk Stage
		
	//Voizatia Calm Malvalia Stage
	case PROLOGUE_END_CUTSCENE.VOIZATIA_CALM_MALVALIA:
		
		#region Voizatia Calm Malvalia
			
			var _text = 
			[
				"Now now, calm down. I'm glad that you've inherited the ways of our people, but blind rage isn't gonna get you anywhere, ya gotta be rational.",
				"Think carefully of how you're gonna beat her, and what the 'most painful death' even looks like.",
				"Only then will slaughtering her be satisfying.",
				"That is who we, the Vlastels, truly are.",
				"So until then.",
				"Calm. Down."
			];
			
			var _voice = 
			[
				sound_Voizatia_Light_Kaaah,
				sound_Voizatia_Light_SHIhalaga,
				sound_Voizatia_Light_ValaSHImana,
				sound_Voizatia_Serious_KorKilimamya,
				sound_Voizatia_Light_Orkazna,
				sound_Voizatia_Attack_Valahai
			]
			
			if !(PrologueEndCutscene_VoizatiaCalmMalvalia_TalkStarted)
			{
				PrologueEndCutscene_VoizatiaCalmMalvalia_Talk = CutsceneText(_text, "Voizatia", p, ft_Voizatia);
				PrologueEndCutscene_VoizatiaCalmMalvalia_Talk.TextBox_Voices = _voice;
				PrologueEndCutscene_VoizatiaCalmMalvalia_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				//layer_sequence_destroy(PrologueEndCutscene_MalvaliaIdle);
				if (PrologueEndCutscene_TimeSource == noone) PrologueEndCutscene_TimeSource = TimeSourceCreateAndStart(60, function(){PrologueEndCutscene_Stage = PROLOGUE_END_CUTSCENE.MALVALIA_EXIT_TALK; time_source_destroy(PrologueEndCutscene_TimeSource); PrologueEndCutscene_TimeSource = noone;});
			}
		
		#endregion
		
		break;//end Voizatia Calm Malvalia Stage
		
	//Malvalia Exit Talk Stage
	case PROLOGUE_END_CUTSCENE.MALVALIA_EXIT_TALK:
	
		#region Malvalia Exit Talk
			
			var _text = 
			[
				"...",
				".....",
				".........",
				"I..understand...",
				"I'm calm...",
				"Yes, I can kill her if I just think a bit.",
				"Haha, HAHAHAHA, HAHAHAHAHAHAHAHAHA",
				"That's it! I could easily kill her if I had one of those Carvaline Orbs!",
				"HAHAHAHAHAHA! Just you wait you damn doll!",
				"You're gonna get it real soon!"
			];
			
			var _voice = 
			[
				blanksound,
				blanksound,
				blanksound,
				sound_Malvalia_Calm_Esparo,
				sound_Malvalia_Calm_Almei,
				sound_Malvalia_Calm_Visandi,
				sound_Malvalia_Laugh_uHahahaha,
				sound_Malvalia_Angry_FairQUIsha,
				sound_Malvalia_Laugh_Soofmaha,
				sound_Malvalia_Mocking_KaleizaInja
			]
			
			if !(PrologueEndCutscene_MalvaliaExitTalk_TalkStarted)
			{
				PrologueEndCutscene_MalvaliaExitTalk_Talk = CutsceneText(_text, "Malvalia", p, ft_Malvalia);
				PrologueEndCutscene_MalvaliaExitTalk_Talk.TextBox_Voices = _voice;
				PrologueEndCutscene_MalvaliaExitTalk_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				if (PrologueEndCutscene_TimeSource == noone) PrologueEndCutscene_TimeSource = TimeSourceCreateAndStart(30, function(){PrologueEndCutscene_Stage = PROLOGUE_END_CUTSCENE.MALVALIA_EXIT; time_source_destroy(PrologueEndCutscene_TimeSource); PrologueEndCutscene_TimeSource = noone;});
			}
		
		#endregion
	
		break;//end Malvalia Exit Talk Stage
		
	//Malvalia Exit Stage
	case PROLOGUE_END_CUTSCENE.MALVALIA_EXIT:
		
		#region Malvalia Exit
		
			if !(PrologueEndCutscene_MalvaliaExit_SequenceCreated)
			{
				PrologueEndCutscene_MalvaliaExit_Sequence = layer_sequence_create(layer, x, y, seq_PrologueEndCutscene_MalvaliaExit);				
				layer_sequence_destroy(PrologueEndCutscene_MalvaliaIdle);
				PrologueEndCutscene_MalvaliaExit_SequenceCreated = true;
			}	
			else if (layer_sequence_is_finished(PrologueEndCutscene_MalvaliaExit_Sequence))
			{
				layer_sequence_destroy(PrologueEndCutscene_MalvaliaExit_Sequence);
				
				if (PrologueEndCutscene_TimeSource == noone)
				{
					var _func = function()
					{
						PrologueEndCutscene_Stage = PROLOGUE_END_CUTSCENE.VOIZATIA_LAST_TALK;
						time_source_destroy(PrologueEndCutscene_TimeSource);
						PrologueEndCutscene_TimeSource = noone;
					}
					PrologueEndCutscene_TimeSource = TimeSourceCreateAndStart(50, _func);
				}
			}
		
		#endregion
		
		break;//end Malvalia Exit Stage
		
	//Voizatia Last Talk Stage
	case PROLOGUE_END_CUTSCENE.VOIZATIA_LAST_TALK:
		
		#region Voizatia Last Talk
			
			var _text = 
			[
				"And there she goes, sounds like she'll be having fun.",
				"I guess that's my cue to go do something.",
				"...",
				"Hahahahaha...",
				"HAHAHAHAHAHAHAHAHA!",
				"haaa...",
				"Damn, when was the last time I was THIS excited, I feel like a kid that's stepped into their backyard for the first time!",
				"I see now, this planet truly is interesting.",
				"You were right about everything, just as expected from you...",
				"Your Majesty! "
			];
			
			var _voice = 
			[
				sound_Voizatia_Light_ValaSHImana,
				sound_Voizatia_Light_Yaramah,
				blanksound,
				sound_Voizatia_Laugh_Tthuhuhuhu,
				sound_Voizatia_Laugh_AHAHAHAHA,
				sound_Voizatia_Light_Kaaah,
				sound_Voizatia_Light_Orkazna,
				sound_Voizatia_Serious_KorKilimamya,
				sound_Voizatia_Serious_KorKENZmanya,
				sound_Voizatia_Attack_Vyakai
			]
			
			if !(PrologueEndCutscene_VoizatiaLastTalk_TalkStarted)
			{
				PrologueEndCutscene_VoizatiaLastTalk_Talk = CutsceneText(_text, "Voizatia", p, ft_Voizatia);
				PrologueEndCutscene_VoizatiaLastTalk_Talk.TextBox_Voices = _voice;
				PrologueEndCutscene_VoizatiaLastTalk_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				PrologueEndCutscene_Stage = PROLOGUE_END_CUTSCENE.CUTSCENE_END;
			}
			else if (PrologueEndCutscene_VoizatiaLastTalk_Talk.TextBox_Page >= array_length(_text) - 1)
			{
				with (PrologueEndCutscene_VoizatiaLastTalk_Talk)
				{
					TextBox_TextColor = c_red;
					TextBox_TextSkippable = false;
					TextBox_CharIncrease = 0.2;
				}
			}
			
		#endregion
			
		break;//end Voizatia Last Talk
		
	case PROLOGUE_END_CUTSCENE.CUTSCENE_END:
	
		#region Cutscene End
				
			SetRoomAudio_Music_Default();
			
			global.PrologueEnd_Cutscene_Seen = true;
				
			if (global.IsDemo)
			{
				TransitionStart(Room_Credits_PrologueChapter, seq_FadeOut, seq_FadeIn);
			}
			else
			{
				PlayerTransition(Room_NoctisCity_FieldTunnel, 64, 384);
			}
			
			instance_destroy();
		
		#endregion
	
		break;//end Cutscene End Stage
		
}//end cutscene stage machine


