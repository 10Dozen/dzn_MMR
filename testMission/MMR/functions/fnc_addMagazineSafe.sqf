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

params ["_class", "_ammo"];

private _currentMags = magazinesAmmo player;

player addMagazine [_class, _ammo];

// Check is magazine list changed - if not - drop mag to ground
if ((magazinesAmmo player) isEqualTo _currentMags) exitWith {
	
	private _holder = if (
		!isNull (player getVariable ["dzn_MMR_LastWeaponHolder", objNull])
		&& { player distance (player getVariable "dzn_MMR_LastWeaponHolder") < 0.75 }	
	) then {
		createVehicle ["WeaponHolderSimulated", player modelToWorld [0,0.5,0], [],0,"CAN_COLLIDE"]
	};

	_holder addMagazineAmmoCargo [_class, 1, _ammo];
	player setVariable ["dzn_MMR_LastWeaponHolder", _holder];

	hint format ["%1 dropped", getText (configFile >> "CfgMagazines" >> _class >> "displayName")];
};