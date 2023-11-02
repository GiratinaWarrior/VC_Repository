/// @description Insert description here
// You can write your code in this editor

Wall_FallOn();
Wall_StopRun();

x += xSpeed;
y += ySpeed;

if (place_meeting(x, y + ySpeed, obj_Wall))
{
	xSpeed = 0;
	ySpeed = 0; 
}

image_alpha += VoizatiaBossPrologue_RougeSpear_AppearRate;

if (image_alpha > 1.5) && !(RougeSpear_Fired)
{
	Damage = 2;
	xSpeed = lengthdir_x(VoizatiaBossPrologue_RougeSpear_Speed, VoizatiaBossPrologue_RougeSpear_Direction); 
	ySpeed = lengthdir_y(VoizatiaBossPrologue_RougeSpear_Speed, VoizatiaBossPrologue_RougeSpear_Direction); 
	RougeSpear_Fired = true;
	image_alpha = 1;
}

if (RougeSpear_Fired)
{
	if (xSpeed == 0 && ySpeed == 0)
	{
		Damage = 0;
		FadeAndDestroy(0.1);
	}
}


