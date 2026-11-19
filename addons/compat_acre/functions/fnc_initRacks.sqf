#include "..\script_component.hpp"

/*
 * Author: Andx
 * Sets up the ACRE rack of a PRC-77 prop (CfgVehicles AcreRacks), with its "Racks" interaction. ACRE does this by
 * itself only for vehicles a player gets into; a prop needs acre_api_fnc_initVehicleRacks, which runs on the server
 * and needs a player in the mission to set the rack up, so it waits for the first one.
 *
 * Arguments:
 * 0: PRC-77 prop <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_radio] call shot_over_compat_acre_fnc_initRacks
 *
 * Public: No
 */

params [["_radio", objNull, [objNull]]];

if (!isServer || {isNull _radio}) exitWith {};

[{
    ([] call CBA_fnc_players) isNotEqualTo []
}, {
    params ["_radio"];
    if (isNull _radio || {[_radio] call acre_api_fnc_areVehicleRacksInitialized}) exitWith {};
    // the condition picks the player that sets the rack up; any will do
    [_radio, {true}] call acre_api_fnc_initVehicleRacks;
}, [_radio]] call CBA_fnc_waitUntilAndExecute;
