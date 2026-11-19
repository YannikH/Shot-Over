#include "..\script_component.hpp"

/*
 * Author: YannikH, toadball, Andx
 * Handles the ejectCasing event (the "Open Breech" action) on the server: throws the empty casing of the fired
 * round out of the breech and deletes it after CASING_LIFETIME seconds, so casings do not pile up.
 *
 * Arguments:
 * 0: Gun <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_gun] call shot_over_m101_fnc_ejectCasing
 *
 * Public: No
 */

params [["_gun", objNull, [objNull]]];

if (!isServer || {isNull _gun}) exitWith {};

private _casing = createVehicle ["shto_vn_m101_shell_casing", _gun modelToWorld ([_gun, RECOIL_OFFSET] call FUNC(posAlongRecoilAxis)), [], 0, "CAN_COLLIDE"];
_casing setDir (getDir _gun + 160 + random 40);
_casing setVelocity ((vectorDir _gun) vectorMultiply (-1 - random 2));
_casing disableCollisionWith _gun;

[{deleteVehicle _this}, _casing, CASING_LIFETIME] call CBA_fnc_waitAndExecute;
