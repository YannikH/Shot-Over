#include "..\script_component.hpp"

/*
 * Author: YannikH, toadball, Andx
 * Handles the knockDown event (fnc_fired) where the unit is local: the recoil throws a unit standing behind the
 * breech backwards (ragdoll). Damage is off for a moment so the fall does not hurt; it is only turned back on if
 * it was on before, so a mission's allowDamage false is kept.
 *
 * Arguments:
 * 0: Unit behind the breech <OBJECT>
 * 1: Velocity of the projectile, gives the direction of the recoil <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, velocity _projectile] call shot_over_m101_fnc_knockDown
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_velocity", [0, 0, 0], [[]], 3]];

if (!local _unit || {!alive _unit}) exitWith {};

if (isDamageAllowed _unit) then {
    _unit allowDamage false;
    [{_this allowDamage true}, _unit, 2] call CBA_fnc_waitAndExecute;
};

_unit addForce [(vectorNormalized _velocity) vectorMultiply -KNOCKDOWN_FORCE, _unit selectionPosition "spine3"];
