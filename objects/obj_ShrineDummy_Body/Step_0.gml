/// @description Bounce back and forth

x = Wave(ShrineDummy_OriginBodyPart.x - (cos(ShrineDummy_HitFrom) * ShrineDummy_Rebound), ShrineDummy_OriginBodyPart.x + (cos(ShrineDummy_HitFrom) * ShrineDummy_Rebound), ShrineDummy_ReboundCalmRate);

y = Wave(ShrineDummy_OriginBodyPart.y - (sin(ShrineDummy_HitFrom) * ShrineDummy_Rebound), ShrineDummy_OriginBodyPart.y + (sin(ShrineDummy_HitFrom) * ShrineDummy_Rebound), ShrineDummy_ReboundCalmRate);

ShrineDummy_Rebound--;

ShrineDummy_Rebound = clamp(ShrineDummy_Rebound, 0, ShrineDummy_MaxRebound);