#define LIST(NAME)		dzn_10Rnd_##NAME##_Bulk
#define	LIST_T(NAME)	dzn_10Rnd_##NAME##_Bulk_Tracer

class CfgPatches
{
	class dzn_MMR
	{
		units[] = {};
		weapons[] = {
			"dzn_Placeholder_Small"
			,"dzn_Placeholder_Medium"
			,"dzn_Placeholder_Big"
		};
		magazines[] = {
			/* Rifle ammo */
			LIST(556x45)
			, LIST_T(556x45)
			, LIST(762x51)
			, LIST_T(762x51)
			, LIST(545x39)
			, LIST_T(545x39)
			, LIST(762x39)
			, LIST_T(762x39)
			, LIST(762x54)
			, LIST_T(762x54)

			/* Pistol ammo */
			, LIST(9x19)
			, LIST_T(9x19)
			, LIST(45ACP)
			, LIST_T(45ACP)
			, LIST(9x21)
			, LIST_T(9x21)

			/* Other ammo */
			, LIST(9x39_SP5)
			, LIST(9x39_SP6)
			, LIST(12ga)
			, LIST(12slug)

			/* Placeholder ammo */
			, LIST(65x39_NATO_Caseless)
			, LIST_T(65x39_NATO_Caseless)
			, LIST(65x39_Caseless)
			, LIST_T(65x39_Caseless)
			, LIST(58x42)
			, LIST_T(58x42)
			, LIST(93x64)
			, LIST_T(93x64)
			, LIST(127x54)
			, LIST_T(127x54)
			, LIST(338Lapua)
			, LIST_T(338Lapua)
			, LIST(127x108)
			, LIST_T(127x108)
			, LIST(127x99)
			, LIST_T(127x99)
			, LIST(46x30)
			, LIST_T(46x30)

		};
		requiredVersion = 0.1;
		requiredAddons[] = {"CBA_MAIN"};
		author[] = {"10Dozen"};
		version = "0.1";
	};
};

class Extended_PreInit_EventHandlers
{
	class dzn_MMR_PreInit
	{
		init = "call ('\dzn_MMR\Init.sqf' call SLX_XEH_COMPILE)";
	};
};

#include "ui\baseDialogClasses.hpp"
#include "ui\dzn_MMR_UI_Dialog.hpp"
#include "ui\dzn_MMR_UI_Map.hpp"

class CfgWeapons
{
	#define PH_MASS(X)		class ItemInfo { mass = X; }

	class ItemWatch;
	class dzn_Placeholder_Small: ItemWatch
	{
		author = "10Dozen";
		displayName = "Some sleeping ice fairy";
		descriptionShort = "You were lucky enough to meet a sleeping fairy in your pocket. Do not wake her up, but gently lay it in a cool place, away from direct sunlight!";
		picture = "\dzn_MMR\icon\Placeholder.paa";
		scope = 1;
		PH_MASS(2);
	};
	class dzn_Placeholder_Medium: dzn_Placeholder_Small
	{
		PH_MASS(10);
	};
	class dzn_Placeholder_Big: dzn_Placeholder_Small
	{
		PH_MASS(25);
	};
};
 
class CfgMagazines
{
	class 30Rnd_556x45_Stanag;
	class dzn_Default_Bulk: 30Rnd_556x45_Stanag
	{
		scope = 0;
		count = 10;
		displayName = "";
		descriptionShort = "";
		picture = "";
		tracersEvery = 0;
	};
	class dzn_Default_Bulk_Tracer: dzn_Default_Bulk
	{
		tracersEvery = 1;
	};

	// Macroses
	#define MMR_CLASS(NAME,MASS,FILTER)	class dzn_10Rnd_##NAME##_Bulk: dzn_Default_Bulk \
	{ \
		scope = 2; \
		displayName = $STR_MMR_##NAME##_Bulk; \
		descriptionShort = $STR_MMR_##NAME##_Bulk_Desc; \
		mass = MASS; \
		picture = \dzn_MMR\icon\NAME##_Bulk.paa; \
		dzn_MMR_searchFilter = NAME|FILTER; \
	}
	#define MMR_CLASS_T(NAME,MASS,FILTER)	class dzn_10Rnd_##NAME##_Bulk_Tracer: dzn_Default_Bulk_Tracer \
	{ \
		scope = 2; \
		displayName = $STR_MMR_##NAME##_Bulk_Tracer; \
		descriptionShort = $STR_MMR_##NAME##_Bulk_Tracer_Desc; \
		mass = MASS; \
		picture = \dzn_MMR\icon\NAME##_Bulk_Tracer.paa; \
		dzn_MMR_searchFilter = NAME|FILTER; \
	}

	// 	Rifle ammunition
	//	5.56x45mm / NATO 
	MMR_CLASS(556x45, 3, 5.56|5.56x45);
	MMR_CLASS_T(556x45, 3, 5.56|5.56x45);

	//	7.62x51mm / NATO
	MMR_CLASS(762x51, 4.5, 7.62x51);
	MMR_CLASS_T(762x51, 4.5, 7.62x51);

	//	5.45x39mm / Russian
	MMR_CLASS(545x39, 3, 5.45|5.45x39);
	MMR_CLASS_T(545x39, 3, 5.45|5.45x39);

	//	7.62x39mm / Russian
	MMR_CLASS(762x39, 4, 7.62x39);
	MMR_CLASS_T(762x39, 4, 7.62x39);

	//	7.62x54mmR / Russian
	MMR_CLASS(762x54, 4.5, 7.62x54);
	MMR_CLASS_T(762x54, 4.5, 7.62x54);

