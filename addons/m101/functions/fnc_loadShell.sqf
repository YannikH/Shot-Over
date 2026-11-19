#include "..\script_component.hpp"

/*
 * Author: YannikH, toadball, Andx
 * Loads the shell a unit carries into the nearest M101: checks the breech is open and empty and the shell is at the
 * breech, puts the shell down (ACE dragging) and deletes it, and sends the load to the machine where the gun is
 * local (fnc_onLoadShell), which checks again, as another crew member may have loaded it in the meantime.
 * Runs on the machine of the carrying unit.
 *
 * Arguments:
 * 0: Unit carrying the shell <OBJECT>
 * 1: Carried shell <OBJECT>
 *
 * Return Value:
 * True if the load was sent to the gun <BOOL>
 *
 * Example:
 * [ace_player, ace_player getVariable "ace_dragging_carriedObject"] call shot_over_m101_fnc_loadShell
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_shell", objNull, [objNull]]];

if (!local _unit || {isNull _shell}) exitWith {false};

private _guns = nearestObjects [_unit, ["shto_vn_static_m101_02_base"], GUN_SEARCH_DISTANCE];
if (_guns isEqualTo []) exitWith {
    hint LELSTRING(logistics,Hint_NoHowitzer);
    false
};
private _gun = _guns select 0;

if (magazines _gun isNotEqualTo [] || {abs ((_gun animationSourcePhase BREECH_SOURCE) - BREECH_OPEN) > 0.01}) exitWith {
    hint LLSTRING(Hint_BreechNotEmpty);
    false
};

private _breech = _gun modelToWorld ([_gun, BREECH_OFFSET] call FUNC(posAlongRecoilAxis));
if (_shell distance _breech > LOAD_DISTANCE) exitWith {
    hint LLSTRING(Hint_ShellTooFar);
    false
};

private _magazine = [_shell] call FUNC(getMagazineFromShell);
private _shellClass = typeOf _shell;
private _charge = _shell getVariable ["shto_charge", 1];

[_unit, _shell] call ace_dragging_fnc_dropObject;
deleteVehicle _shell;

[QGVAR(loadShell), [_gun, _magazine, _shellClass, _charge], _gun] call CBA_fnc_targetEvent;

true
