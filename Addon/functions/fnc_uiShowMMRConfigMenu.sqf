
/*
	On first opern:		
	[ok] 	Update Bulk Ammo listbox and clear all other controls 
	On Bulk Ammo selection:
	[ok]	- Update title, desc and picture of bulk ammo
	[ok]		- Get dzn_MMR_searchFilter parameters by classname --> Update Magazines list with filtered data 
	[ok]		- Search bulk ammo mapping in dzn_MMR_Map and update Linked Magazine list
	On Magazine selection	
	[ok]	- Update data with Magazine's curSel - pic, title, class, desc, extra 
	On Linked Magazine selection
	[ok]	- Update data with Magazine's curSel - pic, title, class, desc, extra 
	On Filter search button:
	[ok]	- Parse search filter string (X|Y|Z to [X,Y,Z]) and search by Classname, Description, Display name
	[ok]	- Update Magazine list with filtered list
	[ok]	- Update CurSel of magazines 
	On "+" btn:
	[ok]	- CurSel of Magazines added to Linked List, change color of CurSel magazine to gray 
	On "-" btn:
	[ok]	- CurSel of Linked Magazines remove it from Linked List, change color of this mag in Magazines to white 
	On "Export Current":
	[ok]	- Copy to clipboard
	On "Save Current":
	[ok]	- Update CBA setting of mapping for current bulk 

*/
// Preparations
dzn_MMRC_BulkSelectedIndex = -1;
dzn_MMRC_MagsSelectedIndex = -1;
dzn_MMRC_LinkedSelectedIndex = - 1;
dzn_MMRC_MagsList = [];
dzn_MMRC_LinkedList = [];


// Functions

fnc_MMRC_gfc = {
	params ["_class", "_par","_type",["_config","CfgMagazines"]];
	private _result = switch toUpper(_type) do {
		case "T";
		case "TXT";
		case "TEXT": { (getText (configFile >> _config >> _class >> _par)) };
		case "A";
		case "ARR";
		case "ARRAY": { (getArray (configFile >> _config >> _class >> _par)) };
		case "N";
		case "NUM";
		case "NUMBER": { (getNumber (configFile >> _config >> _class >> _par)) };
	};
	_result
};

fnc_MMRC_filterMagazines = {
	params ["_searchString", "_byClass", "_byDesc", "_byName","_byTracer"];

	private _searchList = if (count (_searchString splitString "|") > 0) then {
		_searchString splitString " " joinString "" splitString "|";
	} else {
		[_searchString]
	};

	private _resultList = [];

	private _allMagClasses = configFile >> "CfgMagazines";
	for "_i" from 0 to ((count _allMagClasses) - 1) do {
		private _class = configName (_allMagClasses select _i);
		private _desc = [_class,"descriptionShort","t"] call fnc_MMRC_gfc;
		private _name = [_class,"displayName","t"] call fnc_MMRC_gfc;
		private _tracer = [_class,"tracersEvery","n"] call fnc_MMRC_gfc;

		// Filter vehicle mags (No picture), basic classes (scope != 2) and bulk ammo (dzn_MMR_searchFilter)
		// + filter Tracer magazines according to parameters
		if (
			[_class,"picture","t"] call fnc_MMRC_gfc != "" 
			&& [_class,"dzn_MMR_searchFilter","t"] call fnc_MMRC_gfc == "" 
			&& [_class,"scope","n"] call fnc_MMRC_gfc == 2
			&& (
				( !_byTracer && _tracer != 1 )
				||
				( _byTracer && _tracer == 1 )
			)
		) then {
			private _found = false;

			{
				// Filter by string and source
				if ( 
					(_byClass && [_x, _class, false] call BIS_fnc_inString)
					|| (_byDesc && [_x, _desc, false] call BIS_fnc_inString)
					|| (_byName && [_x, _name, false] call BIS_fnc_inString)
				) then {
					_found = true;
				};
			} forEach _searchList;

			if (_found) then {
				_resultList pushBack _class;
			};
		};
	};

	_resultList
};

