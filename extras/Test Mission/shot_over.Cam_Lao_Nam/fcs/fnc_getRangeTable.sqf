params ["_magazineClass", "_lowElev", "_highElev", "_highAngle", ["_callback", {}]];
private _muzzleVelocity = getNumber (configFile >> "cfgMagazines" >> _magazineClass >> "initSpeed");
private _ammo = getText (configFile >> "cfgMagazines" >> _magazineClass >> "ammo");
private _airFriction = getNumber (configFile >> "cfgAmmo" >> _ammo >> "airFriction");
private _ret = "ace_artillerytables" callExtension ["start", [_muzzleVelocity, 0, _lowElev, _highElev, _highAngle]];

private _rangeTable = [];
waitUntil {
	private _status = 1; // 1 = data on line, 2 - data not ready, 3 - done
	while {_status == 1} do {
		private _ret = ("ace_artillerytables" callExtension ["getline", []]);;
		_status = _ret select 1;
		if (_status == 1) then { _rangeTable pushBack( parseSimpleArray (_ret select 0)) };
	};

	(_status == 3) // exit loop when all data read
};
_rangeTable call _callback;
_rangeTable