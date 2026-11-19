#include "script_component.hpp"

// stock changes run on the server, so two players cannot take the same crate
if (isServer) then {
    [QGVAR(takeCrate), LINKFUNC(takeCrate)] call CBA_fnc_addEventHandler;
    [QGVAR(takePallet), LINKFUNC(takePallet)] call CBA_fnc_addEventHandler;
    [QGVAR(unpackCrate), LINKFUNC(unpackCrate)] call CBA_fnc_addEventHandler;
};

if (!hasInterface) exitWith {};

// shells are carried with ACE's own carry action; tell the carrier how to load them
["ace_dragging_startedCarry", {
    params ["_unit", "_target"];
    if (_unit isEqualTo ACE_player && {_target isKindOf "shto_vn_m101_shell"}) then {
        [LLSTRING(Hint_LoadShell), 3] call ace_common_fnc_displayTextStructured;
    };
}] call CBA_fnc_addEventHandler;

// "Take <crate> (<n> left)" for pallets and containers
private _takeCrateName = {
    params ["_target", "", "", "_actionData"];
    private _crateName = getText (configFile >> "CfgVehicles" >> getText (configOf _target >> "crateClass") >> "displayName");
    _actionData set [1, format [LLSTRING(Action_TakeFormatStock), _crateName, _target getVariable ["shto_cratesleft", 0]]];
};

private _action = ["Take_Crate", LLSTRING(Action_TakeCrate), "", {
    [QGVAR(takeCrate), [_target, _player]] call CBA_fnc_serverEvent;
}, {
    (_target getVariable ["shto_cratesleft", 0]) > 0
}, nil, nil, [0, 0, 0.4], INTERACTION_DISTANCE, [false, false, false, false, false], _takeCrateName] call ace_interact_menu_fnc_createAction;
["shto_vn_m101_container_base", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
["shto_vn_m101_pallet_base", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ["Take_Pallet", LLSTRING(Action_TakePallet), "", {
    [QGVAR(takePallet), [_target, _player]] call CBA_fnc_serverEvent;
}, {
    (_target getVariable ["shto_cratesleft", 0]) > 0
}, nil, nil, [0, 0, 0.4], INTERACTION_DISTANCE, [false, false, false, false, false], {
    params ["_target", "", "", "_actionData"];
    private _palletClass = getArray (configOf _target >> "palletClasses") param [0, ""];
    _actionData set [1, format [LLSTRING(Action_TakeFormat), getText (configFile >> "CfgVehicles" >> _palletClass >> "displayName")]];
}] call ace_interact_menu_fnc_createAction;
["shto_vn_m101_container_base", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ["Unpack Crate", LLSTRING(Action_UnpackCrate), "", {
    [QGVAR(unpackCrate), [_target]] call CBA_fnc_serverEvent;
}, {
    !(_target getVariable ["shto_crateIsOpen", false])
}] call ace_interact_menu_fnc_createAction;
["shto_vn_crate_base", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

// shell: its name with the charge set on it, and the charge to set
_action = ["M101 Shell", LLSTRING(Action_Shell), "", {}, {true}, nil, nil, [0, 0, 0.4], INTERACTION_DISTANCE, [false, false, false, false, false], {
    params ["_target", "", "", "_actionData"];
    _actionData set [1, format [LLSTRING(Action_ShellFormat), getText (configOf _target >> "displayName"), _target getVariable ["shto_charge", 1]]];
}] call ace_interact_menu_fnc_createAction;
["shto_vn_m101_shell", 0, [], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ["Set Charge", LLSTRING(Action_SetCharge), "", {}, {true}, nil, nil, [0, 0, 0], INTERACTION_DISTANCE, [false, false, false, false, false]] call ace_interact_menu_fnc_createAction;
["shto_vn_m101_shell", 0, ["M101 Shell"], _action, true] call ace_interact_menu_fnc_addActionToClass;

for "_charge" from 1 to 5 do {
    _action = [format ["Charge %1", _charge], format [LLSTRING(Action_Charge), _charge], "", {
        params ["_target", "", "_charge"];
        _target setVariable ["shto_charge", _charge, true];
    }, {true}, nil, _charge, [0, 0, 0], INTERACTION_DISTANCE, [false, false, false, false, false]] call ace_interact_menu_fnc_createAction;
    ["shto_vn_m101_shell", 0, ["M101 Shell", "Set Charge"], _action, true] call ace_interact_menu_fnc_addActionToClass;
};