fnc_MMRC_uiOnBulkChanged = {
	hint "";
	private _display = (findDisplay 192006);
	dzn_MMRC_BulkSelectedIndex = _this select 1;

	private _bulkClass = dzn_MMR_Bulk select dzn_MMRC_BulkSelectedIndex;
	(_display displayCtrl 6111) ctrlSetStructuredText parseText (_bulkClass);
	(_display displayCtrl 6113) ctrlSetText ([_bulkClass,"picture","t"] call fnc_MMRC_gfc);
	(_display displayCtrl 6114) ctrlSetStructuredText parseText format [
		"<t size='0.75'>%1</t>"
		, [_bulkClass,"descriptionShort","t"] call fnc_MMRC_gfc
	];

	// Set filter options (pre-defined search string and check/uncheck tracers)
	private _searchString = ([_bulkClass,"dzn_MMR_searchFilter","t"] call fnc_MMRC_gfc);
	(_display displayCtrl 6121) ctrlSetText _searchString;
	(_display displayCtrl 6129) cbSetChecked (
		([_bulkClass,"tracersEvery","n"] call fnc_MMRC_gfc) == 1
	);

	// Get Linked magazines list
	private _mapped = (_bulkClass call dzn_MMR_fnc_getMapped) - [toLower(_bulkClass)];
	[_mapped, "LINKED"] call fnc_MMRC_uiUpdateMagsListbox;

	["SAVED","DEFAULT"] call fnc_MMRC_uiUpdateSaveState;
};

fnc_MMRC_uiOnSearchBtnClick = {
	private _display = (findDisplay 192006);

	private _searchValues = (ctrlText (_display displayCtrl 6121)); 
	private _seachByClass = cbChecked (_display displayCtrl 6123);
	private _seachByDesc = cbChecked (_display displayCtrl 6125);
	private _seachByName = cbChecked (_display displayCtrl 6127);
	private _seachByTracer = cbChecked (_display displayCtrl 6129);

	private _list = [
		_searchValues
		, _seachByClass
		, _seachByDesc
		, _seachByName
		,_seachByTracer
	] call fnc_MMRC_filterMagazines;

	[_list, "MAGAZINES"] call fnc_MMRC_uiUpdateMagsListbox;
};

fnc_MMRC_uiUpdateMagsListbox = {
	params ["_list", "_listName"];

	private _ctrlList = 0;
	private _needToMark = false;

	if (toUpper(_listName) == "MAGAZINES") then {
		dzn_MMRC_MagsList = _list apply { toLower(_x) };
		_ctrlList = ((findDisplay 192006) displayCtrl 6131);
		_needToMark = true;
	} else {
		dzn_MMRC_LinkedList = _list  apply { toLower(_x) };
		_ctrlList = ((findDisplay 192006) displayCtrl 6141);
	};

	lbClear _ctrlList;

	if !(_list isEqualTo []) then {
		{
			_ctrlList lbAdd ([_x,"displayName","t"] call fnc_MMRC_gfc);
			_ctrlList lbSetPicture [_forEachIndex, [_x,"picture","t"] call fnc_MMRC_gfc];

			if (_needToMark && toLower(_x) in dzn_MMRC_LinkedList) then {
				_ctrlList lbSetColor [_forEachIndex, [0.5,0.5,0.5,1]];
			};
		} forEach _list;

		_ctrlList lbSetCurSel 0;
	};
};

fnc_MMRC_uiOnMagSelected = {
	params ["_index", "_listName"];

	private _display = (findDisplay 192006);
	private _ctrlPic = 0;
	private _ctrlTitle = 0;
	private _ctrlDesc = 0;
	private _ctrlExtra = 0;
	private _class = "";

	if (toUpper(_listName) == "MAGAZINES") then {
		dzn_MMRC_MagsSelectedIndex = _index;

		_class = dzn_MMRC_MagsList select _index;
		_ctrlPic = (_display displayCtrl 6132);
		_ctrlTitle = (_display displayCtrl 6133);
		_ctrlDesc = (_display displayCtrl 6134);
		_ctrlExtra = (_display displayCtrl 6135);
	} else {
		dzn_MMRC_LinkedSelectedIndex = _index;
		
		_class = dzn_MMRC_LinkedList select _index;
		_ctrlPic = (_display displayCtrl 6142);
		_ctrlTitle = (_display displayCtrl 6143);
		_ctrlDesc = (_display displayCtrl 6144);
		_ctrlExtra = (_display displayCtrl 6145);
	};

	_ctrlPic ctrlSetText ([_class,"picture","t"] call fnc_MMRC_gfc);
	_ctrlTitle ctrlSetStructuredText parseText ([_class,"displayName","t"] call fnc_MMRC_gfc);
	_ctrlDesc ctrlSetStructuredText parseText format [
		"<t size='0.75'>%1</t>"		
		, [_class,"descriptionShort","t"] call fnc_MMRC_gfc
	];

	_ctrlExtra ctrlSetStructuredText parseText (
		format [
			"<t size='0.75'>Tracers every: %1<br />Ammo: %2<br />Author: %3</t>"
			, [_class,"tracersEvery","n"] call fnc_MMRC_gfc
			, [_class,"ammo","t"] call fnc_MMRC_gfc
			, [_class,"author","t"] call fnc_MMRC_gfc
		]
	);
};

