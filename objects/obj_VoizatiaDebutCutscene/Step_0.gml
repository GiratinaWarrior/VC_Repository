/// @description

var _VoizatiaFont = ft_Voizatia;

var _MalvaliaFont = ft_Malvalia;

//Voizatia Debut Cutscene State machine
switch(VoizatiaDebut_State)
{
	//Rose Enter Stage
	case VOIZATIADEBUT.ROSE_ENTER:
		
		#region Rose Enter
		
			if !(VoizatiaDebut_RoseEnter_SequenceCreated)
			{
				obj_Camera.follow = noone;
				VoizatiaDebut_RoseEnter_Sequence = layer_sequence_create(layer, 0, 4, seq_VoizatiaDebut_RoseEnter);
				VoizatiaDebut_LavenderIdle_Sequence = layer_sequence_create(layer, 0, 0, seq_VoizatiaDebut_LavenderIdle);
				VoizatiaDebut_VoizatiaIdle_Sequence = layer_sequence_create(layer, 0, 0, seq_VoizatiaDebut_VoizatiaIdle);
				VoizatiaDebut_RoseEnter_SequenceCreated = true;
			}
			else if (layer_sequence_is_finished(VoizatiaDebut_RoseEnter_Sequence))
			{
				obj_Player.x = 256 + RES_W;
				obj_Player.y = 464//190 + RES_H/2;
				layer_sequence_destroy(VoizatiaDebut_RoseEnter_Sequence);
				VoizatiaDebut_State = VOIZATIADEBUT.VOIZATIA_TALK_FIRST;
			}
			
			obj_Camera.xTo = 3000;
		
		#endregion
		
		break;//end Rose Enter Stage
		
	//Voizatia Talk First Stage
	case VOIZATIADEBUT.VOIZATIA_TALK_FIRST:
	
		#region Voizatia Talk First
			
			SetRoomAudio_Music_Default(music_VoizatiaEncounterThemeV2);
			
			var _text = 
			[
				"Intriguing. So these are the Carvaline Orbs.",
				"They certainly do possess the great amounts of vallen I heard about.",
				"It's such a waste for them to rot underground, they're no different from fossils.",
				"My comrades would certainly appreciate these, so I'm sure you won't mind me borrowing them.",
				"Permanently."
			]
		
			if !(VoizatiaDebut_VoizatiaTalkFirst_TalkStarted)
			{
				CutsceneText(_text, "???", TEXTBOX_POS.TOP, _VoizatiaFont);
				VoizatiaDebut_VoizatiaTalkFirst_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{	
				VoizatiaDebut_State = VOIZATIADEBUT.LAVENDER_RESPOND_FIRST;
			}
		
		#endregion
		
		break;//end Voizatia Talk First
		
	//Lavender Respond First Stage
	case VOIZATIADEBUT.LAVENDER_RESPOND_FIRST:
	
		#region Lavender Respond First
		
			var _text = 
			[
				"Unfortunately, I would prefer to keep those down here to rot, that is what is best for this world after all.",
				"And besides, you rudely barged in with terrorism of all things, could you not have at least knocked?"
			]
		
			if !(VoizatiaDebut_LavenderRespondFirst_TalkStarted)
			{
				CutsceneText(_text, "Lavender", TEXTBOX_POS.TOP, ft_Lavender);
				VoizatiaDebut_LavenderRespondFirst_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				VoizatiaDebut_State = VOIZATIADEBUT.VOIZATIA_RESPOND_SECOND;
			}
		
		#endregion
	
		break;//end Lavender Respond First Stage
		
	//Voizatia Respond Second Stage
	case VOIZATIADEBUT.VOIZATIA_RESPOND_SECOND:
	
		#region Voizatia Respond Second
		
			var _text = 
			[
				"Ah, forgive me for the cultural barrier, that was what my planet considers 'knocking'.",
				"I was just curious of what kind of people were safeguarding the Carvaline Orbs for us, and here I find you two.",
				"An older women with purple hair wearing a golden dress and a witch hat. You must be the former Cardinal Lavender",
				"A young grey-skinned child with snow-white hair. You must be Rose, the new Cardinal.",
				"Proper mannerisms demand that I introduce myself to you all as well, don't they?",
				"The name's Voizatia.",
				"Please do your best to put up a decent fight."
			];
		
			if !(VoizatiaDebut_VoizatiaRespondSecond_TalkStarted)
			{
				CutsceneText(_text, "???", TEXTBOX_POS.TOP, _VoizatiaFont);
				VoizatiaDebut_VoizatiaRespondSecond_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{	
				VoizatiaDebut_State = VOIZATIADEBUT.VOIZATIA_FLY;
			}
		
		#endregion
		
		break;//end Voizatia Respond Second Stage
		
	//Voizatia Fly Stage
	case VOIZATIADEBUT.VOIZATIA_FLY:
		
		#region Voizatia Fly
		
			if !(VoizatiaDebut_VoizatiaFly_SequenceCreated)
			{
				VoizatiaDebut_VoizatiaFly_Sequence = layer_sequence_create(layer, 0, 0, seq_VoizatiaDebut_VoizatiaFly);
				layer_sequence_destroy(VoizatiaDebut_VoizatiaIdle_Sequence);
				VoizatiaDebut_VoizatiaIdle_Sequence = noone;
				VoizatiaDebut_VoizatiaFly_SequenceCreated = true;
			}
			else if (layer_sequence_is_finished(VoizatiaDebut_VoizatiaFly_Sequence))
			{
				layer_sequence_destroy(VoizatiaDebut_VoizatiaFly_Sequence);
				VoizatiaDebut_VoizatiaIdle_Sequence = layer_sequence_create(layer, 0, 0, seq_VoizatiaDebut_VoizatiaFloat);
				VoizatiaDebut_State = VOIZATIADEBUT.VOIZATIA_SUMMON_MALVALIA;
			}
			
		#endregion
		
		break;//end Voizatia Fly Stage
		
	//Voizatia Summon Malvalia Stage
	case VOIZATIADEBUT.VOIZATIA_SUMMON_MALVALIA:
	
		#region Voizatia Summon Malvalia
		
			var _text = 
			[
				"A two on one in your favour is it?",
				"It's only fair that both sides start with the same number of pieces",
				"Come forth, Malvalia!"
			];
		
			if !(VoizatiaDebut_VoizatiaSummonMalvalia_TalkStarted)
			{
				CutsceneText(_text, "Voizatia", TEXTBOX_POS.TOP, _VoizatiaFont);
				
				VoizatiaDebut_VoizatiaSummonMalvalia_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				VoizatiaDebut_State = VOIZATIADEBUT.MALVALIA_ENTER;
			}
		
		#endregion
	
		break;//end Voizatia Summon Malvalia Stage
		
	//Malvalia Enter Stage
	case VOIZATIADEBUT.MALVALIA_ENTER:
		
		#region Malvalia Enter
		
			if !(VoizatiaDebut_MalvaliaEnter_SequenceCreated)
			{
				VoizatiaDebut_MalvaliaEnter_Sequence = layer_sequence_create(layer, 0, 0, seq_VoizatiaDebut_MalvaliaEnter);
				VoizatiaDebut_MalvaliaEnter_SequenceCreated = true;
			}
			else if (layer_sequence_is_finished(VoizatiaDebut_MalvaliaEnter_Sequence))
			{
				layer_sequence_destroy(VoizatiaDebut_MalvaliaEnter_Sequence);
				VoizatiaDebut_MalvaliaIdle_Sequence = layer_sequence_create(layer, 0, 0, seq_VoizatiaDebut_MalvaliaFloat);
				VoizatiaDebut_State = VOIZATIADEBUT.MALVALIA_TALK_FIRST;
			}
		
		#endregion
		
		break;//end Malvalia Enter Stage
		
	//Malvalia Talk First Stage
	case VOIZATIADEBUT.MALVALIA_TALK_FIRST:
	
		#region Malvalia Talk First
		
			var _text = 
			[
				"Hahahahahaha! A withering hag and a kid?",
				"What a joke! Where's the fun to be had here?",
				"Dolls are only fun when they can take a beating!"
			];
		
			if !(VoizatiaDebut_MalvaliaTalkFirst_TalkStarted)
			{
				CutsceneText(_text, "Malvalia", TEXTBOX_POS.TOP, _MalvaliaFont);
				VoizatiaDebut_MalvaliaTalkFirst_TalkStarted = true;
			}
			else if (!instance_exists(obj_Text))
			{
				VoizatiaDebut_State = VOIZATIADEBUT.VOIZATIA_RESPOND_THIRD;
			}
			
		#endregion
	
		break;//end Malvalia Talk First Stage
		
	//Voizatia Respond Third Stage
	case VOIZATIADEBUT.VOIZATIA_RESPOND_THIRD:
		
		#region Voizatia Respond Third
			
			var _text = 
			[
				"Cut 'em some slack Malvalia, I'm sure these girls can be some fun",
				"I'll take Lavender, you have fun with Rose",
				"I'm not into older women, but I'm fine with taking this outside, and its best if you enjoy it, Lavender",
				"IT'LL BE THE LAST THING YOU'LL EVER DO AFTER ALL!"
			];
			
			if !(VoizatiaDebut_VoizatiaRespondThird_TalkStarted)
			{
				CutsceneText(_text, "Voizatia", TEXTBOX_POS.TOP, _VoizatiaFont);
				VoizatiaDebut_VoizatiaRespondThird_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				VoizatiaDebut_State = VOIZATIADEBUT.VOIZATIA_EXIT;
			}
			
		#endregion
		
		break;//end Voizatia Respond Third Stage

	//Voizatia Exit Stage
	case VOIZATIADEBUT.VOIZATIA_EXIT:
		
		#region Voizatia Exit
			
			if !(VoizatiaDebut_VoizatiaExit_SequenceCreated) && (VoizatiaDebut_VoizatiaExit_FloatEnd)
			{
				layer_sequence_destroy(VoizatiaDebut_VoizatiaIdle_Sequence);
				VoizatiaDebut_VoizatiaExit_Sequence = layer_sequence_create("VoizatiaTeleport", 0, 0, seq_VoizatiaDebut_VoizatiaExit);
				VoizatiaDebut_VoizatiaExit_SequenceCreated = true;
			}
			else if (layer_sequence_is_finished(VoizatiaDebut_VoizatiaExit_Sequence))
			{
				with (obj_CarvalinePedestal)
				{
					sprite_index = spr_CarvalinePedestal_Empty;
				}
				layer_sequence_destroy(VoizatiaDebut_VoizatiaExit_Sequence);
				VoizatiaDebut_State = VOIZATIADEBUT.LAVENDER_MOVE;
			}
			
		#endregion
		
		break;//end Voizatia Exit Stage
	
	//Lavender Move Stage
	case VOIZATIADEBUT.LAVENDER_MOVE:
	
		#region Lavender Move
		
			if !(VoizatiaDebut_LavenderMove_SequenceCreated)
			{
				layer_sequence_destroy(VoizatiaDebut_LavenderIdle_Sequence);
				VoizatiaDebut_LavenderMove_Sequence = layer_sequence_create(layer, 0, 0, seq_VoizatiaDebut_LavenderMove);
				VoizatiaDebut_LavenderMove_SequenceCreated = true;
			}
			else if (layer_sequence_is_finished(VoizatiaDebut_LavenderMove_Sequence))
			{
				layer_sequence_destroy(VoizatiaDebut_LavenderMove_Sequence);
				VoizatiaDebut_LavenderIdle_Sequence = layer_sequence_create(layer, 0, 0, seq_VoizatiaDebut_LavenderIdleMoved);
				VoizatiaDebut_State = VOIZATIADEBUT.LAVENDER_EXIT_TALK;
			}
			
		#endregion
	
		break;//end Lavender Move Stage
	
	//Lavender Exit Talk Stage
	case VOIZATIADEBUT.LAVENDER_EXIT_TALK:
	
		#region Lavender Exit Talk
		
			var _text = 
			[
				"Rose-darling, listen to me carefully",
				"That Malvalia is stronger than she appears. Do not let your guard down for a second",
				"And above all else, do not fight Voizatia, you will not win",
				"Have faith in your old little mother"
			];
		
			if !(VoizatiaDebut_LavenderExitTalk_TalkStarted)
			{
				CutsceneText(_text, "Lavender", TEXTBOX_POS.TOP, ft_Lavender);
				VoizatiaDebut_LavenderExitTalk_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				VoizatiaDebut_State = VOIZATIADEBUT.LAVENDER_EXIT;
			}
		
		#endregion
	
		break;//end Lavender Exit Talk Stage
		
	//Lavender Exit Stage
	case VOIZATIADEBUT.LAVENDER_EXIT:
		
		#region Lavender Exit
		
			if !(VoizatiaDebut_LavenderExit_SequenceCreated)
			{
				layer_sequence_destroy(VoizatiaDebut_LavenderIdle_Sequence);
				VoizatiaDebut_LavenderExit_Sequence = layer_sequence_create(layer, 0, 0, seq_VoizatiaDebut_LavenderExit);
				VoizatiaDebut_LavenderExit_SequenceCreated = true;
			}
			else if (layer_sequence_is_finished(VoizatiaDebut_LavenderExit_Sequence))
			{
				layer_sequence_destroy(VoizatiaDebut_LavenderExit_Sequence);
				VoizatiaDebut_State = VOIZATIADEBUT.MALVALIA_CHALLENGE;
			}
		
		#endregion
		
		break;//end Lavender Exit Stage
		
	//Malvalia Challenge Stage
	case VOIZATIADEBUT.MALVALIA_CHALLENGE:
		
		#region Malvalia Challenge
			
			var _text = 
			[
				"Hahahhahaaaaaaa",
				"You seriously wanna do this? I'll let ya go if you get on your knees by yourself, how about it my little doll?",
				"...",
				"Tch, alright then, you asked for it",
				"COME FORTH! SHADOW REALM GATE!"
			];
		
			if !(VoizatiaDebut_MalvaliaChallenge_TalkStarted)
			{
				CutsceneText(_text, "Malvalia", TEXTBOX_POS.TOP, _MalvaliaFont);
				VoizatiaDebut_MalvaliaChallenge_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				VoizatiaDebut_State = VOIZATIADEBUT.MALVALIA_SUMMON_SHADOWS;
			}
		
		#endregion
		
		break;//end Malvalia Challenge Stage
	
	//Malvalia Summon Shadows Stage
	case VOIZATIADEBUT.MALVALIA_SUMMON_SHADOWS:
	
		#region Malvalia Summon Shadows
			
			if !(VoizatiaDebut_MalvaliaSummonShadows_GateCreated)
			{
				layer_set_visible("ShadowPortalCutscene", true);
				VoizatiaDebut_MalvaliaSummonShadows_Gate = layer_sprite_create("ShadowPortalCutscene", 1294, 480, spr_MalvaliaShadowRealmGate);
				layer_sprite_alpha(VoizatiaDebut_MalvaliaSummonShadows_Gate, 0);
				VoizatiaDebut_MalvaliaSummonShadows_GateCreated = true;
			}
			else if (VoizatiaDebut_MalvaliaSummonShadows_GateAlpha > 1)
			{
				VoizatiaDebut_State = VOIZATIADEBUT.MALVALIA_EXIT_TALK;
				layer_sprite_alpha(VoizatiaDebut_MalvaliaSummonShadows_Gate, 1);
			}
			else
			{
				layer_sprite_alpha(VoizatiaDebut_MalvaliaSummonShadows_Gate, VoizatiaDebut_MalvaliaSummonShadows_GateAlpha);
				VoizatiaDebut_MalvaliaSummonShadows_GateAlpha+=0.01;
			}
			
		#endregion
	
		break;//end Malvalia Summon Shadows Stage
	
	//Malvalia Exit Talk Stage
	case VOIZATIADEBUT.MALVALIA_EXIT_TALK:
		
		#region Malvalia Exit Talk
		
			var _text = 
			[
				"This shabby place is a gross place to fight, I don't want dirt in my hair, so we'll fight somewhere else",
				"In my world, the Shadow Realm",
				"Follow me, my little doll..."
			];
		
			if !(VoizatiaDebut_MalvaliaExitTalk_TalkStarted)
			{
				CutsceneText(_text, "Malvalia", TEXTBOX_POS.TOP, _MalvaliaFont);
				VoizatiaDebut_MalvaliaExitTalk_TalkStarted = true;
			} 
			else if !(instance_exists(obj_Text))
			{
				VoizatiaDebut_State = VOIZATIADEBUT.MALVALIA_EXIT;
			}
		
		#endregion
		
		break;//end Malvalia Exit Talk Stage
	
	//Malvalia Exit Stage
	case VOIZATIADEBUT.MALVALIA_EXIT:
	
		#region Malvalia Exit
		
			if !(VoizatiaDebut_MalvaliaExit_SequenceCreated) && (VoizatiaDebut_MalvaliaExit_FloatEnd)
			{
				layer_sequence_destroy(VoizatiaDebut_MalvaliaIdle_Sequence);
				VoizatiaDebut_MalvaliaExit_Sequence = layer_sequence_create(layer, 0, 0, seq_VoizatiaDebut_MalvaliaExit);
				VoizatiaDebut_MalvaliaExit_SequenceCreated = true;
			}
			else if (layer_sequence_is_finished(VoizatiaDebut_MalvaliaExit_Sequence))
			{
				layer_sequence_destroy(VoizatiaDebut_MalvaliaExit_Sequence);
				VoizatiaDebut_State = VOIZATIADEBUT.CUTSCENE_END;
			}
		
		#endregion
		
		break;//end Malvalia Exit Stage
	
	//Cutscene End Stage
	case VOIZATIADEBUT.CUTSCENE_END:
	
		#region Cutscene End 
			
			global.VoizatiaDebuted = true;
			
			obj_Player.hascontrol = true;
			
			obj_Camera.follow = obj_Player;
			
			SetRoomAudio_Music_Default(music_DarkShrineBasementTheme);
			
			PlayerFullHeal();
			
			SetSpawnpoint(256 + 960, 190 + 270, Room_DarkShrineBasementPedestal);
			
			SaveGame();
			
			instance_destroy();
			
		#endregion
	
		break;//end Cutscene End Stage
	
}//end Voizatia Debut State Machine


