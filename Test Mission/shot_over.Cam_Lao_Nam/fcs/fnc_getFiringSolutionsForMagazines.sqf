
params ["_magazineList", "_range", "_elevDiff"];
private _solutions = [];

{
	private _magazineClass = _x;
	private _charge = _forEachIndex + 1;
	{
		private _rangeTable = [_magazineClass, -5, 66, _x] call shto_fnc_getRangeTable;
		private _minRange = parseNumber (_rangeTable # 0 # 0);
		private _maxRange = parseNumber (_rangeTable # ((count _rangeTable) - 1) # 0);
		if (_minRange <= _range && _maxRange >= _range) then {
			// systemChat str [_minRange, _range, _maxRange];
			private _solution = ([_rangeTable, _range, _elevDiff] call shto_fnc_getFiringSolutionForTable);
			if (count _solution > 0) then {_solutions pushBack [_charge] + _solution;};

		};
	} forEach [false, true];
} forEach _magazineList;
_solutions