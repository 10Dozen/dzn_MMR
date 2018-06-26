/*
	author: 10Dozen
	description: Compose and draw UI menu for Pack To... magazine class selection
	input: ARRAY - 
		0: STRING - source magazine classname (bulk ammo)
		1: SCALAR - source magazine current ammo
		2: STRING - inventroy section type (Uniform/Vest/Backpack)
		3: ARRAY - list of compatible mags
	returns: nothing
	example:
		[
			"dzn_10Rnd_556x45_Bulk"
			, 10
			, "Vest"
			, [
				"dzn_10Rnd_556x45_Bulk"
				,"rhs_mag_30Rnd_556x45_M855_Stanag"
				,"hlc_30rnd_556x45_b_HK33"
				,"CUP_30Rnd_556x45_G36"
			]
		] call dzn_MMR_fnc_showPackToMenu;
*/

params ["_sourceMagClass", "_sourceMagAmmo", "_container", "_mappedList"];

private _getConfigText = {
	params ["_class", "_par"];

	( getText (configFile >> "CfgMagazines" >> _class >> _par) ) 
};

private _sourceMagDisplayName = [_sourceMagClass, "displayName"] call _getConfigText;
private _sourceMagPic = [_sourceMagClass, "picture"] call _getConfigText;

private _targetMagListFull = [];
private _targetMagListVisible = [];

/*
	a.	Sort list in format: 
			1@Compatible mags in order of weapon's magazines[]
			2@Other mags grouped by DLC / author (see BIS_fnc_arsenal about dlc image recovery)
	b.	Compile full list in format:
			0: className
			1: dlc/author
	c.	Compile displayuable list;
			displayName |Author/DLC|
*/

// Sorting 
private _sortedList = [];

// Sorting -> Compatible mags
private _compatibleMagazines = getArray (configFile >> "CfgWeapons" >> primaryWeapon player >> "magazines");
{
	if (_x in _mappedList) then { 
		_sortedList pushBack _x; 
		_mappedList deleteAt (_mappedList find _x);
	};
} forEach _compatibleMagazines;

// Sorting -> Grouping by DLC/author
private _authors = _mappedList apply { [_x, "author"] call _getConfigText };
_authors sort true;

{
	private _author = _x;
	
	// Return: ["30Rnd 5.56 NATO Magazine", "30Rnd_556x45_Stanag"]
	private _magByAuthor = (_mappedList select { _author == [_x, "author"] call _getConfigText }) apply {
		[
			[_x, "displayName"] call _getConfigText
			,_x
		]	
	};

	_magByAuthor sort true;
	{
		_sortedList pushBack (_x select 1);
	} forEach _magByAuthor;
} forEach _authors;


// Composimg

{
	private _name = getText (configFile >> "CfgMagazines" >> _x >> "displayName" );

} forEach _mappedList;



// _actionData = @_mappedList