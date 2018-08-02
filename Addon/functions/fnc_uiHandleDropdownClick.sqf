/*
	author: 10Dozen
	description: Handle dropdown button click
	input: ARRAY - 
		0: STRING - action type ("Pack_Bulk", "Pack_to_Bulk", "Unpack_Mag", "Pack_Mag", "Exchange_To"),
		1: STRING - classname of the magazine item,
		2: SCALAR - index of the magazine item in inventory container list,
		3: STRING - inventroy section type (Uniform/Vest/Backpack),
		4: ANY - action type argument (@MappedList or @BulkAmmo or @CompatibleMagazineClass)
	returns: nothing
	example:
		["Pack_to_Bulk", _class, _itemIndex, _inventorySection, _mappedList/_comatibleMagazineToPack/_bulkAmmo] call dzn_MMR_fnc_uiHandleDropdownClick;
*/

#include "..\macro.hpp"
params ["_action","_class","_itemIndex","_inventorySection","_actionData"];

([_inventorySection, _itemIndex] call GVAR(fnc_getMagazineByIndex)) params ["_magClass", "_magAmmo"];

switch (toUpper(_action)) do {
	case "PACK_BULK": {
		// _actionData = @ComatibleMagazineToPack
		[_magClass, _magAmmo, _inventorySection, _actionData] call GVAR(fnc_packNewMagazine);
	};
	case "PACK_TO_BULK": {
		// _actionData = @_mappedList
		[_magClass, _magAmmo, _inventorySection, _actionData] call GVAR(fnc_uiShowPackToMenu);
	};
	case "UNPACK_MAG": {
		// _actionData = @BulkAmmoClass
		[_magClass, _magAmmo, _inventorySection, _actionData] call GVAR(fnc_unpackMagazine);
	};
	case "PACK_MAG": {
		// _actionData = @BulkAmmoClass
		[_magClass, _magAmmo, _inventorySection, _actionData] call GVAR(fnc_repackMagazine);
	};
	case "EXCHANGE_TO": {
		// _actionData = @MappedList
		[_magClass, _magAmmo, _inventorySection, _actionData] call GVAR(fnc_uiShowExchangeToMenu);
	};
};

call GVAR(fnc_uiHideDropdown);

(true)