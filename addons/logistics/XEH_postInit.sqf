shto_interaction_distance = 5;
// container
private _crateaction = ["Take_Crate","Take Crate","",{
    params ["_target"];

    private _targetClass = typeOf _target;
    private _cratesClass = getText (configFile >> "CfgVehicles" >> _targetClass >> "crateClass");
    private _carriedObj = ace_player getVariable "ace_dragging_carriedObject";
    if (!isNil "_carriedObj" && !(isNull _carriedObj)) exitWith {};

    private _newCrate = _cratesClass createVehicle (getPos _target);
    [ace_player, _newCrate] call ace_dragging_fnc_startCarry;
    [_target, 1] call shot_over_logistics_fnc_removeCrates;
  },
  { (_target getVariable ["shto_cratesleft",0]) > 0 }, nil, nil, [0,0,0.4], shto_interaction_distance, [false, false, false, false, false], {
    params ["_target", "_player", "_params", "_actionData"];

    _actionData set [1, format ["Take %1", getText (configFile >> "CfgVehicles" >> (getText ((configOf _target) >> "crateClass")) >> "displayName")]];
}] call ace_interact_menu_fnc_createAction;

// pallet
private _palletaction = ["Take_Pallet","Take Pallet","",{
    params ["_target"];

    private _targetClass = typeOf _target;

    private _carriedObj = ace_player getVariable "ace_dragging_carriedObject";
    if (!isNil "_carriedObj" && !(isNull _carriedObj)) exitWith {};

    private _newCrate = "shto_vn_m101_he_pallet_x42" createVehicle (getPos _target);
    //[ace_player, _newCrate] call ace_dragging_fnc_startCarry;
    [_target, getNumber(configFile >> "CfgVehicles" >> "shto_vn_m101_he_pallet_x42" >> "crateCount")] call shot_over_logistics_fnc_removeCrates;
  },
  { (_target getVariable ["shto_cratesleft",0]) > 0 }, nil, nil, [0,0,0.4], shto_interaction_distance, [false, false, false, false, false], {
    params ["_target", "_player", "_params", "_actionData"];

    _actionData set [1, format ["Take %1", getText (configFile >> "CfgVehicles" >> (getText ((configOf _target) >> "crateClass")) >> "displayName")]];
}] call ace_interact_menu_fnc_createAction;

["shto_vn_m101_container_base", 0, ["ACE_MainActions"], _crateaction, true] call ace_interact_menu_fnc_addActionToClass;

_action = ["Unpack Crate","Unpack Crate","",{
	_target remoteExec ["shot_over_logistics_fnc_unpackCrate", _target];
  _target setVariable ["shto_crateIsOpen",true];
},{!(_target getVariable ["shto_crateIsOpen",false])}] call ace_interact_menu_fnc_createAction;
["shto_vn_crate_base", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

// crate
_action = ["Take_Crate","Take Crate","",{
    params ["_target"];

    private _targetClass = typeOf _target;
    private _cratesClass = getText (configFile >> "CfgVehicles" >> _targetClass >> "crateClass");
    private _cratesArray = _target getVariable "shto_crateList";
    private _crate = _cratesArray # ((count _cratesArray)-1);

    private _carriedObj = ace_player getVariable "ace_dragging_carriedObject";
    if (!isNil "_carriedObj" && !(isNull _carriedObj)) exitWith {};

    private _newCrate = _cratesClass createVehicle (getPos _target);
    [ace_player, _newCrate] call ace_dragging_fnc_startCarry;

    deleteVehicle _crate;
    private _cratesArray = _cratesArray - [_crate];
    _target setVariable ["shto_crateList",_cratesArray,true];
    _target setVariable ["shto_cratesleft",count (_cratesArray),true];
    [_target, (ceil(count (_cratesArray) / 21) * 5)] call ace_cargo_fnc_setSize;
  },
  {
    (_target getVariable ["shto_cratesleft",0]) > 0
  }, nil, nil, [0,0,0.4], shto_interaction_distance, [false, false, false, false, false], {
    params ["_target", "_player", "_params", "_actionData"];

    _actionData set [1, format ["Take %1", getText (configFile >> "CfgVehicles" >> (getText ((configOf _target) >> "crateClass")) >> "displayName")]];
}] call ace_interact_menu_fnc_createAction;

["shto_vn_m101_pallet_base", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

// shell
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

[] spawn {
  waitUntil{sleep 1;["ACE_dragging"] call ace_common_fnc_isModLoaded};
  sleep 1;
  ["shto_vn_m101_shell", 0,["ACE_MainActions","ACE_dragging_carry"]] call ace_interact_menu_fnc_removeActionFromClass;
  ["shto_vn_m101_shell_ab", 0,["ACE_MainActions","ACE_dragging_carry"]] call ace_interact_menu_fnc_removeActionFromClass;
  ["shto_vn_m101_shell_frag", 0,["ACE_MainActions","ACE_dragging_carry"]] call ace_interact_menu_fnc_removeActionFromClass;
  ["shto_vn_m101_shell_wp", 0,["ACE_MainActions","ACE_dragging_carry"]] call ace_interact_menu_fnc_removeActionFromClass;
  ["shto_vn_m101_shell_smk", 0,["ACE_MainActions","ACE_dragging_carry"]] call ace_interact_menu_fnc_removeActionFromClass;
  ["shto_vn_m101_shell_illum", 0,["ACE_MainActions","ACE_dragging_carry"]] call ace_interact_menu_fnc_removeActionFromClass;

};