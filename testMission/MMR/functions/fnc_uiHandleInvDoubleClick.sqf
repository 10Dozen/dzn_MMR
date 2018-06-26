/*
	author: 10Dozen
	description: Handles "Inventory dialog - Item - Double click ("LBDblClick")" UI event from UIEventHandler and draw dropdown with buttons if necessary
	input: ARRAY - 0: ARRAY - Event data, 1: STRING - Container name (Uniform/Vest/Backpack)
	returns: nothing
	example:
		[_this, "Uniform"] call dzn_MMR_fnc_uiHandleInvDoubleClick;
*/
params["_event", "_inventorySection"];

private _item = _event select 0;
private _index = _event select 1;

call dzn_MMR_fnc_uiHideDropdown;

private _idc = ctrlIDC _item;
private _class = lbData [_idc, _index];
private _itemIndex = lbValue [_idc, _index];

// Check is item is magazine
if (getText (configFile >> "CfgMagazines" >> _class >> "ammo") == "") exitWith {};

// Check magazine has exchange options
private _mappedList = _class call dzn_MMR_fnc_getMapped;
if (_mappedList isEqualTo []) exitWith {};

// Show dropdown
[_item, _class, _itemIndex, _inventorySection, _mappedList] spawn dzn_MMR_fnc_uiShowInvDropdown;

(true)