fnc_MMRC_uiOnMagazineActionBtnClick = {	
	private _action = toUpper(_this);
	private _actionDone = false;

	if (_action == "ADD") then {
		if (dzn_MMRC_MagsList isEqualTo []) exitWith { };
		private _magClass = toLower (dzn_MMRC_MagsList select dzn_MMRC_MagsSelectedIndex);
		
		// Add to Linked List
		dzn_MMRC_LinkedList pushBackUnique _magClass;
		[dzn_MMRC_LinkedList, "LINKED"] call fnc_MMRC_uiUpdateMagsListbox;

		// Mark as added in Mag List
		private _ctrlMagList = ((findDisplay 192006) displayCtrl 6131);
		_ctrlMagList lbSetColor [dzn_MMRC_MagsSelectedIndex, [0.5,0.5,0.5,1]];

		// Select next available index to add 
		private _index = dzn_MMRC_MagsSelectedIndex + 1;
		if ( _index <= (count dzn_MMRC_MagsList + 1) ) then {
			// Next item (1 down)
			_ctrlMagList lbSetCurSel _index;
		};

		_actionDone = true;
	} else {
		if (dzn_MMRC_LinkedList isEqualTo []) exitWith {};
		private _magClass = toLower (dzn_MMRC_LinkedList select dzn_MMRC_LinkedSelectedIndex);

		// Remove from Linked List
		dzn_MMRC_LinkedList deleteAt (dzn_MMRC_LinkedList find _magClass);
		[dzn_MMRC_LinkedList, "LINKED"] call fnc_MMRC_uiUpdateMagsListbox;

		// Mark as not-added in Mag List 
		private _index = dzn_MMRC_MagsList find _magClass;
		if (_index > -1) then {
			((findDisplay 192006) displayCtrl 6131) lbSetColor [_index, [1,1,1,1]];
		};

		_actionDone = true;
	};

	if (_actionDone) then { ["NOT SAVED","WARN"] call fnc_MMRC_uiUpdateSaveState; };
};

fnc_MMRC_uiOnExportBulkBtnClick = {
	if (dzn_MMRC_BulkSelectedIndex < 0) exitWith {};
	private _bulk = toLower(dzn_MMR_Bulk select dzn_MMRC_BulkSelectedIndex);
	private _result = [_bulk] + dzn_MMRC_LinkedList;

	private _draw = [
		parseText format ["<t size='1.25' color='#FFD000'>%1</t>", [_bulk,"displayName","t"] call fnc_MMRC_gfc]
		, lineBreak
		, parseText "<t color='#6666ff'>BULK MAPPING EXPORTED! (Ctrl+V)</t>"
		, lineBreak
	];

	private _items = 0;
	{
		_draw pushBack lineBreak;
		if (_forEachIndex > 15) exitWith { _draw pushBack format ["... (+%1 items)", count _result - 15]; };		
		_draw pushBack _x;
	} forEach _result;

	hint (composeText _draw);
	copyToClipboard str (_result);
};

