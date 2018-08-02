/*
	author: 10Dozen
	description: Checks is there Bulk Ammo in given mapping list
	input: ARRAY - mapping list
	returns: STRING (class of bulk ammo, "" if not found)
	example:
		_hasBulkOption = _mappedList call dzn_MMR_fnc_getMappedBulkAmmo;
*/
#include "..\macro.hpp"

private _bulkAmmo = _this select { _x call GVAR(fnc_isBulkAmmo) };

private _result = if (count _bulkAmmo > 0) then {
	_bulkAmmo select 0
} else {
	""
};

(_result)