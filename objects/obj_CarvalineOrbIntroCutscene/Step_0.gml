/// @description Insert description here
// You can write your code in this editor

//show_debug_message("Carvaline Cutscene Stage: {0}", CarvalineOrbIntroCutscene_Stage);

//The different stages of this cutscene
switch(CarvalineOrbIntroCutscene_Stage)
{
	//Start Speak Stage: Rose interacts with the Carvaline Pedestal, initiating the story cutscene
	case CARVALINEORBINTROCUTSCENE.START_TALK:
	
		#region Start Speak
	
			obj_Player.hascontrol = false;
	
			//The text the Carvaline Pedestal
			var _text = 
			[
				"A strange light emerged from the structure"
			];
			
			//Create the text
			if !(CarvalineOrbIntroCutscene_Start_TextCreated)
			{
				var NewText = CutsceneText(_text, "", TEXTBOX_POS.TOP);
				NewText.TextBox_TextHeightModifier = 1.3;
				with (obj_Text)
				{
					TextBox_TextHeight = string_height(_text) * 1.3;
				}
				CarvalineOrbIntroCutscene_Start_TextCreated = true;
			}
			//If the text has beeen read, move on
			else if (!instance_exists(obj_Text))
			{
				CarvalineOrbIntroCutscene_Stage = CARVALINEORBINTROCUTSCENE.START_STORY;
			}
			
		#endregion
			
		break;//end Start Speak Stage
		
	//Start Story Stage: A flash of light emerges, enveloping the screen
	case CARVALINEORBINTROCUTSCENE.START_STORY:
		
		#region Start Story
			
			with (obj_Player)
			{
				global.Key_Talk = 1;
				hascontrol = false;
			}
			
			//Turn of the music
			SetRoomAudio_Music(blanksound);
		
			//Create a the story opening sequence
			if (!CarvalineorbIntroCutscene_StartStory_SequenceCreated)
			{
				CarvalineorbIntroCutscene_StartStory_Sequence = layer_sequence_create(layer_get_id("WhiteFlash"), 0, 0, seq_CarvalineOrbIntro_StartStory); 
				CarvalineorbIntroCutscene_StartStory_SequenceCreated = true;
			}
			//Move on to the next stage once the sequence is finished
			else if (layer_sequence_is_finished(CarvalineorbIntroCutscene_StartStory_Sequence))
			{
				CarvalineOrbIntroCutscene_Stage = CARVALINEORBINTROCUTSCENE.STORY;	
			}
		
		#endregion
		
		break;//end Start Story Stage
	
	//Story Stage: The story of the Carvaline Orbs is played
	case CARVALINEORBINTROCUTSCENE.STORY:
	
		#region Story
			
			//Set the players position to the right one
			with (obj_Player)
			{
				x = 1504;
				y = 448;
				image_xscale = 1;
				hascontrol = false;
			}
			
			//Turn on the music
			SetRoomAudio_Music_Default(music_StoryCutsceneTheme);
		
			//Create a the story sequence
			if (!CarvalineOrbIntroCutscene_Story_SequenceCreated)
			{
				//Create the sequence for the story
				CarvalineOrbIntroCutscene_Story_Sequence = layer_sequence_create(layer_get_id("CarvalineStory"), obj_Camera.x, obj_Camera.y, seq_CarvalineOrbIntro_Story_Full); 
				
				CarvalineOrbIntroCutscene_Story_SequenceCreated = true;
			}
			//Move on to the next stage once the sequence is finished
			else if (layer_sequence_is_finished(CarvalineOrbIntroCutscene_Story_Sequence))
			{
				
				show_debug_message("Story Sequence Finished");
				
				//Create the story end sequence, keep it paused
				CarvalineOrbIntroCutscene_StoryEnd_Sequence = layer_sequence_create(layer_get_id("WhiteFlash"), 0, 0, seq_CarvalineOrbIntro_EndStory);
				layer_sequence_pause(CarvalineOrbIntroCutscene_StoryEnd_Sequence);
				layer_sequence_destroy(CarvalineOrbIntroCutscene_Story_Sequence);
				CarvalineOrbIntroCutscene_Stage = CARVALINEORBINTROCUTSCENE.STORY_END;	
			}
			
			
		#endregion
		
		break;//end Story Stage
	
	//Story End Stage: The flash of light fades away
	case CARVALINEORBINTROCUTSCENE.STORY_END:
		
		#region Story End
			
			//Create the fade out sequence, delete the previous story sequence
			if (!CarvalineOrbIntroCutscene_StoryEnd_SequenceCreated)
			{
				
				layer_sequence_destroy(CarvalineorbIntroCutscene_StartStory_Sequence);
				//Set the players position to the right one
				with (obj_Player)
				{
					x = 1504;
					y = 448;
					image_xscale = 1;
				}
				//Create the sprite
				CarvalineOrbIntroCutscene_LavenderTalk_LavenderSprite = layer_sprite_create(layer_get_id("Lavender"), 1088, 448, spr_Lavender_Idle);			
				//Create the story end cutscene
				SetRoomAudio_Music_Default(blanksound);
				layer_sequence_play(CarvalineOrbIntroCutscene_StoryEnd_Sequence);
				CarvalineOrbIntroCutscene_StoryEnd_SequenceCreated = true;
			}
			//Move on to the next sequence after the current one is finished
			else if (layer_sequence_is_finished(CarvalineOrbIntroCutscene_StoryEnd_Sequence))
			{
				
				
				layer_sequence_destroy(CarvalineOrbIntroCutscene_StoryEnd_Sequence);
				CarvalineOrbIntroCutscene_Stage = CARVALINEORBINTROCUTSCENE.LAVENDER_TALK;
			}
		
		#endregion
		
		break;//end Story End Stage
		
	//Lavender Talk Stage: Lavender begins speaking behind the player
	case CARVALINEORBINTROCUTSCENE.LAVENDER_TALK:
		
		#region Lavender Talk
			
			if (layer_sequence_exists(layer_get_id("WhiteFlash"), CarvalineOrbIntroCutscene_StoryEnd_Sequence))
			{
				layer_sequence_destroy(CarvalineOrbIntroCutscene_StoryEnd_Sequence);
			}
			
			SetRoomAudio_Music_Default(music_LavenderEncounterTheme);
			
			//The different stages of Lavender's Speech
			switch(CarvalineOrbIntroCutscene_LavenderSpeech_Stage)
			{
				//Intro Stage: Lavender announces her presence to Rose, revealing that she was reading the story
				case CARVALINEORBINTROCUTSCENE_LAVENDERSPEECH.INTRO:
					
					#region Intro
					
						var _text = 
						[
							"Ahahaha, Hello again Rose-darling, I do make for a great story-teller, do I not?",
							"I hav- Oh dear, where are my manners! I forgot to give you your dialogue skipping permissions back!",
							"There you go, now then, where was I?",
							"Ah yes.",
							"I have always dreamed of being a writer, and now that you are almost ready to have my title of Valnyx Shrine Cardinal, I can still reach it.",
							"I am particularily fond of historical texts, because the way they portray events of the past fascinate me, whether by glorification or erasing certain details.",
							"The story I just told and have just recently named 'Dawn of Nox', describes the events that led to the society of Nox as we know it, including the origins of vallen.",
							"Once I start my writing career as an editor, I would take good care to make sure that such absurb stories like that never be permitted into any form of library, that story is an insult to the amazing history of Nox.",
							"Aside from the fact that it is a complete abomination from a literary perspective, 'Dawn of Nox' is a fabrication.",
							"Quite a wild statement to make, but the original story has a gaping plothole that renders it susceptible to suspicious .",
							"And that plothole..."
						];
					
						if !(CarvalineOrbIntroCutscene_LavenderTalk_Intro_TalkStarted)
						{
							CarvalineOrbIntroCutscene_LavenderSpeech = CutsceneText(_text, "Lavender", TEXTBOX_POS.TOP, ft_Lavender);
							with (obj_Player)
							{
								image_xscale = -1;
							}
							CarvalineOrbIntroCutscene_LavenderTalk_Intro_TalkStarted = true;
						}
					
						else if (!instance_exists(obj_Text))
						{
							CarvalineOrbIntroCutscene_LavenderSpeech_Stage = CARVALINEORBINTROCUTSCENE_LAVENDERSPEECH.APPROACH_PEDESTAL;
						}
						
						else 
						{
							if (CarvalineOrbIntroCutscene_LavenderSpeech.TextBox_Page >= 0 && CarvalineOrbIntroCutscene_LavenderSpeech.TextBox_Page < 2)
							{
								CarvalineOrbIntroCutscene_LavenderSpeech.TextBox_TextSkippable = false;
								CarvalineOrbIntroCutscene_LavenderSpeech.TextBox_CharIncrease = 0.5;
							}
							else
							{
								CarvalineOrbIntroCutscene_LavenderSpeech.TextBox_TextSkippable = true;
								CarvalineOrbIntroCutscene_LavenderSpeech.TextBox_CharIncrease = 1;
							}
							
						}
						
					#endregion
						
					break;//end Intro Stage
					
				//Approach Pedestal Stage: Lavender walks towards the Carvaline Pedestal
				case CARVALINEORBINTROCUTSCENE_LAVENDERSPEECH.APPROACH_PEDESTAL:
				
					#region Approach Pedestal
					
						if !(CarvalineOrbIntroCutscene_LavenderTalk_ApproachPedestal_SequenceCreated)
						{
							CarvalineOrbIntroCutscene_LavenderTalk_ApproachPedestal_Sequence = layer_sequence_create(layer_get_id("Lavender"), layer_sprite_get_x(CarvalineOrbIntroCutscene_LavenderTalk_LavenderSprite), layer_sprite_get_y(CarvalineOrbIntroCutscene_LavenderTalk_LavenderSprite), seq_CarvalineOrbIntro_LavenderTalk_ApproachPedestal); 
							layer_sprite_alpha(CarvalineOrbIntroCutscene_LavenderTalk_LavenderSprite, 0);
							CarvalineOrbIntroCutscene_LavenderTalk_ApproachPedestal_SequenceCreated = true;
						} 
						else if (layer_sequence_is_finished(CarvalineOrbIntroCutscene_LavenderTalk_ApproachPedestal_Sequence))
						{
							layer_sprite_alpha(CarvalineOrbIntroCutscene_LavenderTalk_LavenderSprite, 1);
							layer_sprite_x(CarvalineOrbIntroCutscene_LavenderTalk_LavenderSprite, 1600);
							layer_sequence_destroy(CarvalineOrbIntroCutscene_LavenderTalk_ApproachPedestal_Sequence);
							with (obj_CarvalinePedestal)
							{
							//	sprite_index = spr_CarvalinePedestal_FlashOrbs;
							}
							
							CreateParticleSystem(ps_CarvalineOrbFlash, "Shine", 1696, 352);
							CarvalineOrbIntroCutscene_LavenderSpeech_Stage = CARVALINEORBINTROCUTSCENE_LAVENDERSPEECH.EXPLAIN_CARDINAL;
						}
					
					#endregion
				
					break;//end Approach Pedestal Stage
					
				//Explain Cardinal Stage: Lavender explains that the duty of Cardinal is to also guard the Carvaline Orb
				case CARVALINEORBINTROCUTSCENE_LAVENDERSPEECH.EXPLAIN_CARDINAL:
					
					#region Explain Cardinal
					
						var _text = 
						[
							"Is the very existence of THESE. The 'Carvaline Orbs' that are wedged into the 'Carvaline Pedestal'.",
							"Out of all of the previous Cardinals within the past millenia, not a single one in recorded history has a concrete idea of what these objects are",
							"They did not know what they were, where they came from, who made them, and nor for what purpose",
							"All that is certain is that it is the Cardinals duty to guard these things.",
							"The power of the orbs can also be felt throughout Valnyx Shrine, as if its attempting to impose its will onto us.",
							"A scary thought isn't it?",
							"That your thoughts may not be your own",
							"I believe there is nothing more horrifying in this world than that.",
							"Yes...nothing else..."
						];
						
						//Have Lavender start talking
						if !(CarvalineOrbIntroCutscene_LavenderTalk_ExplainCardinal_StartedTalk)
						{
							CutsceneText(_text, "Lavender", TEXTBOX_POS.TOP, ft_Lavender);
							CarvalineOrbIntroCutscene_LavenderTalk_ExplainCardinal_StartedTalk = true;
						}
						
						//If Lavender has finished talking
						else if (!instance_exists(obj_Text))
						{
							//the function to run after a certain amount of itme
							var _func = function()
							{
								
								//Have Lavender turn around
								layer_sprite_xscale(CarvalineOrbIntroCutscene_LavenderTalk_LavenderSprite, -1);
								
								time_source_destroy(CarvalineOrbIntroCutscene_TimeSource);
								CarvalineOrbIntroCutscene_TimeSource = noone;
								
								//The function to run after a specified amount of time
								var _newFunc = function()
								{
									CarvalineOrbIntroCutscene_LavenderSpeech_Stage = CARVALINEORBINTROCUTSCENE_LAVENDERSPEECH.EXPLAIN_CARDINAL_MORE;
									time_source_destroy(CarvalineOrbIntroCutscene_TimeSource);
									CarvalineOrbIntroCutscene_TimeSource = noone;
								}
								
								//After a specified amount, activate the above tunction
								if (CarvalineOrbIntroCutscene_TimeSource == noone) CarvalineOrbIntroCutscene_TimeSource = TimeSourceCreateAndStart(60, _newFunc);
							}
							
							//Activate a function after a certain amount of time
							if (CarvalineOrbIntroCutscene_TimeSource == noone) CarvalineOrbIntroCutscene_TimeSource = TimeSourceCreateAndStart(60, _func);
							
							
						}//end Lavender done talking
						
					#endregion
					
					break;//end Approach Pedestal Stage
					
				//Explain Cardinal More: Lavender continues to talk, this time facing Rose
				case CARVALINEORBINTROCUTSCENE_LAVENDERSPEECH.EXPLAIN_CARDINAL_MORE:
					
					#region Explain Cardinal More
					
						var _text =
	 					[
							"Since over 18 years ago, I have spent my time uncovering the true ending, I am no fan of happy endings afterall", 
							"I prefer anything between bittersweet to tragic",
							"History truly is fascinating is it not?",
							"The idea of discovering the past myself excited me, it made me feel like a child exploring their backyard."
						];
					
						if !(CarvalineOrbIntroCutscene_LavenderTalk_ExplainCardinalMore_StartedTalk)
						{
							CutsceneText(_text, "Lavender", TEXTBOX_POS.TOP, ft_Lavender);
							CarvalineOrbIntroCutscene_LavenderTalk_ExplainCardinalMore_StartedTalk = true;
						}
						else if !(instance_exists(obj_Text))
						{
							CarvalineOrbIntroCutscene_LavenderSpeech_Stage = CARVALINEORBINTROCUTSCENE_LAVENDERSPEECH.APPROACH_EXIT;
						}
						
					#endregion
					
					break;//end Explain Cardinal More Stage
					
				//Approach Exit Stage: Lavender makes her way to the exit to leave
				case CARVALINEORBINTROCUTSCENE_LAVENDERSPEECH.APPROACH_EXIT:
				
					#region Approach Exit
					
						if !(CarvalineOrbIntroCutscene_LavenderTalk_ApproachExit_SequenceCreated)
						{
							CarvalineOrbIntroCutscene_LavenderTalk_ApproachExit_Sequence = layer_sequence_create(layer_get_id("Lavender"), layer_sprite_get_x(CarvalineOrbIntroCutscene_LavenderTalk_LavenderSprite), layer_sprite_get_y(CarvalineOrbIntroCutscene_LavenderTalk_LavenderSprite), seq_CarvalineOrbIntro_LavenderTalk_ApproachExit); 
							layer_sprite_alpha(CarvalineOrbIntroCutscene_LavenderTalk_LavenderSprite, 0);
							CarvalineOrbIntroCutscene_LavenderTalk_ApproachExit_SequenceCreated = true;
						} 
						else if (layer_sequence_is_finished(CarvalineOrbIntroCutscene_LavenderTalk_ApproachExit_Sequence))
						{
							layer_sprite_alpha(CarvalineOrbIntroCutscene_LavenderTalk_LavenderSprite, 1);
							layer_sprite_x(CarvalineOrbIntroCutscene_LavenderTalk_LavenderSprite, 1056);
							layer_sequence_destroy(CarvalineOrbIntroCutscene_LavenderTalk_ApproachExit_Sequence);
							CarvalineOrbIntroCutscene_LavenderSpeech_Stage = CARVALINEORBINTROCUTSCENE_LAVENDERSPEECH.EXIT_TALK;
						}
					
					#endregion
					
					break;//end Approach Exit Stage
					
				//Exit Talk Stage: Lavender says her parting words before leaving for Noctis City
				case CARVALINEORBINTROCUTSCENE_LAVENDERSPEECH.EXIT_TALK:
				
					#region Exit Talk
					
						var _text = 
						[
							"Moving on from the lore stuff, it is time to undergo the last test to becoming Cardinal of Nox",
							"New Moon Garden",
							"The final test will be conducted there.",
							"Come when you are ready."
							/*
							"Moving on from the...'plot' important stuff, we must return to the surface at once.",
							"We can no way let you get away with becoming Cardinal without a nice ceremony can me now?",
							"The ceremony will be in Noctis City, to get there, go back to the main floor, and head left.",
							"We are going to have one heaven of a time, so take care not to be tardy!"
							*/
						]
					
						if !(CarvalineOrbIntroCutscene_LavenderTalk_ExitTalk_TalkStarted)
						{
							CutsceneText(_text, "Lavender", TEXTBOX_POS.TOP, ft_Lavender);
							CarvalineOrbIntroCutscene_LavenderTalk_ExitTalk_TalkStarted = true;
						}
						else if (!instance_exists(obj_Text))
						{
							CarvalineOrbIntroCutscene_Stage = CARVALINEORBINTROCUTSCENE.LAVENDER_EXIT;
						}
					
					#endregion
					
					break;//end Exit Talk Stage
				
			}//end Lavender Speech stage machine
		
		#endregion 		
		
		break;//end Lavender Talk Stage
	
	//Lavender Exit Stage: Lavender exits the Pedestal Room, and the game goes back to normal
	case CARVALINEORBINTROCUTSCENE.LAVENDER_EXIT:
		
		#region Lavender Exit
		
			//Have Lavender start leaving
			if !(CarvalineOrbIntroCutscene_LavenderExit_SequenceCreated)
			{
				CarvalineOrbIntroCutscene_LavenderExit_Sequence = layer_sequence_create(layer_get_id("Lavender"), layer_sprite_get_x(CarvalineOrbIntroCutscene_LavenderTalk_LavenderSprite), layer_sprite_get_y(CarvalineOrbIntroCutscene_LavenderTalk_LavenderSprite), seq_CarvalineOrbIntro_LavenderExit); 
				layer_sprite_destroy(CarvalineOrbIntroCutscene_LavenderTalk_LavenderSprite);
				CarvalineOrbIntroCutscene_LavenderExit_SequenceCreated = true;
			} 
			//Once Lavender has left
			else if (layer_sequence_is_finished(CarvalineOrbIntroCutscene_LavenderExit_Sequence))
			{
				//destroy the lavender leave sequence
				layer_sequence_destroy(CarvalineOrbIntroCutscene_LavenderExit_Sequence);
				//Reset the music
				SetRoomAudio_Music_Default(music_ShrineBasementTheme);
				//have the player start moving again
				with (obj_Player)
				{
					SetSpawnpoint(x, y);
					hascontrol = true;
				}
				//Set the global flag for seeing that story
				global.CarvalineOrb_Cutscene_Seen = true
				
				
				
				SaveGame();
				
				with (obj_CarvalinePedestal)
				{
					Text("The Carvaline Pedestal. It looks really old");
					Text("The Carvaline Orbs look fresh as new, you feel a divine power emanating from it");
				}
				
				instance_destroy();
			}
			
		#endregion
		
		break;//end Lavender Exit Stage

}//end Stage machine