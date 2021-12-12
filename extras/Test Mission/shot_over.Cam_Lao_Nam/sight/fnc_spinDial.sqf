// shto_sight_fnc_spinDial

params ["_variable", "_event", "_default"];
//systemChat str _this;
private _change 	= 0;
_event params ["_control", "_button", "", "", "_shift", "_control", "_alt"];
if (count _event == 2) then {
	_change = if (_button > 0) then [{10}, {-10}];
} else {
	_change = 1;
	_change = if (_shift) then [{_change * 10}, {1}];
	_change = if (_control) then [{_change * 10}, {1}];
	_change = if (_button == 0) then [{_change * 1}, {_change * -1}];
};
private _howitzer = vehicle player;
private _variable = "shto_sight_"+_variable;
private _cur = _howitzer getVariable [_variable, _default];
private _new = _cur + _change;
_howitzer setVariable [_variable, _new];
systemChat str [_cur + _change];
//_control ctrlSetAngle ((ctrlAngle _control) vectorAdd [10,0,0]);
//_control ctrlCommit 0;
private _reticleDialog = uiNamespace getVariable "shto_sight_reticle";
if (_variable == "shto_sight_deflection") then {
	systemChat str [_variable, "deflecting", (_new / 6400 * 360) - 180];
	shto_sight_camera setDir -45 + ((_new / 6400 * 360) - 180);
	(_reticleDialog displayCtrl 1002) ctrlSetText (str _new);

	private _range = (safeZoneH / 2);
	private _deflectionAdjust = _range / 6400;
	private _deflectionMod = (3200 - _new) * _deflectionAdjust;
	private _tape = (_reticleDialog displayCtrl 1203) controlsGroupCtrl 1205;
	_tape ctrlSetPositionX (safeZoneX + (safeZoneW / 2) - ((safeZoneH/4)*1.1) + _deflectionMod);
	_tape ctrlCommit 0;
} else {
	private _sideBarWidth = ((safeZoneW - (safeZoneH*1.4))/2);
	private _elevation = ((_howitzer animationPhase "maingun")  * 57.2958) / 360 * 6400;
	private _diff = (_new - _elevation) max -20 min 20;
	private _range = (_sideBarWidth * 0.2) / 20;
	systemChat str _diff;
	private _newPosition = (
		safeZoneX + (_sideBarWidth * 0.5) +
		(_diff * _range) -
		(_sideBarWidth * 0.05)
	);
	(_reticleDialog displayCtrl 1202) ctrlSetPositionX _newPosition;
	(_reticleDialog displayCtrl 1202) ctrlCommit 0;
	systemChat str [_variable, "quadrant", (_new / 6400 * 360) - 180];
	ctrlSetText [1004, str _new];
	(_reticleDialog displayCtrl 1004) ctrlSetText (str _new);
};