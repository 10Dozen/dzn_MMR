/*
	author: 10Dozen
	description: Compose and draw UI menu for Exchange To... magazine class selection
	input: ARRAY - 
		0: STRING - source magazine classname (magazine without bulk ammo options)
		1: SCALAR - source magazine current ammo
		2: STRING - inventroy section type (Uniform/Vest/Backpack)
		3: ARRAY - list of compatible mags
	returns: nothing
	example:
		[
			"RPG7_F"
			, 1
			, "Backpack"
			, ["RPG7_F", "rhs_rpg7_PG7VL_mag"]
		] call dzn_MMR_fnc_uiShowExchangeToMenu;
*/

params ["_sourceMagClass", "_sourceMagAmmo", "_container", "_mappedList"];

private _getConfigText = {
	params ["_class", "_par"];
	( getText (configFile >> "CfgMagazines" >> _class >> _par) ) 
};

// Prepare menu: labels, pictures and dropdown options
private _sourceMagClass = toLower _sourceMagClass;
private _sourceMagDisplayName = [[_sourceMagClass, "displayName"] call _getConfigText, "SPLIT_LINES"] call dzn_MMR_fnc_formatStrings;;
private _sourceMagPic = [_sourceMagClass, "picture"] call _getConfigText;

// 		Getting sorted Pack to options
private _sortedList = [];

// 		Compatible items
private _UGLmuzzle = (getArray(configFile >> "cfgWeapons" >> primaryWeapon player >> "muzzles")) - ["this","SAFE"];
private _compatibleMagazines = [];
{
	_compatibleMagazines append ((getArray (configFile >> "CfgWeapons" >> _x >> "magazines")) apply { toLower _x });
} forEach [
	primaryWeapon player
	, if (_UGLmuzzle isEqualTo []) then { "" } else { _UGLmuzzle select 0 }
	, secondaryWeapon player
	, handgunWeapon player
];

{
	if (_x in _mappedList && _x != _sourceMagClass) then {
		_sortedList pushBack [
			_x
			, [_x, "displayName"] call _getConfigText
			, [[_x, "author"] call _getConfigText, "ACRONYM"] call dzn_MMR_fnc_formatStrings
			, [_x, "picture"] call _getConfigText
			, true
		];

		_mappedList deleteAt (_mappedList find _x);
	};
} forEach _compatibleMagazines;

// 		Remove source magazine from mapped list
private _list = _mappedList - [_sourceMagClass];

// 		Sorting -> Grouping by DLC/author -> [ @Author, @DisplayName, @Classname ]
_list = _list apply { [ [_x, "author"] call _getConfigText, [_x, "displayName"] call _getConfigText, _x ] };

_list sort true;

// 		Composing
// 		Exiting with [@Class, @Name, @Author, @Picture, @isCompatibleWithPlayersPrimaryWeapon]
{
	_x params ["_author", "_displayName", "_classname"];

	// Do not add items without display name (means, that mod is not launched now)
	if (_displayName != "") then {		
		_sortedList pushBack [
			_classname
			, _displayName
			, [_author, "ACRONYM"] call dzn_MMR_fnc_formatStrings
			, [_classname, "picture"] call _getConfigText
			, false
		];
	};
} forEach _list;


// UI Drawing
// Dialog creation
createDialog "dzn_MMR_Group";
private _display = (findDisplay 192005);

// 		Static contend
(_display displayCtrl 5101) ctrlSetStructuredText parseText format ["<t font='PuristaMedium'>%1</t>", "Exchange To..."];
(_display displayCtrl 5106) ctrlSetStructuredText parseText format ["<t font='PuristaLight'>%1</t>", _sourceMagDisplayName];
(_display displayCtrl 5105) ctrlSetText _sourceMagPic;
(_display displayCtrl 5110) ctrlSetStructuredText parseText format ["<t font='PuristaLight'>%1</t>", "Exchange to"];

//		Dropdown

private _dropdown = (_display displayCtrl 5109);
{
	_x params ["_itemClass","_itemDisplayName","_itemAuthor","_itemPic", "_isCompatible"];

	_dropdown lbAdd _itemDisplayName;
	_dropdown lbSetData [_forEachIndex, _itemClass];
	_dropdown lbSetTooltip [
		_forEachIndex
		, if (_isCompatible) then { _itemDisplayName } else { format ["[Not compatible] %1", _itemDisplayName] }
	];

	_dropdown lbSetTextRight [_forEachIndex, _itemAuthor];
	_dropdown lbSetPictureRight [_forEachIndex, _itemPic];

	if (!_isCompatible) then { _dropdown lbSetColor [_forEachIndex, [1, 1, 1, 0.5]]; };
} forEach _sortedList;

_dropdown ctrlSetEventHandler ["LBSelChanged", "_this call dzn_MMR_fnc_uiOnLBSelChanged"];
_dropdown lbSetCurSel 0;

// 		Buttons CANCEL and PACK TO
(_display displayCtrl 5103) ctrlSetText "CANCEL";
(_display displayCtrl 5103) ctrlSetEventHandler ["ButtonClick", "closeDialog 2"];

(_display displayCtrl 5104) ctrlSetText "EXCHANGE TO";
(_display displayCtrl 5104) ctrlSetEventHandler [
	"ButtonClick"
	, format ["
		private _targetClass = ((findDisplay 192005) displayCtrl 5109) lbData (lbCurSel ((findDisplay 192005) displayCtrl 5109));

		DZN_EXCHGTO = [""%1"", %2, ""%3"", _targetClass];

		[""%1"", %2, ""%3"", _targetClass] call dzn_MMR_fnc_packNewMagazine;

		closeDialog 2;"
		, _sourceMagClass
		, _sourceMagAmmo
		, _container
	]
];
