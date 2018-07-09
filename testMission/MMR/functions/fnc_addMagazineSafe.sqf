/*
	author: 10Dozen
	description: Safely adds magazine to player's inventory, if there is no space left - drops magazine to weapon holder under the player.
	input: ARRAY -
		0: STRING 	- magazine class to add,
		1: SCALAR 	- ammo of the magazine
	returns: nothing
	example:
		["dzn_10Rnd_556x45_Bulk", 10] call dzn_MMR_fnc_addMagazineSafe;
*/
#include "..\macro.hpp"

params ["_class", "_ammo"];

private _currentMags = magazinesAmmo player;

player addMagazine [_class, _ammo];

// Check is magazine list changed - if not - drop mag to ground
if ((magazinesAmmo player) isEqualTo _currentMags) exitWith {
	private _holder = objNull;
	private _hintText = "";

	if (vehicle player == player) then {
		// Drop to ground
		_holder = if (
			!isNull (player getVariable [SVAR(LastWeaponHolder), objNull])
			&& { player distance (player getVariable SVAR(LastWeaponHolder)) < 1.25 }	
		) then {
			player getVariable SVAR(LastWeaponHolder)
		} else {
			createVehicle ["WeaponHolderSimulated", player modelToWorld [0,0.5,0], [],0,"CAN_COLLIDE"]
		};
		
		player setVariable [SVAR(LastWeaponHolder), _holder];

		_hintText = format [
			/*"%1 dropped"*/
			localize "STR_MMR_Hint_MagazineDropped"
			, getText (configFile >> "CfgMagazines" >> _class >> "displayName")
		];
	} else {
		// In vehicle - drop to vehicle cargo
		_holder = vehicle player;
		_hintText = format [
			/*"%1 is placed to vehicle"*/
			localize "STR_MMR_Hint_MagazineToVehicle"
			, getText (configFile >> "CfgMagazines" >> _class >> "displayName")
		];
	};

	_holder addMagazineAmmoCargo [_class, 1, _ammo];
	hint _hintText;
};