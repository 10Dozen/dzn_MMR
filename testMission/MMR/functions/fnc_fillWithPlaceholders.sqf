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

private _placeholder = "ItemWatch";
private _containers = switch toLower(_this) do {
	case "uniformonly":		{ ["Uniform"] };
	case "vestonly":		{ ["Vest"] };
	case "backpackonly":	{ ["Backpack"] };

	case "uniform":			{ [] };
	case "vest":			{ ["Uniform"] };
	case "backpack": 		{ ["Uniform", "Vest"] };
};

if (_containers isEqualTo []) exitWith { (false) };

player setVariable ["dzn_MMR_PlaceholderCount", 0];
{
	call compile format ["
		private _attempts = 0;
		while { 
			_attempts = _attempts + 1;
			(load%1 player < 0.99) && _attempts < 150 
		} do {			
			player setVariable [
				'dzn_MMR_PlaceholderCount'
				, (player getVariable 'dzn_MMR_PlaceholderCount') + 1
			];
			player addItemTo%1 '%2';
		};	
	", _x
	, _placeholder];
} forEach _containers;

(true)