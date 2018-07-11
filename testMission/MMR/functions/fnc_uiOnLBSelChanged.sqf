/*
	author: 10Dozen
	description: Handle LBSelChange event on selection of dropdown item in PackTo/ExchangeTo dialog
	input: ARRAY - 
		0: CONTROL - Control 
		1: SCALAR - Selected index of LB
	returns: nothing
	example:
		_event call dzn_MMR_fnc_uiOnLBSelChanged;
*/

params ["_control", "_selectedIndex"];

private _display = findDisplay 192005;
private _selectedData = _control lbData _selectedIndex;

// Update target picture
(_display displayCtrl 5107) ctrlSetText (getText (configFile >> "CfgMagazines" >> _selectedData >> "picture"));