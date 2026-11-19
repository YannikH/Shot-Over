#include "..\script_component.hpp"

/*
 * Author: YannikH, toadball, Andx
 * Stacks a pallet with crates on the server: attached simple objects, three per layer, each layer turned by 90°,
 * replacing any crates it already had. Stores them as shto_crateList and their number as shto_cratesleft (both
 * public) and sets the ACE cargo size. Init event handler of the pallets, so it also runs on clients; it only acts
 * on the server, which owns the crates (a client deleting them on joining would remove them for everyone).
 *
 * Arguments:
 * 0: Pallet <OBJECT>
 * 1: Number of crates (default: the pallet's crateCount) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_pallet, 12] call shot_over_logistics_fnc_initPallet
 *
 * Public: No
 */

params [["_pallet", objNull, [objNull]], ["_crateCount", -1, [0]]];

if (!isServer || {isNull _pallet}) exitWith {};

{
    deleteVehicle _x;
} forEach (_pallet getVariable ["shto_crateList", []]);

private _config = configOf _pallet;
if (_crateCount < 0) then {
    _crateCount = getNumber (_config >> "crateCount");
};
private _crateClass = getText (_config >> "crateClass");
private _height = getNumber (_config >> "yOffset");

private _crates = [];
for "_index" from 0 to _crateCount - 1 do {
    private _layer = floor (_index / 3);
    private _offset = -0.35 + (_index % 3) * 0.35;
    private _crate = createSimpleObject [_crateClass, getPosASL _pallet];
    // the first, third, ... layer lies along the pallet's y axis, the others along its x axis
    if (_layer % 2 == 0) then {
        _crate attachTo [_pallet, [0, _offset, _height + _layer * 0.2]];
        _crate setVectorDirAndUp [[0, 1, 0], [0, 0, 1]];
    } else {
        _crate attachTo [_pallet, [_offset, 0, _height + _layer * 0.2]];
        _crate setVectorDirAndUp [[1, 0, 0], [0, 0, 1]];
    };
    _crates pushBack _crate;
};

_pallet setVariable ["shto_crateList", _crates, true];
_pallet setVariable ["shto_cratesleft", count _crates, true];
[_pallet, PALLET_CARGO_SIZE(count _crates)] call ace_cargo_fnc_setSize;
