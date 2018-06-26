/*
	author: 10Dozen
	description: Remove all placeholders from player's inventory
	input: nothing
	returns: nothing
	example:
		call dzn_MMR_fnc_removePlaceholders;
*/

for "_i" from 0 to (player getVariable ["dzn_MMR_PlaceholderCount",100]) do { 
	player removeItem "ItemWatch";
};

player setVariable ["dzn_MMR_PlaceholderCount", 0];

(true)