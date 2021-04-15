
_action = ["Unpack Crate","Unpack Crate","",{
	_target remoteExec ["shto_fnc_unpackCrate", _target];
},{true}] call ace_interact_menu_fnc_createAction;
["shto_vn_crate_base", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
