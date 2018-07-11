/*
	author: 10Dozen
	description: Pack new magazine from selected bulk ammo
	input: ARRAY - 
		0: STRING - source magazine classname
		1: SCALAR - source magazine current ammo
		2: STRING - inventroy section type (Uniform/Vest/Backpack)
		3: STRING - comatible magazine classname to pack
	returns: nothing
	example:
		["dzn_10Rnd_556x45_Bulk", 10, "Vest", "30Rnd_556x45_Stanag"] call dzn_MMR_fnc_packNewMagazine;
*/

#include "..\macro.hpp"

params ["_sourceMagClass", "_sourceMagAmmo", "_container", "_targetMagClass"];

private _magazines = [_sourceMagClass, _container] call GVAR(fnc_getMagazinesAmmoFromContainer);

// Remove all magazines of unpacking/exchanging class
[_sourceMagClass, count _magazines, _container] call GVAR(fnc_removeMagazinesFromContainer);

// Add placeholders to add magazines to given container via addMagazine
_container call dzn_MMR_fnc_fillWithPlaceholders;

private _modified = false;
private _targetMagAmmoFull = getNumber (configFile >> "CfgMagazines" >> _targetMagClass >> "count");

// By default target magazine expected to be added partially loaded (e.g. 30Rnd Stanag mag will be added with 1...10 rounds)
private _targetMagAmmoFinal = _sourceMagAmmo;

// Go through all magazines of source class that player has and update source magazine (one that has exact same ammo as given):
//	- if target magazine contains ammo > selected bulk ammo mag -> remove bulk ammo mag
//	- if ammo < selected bulk ammo mag -> add bulk ammo mag with (current bulk ammo - magazine ammo)
{
	_x params ["_magClass", "_magAmmo"];

	if (_magAmmo == _sourceMagAmmo && !_modified) then {
		// Delete/modify source magazine (bulk ammo)

		if (_sourceMagAmmo > _targetMagAmmoFull) then {
			// e.g. 5Rnd magazine loaded by 10Rnd Bulk ammo -> 5/10Rnd Bulk Ammo added back
			player addMagazine [_sourceMagClass, (_sourceMagAmmo - _targetMagAmmoFull)]; 

			// Target magazine will be added fully loaded
			_targetMagAmmoFinal = _targetMagAmmoFull;
		} else {
			// All ammo of bulk magazine consumed, mag not added	
		};

		_modified = true;
	} else {
		// Add other magazines
		player addMagazine [_magClass, _magAmmo];
	};
} forEach _magazines;

// Clear placeholders
call dzn_MMR_fnc_removePlaceholders;

// Safe add target magazine
[_targetMagClass, _targetMagAmmoFinal] call GVAR(fnc_addMagazineSafe);

(true)