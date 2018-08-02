/*
	author: 10Dozen
	description: Remove all placeholders from player's inventory
	input: nothing
	returns: nothing
	example:
		call dzn_MMR_fnc_removePlaceholders;
*/
#include "..\macro.hpp"
private _count = (player getVariable [SVAR(PlaceholderCount),100]) + 6;

player removeItem "dzn_Placeholder_Big";
player removeItem "dzn_Placeholder_Big";
player removeItem "dzn_Placeholder_Big";
player removeItem "dzn_Placeholder_Big";

player removeItem "dzn_Placeholder_Medium";
player removeItem "dzn_Placeholder_Medium";
player removeItem "dzn_Placeholder_Medium";
player removeItem "dzn_Placeholder_Medium";

for "_i" from 0 to (_count) do { 
	player removeItem "dzn_Placeholder_Small";
	player removeItem "dzn_Placeholder_Small";
};

player setVariable [SVAR(PlaceholderCount),0];