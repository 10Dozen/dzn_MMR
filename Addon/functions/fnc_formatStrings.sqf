/*
	author: 10Dozen
	description: Formatting text data
	input: ARRAY - 
		0: STRING - text to format
		1: STRING - formation option
	returns: STRING - formatted string
	example:
		_str = ["5.56 mm 30rnd STANAG Reload Tracer (Yellow) Mag", "SPLIT_LINES"] call dzn_MMR_fnc_formatStrings; // "5.56 mm 30rnd STANAG Reload<br />Tracer (Yellow) Mag"
*/

params ["_text", "_formatOption"];

private _output = "";

switch toUpper(_formatOption) do {
	case "SPLIT_LINES": {
		// Split to 2 lines if text is too long
		_output = _text;
		if (count _text > 27) then {
			private _parts = _text splitString " ";
			private _line1 = "";
			private _line2 = "";
			private _i = 0;

			while { count _line1 < 27 } do {
				_line1 = _line1 + (_parts select _i) + " ";
				_i = _i + 1;
			};

			_line1 = _line1 select [0, count _line1 - 1]; // Remove last space
			_line2 = (_parts select [_i, count _parts - 1]) joinString " ";

			_output = format ["%1<br />%2", _line1, _line2];
		};
	};
	case "ACRONYM": {
		// Split text by spaces and compose parts as acronym, e.g. Community Upgrade Project -> CUP 
		// 		if single word - skip formatting
		private _parts = _text splitString " ";

		if (count _parts > 1) then {
			_output = "";
			{
				_output = format ["%1%2", _output, toUpper (_x select [0,1])];
			} forEach _parts;
		} else {
			_output = _text;
		};
	};
	default {
		_output = _text;
	};
};

(_output)