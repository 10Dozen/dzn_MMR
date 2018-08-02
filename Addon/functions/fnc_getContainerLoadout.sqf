/*
	author: 10Dozen
	description: Return loadout of selected container as it displayed in the inventory menu
	input: STRING - inventroy section type (Uniform/Vest/Backpack)
	returns: ARRAY of items in array format [@MagazineClass, @MagazineAmmo, @NumbersOfStackedMagazine]
	example:
		_loadout = "Vest" call dzn_MMR_fnc_getContainerLoadout; 
		// result: [
		//		["16Rnd_9x21_Mag",17,2]
		//		,["SmokeShell",-1,1]
		//		,["HandGrenade",-1,1]
		//		,["30Rnd_556x45_Stanag",30,2]
		//		,["30Rnd_556x45_Stanag",14,1]
		// ]
*/

private _container = toLower _this;

private _result = [];
private _allMags = magazinesAmmoFull player;

private _itemsInContainer = switch toUpper(_container) do {
	case "UNIFORM": 	{ uniformItems player };
	case "VEST":		{ vestItems player };
	case "BACKPACK":	{ backpackItems player };	
} call BIS_fnc_consolidateArray;

private _magsInContainer = ((_allMags select { toLower(_x select 4) == _container }) call BIS_fnc_consolidateArray) apply {
	_x params ["_item","_count"];

	[ _item select 0, _item select 1, _count ]
};

{
	_x params ["_class","_count"];
	private _mags = _magsInContainer select { _x select 0 == _class };
	
	if !(_mags isEqualTo []) then {
		{
			_result pushBack _x;
		} forEach _mags;
	} else {
		_result pushBack [_class, -1, _count];
	};
} forEach _itemsInContainer;

(_result)