
switch(global.Player_CauseOfDeath)
{
	case PLAYER_DEATHCAUSE.SHRINE_SOLDIER:
		TipText = array_concat(TipText, TipText_ShrineSoldier);
		break;
		
	case PLAYER_DEATHCAUSE.SHRINE_GENERAL:
		TipText = array_concat(TipText, TipText_ShrineGeneral);
		break;
		
	case PLAYER_DEATHCAUSE.LAVENDER:
		TipText = array_concat(TipText, TipText_Lavender);
		break;
	
	case PLAYER_DEATHCAUSE.GUARDARK: case PLAYER_DEATHCAUSE.AXEYE: case PLAYER_DEATHCAUSE.CHAKROLEM:
		TipText = array_concat(TipText, TipText_DarkShrine);
		break;
			
	case PLAYER_DEATHCAUSE.MALVALIA:
		TipText = array_concat(TipText, TipText_Malvalia);
		break;
	
}
