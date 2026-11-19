#include "..\script_component.hpp"
/*
 * Author: Andx
 * Closes the sights and leaves the dials' settings on the gun for the next gunner.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call shot_over_sight_fnc_close
 *
 * Public: No
 */

if (isNil QGVAR(camera)) exitWith {};

[GVAR(pfh)] call CBA_fnc_removePerFrameHandler;
GVAR(camera) cameraEffect ["terminate", "back"];
camDestroy GVAR(camera);
QGVAR(view) cutText ["", "PLAIN"];
GVAR(hiddenUnit) hideObject false;

// broadcast once per use of the sights, not per turn of a dial; a public variable reaches players who join later
private _gun = GVAR(gun);
if (!isNull _gun) then {
    private _deflection = round GVAR(currentDeflection) % 6400;
    private _quadrant = round GVAR(currentQuadrant);
    if (_gun getVariable [QGVAR(deflection), DEFAULT_DEFLECTION] != _deflection) then {
        _gun setVariable [QGVAR(deflection), _deflection, true];
    };
    if (_gun getVariable [QGVAR(quadrant), 0] != _quadrant) then {
        _gun setVariable [QGVAR(quadrant), _quadrant, true];
    };
};

GVAR(camera) = nil;
GVAR(gun) = nil;
GVAR(hiddenUnit) = nil;
GVAR(pfh) = nil;
GVAR(turning) = [];
