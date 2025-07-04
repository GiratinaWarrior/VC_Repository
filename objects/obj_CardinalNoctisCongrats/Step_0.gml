/// @description The Cardinal Inauguration Cutscene


//The Stages of the Cardinal Ceremony
switch(CardinalNoctisCongrats_State)
{
	//Lavender Greeting Stage: Lavender greets the player, and starts the cutscene
	case CARDINALNOCTISCONGRATS.LAVENDER_GREETING:
		
		#region Lavender Greeting
		
			var _text = 
			[
				"Ah, there you are Rose-darling, about time you showed.",
				"No time to waste, time to get started."
			]
			
			var _voice = 
			[
				sound_Lavender_Talk_Aleevah,
				sound_Lavender_Talk_RinuLefoom,
			]
		
			if (!CardinalNoctisCongrats_LavenderGreeting_TalkStarted)
			{
				CutsceneText(_text, "Lavender", TEXTBOX_POS.BOTTOM, ft_Lavender);
				obj_Text.TextBox_Voices = _voice;
				
				with (obj_NPC)
				{
					if (Name != "Lavender")
					{
						visible = false;
					}
				}
				
				CardinalNoctisCongrats_LavenderGreeting_TalkStarted = true;
			}
			else if (!instance_exists(obj_Text))
			{
				CardinalNoctisCongrats_State = CARDINALNOCTISCONGRATS.LAVENDER_ASCEND;
			}
			else
			{
				SkipTextOption();	
			}
			
			
		#endregion
		
		break;//end Lavender Greeting Stage
		
	//Lavender Ascend Stage: Lavender flies up to a higher podium
	case CARDINALNOCTISCONGRATS.LAVENDER_ASCEND:
		
		#region Lavender Ascend
		
			if (!CardinalNoctisCongrats_LavenderAscend_SequenceCreated)
			{
				CardinalNoctisCongrats_LavenderAscend_Sequence = layer_sequence_create(layer, 416, 578, seq_CardinalNoctisCongrats_LavenderAscend);
				CardinalNoctisCongrats_LavenderAscend_SequenceCreated = true;
				Lavender_NoctisCity_Podium.visible = false;
			}
		
			else if (layer_sequence_is_finished(CardinalNoctisCongrats_LavenderAscend_Sequence))
			{
				//CardinalNoctisCongrats_LavenderSprite = layer_sprite_create(layer, 352, 320, spr_Lavender_Idle);
				Lavender_NoctisCity_Podium.visible = true;
				Lavender_NoctisCity_Podium.x = 351;
				Lavender_NoctisCity_Podium.y = 320;
				layer_sequence_destroy(CardinalNoctisCongrats_LavenderAscend_Sequence);
				CardinalNoctisCongrats_State = CARDINALNOCTISCONGRATS.LAVENDER_CALL_ASSEMBLY
			}
			else
			{
				SkipCutsceneOption(CardinalNoctisCongrats_LavenderAscend_Sequence);
				with (obj_Camera)
				{
					follow = noone;
					xTo = 0 + RES_W/2; //RES_W/2 = 480
					yTo = 256 + RES_H/2; //RES_H/2 = 270
				}
			}
			
			
		#endregion
		
		break;//end Lavender Ascend Stage;
		
	//Lavender Call Assembly Stage
	case CARDINALNOCTISCONGRATS.LAVENDER_CALL_ASSEMBLY:
	
		#region Lavender Call Assembly

			SetRoomAudio_Music_Default(blanksound);

			var _text = 
			[
				"Attention, all Residents of Noctis City, come forth!",
				"It is time to begin!",
				"The Cardinal Inauguration Ceremony!"
			];
		
			var _voice =
			[
				sound_Lavender_Excited_AREEsheneLEEN, //attention
				sound_Lavender_Excited_Avinasoom, //it is time
				sound_Lavender_Excited_SAYAlora, //Cardinal Ceremony
			]
		
			if (!CardinalNoctisCongrats_LavenderCallAssembly_TalkStarted)
			{
				CutsceneText(_text, "Lavender", TEXTBOX_POS.BOTTOM, ft_Lavender);
				obj_Text.TextBox_Voices = _voice;
				CardinalNoctisCongrats_LavenderCallAssembly_TalkStarted = true;
			}
			else if (!instance_exists(obj_Text))
			{
				CardinalNoctisCongrats_State = CARDINALNOCTISCONGRATS.AUDIENCE_ASSEMBLE;
			}
			else
			{
				SkipTextOption();
			}
			
		#endregion
		
		break;//end Lavender Call Assembly Stage
		
	//Audience Assemble Stage
	case CARDINALNOCTISCONGRATS.AUDIENCE_ASSEMBLE:
		
		#region Audience Assemble
		
			if !(CardinalNoctisCongrats_AudienceAssemble_SequenceCreated)
			{
				CardinalNoctisCongrats_AudienceAssemble_Sequence = layer_sequence_create("Residents", 656, 530, seq_CardinalNoctisCongrats_AudienceAssemble);	
				obj_Player.image_xscale = 1;
				with (obj_Player)
				{
					x = round(x);
					y = round(y);
					image_xscale = round(image_xscale);
				}
				with (obj_Camera)
				{
					x = round(x);
					y = round(y);
				}
				CardinalNoctisCongrats_AudienceAssemble_SequenceCreated = true;
			} 
			else if (layer_sequence_is_finished(CardinalNoctisCongrats_AudienceAssemble_Sequence))
			{
				layer_sequence_destroy(CardinalNoctisCongrats_AudienceAssemble_Sequence);
				if (CardinalNoctisCongrats_AudienceIdleSequence == noone) 
					{
						CardinalNoctisCongrats_AudienceIdleSequence = layer_sequence_create("Residents", 656, 530, seq_CardinalNoctisCongrats_AudienceIdle);
					}
				CardinalNoctisCongrats_State = CARDINALNOCTISCONGRATS.LAVENDER_SPEECH;
			}
			else
			{
				SkipCutsceneOption(CardinalNoctisCongrats_AudienceAssemble_Sequence);
			}
		
		#endregion
		
		break;//end Audience Assemble Stage
		
	//Lavender Speech Stage
	case CARDINALNOCTISCONGRATS.LAVENDER_SPEECH:
	
		#region Lavender Speech
			
			SetRoomAudio_Music_Default(music_StoryCutsceneTheme);
			
			var _text = 
			[
				"My children of Nox, during my time as Cardinal, our life together has been wonderful and filled with peace.", 
				"We did not have worry about starving, suffering from illness, and falling in war, and we could spend our days doing pointless things.",
				"Knitting clothes, lazing around in the moonlight, and planting flowers.",
				"The only reason such fun could ever exist was because of the struggles of the previous Cardinals who fought for peace.",
				"I have been starting to think that it is time I took it even easier, and there is only one way to go about this.", 
				"Rose!", 
				"She who stands before you has successfully completed our onerous tests.", 
				"She is ready to succeed the will of me and my predecessors",
				"I ask you to welcome my beautiful daughter as your new guardian figure, but much more importantly, as our friend."
			];
		
			var _voice = 
			[
				sound_Lavender_Talk_Aleevah, //My children
				sound_Lavender_Talk_AvaboLinfinit, //We did not worry
				sound_Lavender_Talk_Gonnamenah, //Knitting clothes
				sound_Lavender_Talk_AnaSOOnaREEM, //The only reason
				sound_Lavender_Talk_AloBAwaKIneru, //I have been
				sound_Lavender_Excited_SAYAlora, //Rose
				sound_Lavender_Excited_RavinaLAsheen, //She who stands
				sound_Lavender_Excited_SenavoreyOOnium, //She is ready
				sound_Lavender_Excited_AREEsheneLEEN //I ask you
			]
		
			if (!CardinalNoctisCongrats_LavenderSpeech_TalkStarted)
			{
				CutsceneText(_text, "Lavender", TEXTBOX_POS.BOTTOM, ft_Lavender);
				obj_Text.TextBox_Voices = _voice;
				CardinalNoctisCongrats_LavenderSpeech_TalkStarted = true;
			}
			else if (!instance_exists(obj_Text))
			{
				CardinalNoctisCongrats_State = CARDINALNOCTISCONGRATS.AUDIENCE_CHEER;
			}
			else
			{
				SkipTextOption();
			}
			
		#endregion
		
		break;//end Lavender Speech Stage
		
	//Audience Cheer Stage
	case CARDINALNOCTISCONGRATS.AUDIENCE_CHEER:
		
		#region Audience Cheer
		
			var _text = 
			[
				"WOOOOOOHOOOOOOOO",
				"ROSE! ROSE! CARDINAL ROSE! ROSE! ROSE! CARDINAL ROSE!",
				"WOOOOOOHOOOOOOOO"
			];
			
			var _voice = 
			[
				sound_Applause,
				blanksound,
				blanksound
			]
		
			if (!CardinalNoctisCongrats_AudienceCheer_TalkStarted)
			{
				CutsceneText(_text, "Noxians", TEXTBOX_POS.BOTTOM, ft_NPC);
				obj_Text.TextBox_Voices = _voice;
				CardinalNoctisCongrats_AudienceCheer_TalkStarted = true;
			}
			else if (!instance_exists(obj_Text)) && !audio_is_playing(sound_Applause)
			{
				CardinalNoctisCongrats_State = CARDINALNOCTISCONGRATS.LAVENDER_END_SPEECH;
			}
			else
			{
				SkipTextOption();
			}
		
		#endregion
		
		break;//end Audience Cheer Stage
	
	//Lavender End Speech Stage
	case CARDINALNOCTISCONGRATS.LAVENDER_END_SPEECH:
		
		#region Lavender End Speech
		
			var _text = 
			[
				"Ahem, now that my thesaurus-petting speech is finished",
				"It is about time w-"
			];
			
			var _voice = 
			[
				sound_Lavender_Talk_Aleevah, //Ahem
				sound_Lavender_Talk_RinuLefoom //It is 
			]
		
			if (!CardinalNoctisCongrats_LavenderEndSpeech_TalkStarted)
			{
				CutsceneText(_text, "Lavender", TEXTBOX_POS.BOTTOM, ft_Lavender);
				obj_Text.TextBox_Voices = _voice;
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
					if (TextBox_CharCount >= string_length(TextBox_Text[TextBox_Page]) && !(TextBox_Page + 1 < array_length(TextBox_Text)))
					{
						instance_destroy(obj_Text);
						audio_stop_sound(_voice[1]);
						other.CardinalNoctisCongrats_State = CARDINALNOCTISCONGRATS.SHRINE_EXPLOSION;
					}
					else
					{
						SkipTextOption();
					}
				}
			}
		
		#endregion
		
		break;//end Lavender End Speech Stage
		
	//Shrine Explosion Stage
	case CARDINALNOCTISCONGRATS.SHRINE_EXPLOSION:
	
		#region Shrine Explosion
			
			//If the explosion hasn't started
			if !(CardinalNoctisCongrats_ShrineExplosion_Shaken)
			{
				//Earthquake time
				ScreenShake(64, 5 * 60);
				SetRoomAudio_Music();
				audio_play_sound(sound_ShrineExplosion, 1000, false);
				audio_stop_sound(sound_Applause);
				CardinalNoctisCongrats_ShrineExplosion_Shaken = true;
			}
			//If the earthquake is finished
			else if (obj_Camera.ScreenShake_Remain <= 0)
			{
				SetRoomAudio_Sounds();
				SetRoomAudio_Music_Default(music_HighStakesPanic);
				CardinalNoctisCongrats_State = CARDINALNOCTISCONGRATS.AUDIENCE_PANIC;
			}
			//If the earthquake is ongoing
			else
			{
				SetRoomAudio_Sounds(sound_Earthquake, 0.5, 0);
			}
			
		#endregion
		
		break;//end Shrine Explosion Stage
		
	//Audience Panic Stage
	case CARDINALNOCTISCONGRATS.AUDIENCE_PANIC:
		
		#region Audience Panic
		
			var _text = 
			[
				"WHAT WAS THAT!?",
				"IT CAME FROM THE SHRINE!",
				"THE SHRINE! THE SHRINE! THE SHRINE JUST EXPLODED!",
				"WHATS HAPPENING?!"
			];
		
			if (!CardinalNoctisCongrats_AudiencePanic_TalkStarted)
			{
				CutsceneText(_text, "Noxians", TEXTBOX_POS.BOTTOM, ft_NPC);
				CardinalNoctisCongrats_AudiencePanic_TalkStarted = true;
			}
			else if (!instance_exists(obj_Text))
			{
				CardinalNoctisCongrats_State = CARDINALNOCTISCONGRATS.LAVENDER_ORDERS;
			}
			else
			{
				SkipTextOption();
			}
		
		#endregion
		
		break;//end Audience Panic Stage
		
	//Lavender Orders Stage
	case CARDINALNOCTISCONGRATS.LAVENDER_ORDERS:
		
		#region Lavender Orders
		
			var _text = 
			[
				"PEOPLE OF NOX!",
				"Calm yourselves this instant, panic breeds chaos.",
				"There is no need to fear, a former Cardinal such as I will not permit any injuries for anyone.",
				"Nasi, Nadiolo, Fanna, Grela, Raijay!", 
				"You 5 will retreat underground to safety, I cannot have you all in danger.",
				"Jest! You will be in charge of leading them underground and protecting them from external threats."
			];
			
			
			var _voice = 
			[
				sound_Lavender_Serious_IzahRahna, //People of Nox
				sound_Lavender_Serious_Zinamanarasa, //Calm yourselves
				sound_Lavender_Serious_AnasivuUnazin, //There is no need
				sound_Lavender_Serious_AkahNahSavah, //Nasi, Nadiolo .....
				sound_Lavender_Serious_RahSavanai, //You 5 will retreat
				sound_Lavender_Serious_ZanaziAkoo, //Jest
			]
		
			if (!CardinalNoctisCongrats_LavenderOrders_TalkStarted)
			{
				CutsceneText(_text, "Lavender", TEXTBOX_POS.BOTTOM, ft_Lavender);
				obj_Text.TextBox_Voices = _voice;
				CardinalNoctisCongrats_LavenderOrders_TalkStarted = true;
			}
			else if (!instance_exists(obj_Text))
			{
				CardinalNoctisCongrats_State = CARDINALNOCTISCONGRATS.JEST_CONFIRM;
			}
			else
			{
				SkipTextOption();
			}
		
		#endregion
		
		break;//end Lavender Orders Stage
		
	//Jest Confirm Stage
	case CARDINALNOCTISCONGRATS.JEST_CONFIRM:
		
		#region Jest Confirm
		
			var _text = 
			[
				"Righty-o Mother!",
				"Don't you worry little and big ones!",
				"You're all safe with me and fun!"
			];
			
			var _voice = 
			[
				sound_Jest_Talk_Volapachi_Halaka,
				sound_Jest_Talk_haleKIzena,
				sound_Jest_Talk_jaravajikaraZHAna,
			]
		
			if (!CardinalNoctisCongrats_JestConfirm_TalkStarted)
			{
				CutsceneText(_text, "Jest", TEXTBOX_POS.BOTTOM, ft_Jest);
				obj_Text.TextBox_Voices = _voice;
				CardinalNoctisCongrats_JestConfirm_TalkStarted = true;
			}
			else if (!instance_exists(obj_Text))
			{
				CardinalNoctisCongrats_State = CARDINALNOCTISCONGRATS.AUDIENCE_RETREAT;
			}
			else SkipTextOption();
		
		#endregion
		
		break;//end Jest Confirm Stage
		
	//Audience Retreat Stage
	case CARDINALNOCTISCONGRATS.AUDIENCE_RETREAT:
	
		#region Audience Retreat Stage
			
			if !(CardinalNoctisCongrats_AudienceRetreat_SequenceCreated)
			{
				layer_sequence_destroy(CardinalNoctisCongrats_AudienceIdleSequence);
				CardinalNoctisCongrats_AudienceRetreat_Sequence = layer_sequence_create("Residents", 656, 530, seq_CardinalNoctisCongrats_AudienceRetreat);
				CardinalNoctisCongrats_AudienceRetreat_SequenceCreated = true;
			}
			else if (layer_sequence_is_finished(CardinalNoctisCongrats_AudienceRetreat_Sequence))
			{
				layer_sequence_destroy(CardinalNoctisCongrats_AudienceRetreat_Sequence);
				CardinalNoctisCongrats_State = CARDINALNOCTISCONGRATS.LAVENDER_DESCEND;
			}
			else SkipCutsceneOption(CardinalNoctisCongrats_AudienceRetreat_Sequence);
			
		#endregion
	
		break;//end Audience Retreat Stage
		
	//Lavender Descend Stage
	case CARDINALNOCTISCONGRATS.LAVENDER_DESCEND:
	
		#region Lavender Descend Stage
			
			if (!CardinalNoctisCongrats_LavenderDescend_SequenceCreated)
			{
				CardinalNoctisCongrats_LavenderDescend_Sequence = layer_sequence_create(layer, 416, 578, seq_CardinalNoctisCongrats_LavenderDescend);
				Lavender_NoctisCity_Podium.visible = false;
				CardinalNoctisCongrats_LavenderDescend_SequenceCreated = true;
			}
		
			else if (layer_sequence_is_finished(CardinalNoctisCongrats_LavenderDescend_Sequence))
			{
				//CardinalNoctisCongrats_LavenderSprite = layer_sprite_create(layer, 352, 320, spr_Lavender_Idle);
				Lavender_NoctisCity_Podium.visible = true;
				Lavender_NoctisCity_Podium.x = 352 + 256;
				Lavender_NoctisCity_Podium.y = 576;
				layer_sequence_destroy(CardinalNoctisCongrats_LavenderDescend_Sequence);
				CardinalNoctisCongrats_State = CARDINALNOCTISCONGRATS.LAVENDER_ORDERS_FAMILY;
			}
			else
			{
				SkipCutsceneOption(CardinalNoctisCongrats_LavenderDescend_Sequence);
				with (obj_Camera)
				{
					follow = noone;
					xTo = 0 + RES_W/2; //RES_W/2 = 480
					yTo = obj_Player.y// + RES_H/2; //RES_H/2 = 270
				}
			}
			
		#endregion
	
		break;//end Lavender Descend Stage
		
	//Lavender Orders Stage
	case CARDINALNOCTISCONGRATS.LAVENDER_ORDERS_FAMILY:
		
		#region Lavender Orders
		
			var _text = 
			[
				"Rose! You and I will head for Valnyx Shrine, the source",
				"That explosion came from a Vallen Spell, in other words...",
				"Valnyx Shrine is under attack!",
				"And the one time that it is unguarded, how skeptical...",
				"Onwards my little warrior, haste makes no waste!"
			];
			
			//TO DO
			var _voice = 
			[
				sound_Lavender_Serious_Inzuga, //Rose
				sound_Lavender_Serious_IzahRahna, //That explosion
				sound_Lavender_Serious_Zinamanarasa, //Valnyx Shrine
				sound_Lavender_Curious_SawakaAbina, //And the one time
				sound_Lavender_Serious_Venemin, //Onwards my little warrior
			]
		
			if (!CardinalNoctisCongrats_LavenderOrdersFamily_TalkStarted)
			{
				CutsceneText(_text, "Lavender", TEXTBOX_POS.BOTTOM, ft_Lavender);
				obj_Text.TextBox_Voices = _voice;
				CardinalNoctisCongrats_LavenderOrdersFamily_TalkStarted = true;
			}
			else if (!instance_exists(obj_Text))
			{
				CardinalNoctisCongrats_State = CARDINALNOCTISCONGRATS.LAVENDER_EXIT;
			}
			else
			{
				SkipTextOption();
			}
		
		#endregion
		
		break;//end Lavender Orders Stage
		
	//Lavender Exit Stage
	case CARDINALNOCTISCONGRATS.LAVENDER_EXIT:
	
		#region Lavender Exit Stage
			
			if !(CardinalNoctisCongrats_LavenderExit_SequenceCreated)
			{
				Lavender_NoctisCity_Podium.visible = false;
				CardinalNoctisCongrats_LavenderExit_Sequence = layer_sequence_create("Residents", Lavender_NoctisCity_Podium.x, Lavender_NoctisCity_Podium.y, seq_CardinalNoctisCongrats_LavenderExit);
				CardinalNoctisCongrats_LavenderExit_SequenceCreated = true;
			}
			else if (layer_sequence_is_finished(CardinalNoctisCongrats_LavenderExit_Sequence))
			{
				layer_sequence_destroy(CardinalNoctisCongrats_LavenderExit_Sequence);
				CardinalNoctisCongrats_State = CARDINALNOCTISCONGRATS.CUTSCENE_END;
			}
			else
			{
				SkipCutsceneOption(CardinalNoctisCongrats_LavenderExit_Sequence)
			}
			
		#endregion
	
		break;//end Lavender Exit Stage
	
	//Cutscene End Stage
	case CARDINALNOCTISCONGRATS.CUTSCENE_END:
		
		#region Cutscene Exit
		
			with (obj_Camera)
			{
				follow = obj_Player;
			}
			
			instance_destroy(obj_NPC);
			
			//SetRoomAudio_Music_Default(music_NoctisCityTheme);
			
			with (obj_Player)
			{
				hascontrol = true;
				global.Health = global.MaxHealth;
			}
			
			global.CardinalNoctisCongrats_Cutscene_Seen = true;
			
			global.ValnyxShrineUnderAttack_Active = true;
			
			SetSpawnpoint(obj_Player.x, obj_Player.y);
			
			SaveGame();
			
			instance_destroy();

		#endregion
		
		break;//end Cutscene End Stage
	
}//end Cardinal Ceremony Stage machine


