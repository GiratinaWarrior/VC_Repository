/// @description Insert description here
// You can write your code in this editor

show_debug_message("Carvaline Cutscene Stage: {0}", CarvalineOrbIntroCutscene_Stage);

//The different stages of this cutscene
switch(CarvalineOrbIntroCutscene_Stage)
{
	//Start Speak Stage: Rose interacts with the Carvaline Pedestal, initiating the story cutscene
	case CARVALINEORBINTROCUTSCENE.START_TALK:
	
		#region Start Speak
	
			SetRoomAudio_Music(blanksound);
	
			//The text the Carvaline Pedestal
			var _text = 
			[
				"A strange light emerged from the structure"
			]
		
			//Create the text
			if !(CarvalineOrbIntroCutscene_Start_TextCreated)
			{
				CutsceneText(_text, "", TEXTBOX_POS.TOP);
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
	
			//Turn on the music
			SetRoomAudio_Music(music_StoryCutsceneTheme, 0.5, 0);
		
			//Create a the story sequence
			if (!CarvalineOrbIntroCutscene_Story_SequenceCreated)
			{
				CarvalineOrbIntroCutscene_Story_Sequence = layer_sequence_create(layer_get_id("CarvalineStory"), obj_Camera.x, obj_Camera.y, seq_CarvalineOrbIntro_Story_PartOne); 
				CarvalineOrbIntroCutscene_Story_SequenceCreated = true;
			}
			//Move on to the next stage once the sequence is finished
			else if (layer_sequence_is_finished(CarvalineOrbIntroCutscene_Story_Sequence))
			{
				//layer_sequence_play(CarvalineOrbIntroCutscene_Story_Sequence);
				//layer_sequence_destroy(CarvalineOrbIntroCutscene_Story_Sequence);
				CarvalineOrbIntroCutscene_Stage = CARVALINEORBINTROCUTSCENE.STORY_END;	
			}
			//If the sequence exists and is progressing
			else
			{
			
				//If text is being displayed, pause the sequence
				if (instance_exists(obj_Text))
				{
					layer_sequence_pause(CarvalineOrbIntroCutscene_Story_Sequence);
				}
			
				//If text is not present, play the sequence
				else
				{
					layer_sequence_play(CarvalineOrbIntroCutscene_Story_Sequence);				
				}
			
			}
			
		#endregion
		
		break;//end Story Stage
	
	//Story End Stage: The flash of light fades away
	case CARVALINEORBINTROCUTSCENE.STORY_END:
		
		#region Story End
			
			//Create the fade out sequence, delete the previous story sequence
			if (!CarvalineOrbIntroCutscene_StoryEnd_SequenceCreated)
			{
				//Set the players position to the right one
				with (obj_Player)
				{
					x = 1504;
					y = 448;
					image_xscale = 1;
				}
				CarvalineOrbIntroCutscene_LavenderTalk_LavenderSprite = layer_sprite_create(layer_get_id("Lavender"), 1088, 448, spr_Lavender_Idle);			
				CarvalineOrbIntroCutscene_StoryEnd_Sequence = layer_sequence_create(layer_get_id("WhiteFlash"), 0, 0, seq_CarvalineOrbIntro_EndStory);
				layer_sequence_destroy(CarvalineOrbIntroCutscene_Story_Sequence);
				SetRoomAudio_Music(blanksound);
				CarvalineOrbIntroCutscene_StoryEnd_SequenceCreated = true;
			}
			//Move on to the next sequence after the current one is finished
			else if (layer_sequence_is_finished(CarvalineOrbIntroCutscene_StoryEnd_Sequence))
			{
				CarvalineOrbIntroCutscene_Stage = CARVALINEORBINTROCUTSCENE.LAVENDER_TALK;
			}
		
		#endregion
		
		break;//end Story End Stage
		
	//Lavender Talk Stage: Lavender begins speaking behind the player
	case CARVALINEORBINTROCUTSCENE.LAVENDER_TALK:
		
		#region Lavender Talk
			
			SetRoomAudio_Music(music_LavenderEncounterTheme, 0.5);
			
			//The different stages of Lavender's Speech
			switch(CarvalineOrbIntroCutscene_LavenderSpeech_Stage)
			{
				//Intro Stage: Lavender announces her presence to Rose, revealing that she was reading the story
				case CARVALINEORBINTROCUTSCENE_LAVENDERSPEECH.INTRO:
					
					#region Intro
					
						var _text = 
						[
							"Hello again Rose-darling, I do make for a great story-teller, do I not?",
							"I have always dreamed of being a writer, and now that you have my title of Valnyx Shrine Cardinal, I can still reach it",
							"I am particularily fond of historical texts, because the way they portray events of the past fascinate me, whether by glorification of certian sections, or the likes",
							"I would take good care to make sure that such absurb stories like that never enter the literature battlefield, that story is an insult to the amazing history of Nox",
							"But the number one thing that brings the 'History of Valnyx Shrine' to the ground..."
						]
					
						if !(CarvalineOrbIntroCutscene_LavenderTalk_Intro_TalkStarted)
						{
							CutsceneText(_text, "Lavender", TEXTBOX_POS.TOP, ft_Silver);
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
							CarvalineOrbIntroCutscene_LavenderSpeech_Stage = CARVALINEORBINTROCUTSCENE_LAVENDERSPEECH.EXPLAIN_CARDINAL;
						}
					
					#endregion
				
					break;//end Approach Pedestal Stage
					
				//Explain Cardinal Stage: Lavender explains that the duty of Cardinal is to also guard the Carvaline Orb
				case CARVALINEORBINTROCUTSCENE_LAVENDERSPEECH.EXPLAIN_CARDINAL:
					
					#region Explain Cardinal
					
						var _text = 
						[
							"Is the very existence of THIS, the Carvaline Pedestal, specifically, the Carvaline Orbs wedged inside them.",
							"These things completely perplexes me. What are they? Where did they come from? Who created them? And for what purpose?",
							"The only thing I know is that they hold tremendous power, and that it is the duty of Cardinal to guard them.",
							"...",
							"Of course, I hate perfect happy endings, so I spend my time trying to uncover the rest of the story, hoping for something sad or even bittersweet to happen",
							"I "
						]
						
					#endregion
					
					break;//end Approach Pedesta
				
			}//end Lavender Speech stage machine
		
		#endregion 		
		
		break;//end Lavender Talk Stage

}//end Stage machine