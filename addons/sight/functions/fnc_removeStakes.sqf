#include "..\script_component.hpp"
/*
 * Author: Andx
 * Server: deletes the gun's aiming stakes and forgets its azimuth of lay. Handles "Recover Aiming Stakes" and the
 * gun being deleted.
 *
 * Arguments:
 * 0: Gun <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_gun] call shot_over_sight_fnc_removeStakes
 *
 * Public: No
 */

params [["_gun", objNull, [objNull]]];

private _stakes = _gun getVariable [QGVAR(stakes), []];
if (_stakes isEqualTo []) exitWith {};

{deleteVehicle _x} forEach _stakes;
_gun setVariable [QGVAR(stakes), nil, true];
_gun setVariable [QGVAR(azimuthOfLay), nil, true];
