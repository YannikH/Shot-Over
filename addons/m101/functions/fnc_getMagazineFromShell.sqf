#include "..\script_component.hpp"

/*
 * Author: YannikH, toadball
 * Returns the one-round magazine a shell object loads as: the shell's magazineBase with the charge set on the
 * shell (shto_charge, 1 to 5) appended, e.g. "shto_105mm_mag_he_x1_c" and charge 3 give "shto_105mm_mag_he_x1_c3".
 *
 * Arguments:
 * 0: Shell object <OBJECT>
 *
 * Return Value:
 * Magazine class <STRING>
 *
 * Example:
 * [_shell] call shot_over_m101_fnc_getMagazineFromShell
 *
 * Public: No
 */

params [["_shell", objNull, [objNull]]];

private _magazineBase = getText (configOf _shell >> "magazineBase");
private _charge = _shell getVariable ["shto_charge", 1];

format ["%1%2", _magazineBase, _charge]
