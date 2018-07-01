/* #Mykawe
$[
	1.063,
	["dzn_MMR_MapUI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1100,"dzn_MMR_MapUI_Header",[2,"Magazines Mapping",["0 * GUI_GRID_W + GUI_GRID_X","0 * GUI_GRID_H + GUI_GRID_Y","40 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[0.77,0.51,0.08,0.8],[-1,-1,-1,-1],"","-1"],[]],
	[1101,"dzn_MMR_MapUI_Frame",[2,"",["0 * GUI_GRID_W + GUI_GRID_X","1.1 * GUI_GRID_H + GUI_GRID_Y","40 * GUI_GRID_W","23 * GUI_GRID_H"],[-1,-1,-1,-1],[0,0,0,0.5],[-1,-1,-1,-1],"","-1"],[]],
	[1102,"dzn_MMR_MapUI_DropdownLabel",[2,"Bulk ammo",["0.5 * GUI_GRID_W + GUI_GRID_X","2 * GUI_GRID_H + GUI_GRID_Y","5 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[0,0,0,0],[-1,-1,-1,-1],"","-1"],[]],
	[2100,"dzn_MMR_MapUI_Dropdown",[2,"",["6 * GUI_GRID_W + GUI_GRID_X","2 * GUI_GRID_H + GUI_GRID_Y","33 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2400,"dzn_MMR_MapUI_BtnCancel",[2,"CANCEL",["0 * GUI_GRID_W + GUI_GRID_X","24.1 * GUI_GRID_H + GUI_GRID_Y","10 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2401,"dzn_MMR_MapUI_BtnExport",[2,"EXPORT",["30 * GUI_GRID_W + GUI_GRID_X","24.1 * GUI_GRID_H + GUI_GRID_Y","10 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1103,"dzn_MMR_MapUI_ListLabel",[2,"Magazines",["0.5 * GUI_GRID_W + GUI_GRID_X","4 * GUI_GRID_H + GUI_GRID_Y","38.5 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[0,0,0,0],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"dzn_MMR_MapUI_Listbox",[2,"",["1 * GUI_GRID_W + GUI_GRID_X","5 * GUI_GRID_H + GUI_GRID_Y","38 * GUI_GRID_W","18 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by 10Dozen, v1.063, #Wunury)
////////////////////////////////////////////////////////

class dzn_MMR_MapUI_Header: RscStructuredText
{
	idc = 1100;
	text = "Magazines Mapping"; //--- ToDo: Localize;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 0 * GUI_GRID_H + GUI_GRID_Y;
	w = 40 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {0.77,0.51,0.08,0.8};
};
class dzn_MMR_MapUI_Frame: RscStructuredText
{
	idc = 1101;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 1.1 * GUI_GRID_H + GUI_GRID_Y;
	w = 40 * GUI_GRID_W;
	h = 23 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.5};
};
class dzn_MMR_MapUI_DropdownLabel: RscStructuredText
{
	idc = 1102;
	text = "Bulk ammo"; //--- ToDo: Localize;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0};
};
class dzn_MMR_MapUI_Dropdown: RscCombo
{
	idc = 2100;
	x = 6 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 33 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class dzn_MMR_MapUI_BtnCancel: RscButtonMenu
{
	idc = 2400;
	text = "CANCEL"; //--- ToDo: Localize;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 24.1 * GUI_GRID_H + GUI_GRID_Y;
	w = 10 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class dzn_MMR_MapUI_BtnExport: RscButtonMenu
{
	idc = 2401;
	text = "EXPORT"; //--- ToDo: Localize;
	x = 30 * GUI_GRID_W + GUI_GRID_X;
	y = 24.1 * GUI_GRID_H + GUI_GRID_Y;
	w = 10 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class dzn_MMR_MapUI_ListLabel: RscStructuredText
{
	idc = 1103;
	text = "Magazines"; //--- ToDo: Localize;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 38.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0};
};
class dzn_MMR_MapUI_Listbox: RscListbox
{
	idc = 1500;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 38 * GUI_GRID_W;
	h = 18 * GUI_GRID_H;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
