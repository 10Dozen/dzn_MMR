/*
	author: 10Dozen
	description: Closes (deletes) item dropdown in inventory dialog.
	input: nothing
	returns: nothing
	example:
		call dzn_MMR_fnc_uiHideDropdown;
*/
#include "..\macro.hpp"

for "_i" from 0 to (uiNamespace getVariable [SVAR(Inventory_DropdownItemsCount), 0]) do {
	ctrlDelete (uiNamespace getVariable format ["%1%2", SVAR(Inventory_DropdownItem), _i]);
};

(true)