#include "..\script_component.hpp"

/*
 * Author: YannikH, toadball, Andx
 * Handles the unpackCrate event on the server: hides the closed crate, attaches its open variant in its place
 * and puts its two shells in it (attached; they are carried out with ACE). The crate is marked open (public),
 * so its "Unpack Crate" action is gone for everyone and it cannot be unpacked twice.
 *
 * Arguments:
 * 0: Closed crate <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_crate] call shot_over_logistics_fnc_unpackCrate
 *
 * Public: No
 */

params [["_crate", objNull, [objNull]]];

if (!isServer || {isNull _crate} || {_crate getVariable ["shto_crateIsOpen", false]}) exitWith {};

_crate setVariable ["shto_crateIsOpen", true, true];
_crate hideObjectGlobal true;

private _openCrateClass = getText (configOf _crate >> "openVariant");
private _openCrate = createVehicle [_openCrateClass, [0, 0, 100], [], 0, "CAN_COLLIDE"];
_openCrate setVariable ["shto_crateIsOpen", true, true];

private _shellClass = getText (configFile >> "CfgVehicles" >> _openCrateClass >> "shellType");
{
    private _shell = createVehicle [_shellClass, [0, 0, 0], [], 0, "CAN_COLLIDE"];
    _shell attachTo [_openCrate, _x];
    _shell setVectorDirAndUp [[0, 0, 1], [-1, 0, 0]];
} forEach CRATE_SHELL_POSITIONS;

_openCrate attachTo [_crate, [0, 0, 0]];
