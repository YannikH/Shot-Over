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
	sleep 2;
	reload _howitzer;
	_howitzer loadMagazine [[0], "shto_howitzer_105mm_base", (magazines _howitzer) # 0];
	sleep 1;
	_unit fireAtTarget [objNull];
	//waitUntil {
	//	_unit fireAtTarget [objNull];
	//	(time > (_startTime + 1)) || (count (magazines _howitzer) == 0)
	//};
	moveOut _unit;
	deleteVehicle _unit;
};