/*
	author: 10Dozen
	description: Fill player's inventory with placeholder item from uniform to given container
	input: STRING - inventroy section type:
				Uniform/Vest/Backpack 				- fill containers from uniform up to given container (not incl.)
				UnifromOnly/VestOnly/BackpackOnly	- fill only given container
	returns: nothing
	example:
		"Vest" call dzn_MMR_fnc_fillWithPlaceholders;
*/
#include "..\macro.hpp"

private _containers = switch toLower(_this) do {
	case "uniformonly":		{ ["Uniform"] };
	case "vestonly":		{ ["Vest"] };
	case "backpackonly":	{ ["Backpack"] };

	case "uniform":			{ [] };
	case "vest":			{ ["Uniform"] };
	case "backpack": 		{ ["Uniform", "Vest"] };
};

if (_containers isEqualTo []) exitWith { (false) };

player setVariable [SVAR(PlaceholderCount), 0];

/*
	dzn_Placeholder_Small:		mass = 2;
	dzn_Placeholder_Medium:		mass = 10;
	dzn_Placeholder_Big:		mass = 25;
*/

{
	call compile format ["
		private _attempts = 0;

		player setVariable ['%3', 6];

		player addItemTo%1 'dzn_Placeholder_Big';
		player addItemTo%1 'dzn_Placeholder_Big';
		player addItemTo%1 'dzn_Placeholder_Big';
		player addItemTo%1 'dzn_Placeholder_Medium';
		player addItemTo%1 'dzn_Placeholder_Medium';
		player addItemTo%1 'dzn_Placeholder_Medium';

		while { 
			_attempts = _attempts + 1;
			(load%1 player < 0.99) && _attempts < 30 
		} do {
			player addItemTo%1 'dzn_Placeholder_Small';
			player setVariable [
				'%3'
				, (player getVariable '%3') + 1
			];
		};"
		, _x
		, _placeholder
		, SVAR(PlaceholderCount)
	];
} forEach _containers;

(true)