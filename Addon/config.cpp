#define LIST(NAME)		QUOTE(dzn_10Rnd_##NAME##_Bulk)
#define	LIST_T(NAME)	QUOTE(dzn_10Rnd_##NAME##_Bulk_Tracer)

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
	#define	MASS_BOX	120

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
	#define MMR_CLASS(NAME,MASS)	class dzn_10Rnd_##NAME##_Bulk: dzn_Default_Bulk \
	{ \
		scope = 2; \
		displayName = $STR_MMR_##NAME##_Bulk; \
		descriptionShort = $STR_MMR_##NAME##_Bulk_Desc; \
		mass = MASS; \
		picture = \dzn_MMR\icon\NAME##_Bulk.paa; \
	}
	#define MMR_CLASS_T(NAME,MASS)	class dzn_10Rnd_##NAME##_Bulk_Tracer: dzn_Default_Bulk_Tracer \
	{ \
		scope = 2; \
		displayName = $STR_MMR_##NAME##_Bulk_Tracer; \
		descriptionShort = $STR_MMR_##NAME##_Bulk_Desc; \
		mass = MASS; \
		picture = \dzn_MMR\icon\NAME##_Bulk_Tracer.paa; \
	}

	// 	Rifle ammunition
	//	5.56x45mm / NATO 
	MMR_CLASS(556x45, 3);
	MMR_CLASS_T(556x45, 3);

	//	7.62x51mm / NATO
	MMR_CLASS(762x51, 4.5);
	MMR_CLASS_T(762x51, 4.5);

	//	5.45x39mm / Russian
	MMR_CLASS(545x39, 3);
	MMR_CLASS_T(545x39, 3);

	//	7.62x39mm / Russian
	MMR_CLASS(762x39, 4);
	MMR_CLASS_T(762x39, 4);

	//	7.62x54mmR / Russian
	MMR_CLASS(762x54, 4.5);
	MMR_CLASS_T(762x54, 4.5);

	//	Pistol ammunition
	//	9x19mm Para
	MMR_CLASS(9x19, 2);
	MMR_CLASS_T(9x19, 2);

	//	.45ACP
	MMR_CLASS(45ACP, 2.5);
	MMR_CLASS_T(45ACP, 2.5);

	//	9x21mm (Arma 3 only)
	MMR_CLASS(9x21, 2);
	MMR_CLASS_T(9x21, 2);

	//	Other ammunition (sniper, shotgun, caseless, etc.)
	//	9x39mm SP-5
	MMR_CLASS(9x39_SP5, 4);

	//	9x39mm SP-6
	MMR_CLASS(9x39_SP6, 4);

	//	12 Gauge Pellets
	MMR_CLASS(12ga, 3);

	//	12 Gauge Slug
	MMR_CLASS(12slug, 3);

	//	Ammunition with placeholders
	//	Macroses
	#define MMR_PH_CASED(NAME,MASS)	class dzn_10Rnd_##NAME##_Bulk: dzn_Default_Bulk \
	{ \
		scope = 2; \
		displayName = $STR_MMR_##NAME##_Bulk; \
		descriptionShort = $STR_MMR_##NAME##_Bulk_Desc; \
		mass = MASS; \
		picture = \dzn_MMR\icon\Placeholder_Cased.paa; \
	}
	#define MMR_PH_CASED_T(NAME,MASS)	class dzn_10Rnd_##NAME##_Bulk_Tracer: dzn_Default_Bulk \
	{ \
		scope = 2; \
		displayName = $STR_MMR_##NAME##_Bulk_Tracer; \
		descriptionShort = $STR_MMR_##NAME##_Bulk_Tracer_Desc; \
		mass = MASS; \
		picture = \dzn_MMR\icon\Placeholder_Cased.paa; \
	}
	#define MMR_PH_CASELESS(NAME,MASS)	class dzn_10Rnd_##NAME##_Bulk: dzn_Default_Bulk \
	{ \
		scope = 2; \
		displayName = $STR_MMR_##NAME##_Bulk; \
		descriptionShort = $STR_MMR_##NAME##_Bulk_Desc; \
		mass = MASS; \
		picture = \dzn_MMR\icon\Placeholder_Caseless.paa; \
	}
	#define MMR_PH_CASELESS_T(NAME,MASS)	class dzn_10Rnd_##NAME##_Bulk_Tracer: dzn_Default_Bulk \
	{ \
		scope = 2; \
		displayName = $STR_MMR_##NAME##_Bulk_Tracer; \
		descriptionShort = $STR_MMR_##NAME##_Bulk_Tracer_Desc; \
		mass = MASS; \
		picture = \dzn_MMR\icon\Placeholder_Caseless.paa; \
	}
	
	//	6.5x39mm STANAG Caseless (MX rifles) (Arma 3)
	MMR_PH_CASELESS(65x39_NATO_Caseless, 2);
	MMR_PH_CASELESS_T(65x39_NATO_Caseless, 2);

	//	6.5x39mm CSAT Caseless (Arma 3)
	MMR_PH_CASELESS(65x39_Caseless, 2);
	MMR_PH_CASELESS_T(65x39_Caseless, 2);

	//	5.8x42 mm (Arma 3)
	MMR_PH_CASED(58x42,3.5);
	MMR_PH_CASED_T(58x42,3.5);
	
	// 	9.3x64mm (Arma 3)
	MMR_PH_CASED(93x64,4.5);
	MMR_PH_CASED_T(93x64,4.5);

	//	12.7x54mm (Arma 3)
	MMR_PH_CASED(127x54,5);
	MMR_PH_CASED_T(127x54,5);

	//	.338 Lapua
	MMR_PH_CASED(338Lapua,3.5);
	MMR_PH_CASED_T(338Lapua,3.5);

	//	12.7x108mm R
	MMR_PH_CASED(127x108,6);
	MMR_PH_CASED_T(127x108,6);

	//	12.7x99mm NATO
	MMR_PH_CASED(127x99,6);
	MMR_PH_CASED_T(127x99,6);

	//	4.6x30mm (MP7)
	MMR_PH_CASED(46x30,2);
	MMR_PH_CASED_T(46x30,2);

};