fnc_MMRC_uiOnSaveBulkBtnClick = {
	if (dzn_MMRC_BulkSelectedIndex < 0) exitWith {};

	private _bulk = toLower(dzn_MMR_Bulk select dzn_MMRC_BulkSelectedIndex);
	if (_bulk == "Exchange_Mapping_Placeholder") exitWith { ["EXPORT ONLY","WARN"] call fnc_MMRC_uiUpdateSaveState; };

	private _result = [_bulk] + (dzn_MMRC_LinkedList apply {toLower _x});
	private _array = (dzn_MMR_Map apply {_x apply { toLower _x} }) select { _bulk in _x };

	if (_array isEqualTo []) then {
		dzn_MMR_Map pushBack _result;
	} else {
		dzn_MMR_Map = dzn_MMR_Map - _array + [_result];
	};
	
	// Saving mapping to CBA Settings
	private _extraSettings = if (isNil { CBA_Settings_server getVariable "dzn_MMR_ExtraMapSetting" }) then { 
		[]
	} else {	
		call compile ( "[" + ((CBA_Settings_server getVariable "dzn_MMR_ExtraMapSetting") select 0) + "]")
	};
	private _mapSettings = dzn_MMR_Map - _extraSettings;

	[
		"dzn_MMR_MainMapSetting"
		, str(_mapSettings) select [1, count str(_mapSettings) -2]
		, 0
		, "server"
		, true
	] call CBA_settings_fnc_set;

	// Notification
	private _draw = [
		parseText format ["<t size='1.25' color='#FFD000'>%1</t>", [_bulk,"displayName","t"] call fnc_MMRC_gfc]
		, lineBreak
		, parseText "<t color='#6666ff'>BULK MAPPING SAVED!</t>"
		, lineBreak
	];

	hint (composeText _draw);
	["SAVED","OK"] call fnc_MMRC_uiUpdateSaveState;
};

fnc_MMRC_uiUpdateSaveState = {
	params ["_text","_style"];

	((findDisplay 192006) displayCtrl 6103) ctrlSetStructuredText parseText format [
		"<t font='PuristaMedium' color='%2' size='1.5'>%1</t>"
		, _text
		, switch toUpper _style do {
			case "OK": { "#11FF11" };
			case "WARN": { "#FF9911" };
			default { "#FFFFFF" };
		}
	];
};


// UI Drawing
// Dialog creation
createDialog "dzn_MMR_Map_Group";
private _display = (findDisplay 192006);

//	Bulk dropdown
private _bulkDropdown = (_display displayCtrl 6112);
_bulkDropdown ctrlSetEventHandler ["LBSelChanged", "_this call fnc_MMRC_uiOnBulkChanged"];
{
	if (_x == "Exchange_Mapping_Placeholder") then {
		_bulkDropdown lbAdd "<Exchange Mapping Placeholder>";
	} else {
		_bulkDropdown lbAdd ([_x,"displayName","t"] call fnc_MMRC_gfc);
	};
} forEach dzn_MMR_Bulk;


//	Filter controls 
(_display displayCtrl 6121) ctrlSetTooltip "Use | symbol for alternative search (like OR operator), e.g. 5.56|5.56x45|556x45 will search for all 3 pieces";
(_display displayCtrl 6122) ctrlSetEventHandler ["ButtonClick", "_this call fnc_MMRC_uiOnSearchBtnClick"];
(_display displayCtrl 6123) cbSetChecked true;
(_display displayCtrl 6125) cbSetChecked true;

//	Magazines list
(_display displayCtrl 6131) ctrlSetEventHandler ["LBSelChanged", "[_this select 1, 'MAGAZINES'] call fnc_MMRC_uiOnMagSelected"];

//	Linked magazines list
(_display displayCtrl 6141) ctrlSetEventHandler ["LBSelChanged", "[_this select 1, 'LINKED'] call fnc_MMRC_uiOnMagSelected"];

//	Add and Remove magazine 
(_display displayCtrl 6150) ctrlSetEventHandler ["ButtonClick", "'Add' call fnc_MMRC_uiOnMagazineActionBtnClick"];
(_display displayCtrl 6151) ctrlSetEventHandler ["ButtonClick", "'Remove' call fnc_MMRC_uiOnMagazineActionBtnClick"];

//	Bulk Export button 
(_display displayCtrl 6106) ctrlSetEventHandler ["ButtonClick", "call fnc_MMRC_uiOnExportBulkBtnClick"];

//	Bulk Save button 
(_display displayCtrl 6105) ctrlSetEventHandler ["ButtonClick", "call fnc_MMRC_uiOnSaveBulkBtnClick"];
