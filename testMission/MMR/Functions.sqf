dzn_MMR_fnc_processMap = {
	/*		Convert all listed magazine classes to lower case	*/
	{
		dzn_MMR_Map set [_forEachIndex, _x apply { toLower(_x) }]
	} forEach dzn_MMR_Map; 
};

dzn_MMR_fnc_getMapped = {
	/*		Return list of mapped magazines if exists	*/
	private _magToCheck = toLower _this;
	private _mapped = dzn_MMR_Map select { _magToCheck in _x };
	
	private _result = if (count _mapped > 0) then {
		_mapped select 0
	} else {
		[]
	};

	_result
};


dzn_MMR_fnc_getContainerLoadout = {
	/*
		Return list of items from inventory container in format like displayed:
		[
			["16Rnd_9x21_Mag",17,2]
			,["SmokeShell",-1,1]
			,["HandGrenade",-1,1]
			,["30Rnd_556x45_Stanag",30,2]
			,["30Rnd_556x45_Stanag",14,1]
		]

	*/
	private _container = toLower _this;

	private _result = [];
	private _allMags = magazinesAmmoFull player;
	private _itemsInContainer = (vestItems player) call BIS_fnc_consolidateArray;
	private _magsInContainer = (((magazinesAmmoFull player) select { toLower(_x select 4) == _container }) call BIS_fnc_consolidateArray) apply {
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

	_result
};

dzn_MMR_fnc_getMagazineByIndex = {
	params ["_container", "_index"];

	private _loadout = _container call dzn_MMR_fnc_getContainerLoadout;
	
	(_loadout select _index)
};


/*
Case:		Unpack STANAG from 2x full stanags in Vest
Result:		1x full stanag + 1x partial stanag in Vest

Execution:
			1) Remove all stanag magazines from Vest
			2) Fullfill uniform with placeholders
			3) Add partially loaded magazine (20/30)
			4) Add full stanags (30/30)
			5) Add bulk ammo (10)
*/

fnc_unpackMagazineInVest = {
	params ["_class", "_ammo"];

	private _magazines = [_class, "Vest"] call fnc_getMagazinesAmmoFromContainer; 
	
	// Remove all magazines of unpacking class
	for "_i" from 1 to (count _magazines) do {
		player removeItemFromVest _class;
	};

	// Add placeholders to add magazines to Vest via addMagazine
	"UNIFORM" call fnc_fulfillByPlaceholder;

	private _modified = false;
	private _bulkAmmo = 10;
	{
		_x params ["_magClass", "_magAmmo"];

		if (_magAmmo == _ammo && !_modified) then {
			// Target magazine to modify or delete
			if (_ammo > 10) then {
				player addMagazine [_class, (_ammo - 10)];
			} else {
				_bulkAmmo = _ammo;
			};
			_modified = true;
		} else {
			// Add other magazines
			player addMagazine [_magClass, _magAmmo];
		};
	} forEach _magazines;

	// Clear placeholders
	call fnc_removePlacholders;

	// Add bulk ammo
	player addMagazine ["dzn_10Rnd_556x45_Bulk", _bulkAmmo];

	(true)
};

/*
		[
			["30Rnd_556x45_Stanag",30]
			,["30Rnd_556x45_Stanag",19]
			,["30Rnd_556x45_Stanag",30]
		]
	*/

fnc_getMagazinesAmmoFromContainer = {
	params ["_class", "_container"];

	private _result = [];
	private _list = (magazinesAmmoFull player) select { 
		toLower(_x select 4) == toLower(_container)
		&& toLower(_x select 0) == toLower(_class)
	};
	
	_list = _list apply {
		_x params ["_item","_ammo"]; 
		[ _item, _ammo ] 
	};
	
	(_list)
};

fnc_fulfillByPlaceholder = {
	private _containers = switch toLower(_this) do {
		case "uniform": 	{ ["Uniform"] };
		case "vest": 		{ ["Uniform", "Vest"] };
		case "backpack": 	{ ["Uniform", "Vest", "Backpack"] };
	};

	player setVariable ["dzn_MMR_PlaceholderCount", 0];

	{
		call compile format ["
			private _items = 0;

			while { (load%1 player < 0.99) || _items < 300 } do {
				_items = _items + 1;
				player setVariable [
					'dzn_MMR_PlaceholderCount'
					, (player getVariable 'dzn_MMR_PlaceholderCount') + 1
				];

				player addItemTo%1 'ItemWatch';
			};	
		", _x];
	} forEach _containers;

	(true)
};

fnc_removePlacholders = {
	for "_i" from 0 to (player getVariable "dzn_MMR_PlaceholderCount") do { 
		player removeItem "ItemWatch";
	};

	player setVariable ["dzn_MMR_PlaceholderCount", 0];
};

