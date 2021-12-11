params ["_howitzer", "_player"];
_unit = nil;
systemChat str [_this, gunner _howitzer];
if (isNull (gunner _howitzer)) then {
	systemChat "creating AI";
	_unit = group _player createUnit ["B_UAV_AI", [0,0,0], [], 0, "FORM"];
	_unit disableAI "ALL";
	_unit moveInGunner _howitzer;
	systemChat "Moved in gunner";
	systemChat str (gunner _howitzer);
	private _startTime = time;
	_unit fireAtTarget [objNull];
	//waitUntil {
	//	_unit fireAtTarget [objNull];
	//	(time > (_startTime + 1)) || (count (magazines _howitzer) == 0)
	//};
	moveOut _unit;
	deleteVehicle _unit;
} else {
	(gunner _howitzer) fireAtTarget [objNull];
};
_howitzer animatesource ["m101_reload_source",1, true];
_howitzer animatesource ["m101_reload_source",0.95, 0.7];