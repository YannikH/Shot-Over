#include "..\script_component.hpp"

/*
 * Author: YannikH, toadball, Andx
 * MouseButtonDown handler of the mission display (XEH_missionDisplayLoad): a right click while carrying an M101
 * shell loads it into the nearest gun (m101_fnc_loadShell).
 *
 * Arguments:
 * 0: Display <DISPLAY>
 * 1: Mouse button, 1 is the right button <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [findDisplay 46, 1] call shot_over_logistics_fnc_mouseButton
 *
 * Public: No
 */

params [["_display", displayNull, [displayNull]], ["_button", -1, [0]]];

if (_button != 1) exitWith {};

private _shell = ace_player getVariable ["ace_dragging_carriedObject", objNull];
if (isNull _shell || {!(_shell isKindOf "shto_vn_m101_shell")}) exitWith {};

[ace_player, _shell] call EFUNC(m101,loadShell);
