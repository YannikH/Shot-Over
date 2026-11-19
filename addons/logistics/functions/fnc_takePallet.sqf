#include "..\script_component.hpp"

/*
 * Author: YannikH, toadball, Andx
 * Handles the takePallet event on the server: takes a pallet of crates out of a container, next to the unit. Of
 * the container's palletClasses it takes the largest that its stock still fills; with fewer crates left than the
 * smallest pallet holds, the smallest pallet gets the rest.
 *
 * Arguments:
 * 0: Container <OBJECT>
 * 1: Unit taking the pallet <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_container, player] call shot_over_logistics_fnc_takePallet
 *
 * Public: No
 */

params [["_container", objNull, [objNull]], ["_unit", objNull, [objNull]]];

if (!isServer || {isNull _container} || {isNull _unit}) exitWith {};

private _left = _container getVariable ["shto_cratesleft", 0];
private _pallets = getArray (configOf _container >> "palletClasses") apply {[getNumber (configFile >> "CfgVehicles" >> _x >> "crateCount"), _x]};
if (_left <= 0 || {_pallets isEqualTo []}) exitWith {};

_pallets sort false;
private _index = _pallets findIf {(_x select 0) <= _left};
(if (_index == -1) then {[_left, (_pallets select (count _pallets - 1)) select 1]} else {_pallets select _index}) params ["_crateCount", "_palletClass"];

_container setVariable ["shto_cratesleft", _left - _crateCount, true];

// the pallet's init event handler stacks it with its own crateCount; restack it when it gets fewer
private _pallet = createVehicle [_palletClass, _unit getRelPos [2, 0], [], 0, "NONE"];
if (_crateCount != getNumber (configOf _pallet >> "crateCount")) then {
    [_pallet, _crateCount] call FUNC(initPallet);
};
