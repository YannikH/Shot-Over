#include "..\script_component.hpp"

/*
 * Author: YannikH, toadball, Andx
 * Fired event handler of the M101's weapon (CfgWeapons EventHandlers), on every machine. Where the gun is local
 * (the gunner's machine; the projectile is local there too) it varies the shot's muzzle velocity, plays the
 * recoil, knocks down units standing behind the breech (fnc_knockDown on their machines) and empties the gun,
 * so the next round has to be loaded by hand.
 *
 * Arguments:
 * 0: Gun <OBJECT>
 * 1: Weapon <STRING>
 * 2: Muzzle <STRING>
 * 3: Mode <STRING>
 * 4: Ammo <STRING>
 * 5: Magazine <STRING>
 * 6: Projectile <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * _this call shot_over_m101_fnc_fired
 *
 * Public: No
 */

params [["_gun", objNull, [objNull]], "", "", "", "", "", ["_projectile", objNull, [objNull]]];

if (!local _gun) exitWith {};

// shot-to-shot variation of the muzzle velocity, most shots close to the nominal one
private _velocity = velocity _projectile;
private _speed = vectorMagnitude _velocity;
private _spread = _speed * MUZZLE_VELOCITY_SPREAD / 100;
_projectile setVelocity ((vectorNormalized _velocity) vectorMultiply (_speed + random [-_spread, 0, _spread]));

// recoil: the breech jumps back fully, then runs out to its fired phase
_gun animateSource [BREECH_SOURCE, 1, true];
_gun animateSource [BREECH_SOURCE, BREECH_FIRED, 3];

private _behindBreech = _gun modelToWorld ([_gun, RECOIL_OFFSET] call FUNC(posAlongRecoilAxis));
{
    if (_x distance2D _behindBreech < RECOIL_HIT_DISTANCE) then {
        [QGVAR(knockDown), [_x, _velocity], _x] call CBA_fnc_targetEvent;
    };
} forEach (nearestObjects [_gun, ["CAManBase"], 4]);

_gun setVehicleAmmo 0;
{
    _gun removeMagazine _x;
} forEach (magazines _gun);
