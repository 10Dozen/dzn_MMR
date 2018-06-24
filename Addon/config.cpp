class CfgPatches
{
	class dzn_MMR
	{
		units[] = {};
		weapons[] = {};
		magazines[] = {
			"dzn_10Rnd_556x45_Bulk"
			,"dzn_10Rnd_556x45_Bulk_Mixed"
			,"dzn_10Rnd_762x51_Bulk"
			,"dzn_10Rnd_545x39_Bulk"
			,"dzn_10Rnd_762x39_Bulk"
			,"dzn_10Rnd_762x54_Bulk"

			/*
			"dzn_1080Rnd_545x39_Pack"
			,"dzn_700Rnd_762x39_Pack"
			,"dzn_440Rnd_762x54R_Pack"
			,"dzn_840Rnd_556x45_Pack"
			,"dzn_420Rnd_762x51_Pack"
			
			,"dzn_30Rnd_545x39_Pack"
			,"dzn_30Rnd_762x39_Pack"
			,"dzn_20Rnd_762x54R_Pack"
			,"dzn_20Rnd_556x45_Pack"
			,"dzn_20Rnd_762x51_Pack"
			*/
		};
		requiredVersion = 0.1;
		requiredAddons[] = {"CBA_MAIN"};
		author[] = {"10Dozen"};
		version = "0.1";
	};
};
 
class CfgMagazines
{
	#define	MASS_BOX	120
	
	class 30Rnd_556x45_Stanag;
	class dzn_10Rnd_556x45_Bulk: 30Rnd_556x45_Stanag
	{
		author = "10Dozen";
		count = 10;
		displayName = "5.56x45mm Ammunition";
		descriptionShort = "Caliber: 5.56x45mm<br />Rounds: 10";
		picture = "\dzn_MMR\icon\556_45_20Rnd_Pack.paa";		
		scope = 2;
		mass = 3;
		dzn_ammoType = "BALL";
	};
	class dzn_10Rnd_556x45_Bulk_Mixed: dzn_10Rnd_556x45_Bulk
	{
		displayName = "5.56x45mm Ammunition (Mixed)";
		descriptionShort = "Caliber: 5.56x45mm<br />Rounds: 10<br />Contains tracer rounds";
		dzn_ammoType = "MIXED";
	};


	class dzn_10Rnd_762x51_Bulk: dzn_10Rnd_556x45_Bulk
	{
		displayName = "7.62x51mm Ammunition";
		descriptionShort = "Caliber: 7.62x51mm<br />Rounds: 10";
		mass = 4.5;
	};
	class dzn_10Rnd_545x39_Bulk: dzn_10Rnd_556x45_Bulk
	{
		displayName = "5.45x39mm Ammunition";
		descriptionShort = "Caliber: 5.45x39mm<br />Rounds: 10";
		mass = 3;
		picture = "\dzn_MMR\icon\545_39_30Rnd_Pack.paa";
	};
	class dzn_10Rnd_762x39_Bulk: dzn_10Rnd_556x45_Bulk
	{
		displayName = "7.62x39mm Ammunition";
		descriptionShort = "Caliber: 7.62x39mm<br />Rounds: 10";
		mass = 4;
		picture = "\dzn_MMR\icon\545_39_30Rnd_Pack.paa";
	};
	class dzn_10Rnd_762x54_Bulk: dzn_10Rnd_556x45_Bulk
	{
		displayName = "7.62x54mmR Ammunition";
		descriptionShort = "Caliber: 7.62x54mm R<br />Rounds: 10";
		mass = 4.5;
		picture = "\dzn_MMR\icon\545_39_30Rnd_Pack.paa";
	};








	/*
		7.62x39	-	700
		7.62x51	-	220
		5.45x39 	-	1080
		5.56x45 	-	(metalbox) 420  / 840  / (paperbox) 1200
		7.62x51 	-	(metalbox) 420
		
	*/


