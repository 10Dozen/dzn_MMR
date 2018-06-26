
#define PATH                    "MMR\functions\"
#define COMPILE_FUNCTION(X)     dzn_MMR_##X = compile preprocessFileLineNumbers format ["%1%2.sqf", PATH, #X]


COMPILE_FUNCTION(fnc_proccessMap);
COMPILE_FUNCTION(fnc_getMapped);
COMPILE_FUNCTION(fnc_isBulkAmmo);
COMPILE_FUNCTION(fnc_getMappedBulkAmmo);
COMPILE_FUNCTION(fnc_getMagazineByIndex);
COMPILE_FUNCTION(fnc_getContainerLoadout);
COMPILE_FUNCTION(fnc_getMagazinesAmmoFromContainer);
COMPILE_FUNCTION(fnc_addMagazineSafe);

COMPILE_FUNCTION(fnc_fillWithPlaceholders);
COMPILE_FUNCTION(fnc_removePlaceholders);


COMPILE_FUNCTION(fnc_packNewMagazine);
COMPILE_FUNCTION(fnc_unpackMagazine);
COMPILE_FUNCTION(fnc_repackMagazine);
COMPILE_FUNCTION(fnc_showPackToMenu);



COMPILE_FUNCTION(fnc_uiHandleInvDoubleClick);
COMPILE_FUNCTION(fnc_uiHideDropdown);
COMPILE_FUNCTION(fnc_uiShowInvDropdown);
COMPILE_FUNCTION(fnc_uiAddDropdownItem);
COMPILE_FUNCTION(fnc_uiHandleDropdownClick);







/*
Case:		Unpack STANAG from 2x full stanags in Vest
Result:		1x full stanag + 1x partial stanag in Vest

Execution:
			1) Remove all stanag magazines from Vest
			2) Fullfill uniform with placeholders
			3) Add partially loaded magazine (20/30)
			4) Add full stanags (30/30)
			5) Add bulk ammo (10)
*/

fnc_unpackMagazineInVest = {
	params ["_class", "_ammo"];

	private _magazines = [_class, "Vest"] call fnc_getMagazinesAmmoFromContainer; 
	
	// Remove all magazines of unpacking class
	for "_i" from 1 to (count _magazines) do {
		player removeItemFromVest _class;
	};

	// Add placeholders to add magazines to Vest via addMagazine
	"UNIFORM" call fnc_fulfillByPlaceholder;

	private _modified = false;
	private _bulkAmmo = 10;
	{
		_x params ["_magClass", "_magAmmo"];

		if (_magAmmo == _ammo && !_modified) then {
			// Target magazine to modify or delete
			if (_ammo > 10) then {
				player addMagazine [_class, (_ammo - 10)];
			} else {
				_bulkAmmo = _ammo;
			};
			_modified = true;
		} else {
			// Add other magazines
			player addMagazine [_magClass, _magAmmo];
		};
	} forEach _magazines;

	// Clear placeholders
	call fnc_removePlacholders;

	// Add bulk ammo
	player addMagazine ["dzn_10Rnd_556x45_Bulk", _bulkAmmo];

	(true)
};

/*
		[
			["30Rnd_556x45_Stanag",30]
			,["30Rnd_556x45_Stanag",19]
			,["30Rnd_556x45_Stanag",30]
		]
	*/



