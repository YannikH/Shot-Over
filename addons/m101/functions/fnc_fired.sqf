params ["_vehicle","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile"];

if (local _vehicle) then {
	private _currentSpeed = vectorMagnitude (velocity _projectile);
	private _randomFactor = random [(_currentSpeed / 100) * -0.25,0,(_currentSpeed / 100) * 0.25];
	private _targetSpeed = _currentSpeed + _randomFactor;
	private _targetVelocity = (vectorNormalized velocity _projectile) vectorMultiply _targetSpeed;
	_projectile setVelocity _targetVelocity;
};

if (isServer) then {
	_vehicle animatesource ["m101_reload_source",1, true];
    _vehicle animatesource ["m101_reload_source",0.9, 3];
    [_vehicle, velocity _projectile] call shot_over_m101_fnc_tryRagdoll;
    _vehicle setVehicleAmmo 0;
    {_vehicle removeMagazine _x} forEach (magazines _vehicle);
};
