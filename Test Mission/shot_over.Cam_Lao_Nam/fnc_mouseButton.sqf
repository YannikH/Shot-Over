params ["", "_button"];
private _shell = ace_player getVariable "ace_dragging_carriedObject";
if (isNil "_shell") exitWith {};
if (!(_shell isKindOf "shto_vn_m101_shell")) exitWith {systemChat "not a shell";};
if (_button != 1) exitWith {};
systemChat "attempt load";
[] call shto_fnc_attemptLoad;