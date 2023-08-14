/// @desc ScreenShake(magnitude, frames)
/// @param Magnitude
/// @param Frames
function ScreenShake(_magnitude, _frames){

	with (obj_Camera)
	{
		if (_magnitude > ScreenShake_Remain)
		{
			ScreenShake_Magnitude = _magnitude;
			ScreenShake_Remain = _magnitude;
			ScreenShake_Length = _frames;
		}
	}

}