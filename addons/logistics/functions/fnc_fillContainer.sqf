params ["_container"];
{
	if (!isNil "_x") then {deleteVehicle _x};
} forEach (_container getVariable ["shto_crateList",[]]);

private _containerClass = typeOf _container;
private _cratesClass = getText (configFile >> "CfgVehicles" >> _containerClass >> "crateClass");
private _cratesArray = [];
private _crateSlots = [];
private _xSpacing = 0.32;
private _ySpacing = 0.92;
private _manOffset = [-0.15, -0.9];
private _totalRows = 3;
if (_container isKindOf "shto_vn_m101_he_container_x504") then { // big container, which we currently don't have
	_manOffset = [-0.15, -2.5];
	_totalRows = 7;
};
//private _manOffset = [-0.15, -3.9];
_container setVariable ["shto_cratesleft" ,_totalRows * 84];
private _cratesToSkip = 0;
private _stuff = [];
for [{_row = 0}, {_row < _totalRows}, {_row = _row + 1}] do {
	for [{_crateIndex = 0}, {_crateIndex < 84}, {_crateIndex = _crateIndex + 1}] do {
		private _crateNumber = (_row * 84 + _crateIndex);
		_xIndex = _crateIndex % 7;
		_levelIndex = floor (_crateIndex / 7);
		private _crateSlot = [
			(_xSpacing * 3.5) - (_xIndex * _xSpacing) + (_manOffset # 0),
			((_row * _ySpacing)) + (_manOffset # 1),
			1. - (_levelIndex * 0.2)
		];
		_crateSlots pushBack _crateSlot;
		if (_crateNumber < _cratesToSkip || _crateNumber > _cratesToSkip + 83) then {
			_cratesArray set [_crateNumber, objNull];
			continue;
		};
		private _crate = createSimpleObject [_cratesClass, [0,0,0]];
		_cratesArray set [_crateNumber, _crate];
		_crate attachTo [_container, _crateSlot];
		_crate setVectorDirAndUp [[1,0,0], [0,0,1]];
	};
};

_container setVariable ["shto_crateList",_cratesArray,true];
_container setVariable ["shto_crateSlots",_crateSlots,true];
[count _cratesArray]
