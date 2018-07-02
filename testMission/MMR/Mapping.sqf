/* 	
	- Mapping contains Bulk Ammo mapped.
	- Bulk Ammo (dzn_10Rnd_556x45_Bulk) may be packed to any of the listed magazine.
	- Bulk Ammo (dzn_10Rnd_556x45_Bulk) may be packed to any magazine from the list that compatible with current player's weapon:
		first magazine listed both in weapon's magazines[] config & mapping is used by default,
		e.g. for RHS M249 compatible are ["rhsusf_100Rnd_556x45_M855_soft_pouch", "rhs_200rnd_556x45_M_SAW"] --> "rhs_200rnd_556x45_M_SAW" (according to weapons config)
	- All listed magazines (e.g. 30Rnd_556x45_Stanag) may be unpacked to Bulk ammo (dzn_10Rnd_556x45_Bulk).
	- All listed magazines (e.g. 30Rnd_556x45_Stanag) may be repacked using Bulk ammo (dzn_10Rnd_556x45_Bulk). 

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
*/

dzn_MMR_Map = [

[] /* Empty one just for same format of other arrays */

/*	5.56x45mm NATO */
, [
	"dzn_10Rnd_556x45_Bulk"
	,"30Rnd_556x45_Stanag"
	,"30Rnd_556x45_Stanag_green"
	,"30Rnd_556x45_Stanag_red"
	,"20Rnd_556x45_UW_mag"
	,"CUP_30Rnd_556x45_Stanag"
	,"CUP_20Rnd_556x45_Stanag"
	,"CUP_30Rnd_556x45_G36"
	,"CUP_100Rnd_556x45_BetaCMag"
	,"CUP_200Rnd_TE4_Green_Tracer_556x45_M249"
	,"CUP_200Rnd_TE4_Red_Tracer_556x45_M249"
	,"CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249"
	,"CUP_100Rnd_TE4_Green_Tracer_556x45_M249"
	,"CUP_100Rnd_TE4_Red_Tracer_556x45_M249"
	,"CUP_100Rnd_TE4_Yellow_Tracer_556x45_M249"
	,"CUP_200Rnd_TE4_Green_Tracer_556x45_L110A1"
	,"CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1"
	,"CUP_200Rnd_TE4_Yellow_Tracer_556x45_L110A1"
	,"rhs_mag_30Rnd_556x45_M855A1_Stanag"
	,"rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer"
	,"rhs_mag_30Rnd_556x45_M855_Stanag"
	,"rhs_mag_30Rnd_556x45_Mk318_Stanag"
	,"rhs_mag_30Rnd_556x45_Mk262_Stanag"
	,"rhs_mag_30Rnd_556x45_M200_Stanag"
	,"rhsusf_100Rnd_556x45_soft_pouch"
	,"rhsusf_100Rnd_556x45_M855_soft_pouch"
	,"rhsusf_100Rnd_556x45_M200_soft_pouch"
	,"rhsusf_200Rnd_556x45_soft_pouch"
	,"rhsusf_200Rnd_556x45_M855_soft_pouch"
	,"rhs_200rnd_556x45_M_SAW"
	,"rhs_200rnd_556x45_B_SAW"
	,"150Rnd_556x45_Drum_Mag_F"
	,"200Rnd_556x45_Box_F"
	,"200Rnd_556x45_Box_Red_F"
	,"ACE_30Rnd_556x45_Stanag_M995_AP_mag"
	,"ACE_30Rnd_556x45_Stanag_Mk262_mag"
	,"ACE_30Rnd_556x45_Stanag_Mk318_mag"
]

/*	5.56x45mm Tracer NATO */
, [
	"dzn_10Rnd_556x45_Bulk_Tracer"
	,"30Rnd_556x45_Stanag_Tracer_Red"
	,"30Rnd_556x45_Stanag_Tracer_Green"
	,"30Rnd_556x45_Stanag_Tracer_Yellow"
	,"CUP_30Rnd_TE1_Red_Tracer_556x45_G36"
	,"CUP_30Rnd_TE1_Green_Tracer_556x45_G36"
	,"CUP_30Rnd_TE1_Yellow_Tracer_556x45_G36"
	,"CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag"
	,"CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag"
	,"CUP_100Rnd_TE1_Yellow_Tracer_556x45_BetaCMag"
	,"CUP_200Rnd_TE1_Red_Tracer_556x45_M249"
	,"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"
	,"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green"
	,"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow"
	,"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Orange"
	,"rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"
	,"rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Green"
	,"rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Yellow"
	,"rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Orange"
	,"rhs_200rnd_556x45_T_SAW"
	,"150Rnd_556x45_Drum_Mag_Tracer_F"
	,"200Rnd_556x45_Box_Tracer_F"
	,"200Rnd_556x45_Box_Tracer_Red_F"
	,"ACE_30Rnd_556x45_Stanag_Tracer_Dim"
]

/*	7.62x51mm NATO */
, [
	"dzn_10Rnd_762x51_Bulk"
	,"20Rnd_762x51_Mag"
	,"CUP_20Rnd_762x51_FNFAL_M"
	,"CUP_20Rnd_762x51_L129_M"
	,"CUP_20Rnd_762x51_B_SCAR"
	,"CUP_20Rnd_762x51_CZ805B"
	,"CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"
	,"CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"
	,"CUP_200Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"
	,"CUP_200Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"
	,"CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"
	,"CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M"
	,"CUP_20Rnd_762x51_DMR"
	,"CUP_5Rnd_762x51_M24"
	,"CUP_20Rnd_762x51_B_M110"
	,"CUP_10Rnd_762x51_CZ750"
	,"rhsusf_50Rnd_762x51"
	,"rhsusf_50Rnd_762x51_m61_ap"
	,"rhsusf_50Rnd_762x51_m80a1epr"
	,"rhsusf_50Rnd_762x51_m82_blank"
	,"rhsusf_100Rnd_762x51"
	,"rhsusf_100Rnd_762x51_m61_ap"
	,"rhsusf_100Rnd_762x51_m80a1epr"
	,"rhsusf_100Rnd_762x51_m82_blank"
	,"rhsusf_50Rnd_762x51_m993"
	,"rhsusf_100Rnd_762x51_m993"
	,"rhsusf_20Rnd_762x51_m118_special_Mag"
	,"rhsusf_20Rnd_762x51_m993_Mag"
	,"rhsusf_5Rnd_762x51_m118_special_Mag"
	,"rhsusf_5Rnd_762x51_m993_Mag"
	,"rhsusf_10Rnd_762x51_m118_special_Mag"
	,"rhsusf_10Rnd_762x51_m993_Mag"
	,"ACE_20Rnd_762x51_Mag_SD"
	,"ACE_10Rnd_762x51_M118LR_Mag"
	,"ACE_10Rnd_762x51_Mk316_Mod_0_Mag"
	,"ACE_10Rnd_762x51_Mk319_Mod_0_Mag"
	,"ACE_10Rnd_762x51_M993_AP_Mag"
	,"ACE_20Rnd_762x51_M118LR_Mag"
	,"ACE_20Rnd_762x51_Mk316_Mod_0_Mag"
	,"ACE_20Rnd_762x51_Mk319_Mod_0_Mag"
	,"ACE_20Rnd_762x51_M993_AP_Mag"
	,"150Rnd_762x51_Box"
	,"10Rnd_762x51_Mag"
]

/*	7.62x51mm Tracers NATO */
, [
	"dzn_10Rnd_762x51_Bulk_Tracer"
	,"200Rnd_762x51_Belt_T_Red"
	,"200Rnd_762x51_Belt_T_Green"
	,"200Rnd_762x51_Belt_T_Yellow"
	,"CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR"
	,"CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR"
	,"CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR"
	,"CUP_20Rnd_TE1_White_Tracer_762x51_SCAR"
	,"CUP_20Rnd_TE1_Yellow_Tracer_762x51_CZ805B"
	,"CUP_20Rnd_TE1_Red_Tracer_762x51_CZ805B"
	,"CUP_20Rnd_TE1_Green_Tracer_762x51_CZ805B"
	,"CUP_20Rnd_TE1_White_Tracer_762x51_CZ805B"
	,"CUP_200Rnd_TE1_LRT4_Red_Tracer_762x51_Belt_M"
	,"CUP_20Rnd_TE1_Yellow_Tracer_762x51_DMR"
	,"CUP_20Rnd_TE1_Red_Tracer_762x51_DMR"
	,"CUP_20Rnd_TE1_Green_Tracer_762x51_DMR"
	,"CUP_20Rnd_TE1_White_Tracer_762x51_DMR"
	,"CUP_20Rnd_TE1_Yellow_Tracer_762x51_M110"
	,"CUP_20Rnd_TE1_Red_Tracer_762x51_M110"
	,"CUP_20Rnd_TE1_Green_Tracer_762x51_M110"
	,"CUP_20Rnd_TE1_White_Tracer_762x51_M110"
	,"CUP_10Rnd_762x51_CZ750_Tracer"
	,"rhsusf_50Rnd_762x51_m62_tracer"
	,"rhsusf_100Rnd_762x51_m62_tracer"
	,"rhsusf_20Rnd_762x51_m62_Mag"
	,"rhsusf_5Rnd_762x51_m62_Mag"
	,"rhsusf_10Rnd_762x51_m62_Mag"
	,"ACE_20Rnd_762x51_Mag_Tracer"
	,"ACE_20Rnd_762x51_Mag_Tracer_Dim"
]

/*	5.45x39mm Russian */
, [
	"dzn_10Rnd_545x39_Bulk"
	,"CUP_30Rnd_545x39_AK_M"
	,"CUP_30Rnd_Subsonic_545x39_AK_M"
	,"CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M"
	,"CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M"
	,"rhs_30Rnd_545x39_AK"
	,"rhs_30Rnd_545x39_AK_no_tracers"
	,"rhs_30Rnd_545x39_7N6_AK"
	,"rhs_30Rnd_545x39_7N10_AK"
	,"rhs_30Rnd_545x39_7N22_AK"
	,"rhs_30Rnd_545x39_7U1_AK"
	,"rhs_45Rnd_545X39_7N22_AK"
	,"rhs_45Rnd_545X39_7N10_AK"
	,"rhs_45Rnd_545X39_7N6_AK"
	,"rhs_45Rnd_545X39_AK"
	,"rhs_45Rnd_545X39_7U1_AK"
	,"30Rnd_545x39_Mag_F"
	,"30Rnd_545x39_Mag_Green_F"
]

/*	5.45x39mm Tracer Russian */
, [
	"dzn_10Rnd_545x39_Bulk_Tracer"
	,"CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M"
	,"CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M"
	,"CUP_30Rnd_TE1_White_Tracer_545x39_AK_M"
	,"CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK_M"
	,"rhs_30Rnd_545x39_AK_green"
	,"rhs_45Rnd_545X39_AK_Green"
	,"30Rnd_545x39_Mag_Tracer_F"
	,"30Rnd_545x39_Mag_Tracer_Green_F"
]

/*	7.62x39mm Russian */
, [
	"dzn_10Rnd_762x39_Bulk"
	,"CUP_30Rnd_762x39_AK47_M"
	,"CUP_30Rnd_Sa58_M"
	,"rhs_30Rnd_762x39mm"
	,"rhs_30Rnd_762x39mm_89"
	,"rhs_30Rnd_762x39mm_U"
	,"30Rnd_762x39_Mag_F"
	,"30Rnd_762x39_Mag_Green_F"
]

/*	7.62x39mm Tracer Russian */
, [
	"dzn_10Rnd_762x39_Bulk_Tracer"
	,"CUP_30Rnd_Sa58_M_TracerG"
	,"CUP_30Rnd_Sa58_M_TracerR"
	,"CUP_30Rnd_Sa58_M_TracerY"
	,"rhs_30Rnd_762x39mm_tracer"
	,"30Rnd_762x39_Mag_Tracer_F"
	,"30Rnd_762x39_Mag_Tracer_Green_F"
]

/*	7.62x54mm Russian */
, [
	"dzn_10Rnd_762x54_Bulk"
	,"150Rnd_762x54_Box"
	,"10Rnd_762x54_Mag"
	,"CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"
	,"CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M"
	,"CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Yellow_M"
	,"CUP_50Rnd_UK59_762x54R_Tracer"
	,"CUP_10Rnd_762x54_SVD_M"
	,"rhs_100Rnd_762x54mmR"
	,"rhs_100Rnd_762x54mmR_7N13"
	,"rhs_100Rnd_762x54mmR_7N26"
	,"rhs_100Rnd_762x54mmR_7BZ3"
	,"rhs_10Rnd_762x54mmR_7N1"
]

/*	7.62x54mm Tracer Russian */
, [
	"dzn_10Rnd_762x54_Bulk_Tracer"
	,"150Rnd_762x51_Box_Tracer"
	,"150Rnd_762x54_Box_Tracer"
	,"rhs_100Rnd_762x54mmR_green"
	,"ACE_10Rnd_762x54_Tracer_mag"
]

/*	9x19mm Parabellum */
, [
	"dzn_10Rnd_9x19_Bulk"
	,"CUP_64Rnd_9x19_Bizon_M"
	,"CUP_64Rnd_Green_Tracer_9x19_Bizon_M"
	,"CUP_64Rnd_Red_Tracer_9x19_Bizon_M"
	,"CUP_64Rnd_White_Tracer_9x19_Bizon_M"
	,"CUP_64Rnd_Yellow_Tracer_9x19_Bizon_M"
	,"CUP_30Rnd_9x19_MP5"
	,"CUP_30Rnd_9x19_EVO"
	,"CUP_30Rnd_9x19_UZI"
	,"CUP_17Rnd_9x19_glock17"
	,"CUP_10Rnd_9x19_Compact"
	,"CUP_18Rnd_9x19_Phantom"
	,"CUP_15Rnd_9x19_M9"
	,"rhs_mag_9x19_17"
	,"rhs_mag_9x19mm_7n21_20"
	,"rhs_mag_9x19mm_7n31_20"
	,"rhs_mag_9x19mm_7n21_44"
	,"rhs_mag_9x19mm_7n31_44"
	,"rhsusf_mag_17Rnd_9x19_FMJ"
	,"rhsusf_mag_17Rnd_9x19_JHP"
	,"rhsusf_mag_15Rnd_9x19_FMJ"
	,"rhsusf_mag_15Rnd_9x19_JHP"
	,"ACE_16Rnd_9x19_mag"
]

/*
	,"dzn_10Rnd_9x19_Bulk_Tracer"
*/

/*	.45 ACP */
, [
	"dzn_10Rnd_45ACP_Bulk"
	,"30Rnd_45ACP_Mag_SMG_01"
	,"9Rnd_45ACP_Mag"
	,"11Rnd_45ACP_Mag"
	,"6Rnd_45ACP_Cylinder"
	,"CUP_6Rnd_45ACP_M"
	,"CUP_7Rnd_45ACP_1911"
	,"rhsusf_mag_7x45acp_MHP"
]

/*	.45 ACP Tracer */
, [
	"dzn_10Rnd_45ACP_Tracer"
	,"30Rnd_45ACP_Mag_SMG_01_Tracer_Green"
	,"30Rnd_45ACP_Mag_SMG_01_Tracer_Red"
	,"30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow"
]

, [
	"1Rnd_HE_Grenade_shell"
	,"CUP_6Rnd_HE_M203_heli"
	,"CUP_6Rnd_HE_M203"
	,"rhsusf_mag_6Rnd_M441_HE"
]

/*	RPG-7 PG-7V Exchange options
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
	,"dzn_10Rnd_556x45_Bulk_Tracer"
	,"dzn_10Rnd_762x51_Bulk"
	,"dzn_10Rnd_762x51_Bulk_Tracer"
	,"dzn_10Rnd_545x39_Bulk"
	,"dzn_10Rnd_545x39_Bulk_Tracer"
	,"dzn_10Rnd_762x39_Bulk"
	,"dzn_10Rnd_762x39_Bulk_Tracer"
	,"dzn_10Rnd_762x54_Bulk"
	,"dzn_10Rnd_762x54_Bulk_Tracer"
	,"dzn_10Rnd_9x19_Bulk"
	,"dzn_10Rnd_9x19_Bulk_Tracer"
	,"dzn_10Rnd_45ACP_Bulk"
	,"dzn_10Rnd_45ACP_Bulk_Tracer"
	,"1Rnd_HE_Grenade_shell"
];