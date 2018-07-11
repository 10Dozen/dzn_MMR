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
		] call dzn_MMR_fnc_uiShowPackToMenu;
*/
#include "..\macro.hpp"

params ["_sourceMagClass", "_sourceMagAmmo", "_container", "_mappedList"];

// Prepare menu: labels, pictures and dropdown options
private _getConfigText = {
	params ["_class", "_par"];
	( getText (configFile >> "CfgMagazines" >> _class >> _par) ) 
};

private _sourceMagDisplayName = [[_sourceMagClass, "displayName"] call _getConfigText, "SPLIT_LINES"] call GVAR(fnc_formatStrings);
private _sourceMagPic = [_sourceMagClass, "picture"] call _getConfigText;

// 		Getting sorted Pack to options
private _sortedList = [];

// 		Sorting -> Compatible mags -> [@Class, @Name, @Author, @Picture, @IsCompatible]
private _compatibleMagazines = call GVAR(fnc_getCompatibleMagazines);
{
	if (_x in _mappedList) then {
		_sortedList pushBack [
			_x
			, [_x, "displayName"] call _getConfigText
			, [[_x, "author"] call _getConfigText, "ACRONYM"] call GVAR(fnc_formatStrings)
			, [_x, "picture"] call _getConfigText
			, true
		];

		_mappedList deleteAt (_mappedList find _x);
	};
} forEach _compatibleMagazines;

// 		Sorting -> Grouping by DLC/author -> [ @Author, @DisplayName, @Classname ]
private _list = _mappedList apply {	[ [_x, "author"] call _getConfigText, [_x, "displayName"] call _getConfigText, _x ] };

_list sort true;

// 		Composing
// 		Exiting with [@Class, @Name, @Author, @Picture, @isCompatibleWithPlayersPrimaryWeapon]
{
	_x params ["_author", "_displayName", "_classname"];

	// Do not add items without display name (means, that mod is not launched now)
	if (_displayName != "" && !(_classname in GVAR(Bulk)) ) then {		
		_sortedList pushBack [
			_classname
			, _displayName
			, [_author, "ACRONYM"] call GVAR(fnc_formatStrings)
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
(_display displayCtrl 5101) ctrlSetStructuredText parseText format ["<t font='PuristaMedium'>%1</t>", localize "STR_MMR_Overlay_PackTo"];  /* "Pack To..." */
(_display displayCtrl 5106) ctrlSetStructuredText parseText format ["<t font='PuristaLight'>%1</t>", _sourceMagDisplayName];
(_display displayCtrl 5105) ctrlSetText _sourceMagPic;
(_display displayCtrl 5110) ctrlSetStructuredText parseText format ["<t font='PuristaLight'>%1</t>", localize "STR_MMR_Overlay_PackToLabel"]; /* "Pack to" */

// 		Dropdown
private _dropdown = (_display displayCtrl 5109);
{
	_x params ["_itemClass","_itemDisplayName","_itemAuthor","_itemPic", "_isCompatible"];

	_dropdown lbAdd _itemDisplayName;
	_dropdown lbSetData [_forEachIndex, _itemClass];
	_dropdown lbSetTooltip [
		_forEachIndex
		, if (_isCompatible) then { 
			_itemDisplayName 
		} else { 
			/* [Not compatible] MagazineName */
			format ["[%2] %1", _itemDisplayName, localize "STR_MMR_Overlay_NotCompatibleLabel"] 
		}
	];

	_dropdown lbSetTextRight [_forEachIndex, _itemAuthor];
	_dropdown lbSetPictureRight [_forEachIndex, _itemPic];

	if (!_isCompatible) then { _dropdown lbSetColor [_forEachIndex, [1, 1, 1, 0.5]]; };
} forEach _sortedList;

_dropdown ctrlSetEventHandler ["LBSelChanged", format ["_this call %1", SVAR(fnc_uiOnLBSelChanged)]];
_dropdown lbSetCurSel 0;

// 		Buttons CANCEL and PACK TO
(_display displayCtrl 5103) ctrlSetText localize "STR_MMR_Overlay_CancelBtn"; /* "CANCEL" */
(_display displayCtrl 5103) ctrlSetEventHandler ["ButtonClick", "closeDialog 2"];

(_display displayCtrl 5104) ctrlSetText localize "STR_MMR_Overlay_PackToBtn";/* "PACK TO" */
(_display displayCtrl 5104) ctrlSetEventHandler [
	"ButtonClick"
	, format ["
		private _targetClass = ((findDisplay 192005) displayCtrl 5109) lbData (lbCurSel ((findDisplay 192005) displayCtrl 5109));

		[""%1"", %2, ""%3"", _targetClass] call %4;
		closeDialog 2;"
		, _sourceMagClass
		, _sourceMagAmmo
		, _container
		, SVAR(fnc_packNewMagazine)
	]
];