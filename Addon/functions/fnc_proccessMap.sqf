/*
	author: 10Dozen
	description: Prepare Magazine mapping for usage: convert all lines to lowercase
	input: none
	returns: nothing
	example:
		call dzn_MMR_fnc_proccessMap;
*/
#include "..\macro.hpp"

{
	GVAR(Map) set [_forEachIndex, _x apply { toLower(_x) }]
} forEach GVAR(Map);

GVAR(Bulk) = GVAR(Bulk) apply { toLower _x };

(true)