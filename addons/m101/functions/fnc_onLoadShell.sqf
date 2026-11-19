#include "..\script_component.hpp"

/*
 * Author: YannikH, toadball, Andx
 * Handles the loadShell event (fnc_loadShell) where the gun is local: loads the one-round magazine into the gun
 * and moves the breech to its loaded phase. If the gun was loaded or closed in the meantime, the shell is put back
 * at the breech instead, so it is not lost.
 *
 * Arguments:
 * 0: Gun <OBJECT>
 * 1: Magazine class to load <STRING>
 * 2: Class of the shell object it came from <STRING>
 * 3: Charge set on the shell <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_gun, "shto_105mm_mag_he_x1_c3", "shto_vn_m101_shell_he", 3] call shot_over_m101_fnc_onLoadShell
 *
 * Public: No
 */

params [["_gun", objNull, [objNull]], ["_magazine", "", [""]], ["_shellClass", "", [""]], ["_charge", 1, [0]]];

if (!local _gun || {!alive _gun}) exitWith {};

if (magazines _gun isNotEqualTo [] || {abs ((_gun animationSourcePhase BREECH_SOURCE) - BREECH_OPEN) > 0.01}) exitWith {
    private _shell = createVehicle [_shellClass, _gun modelToWorld ([_gun, BREECH_OFFSET] call FUNC(posAlongRecoilAxis)), [], 0, "CAN_COLLIDE"];
    _shell setVariable ["shto_charge", _charge, true];
};

// the original mod's sequence, unchanged: the weapon only takes the new magazine once it is added again
private _weapon = (weapons _gun) select 0;
_gun loadMagazine [[0], _weapon, _magazine];
_gun removeWeapon _weapon;
_gun addMagazine _magazine;
_gun addWeapon _weapon;
_gun selectWeapon _weapon;
reload _gun;

_gun animateSource [BREECH_SOURCE, BREECH_LOADED, 2];
