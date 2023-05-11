/// @description Progress the transition

//If the transition is not off
if (mode != TRANS_MODE.OFF)
{
	
	MaxReach = 1.2;
	
	//if the intro is starting
	if (mode == TRANS_MODE.INTRO) {
		
		percent = max(0, percent - max((percent/10), 0.005));
		
	}//end intro start
	
	//if the intro has already started
	else {
		
		percent = min(MaxReach, percent + max(((MaxReach - percent)/10), 0.005));
		
	}//end intro already started
	
	//if the transition is finished somehow
	if (percent == MaxReach) || (percent == 0) 
	{
		//which transition mode is the transition in
		switch(mode) 
		{
			//if its in the intro
			case TRANS_MODE.INTRO:
			{
				mode = TRANS_MODE.OFF;
				break;
			}//end case intro
			
			//if its in the next
			case TRANS_MODE.NEXT:
			{
				mode = TRANS_MODE.INTRO;
				room_goto_next();
				break;
			}//end case next
			
			//if its in the goto
			case TRANS_MODE.GOTO:
			{
				mode = TRANS_MODE.INTRO;
				room_goto(target);
				break;
			}//end case goto
			
			//if its in the restart
			case TRANS_MODE.RESTART:
			{
				game_restart();
				break;
			}//end case restart
		
		}//end switch
	
	}//end finished transition somehow
	
	
}//end if MODE is not OFF
