/*
	author: 10Dozen
	description: Remove magazines of given class from container
	input: ARRAY - 
		0: STRING - magazine classname
		1: SCALAR - number of magazines to remove
		2: STRING - inventroy section type (Uniform/Vest/Backpack)
	returns: nothing
	example:
		["30Rnd_556x45_Stanag", 1, "Vest"] call dzn_MMR_fnc_removeMagazinesFromContainer;
*/

params ["_class", "_num", "_container"];

private _exec = call compile format [
	"for '_i' from 1 to %1 do { player removeItemFrom%2 '%3'; };"
	, _num
	, _container
	, _class
];