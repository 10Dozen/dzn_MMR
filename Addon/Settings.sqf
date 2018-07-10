#include "macro.hpp"

private _add = {
	params ["_var","_type","_val",["_exp", "No Expression"],["_subcat", ""]];	
	 
	private _arr = [
		format["dzn_%1_%2",ADDON,_var]
		, _type
		, [localize format["STR_%1_%2",ADDON,_var], localize format ["STR_%1_%2_desc",ADDON,_var]]
		, if (_subcat == "") then { TITLE } else { [TITLE, _subcat] }
		, _val
		, true
	];
	
	if !(typename _exp == "STRING" && { _exp == "No Expression" }) then { _arr pushBack _exp; };
	_arr call CBA_Settings_fnc_init;
};

// Settings 
[
	"Enabled"
	, "CHECKBOX"
	, true
] call _add;

[
	"AllowPackTo"
	, "CHECKBOX"
	, true
] call _add;

[
	"AllowExchangeTo"
	, "CHECKBOX"
	, true
] call _add;

[
	"MMRC_Switch"
	, "CHECKBOX"
	, false
	, { if (_this) then { call GVAR(fnc_uiShowMMRConfigMenu); }; }
] call _add;

[
	"BulkSetting"
	, "EDITBOX"
	, str(GVAR(Bulk)) select [1, count str(GVAR(Bulk)) -2]
	, { 
		GVAR(Bulk) = call compile ("[" + _this + "]");
		call GVAR(fnc_proccessMap);
	}
] call _add;

[
	"MainMapSetting"
	, "EDITBOX"
	, str(GVAR(Map)) select [1, count str(GVAR(Map)) -2]
	, { 
		GVAR(Map) = call compile ("[" + _this + "]") + call compile ("[" + GVAR(ExtraMapSettings) + "]");
		call GVAR(fnc_proccessMap);
	}
] call _add;

[
	"ExtraMapSettings"
	, "EDITBOX"
	, ""
	, { 
		GVAR(Map) = call compile ("[" + GVAR(MainMapSetting) + "]") + call compile ("[" + _this + "]");
		call GVAR(fnc_proccessMap);
	}
] call _add;