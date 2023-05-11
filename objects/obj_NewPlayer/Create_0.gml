/// @description Player Variables

x = global.SpawnX;
y = global.SpawnY;

#region Player State Machine

AttackState = ATTACK.FREE;
FreeState = FREE.LAND;

/*
	The different modes of attack the player is in
		FREE means the player is not attacking
		SWORD means the player is attacking with a sword
		MOON means the player is shooting out the moon
*/
enum ATTACK
{
	FREE,
	SWORD,
	MOON,
	HURT,
}

/*
	The different states for when the player is in FREE state
		LAND means the player is on the ground
		AIR means the player is jumping or falling
		WATER means the player is swimming
*/
enum FREE
{
	LAND,
	AIR,
	WATER,
	WALL
}

#endregion

#region Sprites

enum PLAYERSTATE_SPRITE
{
	IDLE,
	RUN,
	JUMP,
	SWIM,
	DAMAGED,
	DEAD
}

//The spriteset for Rose throughout the whole game
AdultRoseSpriteSet = 
[
	spr_PlayerIdle,
	spr_PlayerRun,
	spr_PlayerJump,
	spr_PlayerSwim,
	spr_PlayerDamaged,
	spr_PlayerDying
];

//An array that holds the players different sprites
PlayerSpriteSet = AdultRoseSpriteSet;

#endregion

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

#endregion

#region Attacked Variables

//Invincibility Variables
Invincible = false; //If the player is invincible or not
InvincCoolDown = 100; //How long the player is invincible

//A measure of how long the player is in the HURT state for
DamagedTimer = 0;

//The ID of the object that attacked the player
AttackerID = noone;

#endregion

#region Variables that have something to do with violence

//The time between shots allowed
firingdelay = 0;

/*
	does something maybe idk i forget
	oh right it sets the things hit by an attack to be
	equal to a list of things hit
*/
hitByAttack = ds_list_create();

#endregion

RoomIsCutscene = false;