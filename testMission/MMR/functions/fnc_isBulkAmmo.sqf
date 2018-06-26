/*
	author: 10Dozen
	description: Checks is given magazine class is bulk ammo (not a weapon magazine)
	input: STRING - magazine class
	returns: BOOL 
	example:
		_isBulk = "rhs_100Rnd_762x54mmR" call dzn_MMR_fnc_isBulkAmmo; // return: false
*/

( toLower(_this) in dzn_MMR_Bulk )