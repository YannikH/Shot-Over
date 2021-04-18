//Creates a supply truck with action to space 105mm shells

params ["_object"]; // [_object] call shto_fnc_setupSupplyTruck;

private _action = ["Unpack_105","Unpack 105mm Shell","",{nil},{true}] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["Unpack_HE","Unpack 105mm HE","",{
  ["shto_vn_m101_shell_he"] call shto_fnc_spawnAndCarryAmmo;
},{true}] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions","Unpack_105"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["Unpack_AB","Unpack 105mm AB","",{
  ["shto_vn_m101_shell_ab"] call shto_fnc_spawnAndCarryAmmo;
},{true}] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions","Unpack_105"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["Unpack_FRAG","Unpack 105mm FRAG","",{
  ["shto_vn_m101_shell_frag"] call shto_fnc_spawnAndCarryAmmo;
},{true}] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions","Unpack_105"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["Unpack_WP","Unpack 105mm WP","",{
  ["shto_vn_m101_shell_wp"] call shto_fnc_spawnAndCarryAmmo;
},{true}] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions","Unpack_105"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["Unpack_SMK","Unpack 105mm SMOKE","",{
  ["shto_vn_m101_shell_smk"] call shto_fnc_spawnAndCarryAmmo;
},{true}] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions","Unpack_105"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["Unpack_ILLUM","Unpack 105mm LUME","",{
  ["shto_vn_m101_shell_illum"] call shto_fnc_spawnAndCarryAmmo;
},{true}] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions","Unpack_105"], _action] call ace_interact_menu_fnc_addActionToObject;
