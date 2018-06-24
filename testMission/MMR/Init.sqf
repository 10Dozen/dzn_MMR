/*
Вот я со своими конверсиями магазинов подумал - а мож вернуться к истокам. Запилить 100% ИРЛ и от него плясать.

В общем забить на эйсрепак, сделать классы для патриков россыпью (по 10 штук) и мапить их с магазинами подходящими для конверсии.
В инвентаре хендлить кнопки Unpack/Pack/Pack to.
Unpack - вытаскивает из магазина парики россыпью по 10 штук (т.е. 3 анпака- полный магазин разряжен), без таймеров и анимаций, т.к. кликать занимает примерно тоже время.
Pack на магазине - при наличии патриков россыпью - заряжает патрики в магазины (по максимуму, т.е. всю рассыпуху может упаковать за раз).
Pack на патронах россыпью - меняет расспуху на подходящий текущему стволу магазин (т.е. 5.56 патроны на 5.56 магазины для рхсной м4)
Pack to - открывает диалог где можно заряжать во все варианты (чтобы ленты снаряжать будучи автоматчиком), с опцией - тратить все патроны россыпью на новый магазин, иначе только сделает новый магаз с 10 заряженными раундами, а остальное через дропдауны дрочить.

Цинки попробовать сделать рюкзаком, но с типоразмером чтобы вмещался в обычный рюкзак (т.к. формально цинк просто емкость, можно там хоть картошку носить). Если не получится, то цинкам давать только кнопку Unpack чтобы доставать из него рассыпуху горстями.

Плюсы:
- Реалистична
- Можно конверсить патроны из любого мода в любой мод, поддержка любого мода сводиться к десятиминутному маппингу магазинов в настройках
- Позволяет трансферить патроны между членами сквада чисто по калибру, не глядя на то что ленты там, небо или аллах
- В принципе можно через Пак ту перепаковывать магазины из одного мода в другой, в т.ч. снаряды для РПГ и МААВСов

Минусы:
- На словах выглядит заморочено, нельзя пресс Х ту репак, нужно все руками
- Все эти трассеры ебаные будут теряться в конверсиях или наоборот - из рассыпухи обычных патронов можно собирать магазины с трассерами другого цвета

*/


call compile preprocessFileLineNumbers "MMR\Mapping.sqf";
call compile preprocessFileLineNumbers "MMR\Functions.sqf";
call compile preprocessFileLineNumbers "MMR\UI Functions.sqf";

[] spawn {
	call dzn_MMR_fnc_processMap;

	while {true} do {
		waituntil {!(isnull (finddisplay 602))}; //waituntil inventory UI is opened

		AC = allControls (findDisplay 602);
		ACstr = str ( allControls (findDisplay 602) );

		((findDisplay 602) displayCtrl 633) ctrlSetEventHandler ["LBDblClick", "[_this, 'Uniform'] call dzn_MMR_fnc_handleInvDoubleClick"];
		((findDisplay 602) displayCtrl 638) ctrlSetEventHandler ["LBDblClick", "[_this, 'Vest'] call dzn_MMR_fnc_handleInvDoubleClick"];  
		((findDisplay 602) displayCtrl 619) ctrlSetEventHandler ["LBDblClick", "[_this, 'Backpack'] call dzn_MMR_fnc_handleInvDoubleClick"];
		
		{
			_x ctrlSetEventHandler ["MouseButtonClick", "_this call dzn_MMR_fnc_handleInvSingleClick"];
		} forEach allControls (findDisplay 602);
		
		waituntil {isnull (finddisplay 602)};
	};
};



dzn_MMR_ConvertToListItems = [
	"dzn_20Rnd_556x45_Pack"
	, "30Rnd_556x45_Stanag"
	, "rhs_mag_30Rnd_556x45_M855_Stanag"
	, "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Orange"
];


dzn_MMR_fnc_setListItems = {
	private _ctrl = findDisplay 192005 displayCtrl 5107;
	
	lbClear _ctrl;
	{
		_ctrl lbAdd (getText (configFile >> "CfgMagazines" >> _x >> "displayName"));
	} forEach dzn_MMR_ConvertToListItems;
	
	_ctrl lbSetCurSel 0;
	
	_ctrl ctrlCommit 0;
};


dzn_MMR_fnc_List_SelectItem = {
	params ["_ctrl", "_index"];
	
	private _picture = getText (configFile >> "CfgMagazines" >> (dzn_MMR_ConvertToListItems select _index) >> "picture");
	
	(findDisplay 192005 displayCtrl 5110) ctrlSetText _picture;
	
};

/*
	_ctrlPic ctrlSetText (getText (configFile >> "CfgMagazines" >> _list select 0 >> "picture"));
	*/


