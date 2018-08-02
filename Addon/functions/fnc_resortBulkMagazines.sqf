/*
	author: 10Dozen
	description: Deletes and re-add repacked bulk ammo magazines
	input: ARRAY - 
		0: STRING - bulk ammo magazine class
		1: SCALAR - (optional) total bulk ammo quantity
	returns: nothing
	example:
		["dzn_10Rnd_556x45_Bulk", 54, false] call dzn_MMR_fnc_resortBulkMagazines; // removes all mags and adds 5 full mags (10 rnds) + 1 partially loaded mag (4 rnd)
		["dzn_10Rnd_556x45_Bulk"] call dzn_MMR_fnc_resortBulkMagazines; // calculates total ammo, then remove all mags and re-adds repacked
*/
#include "..\macro.hpp"
params ["_bulkClass", ["_totalBulkAmmo", -1], ["_needRemove", true]];

private _bulkMagAmmo = getNumber (configFile >> "CfgMagazines" >> _bulkClass >> "count");
private _bulkMagazines = [_bulkClass] call GVAR(fnc_getMagazinesAmmoFromContainer);

// Calculate total ammo if not passed
if (_totalBulkAmmo < 0) then {
	_totalBulkAmmo = 0;
	{ 
		_x params ["", "_ammo"];
		_totalBulkAmmo = _totalBulkAmmo + _ammo;
	} forEach _bulkMagazines;
};

// Remove all bulk magazines if necessary (remove by default)
if (_needRemove) then {
	player removeMagazines _bulkClass;
};

// Re-add sorted bulk magazines
while { _totalBulkAmmo > 0 } do {
	private _ammo = _totalBulkAmmo min _bulkMagAmmo;

	if (_ammo > 0) then {
		[_bulkClass, _ammo] call GVAR(fnc_addMagazineSafe);
		_totalBulkAmmo = _totalBulkAmmo - _ammo;
	};
};