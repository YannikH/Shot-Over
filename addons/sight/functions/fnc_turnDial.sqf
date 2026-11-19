#include "..\script_component.hpp"
/*
 * Author: YannikH, Andx
 * Turns a dial of the open sights. Values may be fractional while a key is held; they are rounded where they are
 * shown and used.
 *
 * Arguments:
 * 0: Dial, "deflection" or "quadrant" <STRING>
 * 1: Mils to turn by, positive turns the telescope right or raises the quadrant <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["deflection", 1] call shot_over_sight_fnc_turnDial
 *
 * Public: No
 */

params [["_dial", "", [""]], ["_mils", 0, [0]]];

if (_dial == "deflection") then {
    // the telescope turns all the way round
    GVAR(currentDeflection) = (GVAR(currentDeflection) + (_mils % 6400) + 6400) % 6400;
} else {
    GVAR(currentQuadrant) = (GVAR(currentQuadrant) + _mils) max QUADRANT_MIN min QUADRANT_MAX;
};
