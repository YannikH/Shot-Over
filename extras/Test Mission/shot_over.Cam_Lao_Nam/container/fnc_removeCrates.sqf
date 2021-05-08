params ["_container", "_cratesToRemove"];
private _cratesLeft = _container getVariable ["shto_cratesleft" ,252];
private _cratesLeft = _cratesLeft - _cratesToRemove;
_container setVariable ["shto_cratesleft" ,_cratesLeft];
private _crateSlots = _container getVariable ["shto_crateSlots" ,[]];
private _cratesList = (_container getVariable ["shto_crateList",[]]);

private _cratesRemoved = (count _crateSlots) - _cratesLeft - 1;
if (_cratesRemoved == -1) exitWith {};

{
	if (_forEachIndex > _cratesRemoved) then {
		systemChat str [_forEachIndex, _cratesRemoved, "stopping loop"];
		break
	};
	systemChat str [_forEachIndex, isNull _x, _x];
	if (!(isNull _x)) then {
		private _newIndex = _forEachIndex + 84;
		systemChat str ["new idx", _newIndex];
		_cratesList set [_forEachIndex, objNull];
		if (_newIndex > (count _crateSlots) - 1) then {
			systemChat str ["deleting",_newIndex];
			deleteVehicle _x;
		} else {
			systemChat str ["moving",_newIndex];
			_x attachTo [_container, _crateSlots # _newIndex];
			systemChat str ["new", _crateSlots # _newIndex, "old", _crateSlots # _forEachIndex];
			_cratesList set [_newIndex, _x];
		};
	};
} forEach _cratesList;

_container setVariable ["shto_crateList",_cratesList,true];
_cratesList