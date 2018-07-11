/*
ToDo:
	[ok]	Defaults mappings
	[+]		use macro accros functions
	[+]		Add localization to Inventory dropdown items
	[+]		Add localization to Pack To overlay
	[+]		Add localization to Exchange To overlay
	[]		Add localization to Hints
*/
#include "macro.hpp"

call compile preprocessFileLineNumbers format ["%1\Mapping.sqf", PATH];
call compile preprocessFileLineNumbers format ["%1\Functions.sqf", PATH];

[] spawn {
	waitUntil { !isNil SVAR(fnc_proccessMap) };

	call GVAR(fnc_proccessMap);
	call compile preprocessFileLineNumbers format ["%1\Settings.sqf", PATH];

	while {true} do {
		if !(GVAR(Enabled)) exitWith {};

		//waituntil inventory UI is opened
		waituntil {!(isNull (findDisplay 602))}; 

		((findDisplay 602) displayCtrl 633) ctrlSetEventHandler ["LBDblClick", "[_this, 'Uniform'] call " + SVAR(fnc_uiHandleInvDoubleClick)];
		((findDisplay 602) displayCtrl 638) ctrlSetEventHandler ["LBDblClick", "[_this, 'Vest'] call " + SVAR(fnc_uiHandleInvDoubleClick)];  
		((findDisplay 602) displayCtrl 619) ctrlSetEventHandler ["LBDblClick", "[_this, 'Backpack'] call " + SVAR(fnc_uiHandleInvDoubleClick)];
		
		{
			_x ctrlSetEventHandler ["MouseButtonClick", "call " + SVAR(fnc_uiHideDropdown)];
		} forEach allControls (findDisplay 602);
		
		waituntil {isNull (findDisplay 602)};
	};
};