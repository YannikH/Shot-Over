#include "..\script_component.hpp"

/*
 * Author: YannikH, toadball, Andx
 * Handles the fire event (the "Fire Howitzer" action, pulling the lanyard) where the gun is local: the gunner
 * fires the loaded round. The action needs a gunner, so no unit is created for it.
 *
 * Arguments:
 * 0: Gun <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_gun] call shot_over_m101_fnc_onFire
 *
 * Public: No
 */

params [["_gun", objNull, [objNull]]];

if (!local _gun || {!alive gunner _gun}) exitWith {};

(gunner _gun) fireAtTarget [objNull];
