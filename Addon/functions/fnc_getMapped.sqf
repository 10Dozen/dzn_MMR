/*
	author: 10Dozen
	description: Return array of mapped magazines of given classname. Or empty array if none.
	input: STRING - classname of the magazine to check
	returns: ARRAY of mapping or [] if not mapped
	example:
		_mappedList = "rhs_100Rnd_762x54mmR" call dzn_MMR_fnc_getMapped;
*/
#include "..\macro.hpp"

private _magToCheck = toLower _this;
private _mapped = GVAR(Map) select { _magToCheck in _x };

private _result = if (count _mapped > 0) then {
	_mapped select 0
} else {
	[]
};

_result