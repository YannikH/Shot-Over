/*private _action = ["Take_Crate","Take Crate","",{

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


},{true}] call ace_interact_menu_fnc_createAction;

["shto_vn_m101_he_pallet_x42", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;*/


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

["shto_vn_m101_he_pallet_x42", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
