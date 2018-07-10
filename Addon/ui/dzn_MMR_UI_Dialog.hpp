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
	y = 7 * GUI_GRID_H + GUI_GRID_Y;
	w = 28 * GUI_GRID_W;
	h = 8 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.75};
	
	class controls
	{	
		// HEADER & BACKGROUND
		class dzn_MMR_UI_Header: RscStructuredText
		{
			idc = 5101;
			text = "Pack To..."; //--- ToDo: Localize;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 5.9 * GUI_GRID_H + GUI_GRID_Y;
			w = 28 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.77,0.51,0.08,0.8};
			font = "PuristaMedium";
		};
		class dzn_MMR_UI_Background: RscFrame
		{
			idc = 5102;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 28 * GUI_GRID_W;
			h = 8 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.5};
			style=0;
		};

		// BUTTONS
		class dzn_MMR_UI_CancelBtn: RscButtonMenu
		{
			idc = 5103;
			text = "CANCEL"; //--- ToDo: Localize;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			font = "PuristaLight";
		};
		class dzn_MMR_UI_ApplyBtn: RscButtonMenu
		{
			idc = 5104;
			text = "PACK TO"; //--- ToDo: Localize;
			x = 25 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			font = "PuristaLight";
		};

		// SOURCE MAGAZINE CONTROLS
		class dzn_MMR_UI_SourcePic: RscPicture
		{
			idc = 5105;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 6.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
			font = "PuristaLight";
		};
		class dzn_MMR_UI_SourceLabel: RscStructuredText
		{
			idc = 5106;
			text = "5.56x45mm Ammunition"; //--- ToDo: Localize;
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 17.5 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			colorBackground[] = {-1,-1,-1,0};
			font = "PuristaLight";
		};

		// TARGET MAGAZINE CONTROLS
		class dzn_MMR_UI_TargetPic: RscPicture
		{
			idc = 5107;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 28.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
		};
		class dzn_MMR_UI_AuthorPic: RscPicture
		{
			idc = 5108;
			text = "#(argb,8,8,3)color(0,1,0,0)";
			x = 31 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 2.5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};

		// TARGET MAGAZINE SELECTORS CONTROL
		class dzn_MMR_UI_TargetCombo: RscCombo
		{
			idc = 5109;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 21.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			font = "PuristaLight";
		};
		class dzn_MMR_UI_ListLabel: RscStructuredText
		{
			idc = 5110;
			text = "Pack to"; //--- ToDo: Localize;
			x = 6.5 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {-1,-1,-1,0};
			font = "PuristaLight";
		};
	};
};