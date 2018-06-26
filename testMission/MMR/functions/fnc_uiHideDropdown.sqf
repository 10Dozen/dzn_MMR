/*
	author: 10Dozen
	description: Closes (deletes) item dropdown in inventory dialog.
	input: nothing
	returns: nothing
	example:
		call dzn_MMR_fnc_uiHideDropdown;
*/

for "_i" from 0 to (uiNamespace getVariable ["dzn_MMR_Inventory_DropdownItemsCount", 0]) do {
	ctrlDelete (uiNamespace getVariable format ["dzn_MMR_Inventory_DropdownItem%1", _i]);
};

(true)