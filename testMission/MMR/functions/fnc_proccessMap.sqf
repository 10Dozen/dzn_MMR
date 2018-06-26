/*
	author: 10Dozen
	description: Prepare Magazine mapping for usage: convert all lines to lowercase
	input: none
	returns: nothing
	example:
*/

{
	dzn_MMR_Map set [_forEachIndex, _x apply { toLower(_x) }]
} forEach dzn_MMR_Map;

dzn_MMR_Bulk = dzn_MMR_Bulk apply { toLower _x };

(true)