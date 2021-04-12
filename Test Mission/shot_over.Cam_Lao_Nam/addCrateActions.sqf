
_action = ["Unpack Crate","Unpack Crate","",{
	private _pos = getPosASL _target;
	_target hideObject true;
	private _dir = direction _target;
	(_target call BIS_fnc_setPitchBank) params ["_pitch", "_bank"];
	private _openCrateClass = getText (configFile >> "cfgvehicles" >> typeOf _target >> "openVariant");
	//deleteVehicle _target;
	private _openCrate = _openCrateClass createVehicle [0,0,100];
	private _shellType = getText (configFile >> "cfgvehicles" >> _openCrateClass >> "shellType");
	{
		_shell = _shellType createVehicle [0,0,0];
		_shell attachTo [_openCrate, _x];
		_shell setVectorDirAndUp [[0,0,1], [-1,0,0]];
		[_shell, 0,["ACE_MainActions","ACE_dragging_carry"]] call ace_interact_menu_fnc_removeActionFromObject;
	} forEach [[0.425, 0.075, 0.1], [0.425, -0.075, 0.1]];
	//_openCrate setDir _dir;
	//[_target, _pitch, _bank] call BIS_fnc_setPitchBank;
	_openCrate attachTo [_target, [0,0,0]];
	//_openCrate setVelocity [0,0,0];
	//_openCrate setPosASL (_pos vectorAdd [0,0,0.2]);
},{true}] call ace_interact_menu_fnc_createAction;
["shto_vn_crate_base", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
