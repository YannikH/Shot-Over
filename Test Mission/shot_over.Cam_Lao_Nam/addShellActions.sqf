
_action = ["M101 Shell","M101 Shell","",{},{true}, nil, nil, [0,0,0.3], shto_interaction_distance, [false, false, false, false, false]] call ace_interact_menu_fnc_createAction;
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

["shto_vn_m101_shell", 0,["ACE_MainActions","ACE_dragging_carry"]] call ace_interact_menu_fnc_removeActionFromClass;
["shto_vn_m101_shell_ab", 0,["ACE_MainActions","ACE_dragging_carry"]] call ace_interact_menu_fnc_removeActionFromClass;
["shto_vn_m101_shell_frag", 0,["ACE_MainActions","ACE_dragging_carry"]] call ace_interact_menu_fnc_removeActionFromClass;
["shto_vn_m101_shell_wp", 0,["ACE_MainActions","ACE_dragging_carry"]] call ace_interact_menu_fnc_removeActionFromClass;
["shto_vn_m101_shell_smk", 0,["ACE_MainActions","ACE_dragging_carry"]] call ace_interact_menu_fnc_removeActionFromClass;
["shto_vn_m101_shell_illum", 0,["ACE_MainActions","ACE_dragging_carry"]] call ace_interact_menu_fnc_removeActionFromClass;