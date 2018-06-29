/*
	author: 10Dozen
	description: Repack selected magazine with 1 bulk ammo magazine (total ammo)
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
private _bulkMagAmmo = getNumber (configFile >> "CfgMagazines" >> _bulkClass >> "count");
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

// Remove all magazines of repacking class (source)
[_sourceMagClass, count _magazines, _container] call dzn_MMR_fnc_removeMagazinesFromContainer;

// Add placeholders to add magazines to given container via addMagazine
_container call dzn_MMR_fnc_fillWithPlaceholders;

// Adding magazines back, source mag loaded with additional up to 10 ammo
private _modified = false;
private _sourceMagAmmoFull = getNumber (configFile >> "CfgMagazines" >> _sourceMagClass >> "count");
private _ammoNeeded = _sourceMagAmmoFull - _sourceMagAmmo;
private _ammoToLoad = _ammoNeeded min (_bulkMagAmmo min _bulkAmmoTotal);

/*
Examples:
["Input > Magazine 22/30, Ammo 100","Need to load: 8","Ammo used to load: 8","Magazine final: 30/30","Ammo left: 92"]
["Input > Magazine 22/30, Ammo 2","Need to load: 8","Ammo used to load: 2","Magazine final: 24/30","Ammo left: 0"]
["Input > Magazine 22/30, Ammo 21","Need to load: 8","Ammo used to load: 8","Magazine final: 30/30","Ammo left: 13"]
["Input > Magazine 2/30, Ammo 11","Need to load: 28","Ammo used to load: 10","Magazine final: 12/30","Ammo left: 1"]
["Input > Magazine 2/30, Ammo 15","Need to load: 28","Ammo used to load: 10","Magazine final: 12/30","Ammo left: 5"]
["Input > Magazine 2/30, Ammo 115","Need to load: 28","Ammo used to load: 10","Magazine final: 12/30","Ammo left: 105"]
*/

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
call dzn_MMR_fnc_removePlaceholders;

// Re-add not consumed bulk ammo + repack bulk ammo mags
while { _bulkAmmoTotal > 0 } do {
	private _ammo = _bulkAmmoTotal min _bulkMagAmmo;

	if (_ammo > 0) then {
		[_bulkClass, _ammo] call dzn_MMR_fnc_addMagazineSafe;
		_bulkAmmoTotal = _bulkAmmoTotal - _ammo;
	};
};

(true)