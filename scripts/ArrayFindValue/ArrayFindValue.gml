/// @description ArrayFindValue (array, value)
/// @arg array
/// @arg value

function ArrayFindValue(_array, _value){

	var _valuefound;

	for (var i = 0; i < array_length(_array); i++)
	{
		if (_array[i] == _value)
		{
			_valuefound = true;
		}
	}
	
}