
dzn_MMR_fnc_handleInvDoubleClick = {
	params["_event", "_inventorySection"];

	private _item = _event select 0;
	private _index = _event select 1;

	call dzn_MMR_fnc_hideDropdown;

	private _idc = ctrlIDC _item;
	private _class = lbData [_idc, _index];
	private _itemIndex = lbValue [_idc, _index];
	private _mappedList = _class call dzn_MMR_fnc_getMapped;

	if (_mappedList isEqualTo []) exitWith { 
		systemChat "Not a convertable magazine";
	};
	
	[_item, _class, _itemIndex, _inventorySection, _mappedList] call dzn_MMR_fnc_showInvDropdown;
};

dzn_MMR_fnc_handleInvSingleClick = {
	systemChat "Single Click";

	call dzn_MMR_fnc_hideDropdown;
};

dzn_MMR_fnc_hideDropdown = {
	ctrlDelete (uiNamespace getVariable "dzn_MMR_Inventory_DropdownItem1");
	ctrlDelete (uiNamespace getVariable "dzn_MMR_Inventory_DropdownItem2");
	ctrlDelete (uiNamespace getVariable "dzn_MMR_Inventory_DropdownItem3");
};

dzn_MMR_fnc_showInvDropdown = {
	params ["_item", "_class", "_itemIndex", "_inventorySection", "_mappedList"];

	private _x = (ctrlPosition _item select 0) + (ctrlPosition _item select 2);
	private _y = getMousePosition select 1;
	
	// Add buttons
	uiNamespace setVariable [
		"dzn_MMR_Inventory_DropdownItem1"
		, [
			"Repack"
			, { _args call dzn_MMR_fnc_handleInvDropdownClick; }, ["Repack", _class, _itemIndex, _inventorySection, _mappedList]
			, _x, _y, 0.15, 0.05
		] call dzn_MMR_fnc_addDropdownItem 
	];

	uiNamespace setVariable [
		"dzn_MMR_Inventory_DropdownItem2"
		, [
			"Unpack"
			, { _args call dzn_MMR_fnc_handleInvDropdownClick; }, ["Unpack", _class, _itemIndex, _inventorySection, _mappedList]
			, _x, _y + 0.05, 0.15, 0.05
			, true
		] call dzn_MMR_fnc_addDropdownItem 
	];
	uiNamespace setVariable [
		"dzn_MMR_Inventory_DropdownItem3"
		, [
			"Repack to"
			, { _args call dzn_MMR_fnc_handleInvDropdownClick; }, ["Repack to", _class, _itemIndex, _inventorySection, _mappedList]
			, _x, _y + 0.10, 0.15, 0.05
			, true
		] call dzn_MMR_fnc_addDropdownItem 
	];
};

dzn_MMR_fnc_addDropdownItem = {
	/*
		_text			- structured or simple text
		_expression		- code in { } (first and last symbol are { / } )
		_args 			- any
		_x,_y,_w,_h		- scalar
	*/
	params [
		"_text"
		,"_expression"
		,"_args"
		,"_x"
		,"_y"
		,"_w"
		,"_h"
		,["_isEnable", false]
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

	_item ctrlEnable _isEnable;	
	_item ctrlCommit 0;
	
	_item
};

dzn_MMR_fnc_handleInvDropdownClick = {
	params["_action","_class","_itemIndex","_inventorySection","_mappedList"];

	hint format ["%1 selected", _action];

	private _mag = [_inventorySection, _itemIndex] call dzn_MMR_fnc_getMagazineByIndex;

	[_mag select 0, _mag select 1] call fnc_unpackMagazineInVest;
	CX = [_this, _mag];

	// player action ["Gear", objNull];
};


/*
["Unpack","30Rnd_556x45_Stanag",4,"Vest",["dzn_10rnd_556x45_bulk" ... "rhsusf_100rnd_556x45_m855_soft_pouch"]],

["30Rnd_556x45_Stanag",15,1]]
*/


fnc_showInvDropdown = {
	params["_item","_selectedIndex"];

	
	
	private _idc = ctrlIDC _item;
	private _class = lbData [_idc, _selectedIndex];
	private _index = lbValue [_idc, _selectedIndex];

	private _mappedList = _class call dzn_MMR_fnc_getMapped;

	if (_mappedList isEqualTo []) exitWith { systemChat "Not a convertable magazine"; hint "Not a convertable magazine"; };

	private _x = (ctrlPosition _item select 0) + (ctrlPosition _item select 2);
	private _y = getMousePosition select 1;
	
	uiNamespace setVariable ["dzn_MMR_Inventory_DropdownItem1", [
		"Repack", { hint "Repack selected"; closeDialog 2; }, []
		, _x, _y, 0.15, 0.05
	] call dzn_MMR_fnc_addDropdownItem ];
	uiNamespace setVariable ["dzn_MMR_Inventory_DropdownItem2", [
		"Unpack", { hint "Unpack selected"; closeDialog 2; }, []
		, _x, _y + 0.05, 0.15, 0.05
	] call dzn_MMR_fnc_addDropdownItem ];
	uiNamespace setVariable ["dzn_MMR_Inventory_DropdownItem3", [
		"Repack to", { hint "Repack to selected"; closeDialog 2; }, []
		, _x, _y + 0.10, 0.15, 0.05
	] call dzn_MMR_fnc_addDropdownItem ];
	
	systemChat str(uiNamespace getVariable "dzn_MMR_Inventory_DropdownItem1");
    	

	_data = format ["Data<br />%1<br />________<br />",lbData [_idc, _selectedIndex]];
	_text = format ["Text<br />%1<br />________<br />",lbText [_idc, _selectedIndex]];
	_value = format ["Value<br />%1<br />________<br />",lbValue [_idc, _selectedIndex]];
	_pic = format ["Picture<br /><img  size='15' image='%1'/><br />________<br />",lbPicture [_idc, _selectedIndex]]; 
	hint parseText format["Selected Uniform Index: %1 (idc %6)<br />%2%3%4%5",_selectedIndex,_data,_text,_value,_pic,_idc];

	false
};



