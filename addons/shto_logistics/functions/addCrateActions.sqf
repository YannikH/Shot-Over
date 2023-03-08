
_action = ["Unpack Crate","Unpack Crate","",{
	_target remoteExec ["shot_over_shto_logistics_fnc_unpackCrate", _target];
  _target setVariable ["shto_crateIsOpen",true];
},{!(_target getVariable ["shto_crateIsOpen",false])}] call ace_interact_menu_fnc_createAction;
["shto_vn_crate_base", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
