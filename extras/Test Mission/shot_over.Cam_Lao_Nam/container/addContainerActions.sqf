_crateaction = ["Take_Crate","Take Crate","",{
    params ["_target"];

    private _targetClass = typeOf _target;
    private _cratesClass = getText (configFile >> "CfgVehicles" >> _targetClass >> "crateClass");
    private _carriedObj = ace_player getVariable "ace_dragging_carriedObject";
    if (!isNil "_carriedObj" && !(isNull _carriedObj)) exitWith {};

    private _newCrate = _cratesClass createVehicle (getPos _target);
    [ace_player, _newCrate] call ace_dragging_fnc_startCarry;
    [_target, 1] call shto_fnc_removeCrates;
  },
  { (_target getVariable ["shto_cratesleft",0]) > 0 }, nil, nil, [0,0,0.4], shto_interaction_distance, [false, false, false, false, false], {
    params ["_target", "_player", "_params", "_actionData"];

    _actionData set [1, format ["Take %1", getText (configFile >> "CfgVehicles" >> (getText ((configOf _target) >> "crateClass")) >> "displayName")]];
}] call ace_interact_menu_fnc_createAction;

_palletaction = ["Take_Pallet","Take Pallet","",{
    params ["_target"];

    private _targetClass = typeOf _target;

    private _carriedObj = ace_player getVariable "ace_dragging_carriedObject";
    if (!isNil "_carriedObj" && !(isNull _carriedObj)) exitWith {};

    private _newCrate = "shto_vn_m101_he_pallet_x42" createVehicle (getPos _target);
    //[ace_player, _newCrate] call ace_dragging_fnc_startCarry;
    [_target, getNumber(configFile >> "CfgVehicles" >> "shto_vn_m101_he_pallet_x42" >> "crateCount")] call shto_fnc_removeCrates;
  },
  { (_target getVariable ["shto_cratesleft",0]) > 0 }, nil, nil, [0,0,0.4], shto_interaction_distance, [false, false, false, false, false], {
    params ["_target", "_player", "_params", "_actionData"];

    _actionData set [1, format ["Take %1", getText (configFile >> "CfgVehicles" >> (getText ((configOf _target) >> "crateClass")) >> "displayName")]];
}] call ace_interact_menu_fnc_createAction;

["shto_vn_m101_he_container_x504", 0, ["ACE_MainActions"], _crateaction, true] call ace_interact_menu_fnc_addActionToClass;
