
#define PATH                    "MMR\functions\"
#define COMPILE_FUNCTION(X)     dzn_MMR_##X = compile preprocessFileLineNumbers format ["%1%2.sqf", PATH, #X]


COMPILE_FUNCTION(fnc_proccessMap);
COMPILE_FUNCTION(fnc_getMapped);
COMPILE_FUNCTION(fnc_isBulkAmmo);
COMPILE_FUNCTION(fnc_getMappedBulkAmmo);
COMPILE_FUNCTION(fnc_getMagazineByIndex);
COMPILE_FUNCTION(fnc_getContainerLoadout);
COMPILE_FUNCTION(fnc_getMagazinesAmmoFromContainer);
COMPILE_FUNCTION(fnc_removeMagazinesFromContainer);
COMPILE_FUNCTION(fnc_addMagazineSafe);
COMPILE_FUNCTION(fnc_fillWithPlaceholders);
COMPILE_FUNCTION(fnc_removePlaceholders);
COMPILE_FUNCTION(fnc_formatStrings);
COMPILE_FUNCTION(fnc_resortBulkMagazines);

COMPILE_FUNCTION(fnc_packNewMagazine);
COMPILE_FUNCTION(fnc_unpackMagazine);
COMPILE_FUNCTION(fnc_repackMagazine);
COMPILE_FUNCTION(fnc_uiShowPackToMenu);
COMPILE_FUNCTION(fnc_uiShowExchangeToMenu);

COMPILE_FUNCTION(fnc_uiHandleInvDoubleClick);
COMPILE_FUNCTION(fnc_uiHideDropdown);
COMPILE_FUNCTION(fnc_uiShowInvDropdown);
COMPILE_FUNCTION(fnc_uiAddDropdownItem);
COMPILE_FUNCTION(fnc_uiHandleDropdownClick);
COMPILE_FUNCTION(fnc_uiOnLBSelChanged);


/*

dzn_MMR_fnc_uiOnLBSelChanged = compile preprocessFileLineNumbers "MMR\functions\fnc_uiOnLBSelChanged.sqf";


dzn_MMR_fnc_uiShowExchangeToMenu = compile preprocessFileLineNumbers "MMR\functions\fnc_uiShowExchangeToMenu.sqf";




*/