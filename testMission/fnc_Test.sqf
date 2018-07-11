fnc_test1 = {
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
		,[ "_tileStyle", [0,0,0,0.7] ]
		,[ "_textStyle", [[1,1,1,1], "PuristaLight", 0.04] ]
	];
	private _dialog = (findDisplay 602);
	private _ctrlId = 1300100;
	
	private _item = _dialog ctrlCreate ["RscButtonMenuOK", -1];			
	_item ctrlSetPosition [
		_x
		, _y
		, _w
		, _h
	];
	
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
	
	_item ctrlCommit 0;
	
	_item
};

// ["Button X", 0.5, 0.5, 1, 1] call fnc_test1;


fnc_singleClick = {
	systemChat "Single Click";
	hint "SINGLE CLICK";
	ctrlDelete (uiNamespace getVariable "dzn_MMR_Inventory_DropdownItem1");
	ctrlDelete (uiNamespace getVariable "dzn_MMR_Inventory_DropdownItem2");
};

fnc_test = { 
	private _item = (_this select 0);
	private _x = (ctrlPosition _item select 0) + (ctrlPosition _item select 2);
	// private _y = (ctrlPosition _item select 1);
	private _y = getMousePosition select 1;
	
	
	CCC = ctrlPosition (_this select 0);
	
	uiNamespace setVariable ["dzn_MMR_Inventory_DropdownItem1", [
		"Repack to", { hint "Repack selected"; closeDialog 2; }, []
		, _x
		, _y
		, 0.15
		, 0.05
	] call fnc_test1 ];
	uiNamespace setVariable ["dzn_MMR_Inventory_DropdownItem2", [
		"Unpack", { hint "Unpack selected"; closeDialog 2; }, []
		, _x
		, _y + 0.05
		, 0.15
		, 0.05
	] call fnc_test1 ];
	
	hint str(uiNamespace getVariable "dzn_MMR_Inventory_DropdownItem1");
	systemChat str(uiNamespace getVariable "dzn_MMR_Inventory_DropdownItem1");
	// ["Button X", getMousePosition select 0, getMousePosition select 1, 0.15, 0.05] call fnc_test1;
	
	
	/*
	[
		[0, "HEADER", "Dynamic Advanced Dialog",  [[1,0,1,1], "PuristaBold", 0.04],[1,0,1,1] ]
		, [1, "LABEL", "Select teleport position",[[1,0,1,1], "PuristaBold", 0.04],[1,0,1,1]]
		, [1, "DROPDOWN", ["Airfield", "Mike-26", "Kamino Firing range"], [tp1,tp2,tp3],[[1,0,0,1], "PuristaBold", 0.04],[1,0,1,1]]
		, [1, "LISTBOX", ["Airfield", "Mike-26", "Kamino Firing range"], [tp1,tp2,tp3],[[1,0,0,1], "PuristaBold", 0.04],[1,0,1,1]]
		, [2, "BUTTON", "End mission", {hint _args}, "ARgument", [[1,0,0,1], "PuristaBold", 0.04],[0,0,1,1]]
		, [2, "INPUT", [[1,0,0,1], "PuristaBold", 0.04],[0,0,1,1]]

	] call dzn_fnc_ShowAdvDialog;
	*/
	
    	
	_idc = ctrlIDC _item;
    	_selectedIndex = _this select 1;
	

    	_data = format ["Data<br />%1<br />________<br />",lbData [_idc, _selectedIndex]];

    	_text = format ["Text<br />%1<br />________<br />",lbText [_idc, _selectedIndex]];

    	_value = format ["Value<br />%1<br />________<br />",lbValue [_idc, _selectedIndex]];

    	_pic = format ["Picture<br /><img  size='15' image='%1'/><br />________<br />",lbPicture [_idc, _selectedIndex]]; 

    	hint parseText format["Selected Uniform Index: %1 (idc %6)<br />%2%3%4%5",_selectedIndex,_data,_text,_value,_pic,_idc];

    	false
};