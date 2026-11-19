#include "script_component.hpp"

if (!hasInterface) exitWith {};

#define NOTEBOOK_ICON "vn\modules_f_vietnam\data\vn_displayartillery\mapfolder.paa"

// the notebook comes with the FDC backpack, worn or lying on the ground
private _action = ["SHTO_FDC_Notebook", LLSTRING(Action_OpenNotebook), NOTEBOOK_ICON, {
    createDialog "shto_calculator";
}, {
    backpack _player isKindOf "shto_rto_pack"
}] call ace_interact_menu_fnc_createAction;
["Man", 1, ["ACE_SelfActions", "ACE_Equipment"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ["SHTO_FDC_Notebook", LLSTRING(Action_OpenNotebook), NOTEBOOK_ICON, {
    createDialog "shto_calculator";
}, {
    (getBackpackCargo _target select 0) findIf {_x isKindOf "shto_rto_pack"} != -1
}, nil, nil, [0, 0, -0.4], INTERACTION_DISTANCE] call ace_interact_menu_fnc_createAction;
["GroundWeaponHolder", 0, [], _action, true] call ace_interact_menu_fnc_addActionToClass;

// the minimized notebook stays on screen after the notebook is closed, until it is hidden
_action = ["SHTO_FDC_Notebook_hide", LLSTRING(Action_HideNotebook), NOTEBOOK_ICON, {
    MINIMIZED_LAYER cutText ["", "PLAIN"];
}, {
    !isNull (uiNamespace getVariable ["shto_fcs_dialog", displayNull])
}] call ace_interact_menu_fnc_createAction;
["Man", 1, ["ACE_SelfActions", "ACE_Equipment"], _action, true] call ace_interact_menu_fnc_addActionToClass;

[
    "Shot, Over!",
    "shto_keybind_togglenotebook",
    LLSTRING(Keybind_ToggleNotebook),
    {},
    {
        if !(backpack ACE_player isKindOf "shto_rto_pack") exitWith {};
        if (dialog) then {
            closeDialog 2;
        } else {
            createDialog "shto_calculator";
        };
    },
    [207, [false, false, false]] // End
] call CBA_fnc_addKeybind;

[
    "Shot, Over!",
    "shto_keybind_closenotebook",
    LLSTRING(Keybind_CloseNotebook),
    {},
    {
        if (isNull (uiNamespace getVariable ["shto_fcs_dialog", displayNull])) exitWith {};
        if (dialog) then {
            closeDialog 2;
        } else {
            MINIMIZED_LAYER cutText ["", "PLAIN"];
        };
    },
    [207, [false, true, false]] // Ctrl+End
] call CBA_fnc_addKeybind;
