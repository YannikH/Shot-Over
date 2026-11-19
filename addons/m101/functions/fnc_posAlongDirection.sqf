#include "..\script_component.hpp"

/*
 * Author: YannikH, toadball
 * Converts a position given relative to the gun's carriage into model coordinates: the offset is turned with the
 * turret's traverse around the elevation axis ("osaveze"), but not with the elevation, so it follows the
 * traverse and elevation handwheels.
 *
 * Arguments:
 * 0: Gun <OBJECT>
 * 1: Offset from the elevation axis with the turret pointing forward, model space <ARRAY>
 *
 * Return Value:
 * Position in model coordinates <ARRAY>
 *
 * Example:
 * [_gun, [-0.5, -0.5, 0]] call shot_over_m101_fnc_posAlongDirection
 *
 * Public: No
 */

params [["_gun", objNull, [objNull]], ["_offset", [0, 0, 0], [[]], 3]];

private _direction = deg (_gun animationPhase "mainturret");
private _origin = _gun selectionPosition "osaveze";

(_offset call CBA_fnc_vect2Polar) params ["_distance", "_azimuth", "_pitch"];

_origin vectorAdd ([_distance, _azimuth - _direction, _pitch] call CBA_fnc_polar2vect)
