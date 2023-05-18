/// @description Creation Code

#region Movement

	//The speeds and gravity
	xSpeed = 0;
	ySpeed = 0;

	//The gravity variables
	Gravity_Jump = 0.3;
	Gravity_Fall = 0.4;

	Gravity_Normal = Gravity_Jump;
	Gravity_Swim = 0;
	Gravity = Gravity_Normal;

	//Acceleration variables
	PlayerSpeed = 5;

	//How high the player jumps
	JumpPower = 9;

	//How good the player can swm
	SwimPower = 2;

	//Check if the player can jump
	PlayerJump = 0;
	MaxCoyoteJump = 10;

#endregion

#region Input Variables

	//Whether the player has control over their actions
	hascontrol = true;

	//the inputs for the attacks
	key_moon = false;
	key_sword = false;
	key_dash = false;
	key_heal = false;

#endregion

#region Attacks

	//Lunar Cannon Variables
	LunarCannonCooldownMax = 60;
	LunarCannonCooldown = 0;
	
	//Crescent Blitz Variables
	CrescentBlitz_Usable = false;
	CrescentBlitz_MaxDistance = 100;
	CrescentBlitz_Speed = 10;
	CrescentBlitz_DistTraveled = 0;
	CrescentBlitz_Direction = 0;
	
	
#endregion

#region State Machine

	//the players different states
	enum PLAYERSTATE
	{
		NEUTRAL,
		SWORD,
		CANNON,
		HEAL,
		STARJUMP,
		AIRDASH,
		WALL,
		HURT
	}

	//the players neutral states
	enum PLAYERSTATE_NEUTRAL
	{
		AIR,
		WATER,
		GROUND
	}

PlayerState = PLAYERSTATE.NEUTRAL;

PlayerNeutralState = PLAYERSTATE_NEUTRAL.AIR;

#endregion

#region Sprites

enum PLAYERSPRITE_NEUTRAL
{
	IDLE,
	RUN,
	JUMP,
	SWIM_H,
	SWIM_V,
	HURT,
	DEAD,
}

enum PLAYERSPRITE_SPECIAL
{
	STARJUMP,
	HEAL,
	DASH,
	WALL
}
	
	//The spriteset for Rose throughout the whole game
	RoseSpriteSet_Neutral = 
	[
		spr_PlayerIdle,
		spr_PlayerRun,
		spr_PlayerJump,
		spr_PlayerSwimHorizontal,
		spr_PlayerSwimVertical,
		spr_PlayerDamaged,
		spr_PlayerDying
	];
	
	
	//An array that holds the players different sprites
	PlayerSpriteSet = RoseSpriteSet_Neutral;	
	
#endregion

#region Hurt Variables

//Invincibility Variables
Invincible = false; //If the player is invincible or not
InvincCoolDown = 100; //How long the player is invincible

//A measure of how long the player is in the HURT state for
DamagedTimer = 0;

//The ID of the object that attacked the player
AttackerID = noone;

#endregion