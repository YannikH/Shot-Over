#include "script_component.hpp"

if (!hasInterface) exitWith {};

private _action = [QGVAR(open), LLSTRING(Action_Open), "", {
    [_target] call FUNC(open);
}, {
    isNil QGVAR(camera) && {_player == gunner _target}
}] call ace_interact_menu_fnc_createAction;
[GUN_CLASS, 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = [QGVAR(close), LLSTRING(Action_Close), "", {
    call FUNC(close);
}, {
    !isNil QGVAR(camera)
}] call ace_interact_menu_fnc_createAction;
[GUN_CLASS, 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

[
    "Shot, Over!",
    "shto_keybind_togglesight",
    LLSTRING(Keybind_Toggle),
    {
        if (!isNil QGVAR(camera)) exitWith {call FUNC(close); true};
        private _gun = vehicle ACE_player;
        if !(_gun isKindOf GUN_CLASS && {ACE_player == gunner _gun}) exitWith {false};
        [_gun] call FUNC(open);
        true
    },
    {},
    [76, [false, false, false]] // Numpad 5
] call CBA_fnc_addKeybind;

// a press turns a dial by 1 mil; fnc_update keeps turning it while the key is held. The keys only act while the
// sights are open, and leave the key to the game otherwise.
{
    _x params ["_id", "_name", "_dial", "_direction", "_key"];
    [
        "Shot, Over!",
        _id,
        _name,
        compile format ['
            if (isNil "%1") exitWith {false};
            ["%2", %3] call %4;
            %5 = ["%2", %3, diag_tickTime];
            true
        ', QGVAR(camera), _dial, _direction, QFUNC(turnDial), QGVAR(turning)],
        compile format ['
            if ((%1 select [0, 2]) isEqualTo ["%2", %3]) then {%1 = []};
            false
        ', QGVAR(turning), _dial, _direction],
        [_key, [false, false, false]]
    ] call CBA_fnc_addKeybind;
} forEach [
    ["shto_keybind_deflectionup", LLSTRING(Keybind_DeflectionUp), "deflection", 1, 77], // Numpad 6
    ["shto_keybind_deflectiondown", LLSTRING(Keybind_DeflectionDown), "deflection", -1, 75], // Numpad 4
    ["shto_keybind_quadrantup", LLSTRING(Keybind_QuadrantUp), "quadrant", 1, 72], // Numpad 8
    ["shto_keybind_quadrantdown", LLSTRING(Keybind_QuadrantDown), "quadrant", -1, 80] // Numpad 2
];
