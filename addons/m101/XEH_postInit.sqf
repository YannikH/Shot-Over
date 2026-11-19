#include "script_component.hpp"

// each event runs where its target is local: the gun (load, fire), the unit (knock-down), the server (casing)
[QGVAR(loadShell), LINKFUNC(onLoadShell)] call CBA_fnc_addEventHandler;
[QGVAR(fire), LINKFUNC(onFire)] call CBA_fnc_addEventHandler;
[QGVAR(knockDown), LINKFUNC(knockDown)] call CBA_fnc_addEventHandler;
if (isServer) then {
    [QGVAR(ejectCasing), LINKFUNC(ejectCasing)] call CBA_fnc_addEventHandler;
};

if (!hasInterface) exitWith {};

// the breech animation is global, so the actions can move it from the machine of the crew member using them
private _action = ["Open Breech", LLSTRING(Action_OpenBreech), "", {
    _target animateSource [BREECH_SOURCE, BREECH_OPEN, 3];
    [QGVAR(ejectCasing), [_target]] call CBA_fnc_serverEvent;
}, {
    (_target animationSourcePhase BREECH_SOURCE) > 0.85
}, nil, nil, {[_target, [0.11, -1.7, 0.8]] call FUNC(posAlongRecoilAxis)}, INTERACTION_DISTANCE] call ace_interact_menu_fnc_createAction;
["shto_vn_static_m101_02_base", 0, [], _action] call ace_interact_menu_fnc_addActionToClass;

_action = ["Close Breech", LLSTRING(Action_CloseBreech), "", {
    _target animateSource [BREECH_SOURCE, BREECH_CLOSED, 4];
}, {
    private _phase = _target animationSourcePhase BREECH_SOURCE;
    _phase > BREECH_CLOSED && {_phase < 0.31}
}, nil, nil, {[_target, [0.35, -1.07, 0.8]] call FUNC(posAlongRecoilAxis)}, INTERACTION_DISTANCE] call ace_interact_menu_fnc_createAction;
["shto_vn_static_m101_02_base", 0, [], _action] call ace_interact_menu_fnc_addActionToClass;

// pulling the lanyard: needs a gunner, who fires the round where the gun is local
_action = ["Fire Howitzer", LLSTRING(Action_FireHowitzer), "", {
    [QGVAR(fire), [_target], _target] call CBA_fnc_targetEvent;
}, {
    (_target animationSourcePhase BREECH_SOURCE) < 0.01 && {alive gunner _target}
}, nil, nil, {[_target, [0.2, -1, 0.25]] call FUNC(posAlongRecoilAxis)}, INTERACTION_DISTANCE] call ace_interact_menu_fnc_createAction;
["shto_vn_static_m101_02_base", 0, [], _action] call ace_interact_menu_fnc_addActionToClass;

_action = ["Traverse Turret", LLSTRING(Action_TraverseTurret), "", {
    private _direction = getDir _target - deg (_target animationPhase "mainturret");
    hint format [LLSTRING(Hint_Direction), round (_direction * 6400 / 360)];
}, {true}, nil, nil, {[_target, [-0.5, -0.5, 0]] call FUNC(posAlongDirection)}, 1, [false, false, false, true, false]] call ace_interact_menu_fnc_createAction;
["shto_vn_static_m101_02_base", 0, [], _action] call ace_interact_menu_fnc_addActionToClass;

_action = ["Elevate Turret", LLSTRING(Action_ElevateTurret), "", {
    private _elevation = deg (_target animationPhase "maingun");
    hint format [LLSTRING(Hint_Elevation), round (_elevation * 6400 / 360)];
}, {true}, nil, nil, {[_target, [0.4, -0.3, 0.2]] call FUNC(posAlongDirection)}, 1, [false, false, false, true, false]] call ace_interact_menu_fnc_createAction;
["shto_vn_static_m101_02_base", 0, [], _action] call ace_interact_menu_fnc_addActionToClass;
