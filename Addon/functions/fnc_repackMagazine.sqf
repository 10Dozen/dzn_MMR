/*
	author: 10Dozen
	description: Repack (add ammo) selected magazine with 1 bulk ammo magazine (total ammo)
	input: ARRAY - 
		0: STRING - source magazine classname
		1: SCALAR - source magazine current ammo
		2: STRING - inventroy section type (Uniform/Vest/Backpack)
		3: STRING - compatible bulk ammo magazine classname
	returns: nothing
	example:
		["30Rnd_556x45_Stanag", 23, "Vest", "dzn_10Rnd_556x45_Bulk"] call dzn_MMR_fnc_repackMagazine;
*/
#include "..\macro.hpp"
params ["_sourceMagClass", "_sourceMagAmmo", "_container", "_bulkClass"];

// Calculate total bulk ammo rounds
private _bulkMagAmmo = getNumber (configFile >> "CfgMagazines" >> _bulkClass >> "count");
private _bulkAmmoTotal = 0;
private _bulkMagazines = [_bulkClass] call GVAR(fnc_getMagazinesAmmoFromContainer);
{ 
	_x params ["", "_ammo"];
	_bulkAmmoTotal = _bulkAmmoTotal + _ammo;
} forEach _bulkMagazines;

// Remove all bulk ammo magazines
player removeMagazines _bulkClass;

// Get source magazines
private _magazines = [_sourceMagClass, _container] call GVAR(fnc_getMagazinesAmmoFromContainer);

// Remove all magazines of repacking class (source)
[_sourceMagClass, count _magazines, _container] call GVAR(fnc_removeMagazinesFromContainer);

// Add placeholders to add magazines to given container via addMagazine
_container call GVAR(fnc_fillWithPlaceholders);

// Adding magazines back, source mag loaded with additional up to 10 ammo
private _modified = false;
private _sourceMagAmmoFull = getNumber (configFile >> "CfgMagazines" >> _sourceMagClass >> "count");
private _ammoNeeded = _sourceMagAmmoFull - _sourceMagAmmo;
private _ammoToLoad = _ammoNeeded min (_bulkMagAmmo min _bulkAmmoTotal);

{
	_x params ["_magClass", "_magAmmo"];

	if (_magAmmo == _sourceMagAmmo && !_modified) then {
		// Modify source magazine
		player addMagazine [_sourceMagClass, _sourceMagAmmo + _ammoToLoad]; 

		_bulkAmmoTotal = _bulkAmmoTotal - _ammoToLoad;
		_modified = true;
	} else {
		// Add other magazines
		player addMagazine [_magClass, _magAmmo];
	};
} forEach _magazines;

// Clear placeholders
call GVAR(fnc_removePlaceholders);

// Re-add not consumed bulk ammo + repack bulk ammo mags
[_bulkClass, _bulkAmmoTotal, false] call GVAR(fnc_resortBulkMagazines);

(true)