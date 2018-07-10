/*
	author: 10Dozen
	description: Compose and show dropdown menu in inventory
	input: ARRAY - 
		0: CONTROL - inventory dialog item control, 
		1: STRING - item calss, 
		2: SCALAR - item index in the list control, 
		3: STRING - name of the container, 
		4: ARRAY - list of mapped items.
	returns: nothing
	example:
		[_item, _class, _itemIndex, _inventorySection, _mappedList] call dzn_MMR_fnc_uiShowInvDropdown;
*/
#include "..\macro.hpp"

params ["_item", "_class", "_itemIndex", "_inventorySection", "_mappedList"];

private _xPos = (ctrlPosition _item select 0) + (ctrlPosition _item select 2);
private _yPos = getMousePosition select 1;
private _dropdownItems = [];

// BULK AMMO
// 		PACK -> Check that bulk ammo can be exchanged to player's weapon 
// 		PACK TO -> Chcek tha bulk ammo has any exchange option
if (_class call GVAR(fnc_isBulkAmmo)) exitWith {

	// PACK -> Check that player's current weapons any compatible magazine is in @MappedList of the Bulk Ammo
	private _compatibleMagazines = (call GVAR(fnc_getCompatibleMagazines)) select { _x in _mappedList };
	private _compatibleMagazineToPack = [];
	if !( _compatibleMagazines isEqualTo [] ) then {
		_compatibleMagazineToPack = _compatibleMagazines select 0;
	};

		_dropdownItems pushBack [
			localize "STR_MMR_Dropdown_Pack" /* "Pack" */
			, { _args call GVAR(fnc_uiHandleDropdownClick); }
			, ["Pack_Bulk", _class, _itemIndex, _inventorySection, _compatibleMagazineToPack]
			, !(_compatibleMagazines isEqualTo [])
			, _xPos, _yPos
		];

	// PACK TO -> As bulk ammo has exchange option (true at this moment, because @MappedList already passed to current function)
	if (GVAR(AllowPackTo)) then {
		_dropdownItems pushBack [
			localize "STR_MMR_Dropdown_PackTo" /* "Pack to" */
			, { _args call GVAR(fnc_uiHandleDropdownClick); }
			, ["Pack_to_Bulk", _class, _itemIndex, _inventorySection, _mappedList]
			, true
			, _xPos, _yPos + 0.05
		];
	};

	// Add dropdown items
	{
		uiNamespace setVariable [
			format ["%1%2", SVAR(Inventory_DropdownItem), _forEachIndex]
			, _x call GVAR(fnc_uiAddDropdownItem)
		];
	} forEach _dropdownItems;
	uiNamespace setVariable [SVAR(Inventory_DropdownItemsCount), (count _dropdownItems) - 1];

	(true)
};


// MAGAZINE (not a bulk ammo, but mapped to bulk ammo)
// 		UNPACK -> Check magazine exchange options contain bulk ammo
// 		PACK -> check is there are BulkAmmo in players inventory to pack magazine
private _bulkAmmo = _mappedList call GVAR(fnc_getMappedBulkAmmo);
if (_bulkAmmo != "") exitWith {

	// PACK -> check is there are BulkAmmo in players inventory to pack magazine
	private _hasBulkAmmoAvailable = (_bulkAmmo in ((magazines player) apply { toLower _x }));
	// Check selected magazine is not full
	private _magAmmo = ([_inventorySection, _itemIndex] call GVAR(fnc_getMagazineByIndex)) select 1;
	private _magAmmoFull = getNumber (configFile >> "CfgMagazines" >> _class >> "count");

	_dropdownItems pushBack [
		localize "STR_MMR_Dropdown_Pack" /* "Pack" */
		, { _args call GVAR(fnc_uiHandleDropdownClick); }
		, ["Pack_Mag", _class, _itemIndex, _inventorySection, _bulkAmmo]
		, _hasBulkAmmoAvailable && (_magAmmo != _magAmmoFull)
		, _xPos, _yPos
	];

	// UNPACK -> Check magazine exchange options contain bulk ammo
	_dropdownItems pushBack [
		localize "STR_MMR_Dropdown_Unpack" /* "Unpack" */
		, { _args call GVAR(fnc_uiHandleDropdownClick); }
		, ["Unpack_Mag", _class, _itemIndex, _inventorySection, _bulkAmmo]
		, true
		, _xPos, _yPos + 0.05
	];

	// Add dropdown items
	{
		uiNamespace setVariable [
			format ["%1%2", SVAR(Inventory_DropdownItem), _forEachIndex]
			, _x call GVAR(fnc_uiAddDropdownItem)
		];
	} forEach _dropdownItems;
	uiNamespace setVariable [SVAR(Inventory_DropdownItemsCount), (count _dropdownItems) - 1];

	(true)
};


// SPECIAL MAGAZINE like 40mm grenade, HEAT RPG, etc. (not a bulk ammo AND not mapped to any bulk ammo, but has exchange options)
// 		EXCHANGE TO -> Check magazine exchange options exists
if !(GVAR(AllowExchangeTo)) exitWith {};

uiNamespace setVariable [
	"dzn_MMR_Inventory_DropdownItem0"
	, [
		localize "STR_MMR_Dropdown_ExchangeTo" /* "Exchange to" */
		, { _args call GVAR(fnc_uiHandleDropdownClick); }
		, ["Exchange_to", _class, _itemIndex, _inventorySection, _mappedList]
		, true
		, _xPos, _yPos
	] call GVAR(fnc_uiAddDropdownItem)
];
uiNamespace setVariable [SVAR(Inventory_DropdownItemsCount), 1];

(true)