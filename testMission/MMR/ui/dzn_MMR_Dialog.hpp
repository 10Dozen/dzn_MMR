
#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)


class dzn_MMR_Group: RscControlsGroup
{
	idd = 192005;
	idc = 5100;
	x = 6 * GUI_GRID_W + GUI_GRID_X;
	y = 8 * GUI_GRID_H + GUI_GRID_Y;
	w = 28 * GUI_GRID_W;
	h = 9 * GUI_GRID_H;
	colorBackground[] = {0,0,0,.75};
	/* onLoad = "[] spawn { uiSleep 0.01; call dzn_CG_fnc_restoreLastExecutedAndWatch;};" */
	
	class controls
	{
		class dzn_MMR_DisplayMain: RscFrame
		{
			idc = 5101;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 28 * GUI_GRID_W;
			h = 9 * GUI_GRID_H;
			colorBackground[] = {0,0,0,.5};
			style=0;
		};
		class dzn_MMR_Title: RscStructuredText
		{
			idc = 5102;
			text = "Repack To ...";
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 6.9 * GUI_GRID_H + GUI_GRID_Y;
			w = 28 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.77,0.51,0.08,0.8};
		};
		class dzn_MMR_MagPicture: RscPicture
		{
			idc = 5103;
			text = "\dzn_MMR\icon\556_45_840Rnd_Box.paa";
			x = 6.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 4.5 * GUI_GRID_H;
		};
		class dzn_MMR_MagNameLabel: RscStructuredText
		{
			idc = 5104;
			text = "5.56x45mm Ammo box"; //--- ToDo: Localize;
			x = 13 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 19 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {-1,-1,-1,0};
			colorActive[] = {-1,-1,-1,0};
		};
		class dzn_MMR_MagAmmoCount: RscStructuredText
		{
			idc = 5105;
			text = "840/840 rounds"; //--- ToDo: Localize;
			x = 13 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {-1,-1,-1,0};
			colorActive[] = {-1,-1,-1,0};
		};
		class dzn_MMR_ConvertToLabel: RscStructuredText
		{
			idc = 5106;
			text = "> >"; //--- ToDo: Localize;
			x = 13 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 2.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {-1,-1,-1,0};
			colorActive[] = {-1,-1,-1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		
		class dzn_MMR_ConvertToMagPicture: RscPicture
		{
			idc = 5110;
			text = "";
			x = 29 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		
		class dzn_MMR_ConvertToMagAmmoCount: RscStructuredText
		{
			idc = 5111;
			text = "30 rounds"; //--- ToDo: Localize;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 11  * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {-1,-1,-1,0};
			colorActive[] = {-1,-1,-1,0};
		};
		
		class dzn_MMR_ConvertToList: RscCombo
		{
			idc = 5107;
			x = 16 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 17.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			
			onSetFocus = "call dzn_MMR_fnc_setListItems";
			onLBSelChanged = "call dzn_MMR_fnc_List_SelectItem";
		};
		class dzn_MMR_CheckboxLabel: RscStructuredText
		{
			idc = 5108;
			text = "Repack all magazines of same class"; //--- ToDo: Localize;
			x = 8.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 19 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {-1,-1,-1,0};
			colorActive[] = {-1,-1,-1,0};
		};
		class dzn_MMR_Checkbox: RscCheckbox
		{
			idc = 5109;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.25 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class dzn_MMR_CancelButton: RscButtonMenu
		{
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 16 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "CANCEL";
			onButtonClick = "closeDialog 2";
		};
		class dzn_MMR_OkButton: RscButtonMenu
		{
			x = 25 * GUI_GRID_W + GUI_GRID_X;
			y = 16 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "REPACK";
			onButtonClick = "closeDialog 2";
		};
	};
};

/*

class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	text = "Repack To ..."; //--- ToDo: Localize;
	x = 6 * GUI_GRID_W + GUI_GRID_X;
	y = 6.9 * GUI_GRID_H + GUI_GRID_Y;
	w = 28 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0.77,0.51,0.08,0.8};
};
class RscPicture_1200: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 6.5 * GUI_GRID_W + GUI_GRID_X;
	y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 4.5 * GUI_GRID_H;
};
class RscStructuredText_1101: RscStructuredText
{
	idc = 1101;
	text = "5.56x45mm STANAG Magazine"; //--- ToDo: Localize;
	x = 13 * GUI_GRID_W + GUI_GRID_X;
	y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 19 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {-1,-1,-1,0};
	colorActive[] = {-1,-1,-1,0};
};
class RscStructuredText_1102: RscStructuredText
{
	idc = 1102;
	text = "30/30 rounds"; //--- ToDo: Localize;
	x = 13 * GUI_GRID_W + GUI_GRID_X;
	y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {-1,-1,-1,0};
	colorActive[] = {-1,-1,-1,0};
};
class RscStructuredText_1103: RscStructuredText
{
	idc = 1103;
	text = "> >"; //--- ToDo: Localize;
	x = 13 * GUI_GRID_W + GUI_GRID_X;
	y = 12 * GUI_GRID_H + GUI_GRID_Y;
	w = 2.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {-1,-1,-1,0};
	colorActive[] = {-1,-1,-1,0};
	sizeEx = 1 * GUI_GRID_H;
};
class RscCombo_2100: RscCombo
{
	idc = 2100;
	x = 16 * GUI_GRID_W + GUI_GRID_X;
	y = 12 * GUI_GRID_H + GUI_GRID_Y;
	w = 17.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class RscStructuredText_1104: RscStructuredText
{
	idc = 1104;
	text = "Repack all magazines of same class"; //--- ToDo: Localize;
	x = 8.5 * GUI_GRID_W + GUI_GRID_X;
	y = 14 * GUI_GRID_H + GUI_GRID_Y;
	w = 19 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {-1,-1,-1,0};
	colorActive[] = {-1,-1,-1,0};
};
class RscCheckbox_2800: RscCheckbox
{
	idc = 2800;
	x = 7 * GUI_GRID_W + GUI_GRID_X;
	y = 14 * GUI_GRID_H + GUI_GRID_Y;
	w = 1.25 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class RscButtonMenuCancel_2700: RscButtonMenuCancel
{
	x = 6 * GUI_GRID_W + GUI_GRID_X;
	y = 16 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class RscButtonMenuOK_2600: RscButtonMenuOK
{
	x = 25 * GUI_GRID_W + GUI_GRID_X;
	y = 16 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

*/