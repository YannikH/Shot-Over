
_action = ["M101 Shell","M101 Shell","",{},{true}, nil, nil, [0,0,0.4], shto_interaction_distance, [false, false, false, false, false], {
    params ["_target", "_player", "_params", "_actionData"];

    _actionData set [1, format ["%1, Chg %2", getText ((configOf _target) >> "displayName"), _target getVariable ["shto_charge", 1]]];
}] call ace_interact_menu_fnc_createAction;
["shto_vn_m101_shell", 0, [], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ["Carry Shell","Carry Shell","",{
    private _shell = ace_player getVariable "ace_dragging_carriedObject";
    if (!isNil "_shell" && !(isNull _shell)) exitWith {};
    [ace_player, _target] call ace_dragging_fnc_startCarry;

    [] spawn {
        sleep 0.1;
        [localize "STR_ACE_Dragging_Drop", "Load", localize "STR_ace_dragging_RaiseLowerRotate"] call ace_interaction_fnc_showMouseHint;
    };
},{true}, nil, nil, [0,0,0], shto_interaction_distance, [false, false, false, false, false]] call ace_interact_menu_fnc_createAction;
["shto_vn_m101_shell", 0, ["M101 Shell"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ["Set Charge","Set Charge","",{},{true}, nil, nil, [0,0,0], shto_interaction_distance, [false, false, false, false, false]] call ace_interact_menu_fnc_createAction;
["shto_vn_m101_shell", 0, ["M101 Shell"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ["Charge 1","Charge 1","",{_target setVariable ["shto_charge", 1, true]},{true}, nil, nil, [0,0,0], shto_interaction_distance, [false, false, false, false, false]] call ace_interact_menu_fnc_createAction;["shto_vn_m101_shell", 0, ["M101 Shell", "Set Charge"], _action, true] call ace_interact_menu_fnc_addActionToClass;
_action = ["Charge 2","Charge 2","",{_target setVariable ["shto_charge", 2, true]},{true}, nil, nil, [0,0,0], shto_interaction_distance, [false, false, false, false, false]] call ace_interact_menu_fnc_createAction;["shto_vn_m101_shell", 0, ["M101 Shell", "Set Charge"], _action, true] call ace_interact_menu_fnc_addActionToClass;
_action = ["Charge 3","Charge 3","",{_target setVariable ["shto_charge", 3, true]},{true}, nil, nil, [0,0,0], shto_interaction_distance, [false, false, false, false, false]] call ace_interact_menu_fnc_createAction;["shto_vn_m101_shell", 0, ["M101 Shell", "Set Charge"], _action, true] call ace_interact_menu_fnc_addActionToClass;
_action = ["Charge 4","Charge 4","",{_target setVariable ["shto_charge", 4, true]},{true}, nil, nil, [0,0,0], shto_interaction_distance, [false, false, false, false, false]] call ace_interact_menu_fnc_createAction;["shto_vn_m101_shell", 0, ["M101 Shell", "Set Charge"], _action, true] call ace_interact_menu_fnc_addActionToClass;
_action = ["Charge 5","Charge 5","",{_target setVariable ["shto_charge", 5, true]},{true}, nil, nil, [0,0,0], shto_interaction_distance, [false, false, false, false, false]] call ace_interact_menu_fnc_createAction;["shto_vn_m101_shell", 0, ["M101 Shell", "Set Charge"], _action, true] call ace_interact_menu_fnc_addActionToClass;

["shto_vn_m101_shell", 0,["ACE_MainActions","ACE_dragging_carry"]] call ace_interact_menu_fnc_removeActionFromClass;
["shto_vn_m101_shell_ab", 0,["ACE_MainActions","ACE_dragging_carry"]] call ace_interact_menu_fnc_removeActionFromClass;
["shto_vn_m101_shell_frag", 0,["ACE_MainActions","ACE_dragging_carry"]] call ace_interact_menu_fnc_removeActionFromClass;
["shto_vn_m101_shell_wp", 0,["ACE_MainActions","ACE_dragging_carry"]] call ace_interact_menu_fnc_removeActionFromClass;
["shto_vn_m101_shell_smk", 0,["ACE_MainActions","ACE_dragging_carry"]] call ace_interact_menu_fnc_removeActionFromClass;
["shto_vn_m101_shell_illum", 0,["ACE_MainActions","ACE_dragging_carry"]] call ace_interact_menu_fnc_removeActionFromClass;