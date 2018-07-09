/*
	[DEPRECATED]
	author: 10Dozen
	description: Return list of magazines after filtering by classname, tracersEvery and scope = 2
	input: ARRAY - 
		0: STRING - string to search in classname 
		1: SCALAR - tracers every in mag's config
	returns: ARRAY - list of filtered magazines
	example:
		_nonTracerMags = ["556x45", "5.56", 0] call dzn_MMR_fnc_getFilteredMagazines;
		_tracerMags = ["556x45", "", 1] call dzn_MMR_fnc_getFilteredMagazines;
*/

params ["_classnameContaints", ["_descriptionContaints",""], ["_tracersEvery",-1]];

private _resultInfo = [];
private _allMagClasses = configFile >> "CfgMagazines";

for "_i" from 0 to (count _allMagClasses)-1 do {
	private _class = configName (_allMagClasses select _i);
	
	if (
		getText (configFile >> "CfgMagazines" >> _class >> "picture") != ""
		&& {
			[_classnameContaints, _class, false] call BIS_fnc_inString 
			&& [_descriptionContaints, getText(configFile >> "CfgMagazines" >> _class >> "descriptionShort"), false] call BIS_fnc_inString 
		}
	) then {
		if (
			( _tracersEvery == -1  && (getNumber (configFile >> "CfgMagazines" >> _class >> "tracersEvery")) in [0,2,3,4,5,6,7,8,9,10] )
			|| ( _tracersEvery > 0 && getNumber (configFile >> "CfgMagazines" >> _class >> "tracersEvery") == _tracersEvery )
		) then {
			_resultInfo pushBack _class;
		};
	};
};

private _br = toString [13,10];
private _resultStr = "[";
private _bulks = _resultInfo select { ["Bulk", _x] call bis_fnc_inString };
{
	_resultStr = _resultStr + _br + str _x;
	_resultInfo deleteAt (_resultInfo find _x);
} forEach _bulks;

{
	_resultStr = _resultStr + _br + "," + str _x;
} forEach _resultInfo;

_resultStr = _resultStr + _br + "]";

hint "MAGAZINE LIST COPIED!";

copyToClipboard (_resultStr);

_resultInfo










/*

- We can search for 762x39 in className + in ammo classname
[
	"rhs_30Rnd_762x39mm"
	,"rhs_30Rnd_762x39mm_tracer"
	,"rhs_30Rnd_762x39mm_89"
	,"dzn_10Rnd_762x39mm_Bulk"
	,"rhs_30Rnd_762x39mm_U"
	,"CUP_30Rnd_762x39_AK47_M"
]


FOR Tracers -> tracersEvery = 0;


[ Header                                              		]
[															]
[ [Dopdown of BULK_AMMO	______________________________ ][V] ]
[															]
[ [ Select tree                                          ^] ]
[ [ Select tree                                           ] ]
[ [ Select tree                                           ] ]
[ [ Select tree                                           ] ]
[ [ Select tree                                           ] ]
[ [ Select tree                                           ] ]
[ [ Select tree                                           ] ]
[ [ Select tree                                           ] ]
[ [ Select tree                                          v] ]
[															]
[[ CANCEL ]										  [ EXPORT ]]

- Get Bulk ammo classes
- Select all magazines with same caliber (check ["762x39", _class, false] call BIS_fnc_inString ) and (not) traccers + scope=2
- Draw multiselect list with classname + author

*/