/*
	//	5.56x45mm / NATO 
	class dzn_10Rnd_556x45_Bulk: 30Rnd_556x45_Stanag
	{
		author = "10Dozen";
		count = 10;
		displayName = "5.56x45mm Ammunition";
		descriptionShort = "Caliber: 5.56x45mm<br />Rounds: 10";
		picture = "\dzn_MMR\icon\556x45mm_Bulk.paa";		
		scope = 2;
		mass = 3;
		dzn_ammoType = "BALL";
	};
	class dzn_10Rnd_556x45_Bulk_Tracer: dzn_10Rnd_556x45_Bulk
	{
		displayName = "5.56x45mm Ammunition (Tracers)";
		descriptionShort = "Caliber: 5.56x45mm<br />Rounds: 10<br />Contains tracer rounds";
		picture = "\dzn_MMR\icon\556x45mm_Bulk_Tracer.paa";
		tracersEvery = 1;
	};

	//	7.62x51mm / NATO
	class dzn_10Rnd_762x51_Bulk: dzn_10Rnd_556x45_Bulk
	{
		displayName = "7.62x51mm Ammunition";
		descriptionShort = "Caliber: 7.62x51mm<br />Rounds: 10";
		mass = 4.5;
		picture = "\dzn_MMR\icon\762x51mm_Bulk.paa";
	};
	class dzn_10Rnd_762x51_Bulk_Tracer: dzn_10Rnd_556x45_Bulk_Tracer
	{
		displayName = "7.62x51mm Ammunition (Tracers)";
		descriptionShort = "Caliber: 7.62x51mm<br />Rounds: 10<br />Contains tracer rounds";
		picture = "\dzn_MMR\icon\762x51mm_Bulk_Tracer.paa";
	};

	//	5.45x39mm / Russian
	class dzn_10Rnd_545x39_Bulk: dzn_10Rnd_556x45_Bulk
	{
		displayName = "5.45x39mm Ammunition";
		descriptionShort = "Caliber: 5.45x39mm<br />Rounds: 10";
		mass = 3;
		picture = "\dzn_MMR\icon\545x39mm_Bulk.paa";
	};
	class dzn_10Rnd_545x39_Bulk_Tracer: dzn_10Rnd_556x45_Bulk_Tracer
	{
		displayName = "5.45x39mm Ammunition (Tracers)";
		descriptionShort = "Caliber: 5.45x39mm<br />Rounds: 10<br />Contains tracer rounds";
		picture = "\dzn_MMR\icon\545x39mm_Bulk_Tracer.paa";
	};

	//	7.62x39mm / Russian
	class dzn_10Rnd_762x39_Bulk: dzn_10Rnd_556x45_Bulk
	{
		displayName = "7.62x39mm Ammunition";
		descriptionShort = "Caliber: 7.62x39mm<br />Rounds: 10";
		mass = 4;
		picture = "\dzn_MMR\icon\762x39mm_Bulk.paa";
	};
	class dzn_10Rnd_762x39_Bulk_Tracer: dzn_10Rnd_556x45_Bulk_Tracer
	{
		displayName = "7.62x39mm Ammunition (Tracers)";
		descriptionShort = "Caliber: 7.62x39mm<br />Rounds: 10<br />Contains tracer rounds";
		picture = "\dzn_MMR\icon\762x39mm_Bulk_Tracer.paa";
	};

	//	7.62x54mmR / Russian
	class dzn_10Rnd_762x54_Bulk: dzn_10Rnd_556x45_Bulk
	{
		displayName = "7.62x54mmR Ammunition";
		descriptionShort = "Caliber: 7.62x54mm R<br />Rounds: 10";
		mass = 4.5;
		picture = "\dzn_MMR\icon\762x54mm_Bulk.paa";
	};
	class dzn_10Rnd_762x54_Bulk_Tracer: dzn_10Rnd_556x45_Bulk_Tracer
	{
		displayName = "7.62x54mmR Ammunition (Tracers)";
		descriptionShort = "Caliber: 7.62x54mm R<br />Rounds: 10<br />Contains tracer rounds";
		picture = "\dzn_MMR\icon\762x54mm_Bulk_Tracer.paa";
	};


	// 9x19mm Para
	class dzn_10Rnd_9x19_Bulk: dzn_10Rnd_556x45_Bulk
	{
		displayName = "9x19mm Ammunition";
		descriptionShort = "Caliber: 9x19mm<br />Rounds: 10";
		mass = 2.5;
		picture = "\dzn_MMR\icon\9x19mm_Bulk.paa";
	};
	class dzn_10Rnd_9x19_Bulk_Tracer: dzn_10Rnd_556x45_Bulk_Tracer
	{
		displayName = "9x19mm Ammunition (Tracers)";
		descriptionShort = "Caliber: 9x19mm<br />Rounds: 10<br />Contains tracer rounds";
		picture = "\dzn_MMR\icon\9x19mm_Bulk_Tracer.paa";
	};

	// .45ACP
	class dzn_10Rnd_45ACP_Bulk: dzn_10Rnd_556x45_Bulk
	{
		displayName = ".45ACP Ammunition";
		descriptionShort = "Caliber: .45 ACP<br />Rounds: 10";
		mass = 2.5;
		picture = "\dzn_MMR\icon\45ACP_Bulk.paa";
	};
	class dzn_10Rnd_45ACP_Bulk_Tracer: dzn_10Rnd_556x45_Bulk_Tracer
	{
		displayName = ".45ACP Ammunition (Tracers)";
		descriptionShort = "Caliber: .45 ACP<br />Rounds: 10<br />Contains tracer rounds";
		mass = 2.5;
		picture = "\dzn_MMR\icon\45ACP_Bulk_Tracer.paa";
	};
};
*/
	
/*
	7.62x39	-	700
	7.62x51	-	220
	5.45x39 	-	1080
	5.56x45 	-	(metalbox) 420  / 840  / (paperbox) 1200
	7.62x51 	-	(metalbox) 420
*/