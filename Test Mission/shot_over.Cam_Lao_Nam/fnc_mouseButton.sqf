params ["", "_button"];
private _shell = ace_player getVariable "ace_dragging_carriedObject";
if (isNil "_shell") exitWith {};
if (!(_shell isKindOf "shto_vn_m101_shell")) exitWith {systemChat "not a shell";};
if (_button != 1) exitWith {};
systemChat "attempt load";
private _nearHowitzers = nearestObjects [ace_player, ["shto_vn_static_m101_02_base"], 5];
if (count _nearHowitzers == 0) exitWith {
	hint "No howitzer nearby";
};
private _howitzer = _nearHowitzers # 0;
[ace_player, _howitzer] remoteExec ["shto_fnc_attemptLoad", _howitzer];