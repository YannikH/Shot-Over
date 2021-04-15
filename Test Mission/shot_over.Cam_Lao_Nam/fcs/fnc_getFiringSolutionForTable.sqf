params ["_table", "_range", "_elevDiff"];
private _bracket = [];
{
	if ((parseNumber (_x # 0)) <= _range) then {_bracket set [0, _x]} else {_bracket set [1, _x]; break;};
} forEach _table;
_bracket params ["_lowEnd", "_highEnd"];
if (count _bracket == 1) exitWith {};
private _rangeBetweenMinMax = (parseNumber (_highEnd # 0)) - (parseNumber (_lowEnd # 0));
private _interpolatedRange = _range - (parseNumber (_lowEnd # 0));
private _interpolationMult = _interpolatedRange / _rangeBetweenMinMax;
_interpolatedBracket = [];
{
	if (_x == "-") then {break;};
	private _low = parseNumber _x;
	private _high = parseNumber (_highEnd # _forEachIndex);
	_interpolatedBracket set [_forEachIndex, _low + ((_high - _low) * _interpolationMult)];
} forEach _lowEnd;
_interpolatedBracket params ["", "_baseElevation", "_elevAdjustment", "_tofAdjustment", "_baseTof"];
private _elevDiffAdjusted = _elevDiff / 100;
if (isNil "_elevAdjustment") exitWith {[]};
private _solution = [
	_baseElevation + (_elevDiffAdjusted * -_elevAdjustment),
	_baseTof + (_elevDiffAdjusted * -_tofAdjustment)
];
_solution