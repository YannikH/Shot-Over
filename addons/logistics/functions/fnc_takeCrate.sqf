#include "..\script_component.hpp"

/*
 * Author: YannikH, toadball, Andx
 * Handles the takeCrate event on the server: takes one crate from a pallet (its top attached crate is removed) or
 * from a container (its stock goes down by one) and puts a crate of the same kind on the ground in front of the
 * unit, to carry with ACE. Done on the server so two players cannot take the last crate at the same time.
 *
 * Arguments:
 * 0: Pallet or container <OBJECT>
 * 1: Unit taking the crate <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_pallet, player] call shot_over_logistics_fnc_takeCrate
 *
 * Public: No
 */

params [["_source", objNull, [objNull]], ["_unit", objNull, [objNull]]];

if (!isServer || {isNull _source} || {isNull _unit}) exitWith {};

private _left = _source getVariable ["shto_cratesleft", 0];
if (_left <= 0) exitWith {};

if (_source isKindOf "shto_vn_m101_pallet_base") then {
    private _crates = _source getVariable ["shto_crateList", []];
    if (_crates isNotEqualTo []) then {
        deleteVehicle (_crates deleteAt (count _crates - 1));
    };
    _left = count _crates;
    _source setVariable ["shto_crateList", _crates, true];
    [_source, PALLET_CARGO_SIZE(_left)] call ace_cargo_fnc_setSize;
} else {
    _left = _left - 1;
};
_source setVariable ["shto_cratesleft", _left, true];

createVehicle [getText (configOf _source >> "crateClass"), _unit getRelPos [1, 0], [], 0, "NONE"];
