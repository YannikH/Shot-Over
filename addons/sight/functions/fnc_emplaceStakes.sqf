#include "..\script_component.hpp"
/*
 * Author: YannikH, Andx
 * Crew member's side of "Emplace Aiming Stakes": the barrel's azimuth becomes the gun's azimuth of lay, and two
 * stakes go out along the telescope's line at the referred deflection, so the gunner sees them at that deflection
 * as long as the gun is laid on the azimuth of lay. The server creates them (fnc_onEmplaceStakes).
 *
 * Arguments:
 * 0: Gun <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject] call shot_over_sight_fnc_emplaceStakes
 *
 * Public: No
 */

params [["_gun", objNull, [objNull]]];

private _weaponDir = _gun weaponDirection currentWeapon _gun;
private _azimuthOfLay = round (((_weaponDir select 0) atan2 (_weaponDir select 1)) * MILS_PER_DEGREE + 6400) % 6400;

// on the rounded azimuth, which is what the FDC works with
private _origin = _gun modelToWorld ([_gun, TELESCOPE_OFFSET] call EFUNC(m101,posAlongDirection));
private _direction = (_azimuthOfLay + REFERRED_DEFLECTION) / MILS_PER_DEGREE;
private _positions = STAKE_DISTANCES apply {
    ((_origin getPos [_x, _direction]) select [0, 2]) + [0]
};

[QGVAR(emplaceStakes), [_gun, _positions, _azimuthOfLay]] call CBA_fnc_serverEvent;

hint format [LLSTRING(Hint_StakesEmplaced), REFERRED_DEFLECTION, [_azimuthOfLay, 4] call CBA_fnc_formatNumber];
