/*
	author: 10Dozen
	description: Return all magazines of given class with ammo from given container
	input: ARRAY - 
		0: STRING - magazine classname
		1: STRING - inventroy section type (Uniform/Vest/Backpack or "" to return all items of same class)
	returns: nothing
	example:
		_magsFromVest = ["30Rnd_556x45_Stanag", "Vest"] call dzn_MMR_fnc_getMagazinesAmmoFromContainer;
		_allMags = ["30Rnd_556x45_Stanag"] call dzn_MMR_fnc_getMagazinesAmmoFromContainer;
*/

params ["_class", ["_container", ""]];

private _result = [];
private _list = if (_container == "") then {
	// Return magazines from all containers
	(magazinesAmmoFull player) select { toLower(_x select 0) == toLower(_class)	}
} else {
	// Return magazines from specific container 
	(magazinesAmmoFull player) select { 
		toLower(_x select 4) == toLower(_container)
		&& toLower(_x select 0) == toLower(_class)
	}
};

_list = _list apply {
	_x params ["_item","_ammo"]; 
	[ _item, _ammo ] 
};
	
(_list)