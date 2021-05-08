private _pos = getPosASL _this;
_this hideObjectGlobal true;
private _dir = direction _this;
private _openCrateClass = getText (configFile >> "cfgvehicles" >> typeOf _this >> "openVariant");
//deleteVehicle _this;
private _openCrate = _openCrateClass createVehicle [0,0,100];
private _shellType = getText (configFile >> "cfgvehicles" >> _openCrateClass >> "shellType");
{
	_shell = _shellType createVehicle [0,0,0];
	_shell attachTo [_openCrate, _x];
	_shell setVectorDirAndUp [[0,0,1], [-1,0,0]];
	[_shell, 0,["ACE_MainActions","ACE_dragging_carry"]] call ace_interact_menu_fnc_removeActionFromObject;
} forEach [[0.425, 0.075, 0.1], [0.425, -0.075, 0.1]];
//_openCrate setDir _dir;
//[_this, _pitch, _bank] call BIS_fnc_setPitchBank;
_openCrate attachTo [_this, [0,0,0]];
//_openCrate setVelocity [0,0,0];
//_openCrate setPosASL (_pos vectorAdd [0,0,0.2]);