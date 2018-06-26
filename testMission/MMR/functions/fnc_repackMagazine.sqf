/*
	author: 10Dozen
	description: Repack selected magazine with available bulk ammo
	input: ARRAY - 
		0: STRING - source magazine classname
		1: SCALAR - source magazine current ammo
		2: STRING - inventroy section type (Uniform/Vest/Backpack)
		3: STRING - compatible bulk ammo magazine classname
	returns: nothing
	example:
		["30Rnd_556x45_Stanag", 23, "Vest", "dzn_10Rnd_556x45_Bulk"] call dzn_MMR_fnc_repackMagazine;
*/

params ["_sourceMagClass", "_sourceMagAmmo", "_container", "_bulkClass"];

// Calculate total bulk ammo rounds
private _bulkAmmoTotal = 0;
private _bulkMagazines = [_bulkClass] call dzn_MMR_fnc_getMagazinesAmmoFromContainer;
{ 
	_x params ["", "_ammo"];
	_bulkAmmoTotal = _bulkAmmoTotal + _ammo;
} forEach _bulkMagazines;

// Remove all bulk ammo magazines
player removeMagazines _bulkClass;

// Get source magazines
private _magazines = [_sourceMagClass, _container] call dzn_MMR_fnc_getMagazinesAmmoFromContainer;

// Remove all magazines of repacking class
for "_i" from 1 to (count _magazines) do {
	player removeItemFromVest _sourceMagClass;
};

// Add placeholders to add magazines to given container via addMagazine
_container call dzn_MMR_fnc_fillWithPlaceholders;

private _modified = false;
private _sourceMagAmmoFull = getNumber (configFile >> "CfgMagazines" >> _sourceMagClass >> "count");
private _ammoNeeded = _sourceMagAmmoFull - _sourceMagAmmo;

// Go through all magazines of source class that player has and update source magazine (one that has exact same ammo as given):
//	- if target magazine contains ammo > selected bulk ammo mag -> remove bulk ammo mag
//	- if ammo < selected bulk ammo mag -> add bulk ammo mag with (current bulk ammo - magazine ammo)
{
	_x params ["_magClass", "_magAmmo"];

	if (_magAmmo == _sourceMagAmmo && !_modified) then {
		// Modify source magazine

		if ( _ammoNeeded <= _bulkAmmoTotal ) then {
			// There are enough bulk ammo to fully repack magazine -> add fully loaded magazine
			player addMagazine [_sourceMagClass, _sourceMagAmmoFull];
			_bulkAmmoTotal = _bulkAmmoTotal - _ammoNeeded;		
		} else {
			// There are NOT enough bulk ammo to fully repack magazine -> add all available bulk ammo to magazine
			player addMagazine [_sourceMagClass, _sourceMagAmmo + _bulkAmmoTotal];
			_bulkAmmoTotal = 0;
		};

		_modified = true;
	} else {
		// Add other magazines
		player addMagazine [_magClass, _magAmmo];
	};
} forEach _magazines;

// Clear placeholders
call dzn_MMR_fnc_removePlaceholders;

// Re-add not consumed bulk ammo
if (_bulkAmmoTotal > 0) then {
	private _bulkMagSize = getNumber (configFile >> "CfgMagazines" >> _bulkClass >> "count");
	private _ammoToAdd = 0;

	while { _bulkAmmoTotal > 0 } do {
		_ammoToAdd = if (_bulkAmmoTotal > _bulkMagSize) then { _bulkMagSize	} else { (_bulkMagSize - _bulkAmmoTotal) };
		_bulkAmmoTotal = _bulkAmmoTotal - _ammoToAdd;

		[_bulkClass, _ammoToAdd] call dzn_MMR_fnc_addMagazineSafe;
	};
};

(true)