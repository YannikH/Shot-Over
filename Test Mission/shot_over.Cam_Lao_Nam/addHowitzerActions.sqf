_action = ["Open Breech","Open Breech","",{
	//_target animatesource ["m101_reload_source",0.8375, 2];
	_target animatesource ["m101_reload_source",0.7, 3];
},{
	//((_target animationSourcePhase "m101_reload_source") < 1) &&
	((_target animationSourcePhase "m101_reload_source") > 0.85)
}, nil, nil, {[_target, [0.11,-1.7,0.8]] call shto_fnc_posAlongRecoilAxis;}, SHTO_INTERACTION_DISTANCE] call ace_interact_menu_fnc_createAction;
["shto_vn_static_m101_02_base", 0, [], _action] call ace_interact_menu_fnc_addActionToClass;

//_action = ["Unload Shell","Unload Shell","",{
//    _target animatesource ["m101_reload_source",0.7];
//},{
//    ((_target animationSourcePhase "m101_reload_source") < 0.86) &&
//    ((_target animationSourcePhase "m101_reload_source") > 0.7)
//}, nil, nil, {[_target, [0,-1.8,0.5]] call shto_fnc_posAlongRecoilAxis;}, SHTO_INTERACTION_DISTANCE] call ace_interact_menu_fnc_createAction;
//["shto_vn_static_m101_02_base", 0, [], _action] call ace_interact_menu_fnc_addActionToClass;

_action = ["Close Breech","Close Breech","",{
	_target animatesource ["m101_reload_source",0, 4];
},{
	((_target animationSourcePhase "m101_reload_source") < 0.31) &&
	((_target animationSourcePhase "m101_reload_source") > 0)
}, nil, nil, {[_target, [0.35,-1.07,0.8]] call shto_fnc_posAlongRecoilAxis;}, SHTO_INTERACTION_DISTANCE] call ace_interact_menu_fnc_createAction;
["shto_vn_static_m101_02_base", 0, [], _action] call ace_interact_menu_fnc_addActionToClass;

_action = ["Fire Howitzer","Fire Howitzer","",{
	[_target, player] remoteExecCall ["shto_fnc_remoteFireHowitzer", _target];
},{
	((_target animationSourcePhase "m101_reload_source") < 0.01)
}, nil, nil, {[_target, [0.2,-1,0.25]] call shto_fnc_posAlongRecoilAxis;}, SHTO_INTERACTION_DISTANCE] call ace_interact_menu_fnc_createAction;
["shto_vn_static_m101_02_base", 0, [], _action] call ace_interact_menu_fnc_addActionToClass;

_action = ["Traverse Turret","Traverse Turret","",{
	private _direction = (direction _target) - (_target animationPhase "mainturret") * 57.2958; // around otocvez
	hint format ["Direction: %1 mils", round (_direction * (6400 / 360))];
},{true}, nil, nil,
{[_target, [-0.5,-0.5,0]] call shto_fnc_posAlongDirection;}, 1, [false, false, false, true, false]] call ace_interact_menu_fnc_createAction;
["shto_vn_static_m101_02_base", 0, [], _action] call ace_interact_menu_fnc_addActionToClass;

_action = ["Elevate Turret","Elevate Turret","",{
	private _direction = (_target animationPhase "maingun") * 57.2958; // around otocvez
	hint format ["Elevation: %1 mils", round (_direction * (6400 / 360))];
},{true}, nil, nil, 
{[_target, [0.4,-0.3,0.2]] call shto_fnc_posAlongDirection;}, 1, [false, false, false, true, false]] call ace_interact_menu_fnc_createAction;
["shto_vn_static_m101_02_base", 0, [], _action] call ace_interact_menu_fnc_addActionToClass;