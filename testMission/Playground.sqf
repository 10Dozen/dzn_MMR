[] execVM "fnc_Test.sqf";


while {true} do {

	waituntil {!(isnull (finddisplay 602))}; //waituntil inventory UI is opened
        
	((findDisplay 602) displayCtrl 638) ctrlSetEventHandler ["LBDblClick", "_this call fnc_test"];  
	((findDisplay 602) displayCtrl 633) ctrlSetEventHandler ["LBDblClick", " _this call fnc_test"];  
	((findDisplay 602) displayCtrl 619) ctrlSetEventHandler ["LBDblClick", "_this call fnc_test"];
	
	((findDisplay 602) displayCtrl 638) ctrlSetEventHandler ["MouseButtonClick", "_this call fnc_singleClick"];    
	((findDisplay 602) displayCtrl 633) ctrlSetEventHandler ["MouseButtonClick", "_this call fnc_singleClick"];    
	((findDisplay 602) displayCtrl 619) ctrlSetEventHandler ["MouseButtonClick", "_this call fnc_singleClick"];    
	
	
	
	waituntil {isnull (finddisplay 602)};
};



