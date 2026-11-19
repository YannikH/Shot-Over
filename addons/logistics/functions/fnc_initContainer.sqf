#include "..\script_component.hpp"

/*
 * Author: Andx
 * Fills a cargo container with its stock of crates on the server: shto_cratesleft (public) is set to the
 * container's crateCount. Containers show no crates; their stock is only a number. Init event handler of the
 * containers, so it also runs on clients, where it does nothing.
 *
 * Arguments:
 * 0: Container <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_container] call shot_over_logistics_fnc_initContainer
 *
 * Public: No
 */

params [["_container", objNull, [objNull]]];

if (!isServer || {isNull _container}) exitWith {};

_container setVariable ["shto_cratesleft", getNumber (configOf _container >> "crateCount"), true];