	//	Pistol ammunition
	//	9x19mm Para
	MMR_CLASS(9x19, 2, 9x19|Para);
	MMR_CLASS_T(9x19, 2, 9x19|Para);

	//	.45ACP
	MMR_CLASS(45ACP, 2.5, .45|ACP);
	MMR_CLASS_T(45ACP, 2.5, .45|ACP);

	//	9x21mm (Arma 3 only)
	MMR_CLASS(9x21, 2, 9x21mm);
	MMR_CLASS_T(9x21, 2, 9x21mm);

	//	Other ammunition (sniper, shotgun, caseless, etc.)
	//	9x39mm SP-5
	MMR_CLASS(9x39_SP5, 4, 9x39mm|SP5|SP-5|СП-5|СП5);

	//	9x39mm SP-6
	MMR_CLASS(9x39_SP6, 4, 9x39mm|SP6|SP-6|СП-6|СП6);

	//	12 Gauge Pellets
	MMR_CLASS(12ga, 3, Pellets|Buckshot|Дробь);

	//	12 Gauge Slug
	MMR_CLASS(12slug, 3, Slug|Пуля);

	//	Ammunition with placeholders
	//	Macroses
	#define MMR_PH_CASED(NAME,MASS,FILTER)	class dzn_10Rnd_##NAME##_Bulk: dzn_Default_Bulk \
	{ \
		scope = 2; \
		displayName = $STR_MMR_##NAME##_Bulk; \
		descriptionShort = $STR_MMR_##NAME##_Bulk_Desc; \
		mass = MASS; \
		picture = \dzn_MMR\icon\Placeholder_Cased.paa; \
		dzn_MMR_searchFilter = NAME|FILTER; \
	}
	#define MMR_PH_CASED_T(NAME,MASS,FILTER)	class dzn_10Rnd_##NAME##_Bulk_Tracer: dzn_Default_Bulk_Tracer \
	{ \
		scope = 2; \
		displayName = $STR_MMR_##NAME##_Bulk_Tracer; \
		descriptionShort = $STR_MMR_##NAME##_Bulk_Tracer_Desc; \
		mass = MASS; \
		picture = \dzn_MMR\icon\Placeholder_Cased.paa; \
		dzn_MMR_searchFilter = NAME|FILTER; \
	}
	#define MMR_PH_CASELESS(NAME,MASS,FILTER)	class dzn_10Rnd_##NAME##_Bulk: dzn_Default_Bulk \
	{ \
		scope = 2; \
		displayName = $STR_MMR_##NAME##_Bulk; \
		descriptionShort = $STR_MMR_##NAME##_Bulk_Desc; \
		mass = MASS; \
		picture = \dzn_MMR\icon\Placeholder_Caseless.paa; \
		dzn_MMR_searchFilter = NAME|FILTER; \
	}
	#define MMR_PH_CASELESS_T(NAME,MASS,FILTER)	class dzn_10Rnd_##NAME##_Bulk_Tracer: dzn_Default_Bulk_Tracer \
	{ \
		scope = 2; \
		displayName = $STR_MMR_##NAME##_Bulk_Tracer; \
		descriptionShort = $STR_MMR_##NAME##_Bulk_Tracer_Desc; \
		mass = MASS; \
		picture = \dzn_MMR\icon\Placeholder_Caseless.paa; \
		dzn_MMR_searchFilter = NAME|FILTER; \
	}
	
	//	6.5x39mm STANAG Caseless (MX rifles) (Arma 3)
	MMR_PH_CASELESS(65x39_NATO_Caseless, 2, 6.5x39);
	MMR_PH_CASELESS_T(65x39_NATO_Caseless, 2, 6.5x39);

	//	6.5x39mm CSAT Caseless (Arma 3)
	MMR_PH_CASELESS(65x39_Caseless, 2, 6.5x39);
	MMR_PH_CASELESS_T(65x39_Caseless, 2, 6.5x39);

	//	5.8x42 mm (Arma 3)
	MMR_PH_CASED(58x42, 3.5, 5.8x42);
	MMR_PH_CASED_T(58x42, 3.5, 5.8x42);
	
	// 	9.3x64mm (Arma 3)
	MMR_PH_CASED(93x64, 4.5, 9.3x64);
	MMR_PH_CASED_T(93x64, 4.5, 9.3x64);

	//	12.7x54mm (Arma 3)
	MMR_PH_CASED(127x54, 5, 12.7x54);
	MMR_PH_CASED_T(127x54, 5, 12.7x54);

	//	.338 Lapua
	MMR_PH_CASED(338Lapua, 3.5, .338|Lapua);
	MMR_PH_CASED_T(338Lapua, 3.5, .338|Lapua);

	//	12.7x108mm R
	MMR_PH_CASED(127x108, 6, 12.7x108);
	MMR_PH_CASED_T(127x108, 6, 12.7x108);

	//	12.7x99mm NATO
	MMR_PH_CASED(127x99, 6, .50|12.7x99|BMG);
	MMR_PH_CASED_T(127x99, 6, .50|12.7x99|BMG);

	//	4.6x30mm (MP7)
	MMR_PH_CASED(46x30, 2, 4.6);
	MMR_PH_CASED_T(46x30, 2, 4.6);

};

	
/*
	7.62x39	-	700
	7.62x51	-	220
	5.45x39 	-	1080
	5.56x45 	-	(metalbox) 420  / 840  / (paperbox) 1200
	7.62x51 	-	(metalbox) 420
*/