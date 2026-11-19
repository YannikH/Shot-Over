#include "script_component.hpp"

// each event runs where its target is local: the gun (load), the unit (knock-down), the server (casing)
[QGVAR(loadShell), LINKFUNC(onLoadShell)] call CBA_fnc_addEventHandler;
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
["shto_vn_static_m101_02_base", 0, [], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ["Close Breech", LLSTRING(Action_CloseBreech), "", {
    _target animateSource [BREECH_SOURCE, BREECH_CLOSED, 4];
}, {
    private _phase = _target animationSourcePhase BREECH_SOURCE;
    _phase > BREECH_CLOSED && {_phase < 0.31}
}, nil, nil, {[_target, [0.35, -1.07, 0.8]] call FUNC(posAlongRecoilAxis)}, INTERACTION_DISTANCE] call ace_interact_menu_fnc_createAction;
["shto_vn_static_m101_02_base", 0, [], _action, true] call ace_interact_menu_fnc_addActionToClass;

// the same as a right click while carrying (logistics_fnc_mouseButton), which ACE's carry mouse hint doesn't show
_action = ["Load Shell", LLSTRING(Action_LoadShell), "", {
    [_player, _player getVariable ["ace_dragging_carriedObject", objNull]] call FUNC(loadShell);
}, {
    (_player getVariable ["ace_dragging_carriedObject", objNull]) isKindOf "shto_vn_m101_shell"
    && {magazines _target isEqualTo []}
    && {abs ((_target animationSourcePhase BREECH_SOURCE) - BREECH_OPEN) <= 0.01}
}, nil, nil, {[_target, BREECH_OFFSET] call FUNC(posAlongRecoilAxis)}, INTERACTION_DISTANCE] call ace_interact_menu_fnc_createAction;
["shto_vn_static_m101_02_base", 0, [], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ["Elevate Turret", LLSTRING(Action_ElevateTurret), "", {
    private _elevation = deg (_target animationPhase "maingun");
    hint format [LLSTRING(Hint_Elevation), round (_elevation * 6400 / 360)];
}, {true}, nil, nil, {[_target, [0.4, -0.3, 0.2]] call FUNC(posAlongDirection)}, 1, [false, false, false, true, false]] call ace_interact_menu_fnc_createAction;
["shto_vn_static_m101_02_base", 0, [], _action, true] call ace_interact_menu_fnc_addActionToClass;
