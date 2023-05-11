/// @description The Code for King Chimarine
CurrentAttack = KC_PHASE.REST;

enum KC_PHASE
{
	REST,
	LIGHTNING,
	CONJURE,
	ACID
}

//Phase Changing
PhaseChange = 0;
PhaseChangeRise = 1;
PhaseLimit = 50;

ChosenAttack = 0;
NextAttack = 1;
SeenAllAttack = false;

//Movement Speed
OriginalSpeed = 3;
TravelSpeed = OriginalSpeed;
Acceleration = 3;

//Mutant Bolt
BoltTimer = 0;
BoltLimit = 500 * (power(10, 0));

//King Conjure
ConjureTimer = 0;
ConjureLimit = 500;
ConjureRate = 100;

//Acid Planet
AcidTimer = 0;
AcidLimit = 500;
AcidWarning = 100;