	/*
	//	5.45x39 AK-74 ammunition packs
	class dzn_1080Rnd_545x39_Pack: 30Rnd_556x45_Stanag
	{
		author = "10Dozen";
		count = 1080;
		descriptionshort = "Caliber: 5.45x39mm<br />Rounds: 1080";
		displayname = "5.45x39mm Ammo box";
		scope = 2;
		mass = MASS_BOX;	// 13.5 kg
		picture = "\dzn_MMR\icon\545_39_1080Rnd_Box.paa";
	};
	class dzn_30Rnd_545x39_Pack: 30Rnd_556x45_Stanag
	{
		authot = "10Dozen";
		count = 30;
		descriptionshort = "Caliber: 5.45x39mm<br />Rounds: 30";
		displayname = "5.45x39mm Ammo pack";
		scope = 2;
		mass = 6;
		picture = "\dzn_MMR\icon\545_39_30Rnd_Pack.paa";
	};
	
	//	7.62x39 AKM ammunition packs
	class dzn_700Rnd_762x39_Pack: 30Rnd_556x45_Stanag
	{
		author = "10Dozen";
		count = 700;
		descriptionshort = "Caliber: 7.62x39mm<br />Rounds: 700";
		displayname = "7.62x39mm Ammunition box";
		scope = 2;
		mass = MASS_BOX;	// 13.5 kg
		picture = "\dzn_MMR\icon\545_39_1080Rnd_Box.paa";
	};
	class dzn_30Rnd_762x39_Pack: 30Rnd_556x45_Stanag
	{
		authot = "10Dozen";
		count = 30;
		descriptionshort = "Caliber: 7.62x39mm<br />Rounds: 30";
		displayname = "7.62x39mm Ammunition pack";
		scope = 2;
		mass = 6;
		picture = "\dzn_MMR\icon\545_39_30Rnd_Pack.paa";
	};
	
	//	7.62x54R PKM/SVD ammunition packs
	class dzn_440Rnd_762x54R_Pack: 30Rnd_556x45_Stanag
	{
		author = "10Dozen";
		count = 440;
		descriptionshort = "Caliber: 7.62x54mm<br />Rounds: 440";
		displayname = "7.62x54mm Ammunition box";
		scope = 2;
		mass = MASS_BOX;	// 13.5 kg
		picture = "\dzn_MMR\icon\545_39_1080Rnd_Box.paa";
	};
	class dzn_20Rnd_762x54R_Pack: 30Rnd_556x45_Stanag
	{
		authot = "10Dozen";
		count = 20;
		descriptionshort = "Caliber: 7.62x54mm<br />Rounds: 20";
		displayname = "7.62x54mm Ammunition pack";
		scope = 2;
		mass = 6;
		picture = "\dzn_MMR\icon\545_39_30Rnd_Pack.paa";
	};
	
	//	5.56x45mm ammunition packs
	class dzn_840Rnd_556x45_Pack: 30Rnd_556x45_Stanag
	{
		author = "10Dozen";
		count = 840;
		descriptionshort = "Caliber: 5.56x45mm<br />Rounds: 840";
		displayname = "5.56x45mm Ammunition box";
		scope = 2;
		mass = MASS_BOX;	// 13.5 kg
		picture = "\dzn_MMR\icon\556_45_840Rnd_Box.paa";
	};
	class dzn_20Rnd_556x45_Pack: 30Rnd_556x45_Stanag
	{
		authot = "10Dozen";
		count = 20;
		descriptionshort = "Caliber: 5.56x45mm<br />Rounds: 20";
		displayname = "5.56x45mm Ammunition pack";
		scope = 2;
		mass = 6;
		picture = "\dzn_MMR\icon\556_45_20Rnd_Pack.paa";
	};
	
	//	7.62x51mm ammunition packs
	class dzn_420Rnd_762x51_Pack: 30Rnd_556x45_Stanag
	{
		author = "10Dozen";
		count = 420;
		descriptionshort = "Caliber: 7.62x51mm<br />Rounds: 420";
		displayname = "7.62x51mm Ammunition box";
		scope = 2;
		mass = MASS_BOX;	// 13.5 kg
		picture = "\dzn_MMR\icon\556_45_840Rnd_Box.paa";
	};
	class dzn_20Rnd_762x51_Pack: 30Rnd_556x45_Stanag
	{
		authot = "10Dozen";
		count = 20;
		descriptionshort = "Caliber: 7.62x51mm<br />Rounds: 20";
		displayname = "7.62x51mm Ammunition pack";
		scope = 2;
		mass = 6;
		picture = "\dzn_MMR\icon\556_45_20Rnd_Pack.paa";
	};
	*/
};;