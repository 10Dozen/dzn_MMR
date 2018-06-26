/*
	author: 10Dozen
	description: Handles "Inventory dialog - Item - Double click ("LBDblClick")" UI event from UIEventHandler and draw dropdown with buttons if necessary
	input: STRING - classname of the magazine to check
	returns: ARRAY of mapping or [] if not mapped
	example:
		_mappedList = "rhs_100Rnd_762x54mmR" call dzn_MMR_fnc_getMapped;
*/

private _magToCheck = toLower _this;
private _mapped = dzn_MMR_Map select { _magToCheck in _x };

private _result = if (count _mapped > 0) then {
	_mapped select 0
} else {
	[]
};

_result