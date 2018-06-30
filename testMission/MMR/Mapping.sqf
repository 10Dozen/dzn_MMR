
dzn_MMR_Map = [


/* 	5.56mm NATO 
	- Mapping contains Bulk Ammo mapped.
	- Bulk Ammo (dzn_10Rnd_556x45_Bulk) may be packed to any of the listed magazine.
	- Bulk Ammo (dzn_10Rnd_556x45_Bulk) may be packed to any magazine from the list that compatible with current player's weapon:
		first magazine listed both in weapon's magazines[] config & mapping is used by default,
		e.g. for RHS M249 compatible are ["rhsusf_100Rnd_556x45_M855_soft_pouch", "rhs_200rnd_556x45_M_SAW"] --> "rhs_200rnd_556x45_M_SAW" (according to weapons config)
	- All listed magazines (e.g. 30Rnd_556x45_Stanag) may be unpacked to Bulk ammo (dzn_10Rnd_556x45_Bulk).
	- All listed magazines (e.g. 30Rnd_556x45_Stanag) may be repacked using Bulk ammo (dzn_10Rnd_556x45_Bulk). 
*/
[
	"dzn_10Rnd_556x45_Bulk"
	
	,"30Rnd_556x45_Stanag"
	,"rhs_mag_30Rnd_556x45_M855_Stanag"
	,"hlc_30rnd_556x45_b_HK33"
	,"CUP_30Rnd_556x45_G36"
	,"CUP_100Rnd_556x45_BetaCMag"
	,"ACE_30Rnd_556x45_Stanag_Mk262_mag"
	,"CUP_30Rnd_556x45_Stanag"
	,"CUP_20Rnd_556x45_Stanag"
	,"KA_SIG_30rnd_M193_Ball_mag"
	,"150Rnd_556x45_Drum_Mag_F"
	,"rhsusf_100Rnd_556x45_M855_soft_pouch"
	,"rhs_200rnd_556x45_M_SAW"
]

/*	RPG-7 PG-7V
	Mapping DOES NOT contain Bulk Ammo mapped.
	All listed magazines (e.g. RPG7_F) may be exchanged to any listed magazine (e.g. rhs_rpg7_PG7VL_mag)

*/
,[
	"RPG7_F"
	, "rhs_rpg7_PG7V_mag"
]


];

dzn_MMR_Bulk = [
	"dzn_10Rnd_556x45_Bulk"
];