/*
	author: 10Dozen
	description: Return magazine class and magazine ammo by index of the item in the container
	input: ARRAY - 
		0: STRING - inventroy section type (Uniform/Vest/Backpack),
		1: SCALAR - index of the magazine item in inventory container list
	returns: ARRAY in format [@MagazineClass, @MagazineAmmo, @NumbersOfStackedMagazine]
	example:
		_item = ["Vest", 3] call dzn_MMR_fnc_getMagazineByIndex;
*/

params ["_container", "_index"];

private _loadout = _container call dzn_MMR_fnc_getContainerLoadout;
	
(_loadout select _index)