#include "..\script_component.hpp"

/*
 * Author: YannikH, toadball
 * Converts a position given along the barrel into model coordinates of the gun: the offset is turned with the
 * turret's traverse and the barrel's elevation around the elevation axis ("osaveze"), so it follows the breech.
 *
 * Arguments:
 * 0: Gun <OBJECT>
 * 1: Offset from the elevation axis with the barrel level and pointing forward, model space <ARRAY>
 *
 * Return Value:
 * Position in model coordinates <ARRAY>
 *
 * Example:
 * _gun modelToWorld ([_gun, [0, -1.5, 0.5]] call shot_over_m101_fnc_posAlongRecoilAxis)
 *
 * Public: No
 */

params [["_gun", objNull, [objNull]], ["_offset", [0, 0, 0], [[]], 3]];

private _elevation = deg (_gun animationPhase "maingun");
private _direction = deg (_gun animationPhase "mainturret");
private _origin = _gun selectionPosition "osaveze";

(_offset call CBA_fnc_vect2Polar) params ["_distance", "_azimuth", "_pitch"];

_origin vectorAdd ([_distance, _azimuth - _direction, _pitch - _elevation] call CBA_fnc_polar2vect)
