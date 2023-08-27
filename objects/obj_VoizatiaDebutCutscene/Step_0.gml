/// @description

var _VoizatiaFont = ft_Voizatia;

var _MalvaliaFont = ft_Malvalia

//Voizatia Debut Cutscene State machine
switch(VoizatiaDebut_State)
{
	//Rose Enter Stage
	case VOIZATIADEBUT.ROSE_ENTER:
		
		#region Rose Enter
		
			if !(VoizatiaDebut_RoseEnter_SequenceCreated)
			{
				VoizatiaDebut_RoseEnter_Sequence = layer_sequence_create(layer, 0, 0, seq_VoizatiaDebut_RoseEnter);
				VoizatiaDebut_LavenderIdle_Sequence = layer_sequence_create(layer, 0, 0, seq_VoizatiaDebut_LavenderIdle);
				VoizatiaDebut_VoizatiaIdle_Sequence = layer_sequence_create(layer, 0, 0, seq_VoizatiaDebut_VoizatiaIdle);
				VoizatiaDebut_RoseEnter_SequenceCreated = true;
			}
			else if (layer_sequence_is_finished(VoizatiaDebut_RoseEnter_Sequence))
			{
				obj_Player.x = 256 + 960;
				obj_Player.y = 190 + 270;
				layer_sequence_destroy(VoizatiaDebut_RoseEnter_Sequence);
				VoizatiaDebut_State = VOIZATIADEBUT.VOIZATIA_TALK_FIRST;
			}
		
		#endregion
		
		break;//end Rose Enter Stage
		
	//Voizatia Talk First Stage
	case VOIZATIADEBUT.VOIZATIA_TALK_FIRST:
	
		#region Voizatia Talk First
		
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
			else if (instance_exists(obj_Text))
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
				CutsceneText(_text, "Lavender", TEXTBOX_POS.TOP, ft_Silver);
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
			else if (instance_exists(obj_Text))
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
				VoizatiaDebut_VoizatiaIdle_Sequence = layer_sequence_create(layer, 0, 0, seq_VoizatiaDebut_VoizatiaFloat);
				VoizatiaDebut_VoizatiaSummonMalvalia_TalkStarted = true;
			}
			else if !(instance_exists(obj_Text))
			{
				VoizatiaDebut_State = VOIZATIADEBUT.MALVALIA_ENTER;
			}
			else
			{
				//layer_sequence_x(VoizatiaDebut_VoizatiaIdle_Sequence, layer_sequence_get_x(VoizatiaDebut_VoizatiaIdle_Sequence) + Wave(-25, 25, 3));
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
		
}//end Voizatia Debut State Machine


