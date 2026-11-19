#include "..\script_component.hpp"
/*
 * Author: YannikH, Andx
 * Opens the gun's sights for its gunner: the view through the panoramic telescope with the deflection and quadrant
 * dials beside it. The dials start as the last gunner left them. Closes by itself (fnc_update) once the player is
 * no longer the gunner.
 *
 * Arguments:
 * 0: Gun <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject] call shot_over_sight_fnc_open
 *
 * Public: No
 */

params [["_gun", objNull, [objNull]]];

if (!isNil QGVAR(camera) || {ACE_player != gunner _gun}) exitWith {};

GVAR(gun) = _gun;
GVAR(currentDeflection) = _gun getVariable [QGVAR(deflection), DEFAULT_DEFLECTION];
GVAR(currentQuadrant) = _gun getVariable [QGVAR(quadrant), 0];
// [dial, direction, time pressed] while a dial key is held, see XEH_postInit
GVAR(turning) = [];

// the telescope sits next to the gunner's head and would show the gunner's own body; hidden only on this machine,
// and only if nothing else hid it (fnc_close shows it again)
GVAR(hiddenUnit) = objNull;
if (!isObjectHidden ACE_player) then {
    ACE_player hideObject true;
    GVAR(hiddenUnit) = ACE_player;
};

GVAR(camera) = "camera" camCreate (ASLToAGL getPosASL _gun);
GVAR(camera) camSetFov TELESCOPE_FOV;
GVAR(camera) cameraEffect ["internal", "back"];
showCinemaBorder false;
QGVAR(view) cutRsc [QGVAR(view), "PLAIN", -1, false];

GVAR(pfh) = [LINKFUNC(update), 0, _gun] call CBA_fnc_addPerFrameHandler;
// place the camera now, not one frame later
[_gun, GVAR(pfh)] call FUNC(update);
