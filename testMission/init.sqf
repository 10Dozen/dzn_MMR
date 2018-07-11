enableSaving [false, false];


[] execVM "MMR\Init.sqf";

/*
To remove jsut select mags:
player removeItemFromVest (A select 4 select 0)

where A is get from 
_value = format ["Value<br />%1<br />________<br />",lbValue [_idc, _selectedIndex]];

*/

Kit = [
	["arifle_SPAR_01_snd_F","","","optic_ACO_grn",["30Rnd_556x45_Stanag",29],[],""]
	,[]
	,["hgun_P07_F","","","",["16Rnd_9x21_Mag",16],[],""]
	,["U_B_CombatUniform_mcam",[["FirstAidKit",1]]]
	,["V_PlateCarrier1_rgr",[["16Rnd_9x21_Mag",2,16],["SmokeShell",1,1],["HandGrenade",1,1],["30Rnd_556x45_Stanag",2,30]]]
	,["B_AssaultPack_cbr",[["30Rnd_556x45_Stanag",2,30]]]
	,"H_HelmetB"
	,""
	,[]
	,["ItemMap","","ItemRadio","ItemCompass","ItemWatch","NVGoggles"]
];

player setUnitLoadout Kit;

clearWeaponCargo BOX1;
clearMagazineCargo BOX1;
clearItemCargo BOX1;
clearBackpackCargo BOX1;

{
	BOX1 addMagazineCargo [_x, 2];
} forEach [
			"dzn_10Rnd_556x45_Bulk"
			,"dzn_10Rnd_556x45_Bulk"
			,"dzn_10Rnd_556x45_Bulk"
			,"dzn_10Rnd_556x45_Bulk"
			,"dzn_10Rnd_556x45_Bulk"
			,"dzn_10Rnd_556x45_Bulk"
			,"dzn_10Rnd_556x45_Bulk"
			,"dzn_10Rnd_556x45_Bulk"
			,"dzn_10Rnd_556x45_Bulk"
			,"dzn_10Rnd_556x45_Bulk"
			,"dzn_10Rnd_556x45_Bulk"
			,"dzn_10Rnd_556x45_Bulk"
			,"dzn_10Rnd_556x45_Bulk"
			,"dzn_10Rnd_556x45_Bulk"
			,"dzn_10Rnd_556x45_Bulk_Mixed"
			,"dzn_10Rnd_556x45_Bulk_Mixed"
			,"dzn_10Rnd_556x45_Bulk_Mixed"
			,"dzn_10Rnd_556x45_Bulk_Mixed"
			,"dzn_10Rnd_556x45_Bulk_Mixed"
			,"dzn_10Rnd_556x45_Bulk_Mixed"
			,"dzn_10Rnd_556x45_Bulk_Mixed"
			
			,"dzn_10Rnd_762x39_Bulk"
			,"dzn_10Rnd_762x39_Bulk"
			,"dzn_10Rnd_762x39_Bulk"
			,"dzn_10Rnd_762x39_Bulk"
			,"dzn_10Rnd_762x39_Bulk"
];






player addAction ["Check total ammo", {
	private _totalAmmo = 0;
	{ _totalAmmo = _totalAmmo + (_x select 1); } forEach (magazinesAmmoFull player);
	hint format ["%1 \n \n Total: %2", currentMagazineDetail player, _totalAmmo];
}];

dzn_MMR_Test1 = {
	removeAllWeapons player;
	(magazines player) apply { player removeMagazines (_x) };
	
	player addWeapon "rhs_weap_ak74mr_grip1";
	for "_i" from 0 to 3 do {
		player addMagazine ["CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M", 10 + ceil(random(60))];
	};
	
	hint "AK74 w. random ADDED";
	
	private _totalAmmo = 0;
	{ _totalAmmo = _totalAmmo + (_x select 1); } forEach (magazinesAmmoFull player);
	
	sleep 1;
	
	call dzn_MMR_fnc_Action;
	
	private _totalAmmo2 = 0;
	{ _totalAmmo2 = _totalAmmo2 + (_x select 1); } forEach (magazinesAmmoFull player);

	hint format["Before: %1 vs %2 :After => %3", _totalAmmo, _totalAmmo2, _totalAmmo == _totalAmmo2];
};
