/*
	author: 10Dozen
	description: Unpack magazine and adds bulk ammo to inventory
	input: ARRAY - 
		0: STRING - source magazine classname
		1: SCALAR - source magazine current ammo
		2: STRING - inventroy section type (Uniform/Vest/Backpack)
		3: STRING - bulk ammo magazine classname
	returns: nothing
	example:
		["30Rnd_556x45_Stanag", 22, "Vest", "dzn_10Rnd_556x45_Bulk"] call dzn_MMR_fnc_unpackMagazine;
*/
#include "..\macro.hpp"

params ["_sourceMagClass", "_sourceMagAmmo", "_container", "_bulkClass"];

private _magazines = [_sourceMagClass, _container] call GVAR(fnc_getMagazinesAmmoFromContainer);

// Remove all magazines of unpacking class
[_sourceMagClass, count _magazines, _container] call GVAR(fnc_removeMagazinesFromContainer);

// Add placeholders to add magazines to given container via addMagazine
_container call GVAR(fnc_fillWithPlaceholders);

private _modified = false;
private _bulkAmmo = getNumber (configFile >> "CfgMagazines" >> _bulkClass >> "count");

// By default target (bulk) magazine expected to be added fully loaded (e.g. 30Rnd Stanag mag will unpacked to 10 round bulk ammo magazine)
private _bulkAmmoFinal = _bulkAmmo;

// Go through all magazines of source class that player has and update source magazine (one that has exact same ammo as given):
//	- if target magazine contains ammo < bulk mag ammo -> remove mag
//	- if selected mag > bulk mag ammo -> add mag with (current mag ammo - bulk mag ammo)
{
	_x params ["_magClass", "_magAmmo"];

	if (_magAmmo == _sourceMagAmmo && !_modified) then {
		// Delete/modify source magazine

		if (_sourceMagAmmo > _bulkAmmo) then {
			// e.g. 23/30Rnd magazine will be added as (23 - 10) = 13Rnd magazine
			player addMagazine [_class, (_sourceMagAmmo - _bulkAmmo)];
		} else {
			// All ammo of source magazine consumed, mag not added
			// Bulk ammo magazine will be partially loaded
			_bulkAmmoFinal = _sourceMagAmmo;
		};

		_modified = true;
	} else {
		// Add other magazines
		player addMagazine [_magClass, _magAmmo];
	};
} forEach _magazines;

// Clear placeholders
call GVAR(fnc_removePlaceholders);

// Safe add bulk ammo
[_bulkClass, _bulkAmmoFinal] call GVAR(fnc_addMagazineSafe);

[_bulkClass] call GVAR(fnc_resortBulkMagazines);

(true)