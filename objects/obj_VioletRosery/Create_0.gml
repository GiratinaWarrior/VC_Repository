
with (obj_PlayBGM)
{
	NextBGM = music_NightfallKnightTheme;
}

//Phase Variables
enum VR_PHASE
{
	REST,
	ARROW,
	TURMOIL,
	FRENZY,
}

CurrentAttack = VR_PHASE.REST;

//ChosenAttack = 0;
NextAttack = VR_PHASE.ARROW;
SeenAllAttack = false;

PhaseChange = 0;
PhaseChangeRise = 1;
PhaseLimit = 50;

OriginalSpeed = 0;
TravelSpeed = OriginalSpeed;
Acceleration = 3;

//Arrow Variables
ArrowTimer = 30;
ArrowDir = 0;
NumOfArrows = 0;
MaxArrows = 20;
ArrowCharge = part_system_create_layer(layer, false, ps_ChargeFeralArrow);

//Turmoil Variables
TurmoilTimer = room_speed / 2;
NumOfTurmoil = 0;
MaxTurmoil = 20;
TurmoilX = room_width/2;
TurmoilY = room_height + 50;
TurmoilSea = layer_get_id("TurmoilSea");
if (layer_exists(TurmoilSea))
{
	TurmoilSeaX = layer_get_x(TurmoilSea);
	TurmoilSeaY = layer_get_y(TurmoilSea);
}

TurmoilDir = TURMOILDIR.DOWN;
enum TURMOILDIR
{
	UP,
	DOWN
}

//Frenzy Variables
FrenzyTimer = 0;
FrenzyLimit = 400;

FrenzyRushMax = 10; //How long it takes to start Frenzy
FrenzyRushCooldown = FrenzyRushMax;
FrenzyRushFreeze = -50; //How long Frenzy lasts

FrenzyTargetX = xstart;
FrenzyTargetY = ystart;

FrenzySpeed = 10;

