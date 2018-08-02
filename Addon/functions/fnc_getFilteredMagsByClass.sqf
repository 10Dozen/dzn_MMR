/*
	[DEPRECATED]
	author: 10Dozen
	description: Return list of magazines after filtering by class's dzn_MMR_searchFilter parameters
	input: STRING - classname
	returns: ARRAY - list of filtered magazines
	example:
		_nonTracerMags = "dzn_10Rnd_556x45_Bulk" call dzn_MMR_fnc_getFilteredMagsByClass;
		_tracerMags = "dzn_10Rnd_556x45_Bulk_Tracer" call dzn_MMR_fnc_getFilteredMagsByClass;
*/

private _resultInfo = [];
private _filters = (getText (configFile >> "CfgMagazines" >> _this >> "dzn_MMR_searchFilter")) splitString " " joinString "" splitString "|";
private _isTracer = getNumber (configFile >> "CfgMagazines" >> _this >> "tracersEvery") > 0;

private _allMagClasses = configFile >> "CfgMagazines";
for "_i" from 0 to (count _allMagClasses)-1 do {
	private _class = configName (_allMagClasses select _i);
	private _desc =  getText (configFile >> "CfgMagazines" >> _class >> "descriptionShort");

	if (
		toLower(_this) != toLower(_class)
		&& getText (configFile >> "CfgMagazines" >> _class >> "picture") != ""
		&& (
			(!_isTracer && (getNumber (configFile >> "CfgMagazines" >> _class >> "tracersEvery")) in [0,2,3,4,5,6,7,8,9,10])
			||
			(_isTracer && (getNumber (configFile >> "CfgMagazines" >> _class >> "tracersEvery") == 1))
		)
	) then {
		private _found = false;
		
		{
			if ( [_x, _class, false] call BIS_fnc_inString || [_x, _desc, false] call BIS_fnc_inString ) then {
				_found = true;
			};
		} forEach _filters;

		if (_found) then {
			_resultInfo pushBack _class;
			dzn_GFMC_log pushBack format ["Loop %1 >> Add %2", _class];
		};
	};
};

private _br = toString [13,10];
private _resultStr = "[" + _br + str _this;
{ _resultStr = _resultStr + _br + "," + str _x; } forEach _resultInfo;
_resultStr = _resultStr + _br + "]";

hint "MAGAZINE LIST COPIED!";
copyToClipboard (_resultStr);
_resultInfo