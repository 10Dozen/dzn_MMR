/* 	
	- Mapping contains Bulk Ammo mapped.
	- Bulk Ammo (dzn_10Rnd_556x45_Bulk) may be packed to any of the listed magazine.
	- Bulk Ammo (dzn_10Rnd_556x45_Bulk) may be packed to any magazine from the list that compatible with current player's weapon:
		first magazine listed both in weapon's magazines[] config & mapping is used by default,
		e.g. for RHS M249 compatible are ["rhsusf_100Rnd_556x45_M855_soft_pouch", "rhs_200rnd_556x45_M_SAW"] --> "rhs_200rnd_556x45_M_SAW" (according to weapons config)
	- All listed magazines (e.g. 30Rnd_556x45_Stanag) may be unpacked to Bulk ammo (dzn_10Rnd_556x45_Bulk).
	- All listed magazines (e.g. 30Rnd_556x45_Stanag) may be repacked using Bulk ammo (dzn_10Rnd_556x45_Bulk). 
*/

#include "macro.hpp"

GVAR(Map) = [

/*		5.56x45mm NATO */
[
"dzn_10rnd_556x45_bulk"
,"30rnd_556x45_stanag"
,"30rnd_556x45_stanag_green"
,"30rnd_556x45_stanag_red"
,"20rnd_556x45_uw_mag"
,"cup_30rnd_556x45_stanag"
,"cup_20rnd_556x45_stanag"
,"cup_30rnd_556x45_g36"
,"cup_100rnd_556x45_betacmag"
,"cup_200rnd_te4_green_tracer_556x45_m249"
,"cup_200rnd_te4_red_tracer_556x45_m249"
,"cup_200rnd_te4_yellow_tracer_556x45_m249"
,"cup_100rnd_te4_green_tracer_556x45_m249"
,"cup_100rnd_te4_red_tracer_556x45_m249"
,"cup_100rnd_te4_yellow_tracer_556x45_m249"
,"cup_200rnd_te4_green_tracer_556x45_l110a1"
,"cup_200rnd_te4_red_tracer_556x45_l110a1"
,"cup_200rnd_te4_yellow_tracer_556x45_l110a1"
,"rhs_mag_30rnd_556x45_m855a1_stanag"
,"rhs_mag_30rnd_556x45_m855a1_stanag_no_tracer"
,"rhs_mag_30rnd_556x45_m855_stanag"
,"rhs_mag_30rnd_556x45_mk318_stanag"
,"rhs_mag_30rnd_556x45_mk262_stanag"
,"rhs_mag_30rnd_556x45_m200_stanag"
,"rhsusf_100rnd_556x45_soft_pouch"
,"rhsusf_100rnd_556x45_m855_soft_pouch"
,"rhsusf_100rnd_556x45_m200_soft_pouch"
,"rhsusf_200rnd_556x45_soft_pouch"
,"rhsusf_200rnd_556x45_m855_soft_pouch"
,"rhs_200rnd_556x45_m_saw"
,"rhs_200rnd_556x45_b_saw"
,"150rnd_556x45_drum_mag_f"
,"200rnd_556x45_box_f"
,"200rnd_556x45_box_red_f"
,"ace_30rnd_556x45_stanag_m995_ap_mag"
,"ace_30rnd_556x45_stanag_mk262_mag"
,"ace_30rnd_556x45_stanag_mk318_mag"
]

/*		5.56x45mm NATO Tracer  */
, [
"dzn_10rnd_556x45_bulk_tracer"
,"30rnd_556x45_stanag_tracer_red"
,"30rnd_556x45_stanag_tracer_green"
,"30rnd_556x45_stanag_tracer_yellow"
,"cup_30rnd_te1_red_tracer_556x45_g36"
,"cup_30rnd_te1_green_tracer_556x45_g36"
,"cup_30rnd_te1_yellow_tracer_556x45_g36"
,"cup_100rnd_te1_red_tracer_556x45_betacmag"
,"cup_100rnd_te1_green_tracer_556x45_betacmag"
,"cup_100rnd_te1_yellow_tracer_556x45_betacmag"
,"cup_200rnd_te1_red_tracer_556x45_m249"
,"rhs_mag_30rnd_556x45_m855a1_stanag_tracer_red"
,"rhs_mag_30rnd_556x45_m855a1_stanag_tracer_green"
,"rhs_mag_30rnd_556x45_m855a1_stanag_tracer_yellow"
,"rhs_mag_30rnd_556x45_m855a1_stanag_tracer_orange"
,"rhs_mag_30rnd_556x45_m855_stanag_tracer_red"
,"rhs_mag_30rnd_556x45_m855_stanag_tracer_green"
,"rhs_mag_30rnd_556x45_m855_stanag_tracer_yellow"
,"rhs_mag_30rnd_556x45_m855_stanag_tracer_orange"
,"rhs_200rnd_556x45_t_saw"
,"150rnd_556x45_drum_mag_tracer_f"
,"200rnd_556x45_box_tracer_f"
,"200rnd_556x45_box_tracer_red_f"
,"ace_30rnd_556x45_stanag_tracer_dim"
]

/*		7.62x51mm NATO */
, [
"dzn_10rnd_762x51_bulk"
,"20rnd_762x51_mag"
,"150rnd_762x51_box"
,"10rnd_762x51_mag"
,"cup_20rnd_762x51_fnfal_m"
,"cup_20rnd_762x51_l129_m"
,"cup_20rnd_762x51_b_scar"
,"cup_20rnd_762x51_cz805b"
,"cup_100rnd_te4_lrt4_white_tracer_762x51_belt_m"
,"cup_100rnd_te4_lrt4_red_tracer_762x51_belt_m"
,"cup_200rnd_te4_lrt4_white_tracer_762x51_belt_m"
,"cup_200rnd_te4_lrt4_red_tracer_762x51_belt_m"
,"cup_100rnd_te4_lrt4_green_tracer_762x51_belt_m"
,"cup_100rnd_te4_lrt4_yellow_tracer_762x51_belt_m"
,"cup_5rnd_762x51_m24"
,"cup_20rnd_762x51_b_m110"
,"cup_10rnd_762x51_cz750"
,"rhsusf_50rnd_762x51"
,"rhsusf_50rnd_762x51_m61_ap"
,"rhsusf_50rnd_762x51_m80a1epr"
,"rhsusf_50rnd_762x51_m82_blank"
,"rhsusf_100rnd_762x51"
,"rhsusf_100rnd_762x51_m61_ap"
,"rhsusf_100rnd_762x51_m80a1epr"
,"rhsusf_100rnd_762x51_m82_blank"
,"rhsusf_20rnd_762x51_m118_special_mag"
,"rhsusf_20rnd_762x51_m993_mag"
,"rhsusf_5rnd_762x51_m118_special_mag"
,"rhsusf_5rnd_762x51_m993_mag"
,"rhsusf_10rnd_762x51_m118_special_mag"
,"rhsusf_10rnd_762x51_m993_mag"
,"ace_20rnd_762x51_mag_sd"
,"ace_10rnd_762x51_m118lr_mag"
,"ace_10rnd_762x51_mk316_mod_0_mag"
,"ace_10rnd_762x51_mk319_mod_0_mag"
,"ace_10rnd_762x51_m993_ap_mag"
,"ace_20rnd_762x51_m118lr_mag"
,"ace_20rnd_762x51_mk316_mod_0_mag"
,"ace_20rnd_762x51_mk319_mod_0_mag"
,"ace_20rnd_762x51_m993_ap_mag"
]
    
/*		7.62x51mm NATO Tracers  */
, [
"dzn_10rnd_762x51_bulk_tracer"
,"150rnd_762x51_box_tracer"
,"cup_20rnd_te1_yellow_tracer_762x51_scar"
,"cup_20rnd_te1_red_tracer_762x51_scar"
,"cup_20rnd_te1_green_tracer_762x51_scar"
,"cup_20rnd_te1_white_tracer_762x51_scar"
,"cup_20rnd_te1_yellow_tracer_762x51_cz805b"
,"cup_20rnd_te1_red_tracer_762x51_cz805b"
,"cup_20rnd_te1_green_tracer_762x51_cz805b"
,"cup_20rnd_te1_white_tracer_762x51_cz805b"
,"cup_200rnd_te1_lrt4_red_tracer_762x51_belt_m"
,"cup_20rnd_te1_yellow_tracer_762x51_m110"
,"cup_20rnd_te1_red_tracer_762x51_m110"
,"cup_20rnd_te1_green_tracer_762x51_m110"
,"cup_20rnd_te1_white_tracer_762x51_m110"
,"cup_10rnd_762x51_cz750_tracer"
,"rhsusf_50rnd_762x51_m62_tracer"
,"rhsusf_100rnd_762x51_m62_tracer"
,"rhsusf_20rnd_762x51_m62_mag"
,"rhsusf_5rnd_762x51_m62_mag"
,"rhsusf_10rnd_762x51_m62_mag"
,"ace_20rnd_762x51_mag_tracer"
,"ace_20rnd_762x51_mag_tracer_dim"
]

/*		5.45x39mm Russian */
, [
"dzn_10rnd_545x39_bulk"
,"cup_30rnd_545x39_ak_m"
,"cup_30rnd_subsonic_545x39_ak_m"
,"cup_75rnd_te4_lrt4_green_tracer_545x39_rpk_m"
,"cup_45rnd_te4_lrt4_green_tracer_545x39_rpk_m"
,"rhs_30rnd_545x39_ak"
,"rhs_30rnd_545x39_ak_no_tracers"
,"rhs_30rnd_545x39_7n6_ak"
,"rhs_30rnd_545x39_7n10_ak"
,"rhs_30rnd_545x39_7n22_ak"
,"rhs_30rnd_545x39_7u1_ak"
,"rhs_45rnd_545x39_7n22_ak"
,"rhs_45rnd_545x39_7n10_ak"
,"rhs_45rnd_545x39_7n6_ak"
,"rhs_45rnd_545x39_ak"
,"rhs_45rnd_545x39_7u1_ak"
,"30rnd_545x39_mag_f"
,"30rnd_545x39_mag_green_f"
]

/*		5.45x39mm Russian Tracer  */
, [
"dzn_10rnd_545x39_bulk_tracer"
,"cup_30rnd_te1_green_tracer_545x39_ak_m"
,"cup_30rnd_te1_red_tracer_545x39_ak_m"
,"cup_30rnd_te1_white_tracer_545x39_ak_m"
,"cup_30rnd_te1_yellow_tracer_545x39_ak_m"
,"rhs_30rnd_545x39_ak_green"
,"rhs_45rnd_545x39_ak_green"
,"30rnd_545x39_mag_tracer_f"
,"30rnd_545x39_mag_tracer_green_f"
]

/*		7.62x39mm Russian */
, [
"dzn_10rnd_762x39_bulk"
,"cup_30rnd_762x39_ak47_m"
,"cup_30rnd_sa58_m"
,"rhs_30rnd_762x39mm"
,"rhs_30rnd_762x39mm_89"
,"rhs_30rnd_762x39mm_u"
,"30rnd_762x39_mag_f"
,"30rnd_762x39_mag_green_f"
]

/*		7.62x39mm Russian Tracer */
, [
"dzn_10rnd_762x39_bulk_tracer"
,"cup_30rnd_sa58_m_tracerg"
,"rhs_30rnd_762x39mm_tracer"
,"30rnd_762x39_mag_tracer_f"
,"30rnd_762x39_mag_tracer_green_f"
]

/*		7.62x54mm Russian */
, [
"dzn_10rnd_762x54_bulk"
,"150rnd_762x51_box"
,"150rnd_762x54_box"
,"10rnd_762x51_mag"
,"10rnd_762x54_mag"
,"cup_100rnd_te4_lrt4_762x54_pk_tracer_green_m"
,"cup_100rnd_te4_lrt4_762x54_pk_tracer_red_m"
,"cup_100rnd_te4_lrt4_762x54_pk_tracer_yellow_m"
,"cup_50rnd_uk59_762x54r_tracer"
,"cup_10rnd_762x54_svd_m"
,"rhs_100rnd_762x54mmr"
,"rhs_100rnd_762x54mmr_7n13"
,"rhs_100rnd_762x54mmr_7n26"
,"rhs_100rnd_762x54mmr_7bz3"
,"rhs_10rnd_762x54mmr_7n1"
]

/*		7.62x54mm Russian Tracer  */
, [
"dzn_10rnd_762x54_bulk_tracer"
,"150rnd_762x51_box_tracer"
,"150rnd_762x54_box_tracer"
,"rhs_100rnd_762x54mmr_green"
,"ace_10rnd_762x54_tracer_mag"
]

/*		9x19mm Parabellum */
, [
"dzn_10rnd_9x19_bulk"
,"cup_30rnd_9x19_mp5"
,"cup_30rnd_9x19_evo"
,"cup_30rnd_9x19_uzi"
,"cup_17rnd_9x19_glock17"
,"cup_10rnd_9x19_compact"
,"cup_18rnd_9x19_phantom"
,"cup_15rnd_9x19_m9"
,"rhs_mag_9x19_17"
,"rhs_mag_9x19mm_7n21_20"
,"rhs_mag_9x19mm_7n31_20"
,"rhs_mag_9x19mm_7n21_44"
,"rhs_mag_9x19mm_7n31_44"
,"rhsusf_mag_17rnd_9x19_fmj"
,"rhsusf_mag_17rnd_9x19_jhp"
,"rhsusf_mag_15rnd_9x19_fmj"
,"rhsusf_mag_15rnd_9x19_jhp"
,"ace_16rnd_9x19_mag"
]
/*		9x19mm Parabellum Tracer */

/*		.45 ACP */
, [
"dzn_10rnd_45acp_bulk"
,"30rnd_45acp_mag_smg_01"
,"9rnd_45acp_mag"
,"11rnd_45acp_mag"
,"6rnd_45acp_cylinder"
,"cup_6rnd_45acp_m"
,"cup_7rnd_45acp_1911"
,"rhsusf_mag_7x45acp_mhp"
]

/*		.45 ACP Tracer */
, [
"dzn_10rnd_45acp_bulk_tracer"
,"30rnd_45acp_mag_smg_01_tracer_green"
,"30rnd_45acp_mag_smg_01_tracer_red"
,"30rnd_45acp_mag_smg_01_tracer_yellow"
]

/*		9x21mm */
, [
"dzn_10rnd_9x21_bulk"
,"30rnd_9x21_mag"
,"30rnd_9x21_red_mag"
,"30rnd_9x21_yellow_mag"
,"30rnd_9x21_green_mag"
,"16rnd_9x21_mag"
,"30rnd_9x21_mag_smg_02"
,"30rnd_9x21_mag_smg_02_tracer_red"
,"30rnd_9x21_mag_smg_02_tracer_yellow"
,"30rnd_9x21_mag_smg_02_tracer_green"
,"16rnd_9x21_red_mag"
,"16rnd_9x21_green_mag"
,"16rnd_9x21_yellow_mag"
,"10rnd_9x21_mag"
]

/*		9x39mm SP-5 */
,[
"dzn_10rnd_9x39_sp5_bulk"
,"cup_10rnd_9x39_sp5_vss_m"
,"cup_20rnd_9x39_sp5_vss_m"
,"rhs_20rnd_9x39mm_sp5"
,"rhs_10rnd_9x39mm_sp5"
]

/*		9x39mm SP-6 */
,[
"dzn_10rnd_9x39_sp6_bulk"
,"rhs_20rnd_9x39mm_sp6"
,"rhs_10rnd_9x39mm_sp6"
]

/*		.12 ga Buck/Pellets */
,[
"dzn_10rnd_12ga_bulk"
,"cup_8rnd_b_saiga12_74pellets_m"
,"cup_20rnd_b_aa12_pellets"
,"cup_8rnd_b_beneli_74pellets"
,"rhsusf_5rnd_00buck"
,"rhsusf_8rnd_00buck"
]

/*		.12 ga Slug */
,[
"dzn_10rnd_12slug_bulk"
,"cup_8rnd_b_saiga12_74slug_m"
,"cup_20rnd_b_aa12_74slug"
,"cup_8rnd_b_beneli_74slug"
,"rhsusf_5rnd_slug"
,"rhsusf_8rnd_slug"
]

/*		6.5x39mm NATO (Caseless) */
,["dzn_10rnd_65x39_nato_caseless_bulk"
,"30rnd_65x39_caseless_mag"
,"100rnd_65x39_caseless_mag"
,"200rnd_65x39_cased_box"]

/*		6.5x39mm NATO (Caseless) Tracer */
,["dzn_10rnd_65x39_nato_caseless_bulk_tracer"
,"30rnd_65x39_caseless_mag_tracer"
,"100rnd_65x39_caseless_mag_tracer"
,"200rnd_65x39_cased_box_tracer"
,"ace_30rnd_65x39_caseless_mag_tracer_dim"]

/*		6.5x39 CSAT (Caseless) */
,["dzn_10rnd_65x39_caseless_bulk"
,"30rnd_65x39_caseless_green"
,"30rnd_65x39_caseless_green_tracer"]

/*		6.5x39 CSAT (Caseless) Tracer */
,["dzn_10rnd_65x39_caseless_bulk_tracer"
,"ace_30rnd_65x39_caseless_green_mag_tracer_dim"
,"30rnd_65x39_caseless_green_mag_tracer"]

/*		5.8x42mm */
,["dzn_10rnd_58x42_bulk"
,"30rnd_580x42_mag_f"
,"100rnd_580x42_mag_f"]

/*		5.8x42mm Tracer */
,["dzn_10rnd_58x42_bulk_tracer"
,"30rnd_580x42_mag_tracer_f"
,"100rnd_580x42_mag_tracer_f"]

/*		9.3x64mm */
,["dzn_10rnd_93x64_bulk"
,"150rnd_93x64_mag"
,"10rnd_93x64_dmr_05_mag"]

/*		12.7x54mm */
,["dzn_10rnd_127x54_bulk"
,"10rnd_127x54_mag"]

/*		.338 Lapua */
,["dzn_10rnd_338lapua_bulk"
,"cup_5rnd_86x70_l115a1"
,"cup_5rnd_762x67_g22"
,"10rnd_338_mag"
,"130rnd_338_mag"
,"rhs_5rnd_338lapua_t5000"
,"200rnd_338_mag"
,"ace_10rnd_338_300gr_hpbt_mag"
,"ace_10rnd_338_api526_mag"]

/*		12.7x108mm */
,["dzn_10rnd_127x108_bulk"
,"5rnd_127x108_mag"
,"5rnd_127x108_apds_mag"
,"cup_5rnd_127x108_ksvk_m"]

/*		12.7x99mm */
,["dzn_10rnd_127x99_bulk"
,"cup_5rnd_127x99_as50_m"
,"cup_10rnd_127x99_m107"
,"rhsusf_mag_10rnd_std_50bmg_m33"
,"rhsusf_mag_10rnd_std_50bmg_mk211"
,"10rnd_50bw_mag_f"
,"ace_5rnd_127x99_mag"
,"ace_5rnd_127x99_api_mag"
,"ace_5rnd_127x99_amax_mag"]

/*		4.6x30mm (MP7) */
,["dzn_10rnd_46x30_bulk"
,"rhsusf_mag_40rnd_46x30_fmj"
,"rhsusf_mag_40rnd_46x30_jhp"
,"rhsusf_mag_40rnd_46x30_ap"]

/*	RPG-7 PG-7V Exchange options example
	Mapping DOES NOT contain Bulk Ammo mapped.
	All listed magazines (e.g. RPG7_F) may be exchanged to any listed magazine (e.g. rhs_rpg7_PG7VL_mag)

,[
	"RPG7_F"
	, "rhs_rpg7_PG7V_mag"
]
*/
];

GVAR(Bulk) = getArray (configFile >> "CfgPatches" >> "dzn_MMR" >> "magazines") + ["Exchange_Mapping_Placeholder"];