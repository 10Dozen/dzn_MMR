/*
ToDo:
	[]	Defaults mappings
*/

call compile preprocessFileLineNumbers "MMR\Mapping.sqf";
call compile preprocessFileLineNumbers "MMR\Functions.sqf";
call compile preprocessFileLineNumbers "MMR\Settings.sqf";

[] spawn {
	waitUntil { !isNil "dzn_MMR_fnc_proccessMap" };
	call dzn_MMR_fnc_proccessMap;

	while {true} do {
		waituntil {!(isnull (finddisplay 602))}; //waituntil inventory UI is opened

		((findDisplay 602) displayCtrl 633) ctrlSetEventHandler ["LBDblClick", "[_this, 'Uniform'] call dzn_MMR_fnc_uiHandleInvDoubleClick"];
		((findDisplay 602) displayCtrl 638) ctrlSetEventHandler ["LBDblClick", "[_this, 'Vest'] call dzn_MMR_fnc_uiHandleInvDoubleClick"];  
		((findDisplay 602) displayCtrl 619) ctrlSetEventHandler ["LBDblClick", "[_this, 'Backpack'] call dzn_MMR_fnc_uiHandleInvDoubleClick"];
		
		{
			_x ctrlSetEventHandler ["MouseButtonClick", "call dzn_MMR_fnc_uiHideDropdown"];
		} forEach allControls (findDisplay 602);
		
		waituntil {isnull (finddisplay 602)};
	};
};