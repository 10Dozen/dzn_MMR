/*
	author: 10Dozen
	description: Add dropdown button to Inventory item dropdown
	input: ARRAY - 
		0: STRING - structured/simple text of the button title, 
		1: CODE - code to execute (in {}),
		2: ANY - arguments to code (refreneced as _args), 
		3: SCALAR - control position X,
		4: SCALAR - control position Y,
		5: SCALAR - control width (default: 0.15),
		6: SCALAR - control height (default: 0.05),
		7: BOOL - enabled/disabled state (default: true),
		8: ARRAY - tile BG style in @RGBA format (default: [0,0,0,0.7]),
		9: ARRAY - text style in format [@RGBA, @FontName, @FontSize] (default: [[1,1,1,1], "PuristaLight", 0.04])
	returns: CONTROL (Button item)
	example:
		_ctrlButton = [
			"Unpack"
			, { _args call dzn_MMR_fnc_handleInvDropdownClick; }
			, ["Unpack", _class, _itemIndex, _inventorySection, _mappedList]
			, _x, _y + 0.05
			, 0.15, 0.05
			, true
		] call dzn_MMR_fnc_uiAddDropdownItem;
*/

params [
	"_text"
	,"_expression"
	,"_args"
	,["_isEnabled", true]
	,"_x"
	,"_y"
	,["_w", 0.15]
	,["_h", 0.05]
	,[ "_tileStyle", [0,0,0,0.7] ]
	,[ "_textStyle", [[1,1,1,1], "PuristaLight", 0.04] ]
];

private _dialog = (findDisplay 602);
private _ctrlId = 1300100;
private _item = _dialog ctrlCreate ["RscButtonMenuOK", -1];

_item ctrlSetPosition [_x, _y, _w, _h];	
_item ctrlSetStructuredText parseText _text;
_item ctrlSetBackgroundColor _tileStyle;
_item ctrlSetTextColor (_textStyle select 0);
_item ctrlSetFont (_textStyle select 1);
_item ctrlSetFontHeight (_textStyle select 2);
_item ctrlSetEventHandler [
	"ButtonClick"
	, format[ 
		"with missionNamespace do {
			private _args = %2;
			%1
		}"
		, str(_expression) select [1, count str(_expression)-2]
		, _args
	]
];

_item ctrlEnable _isEnabled;	
_item ctrlCommit 0;
	
_item