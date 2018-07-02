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
		};
		requiredVersion = 0.1;
		requiredAddons[] = {"CBA_MAIN"};
		author[] = {"10Dozen"};
		version = "0.1";
	};
};

class CfgWeapons
{
	class ItemWatch;
	class dzn_Placeholder_Small: ItemWatch
	{
		author = "10Dozen";
		displayName = "Some sleeping ice fairy";
		descriptionShort = "You were lucky enough to meet a sleeping fairy in your pocket. Do not wake her up, but gently lay it in a cool place, away from direct sunlight!";
		picture = "\dzn_MMR\icon\Placeholder.paa";
		scope = 1;
		class ItemInfo
		{
			mass = 2;
		}
	};
	class dzn_Placeholder_Medium: dzn_Placeholder_Small
	{
		class ItemInfo
		{
			mass = 10;
		}
	};
	class dzn_Placeholder_Big: dzn_Placeholder_Small
	{
		class ItemInfo
		{
			mass = 25;
		}
	};
};
 
class CfgMagazines
{
	#define	MASS_BOX	120
	
	class 30Rnd_556x45_Stanag;
	
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

	
/*
	7.62x39	-	700
	7.62x51	-	220
	5.45x39 	-	1080
	5.56x45 	-	(metalbox) 420  / 840  / (paperbox) 1200
	7.62x51 	-	(metalbox) 420
*/