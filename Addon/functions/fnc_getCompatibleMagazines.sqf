/*
	author: 10Dozen
	description: Return list of all mags compatible with players primary weapon (all muzzles), launcher (all muzzles) and handgun
	input: ARRAY - 
		0: ARRAY - (optional) list of blacklisted muzzles (default: ["SAFE", "this"])
	returns: nothing
	example:
		_allMags = call dzn_MMR_fnc_getCompatibleMagazines; // 
		_allPrimaryMags = ["this","SAFE"] call dzn_MMR_fnc_getCompatibleMagazines; // calculates total ammo, then remove all mags and re-adds repacked
*/

private _excludeMuzzles = if (isNil { _this }) then { ["this","SAFE"] } else { [] };

private _result = [];

private _UGLmuzzle = (getArray(configFile >> "cfgWeapons" >> primaryWeapon player >> "muzzles")) - _excludeMuzzles;
private _sources = [
	primaryWeapon player
	, if (_UGLmuzzle isEqualTo []) then { "" } else { _UGLmuzzle select 0 }
	, secondaryWeapon player
	, handgunWeapon player
];

{
	private _magazines = getArray (configFile >> "CfgWeapons" >> _x >> "magazines");

	{ _result pushBack (toLower _x); } forEach _magazines;
} forEach _sources;

(_result)