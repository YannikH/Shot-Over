#include "..\script_component.hpp"

/*
 * Author: YannikH, toadball, Andx
 * Computes the firing solutions of the M101 for a target: for every charge (one magazine each) the low- and
 * high-angle elevation that reaches the target, within the gun's elevation limits, with the time of flight.
 * Ballistics without air friction, as the original notebook used (it asked ACE's artillery table extension for
 * tables with air friction 0); in a vacuum the elevation has a closed form, so no table is needed.
 *
 * Arguments:
 * 0: Magazine classes, one per charge, charge 1 first <ARRAY>
 * 1: Horizontal distance to the target (m) <NUMBER>
 * 2: Height of the target above the gun (m), negative when below <NUMBER>
 *
 * Return Value:
 * Solutions, each [charge, elevation (mils), time of flight (s)] <ARRAY>
 *
 * Example:
 * [["shto_105mm_mag_he_x1_c1", "shto_105mm_mag_he_x1_c2"], 4500, -20] call shot_over_fcs_fnc_getFiringSolutionsForMagazines
 *
 * Public: No
 */

params [["_magazines", [], [[]]], ["_distance", 0, [0]], ["_height", 0, [0]]];

private _solutions = [];
if (_distance <= 0) exitWith {_solutions};

{
    private _charge = _forEachIndex + 1;
    private _speed = getNumber (configFile >> "CfgMagazines" >> _x >> "initSpeed");
    if (_speed > 0) then {
        // height = distance * tan(e) - a * (1 + tan²(e)), with a = g * distance² / (2 * speed²); solved for tan(e)
        private _a = GRAVITY * _distance ^ 2 / (2 * _speed ^ 2);
        private _discriminant = _distance ^ 2 - 4 * _a * (_a + _height);
        if (_discriminant >= 0) then {
            {
                // -1 gives the low angle, 1 the high angle
                private _elevation = atan ((_distance + _x * sqrt _discriminant) / (2 * _a));
                if (_elevation >= MIN_ELEVATION && {_elevation <= MAX_ELEVATION}) then {
                    _solutions pushBack [_charge, _elevation * 6400 / 360, _distance / (_speed * cos _elevation)];
                };
            } forEach ([[-1], [-1, 1]] select (_discriminant > 0)); // at maximum range both are the same
        };
    };
} forEach _magazines;

_solutions
