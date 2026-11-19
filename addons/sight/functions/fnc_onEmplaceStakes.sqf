#include "..\script_component.hpp"
/*
 * Author: Andx
 * Server's side of "Emplace Aiming Stakes": creates the stakes and keeps them and the azimuth of lay on the gun.
 * Turns the gun's deflection dial to the referred deflection, so the next gunner sees the stakes on the line.
 * Does nothing if the gun already has stakes (two crew members at once).
 *
 * Arguments:
 * 0: Gun <OBJECT>
 * 1: Positions of the stakes, ATL <ARRAY>
 * 2: Azimuth of lay (mils) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_gun, [[100, 100, 0], [120, 100, 0]], 1600] call shot_over_sight_fnc_onEmplaceStakes
 *
 * Public: No
 */

params [["_gun", objNull, [objNull]], ["_positions", [], [[]]], ["_azimuthOfLay", 0, [0]]];

if (isNull _gun || {(_gun getVariable [QGVAR(stakes), []]) isNotEqualTo []}) exitWith {};

private _stakes = _positions apply {
    createVehicle [STAKE_CLASS, _x, [], 0, "CAN_COLLIDE"]
};

_gun setVariable [QGVAR(stakes), _stakes, true];
_gun setVariable [QGVAR(azimuthOfLay), _azimuthOfLay, true];
_gun setVariable [QGVAR(deflection), REFERRED_DEFLECTION, true];
