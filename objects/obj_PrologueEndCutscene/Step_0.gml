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
				"Rose should be on her way to where Escular is right about now, so I should find something to do.",
				"Perhaps I should read some of this Shrines books.",
				"Go on a little decimation rampage myself?",
				"Or better yet..."
			];
		
			if !(PrologueEndCutscene_VoizatiaEnterTalk_TalkStarted)
			{
				PrologueEndCutscene_VoizatiaEnterTalk_Talk = CutsceneText(_text, "Voizatia", p, ft_Voizatia);
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
		
			if !(PrologueEndCutscene_VoizatiaNoticeMalvalia_TalkStarted)
			{
				PrologueEndCutscene_VoizatiaNoticeMalvalia_Talk = CutsceneText(_text, "Voizatia", p, ft_Voizatia);
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
				PrologueEndCutscene_MalvaliaIdle = layer_sequence_create(layer, x, y, seq_PrologueEndCutscene_MalvaliaIdle);
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
			
			if !(PrologueEndCutscene_MalvaliaEnterTalk_TalkStarted)
			{
				PrologueEndCutscene_MalvaliaEnterTalk_Talk = CutsceneText(_text, "Malvalia", p, ft_Malvalia);
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
				"Now now, calm down. I know living with a loss is taboo, but blind rage isn't gonna get you anywhere, ya gotta be rational",
				"Think carefully of how you're gonna beat her, and what the 'most painful death' even looks like.",
				"Only then will slaughtering her be satisfying.",
				"That is the way of our people, the Vlastels.",
				"So until then.",
				"Calm. Down."
			]
			
			if !(PrologueEndCutscene_VoizatiaCalmMalvalia_TalkStarted)
			{
				PrologueEndCutscene_VoizatiaCalmMalvalia_Talk = CutsceneText(_text, "Voizatia", p, ft_Voizatia);
				PrologueEndCutscene_VoizatiaCalmMalvalia_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
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
				"That's it! I could easily kill her if I had one of those Carvaline...Orbs...",
			];
			
			if !(PrologueEndCutscene_MalvaliaExitTalk_TalkStarted)
			{
				PrologueEndCutscene_MalvaliaExitTalk_Talk = CutsceneText(_text, "Malvalia", p, ft_Malvalia);
				PrologueEndCutscene_MalvaliaExitTalk_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				if (PrologueEndCutscene_TimeSource == noone) PrologueEndCutscene_TimeSource = TimeSourceCreateAndStart(100, function(){PrologueEndCutscene_Stage = PROLOGUE_END_CUTSCENE.MALVALIA_QUESTION; time_source_destroy(PrologueEndCutscene_TimeSource); PrologueEndCutscene_TimeSource = noone;});
			}
		
		#endregion
	
		break;//end Malvalia Exit Talk Stage
		
	//Malvalia Question Stage
	case PROLOGUE_END_CUTSCENE.MALVALIA_QUESTION:
	
		#region Malvalia Question
		
			SetRoomAudio_Music_Default();
			
			var _text = 
			[
				"Voizatia.",
				"I've been thinking about this for a while...",
				"But why was getting those Carvaline Orbs so easy?",
				"I mean, we busted through the entrance just when it was unguarded, and took the path that went straight there",
				"Isn't that all  too convenient?"
				/*
				"Our plot to attack the shrine, didn't it go a little too well?",
				"I mean, the path you took led us straight to the Orbs.",
				"And we just happened to do it on the day that it was practically begging to be attacked.",
				"Isn't that all just a bit too convenient?"
				*/
			];
			
			if !(PrologueEndCutscene_MalvaliaQuestion_TalkStarted)
			{
				PrologueEndCutscene_MalvaliaQuestion_Talk = CutsceneText(_text, "Malvalia", p, ft_Malvalia);
				PrologueEndCutscene_MalvaliaQuestion_TalkStarted = true;
			}
			
			else if !(instance_exists(obj_Text))
			{
				if (PrologueEndCutscene_TimeSource == noone) PrologueEndCutscene_TimeSource = TimeSourceCreateAndStart(80, function() {PrologueEndCutscene_Stage = PROLOGUE_END_CUTSCENE.VOIZATIA_TALK_LAVENDER; time_source_destroy(PrologueEndCutscene_TimeSource); PrologueEndCutscene_TimeSource = noone;});
			}
			
		#endregion
	
		break;//end Malvalia Question Stage
		
	//Voizatia Talk Lavender Stage
	case PROLOGUE_END_CUTSCENE.VOIZATIA_TALK_LAVENDER:
	
		#region Voizatia Talk Lavender
			
			var _text = 
			[
				"'Too convenient' huh? You're a lot smarter than you act, you know that?",
				"Spot on",
				"His Majesty told me that I would find an ally on this planet, and as always, His Majesty was correct.",
				"She has the Carvaline Orbs that I want, and I have knowledge of their origins that she wants. A fated alliance.",
				"Now then, since we're gonna be living here for a while, you might as well get to know her.",
				"Come out an introduce yourself."
			];
			
			if !(PrologueEndCutscene_VoizatiaTalkLavender_TalkStarted)
			{
				PrologueEndCutscene_VoizatiaTalkLavender_Talk = CutsceneText(_text, "Voizatia", p, ft_Voizatia);
				PrologueEndCutscene_VoizatiaTalkLavender_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				PrologueEndCutscene_Stage = PROLOGUE_END_CUTSCENE.LAVENDER_ENTER;
			}
		
		#endregion
		
		break;//end Voizatia Talk Lavender Stage
		
	//Lavender Enter Stage
	case PROLOGUE_END_CUTSCENE.LAVENDER_ENTER:
	
		#region Lavender Enter
		
			if !(PrologueEndCutscene_LavenderEnterSequenceCreated)
			{
				PrologueEndCutscene_LavenderEnterSequence = layer_sequence_create(layer, x, y, seq_PrologueEndCutscene_LavenderEnter);
				PrologueEndCutscene_LavenderEnterSequenceCreated = true;
			}
			else if (layer_sequence_is_finished(PrologueEndCutscene_LavenderEnterSequence))
			{
				PrologueEndCutscene_LavenderIdle = layer_sequence_create(layer, x, y, seq_PrologueEndCutscene_LavenderIdle);
				layer_sequence_destroy(PrologueEndCutscene_LavenderEnterSequence);
				if (PrologueEndCutscene_TimeSource == noone) PrologueEndCutscene_TimeSource = TimeSourceCreateAndStart(120, function(){PrologueEndCutscene_Stage = PROLOGUE_END_CUTSCENE.CUTSCENE_END; time_source_destroy(PrologueEndCutscene_TimeSource); PrologueEndCutscene_TimeSource = noone;});
			}
		
		#endregion
		
		break;//end Lavender Enter Stage
		
	case PROLOGUE_END_CUTSCENE.CUTSCENE_END:
	
		#region Cutscene End
				
			TransitionStart(Room_Credits_PrologueChapter, seq_FadeOut, seq_FadeIn);
			
			instance_destroy();
		
		#endregion
	
		break;//end Cutscene End Stage
		
}//end cutscene stage machine


