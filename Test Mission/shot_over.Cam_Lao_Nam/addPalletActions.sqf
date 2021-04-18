private _action = ["Take_Crate","Take Crate","",{

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

["shto_vn_m101_he_pallet_x42", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
