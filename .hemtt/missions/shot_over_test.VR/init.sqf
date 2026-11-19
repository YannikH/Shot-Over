/*
 * Shot, Over! test range, every machine: the impact logger for the notebook check (section 6 of #9).
 * Every M101 shell is followed where it is local (the gunner's machine, the server for the AI gunner)
 * until it bursts; its last position is reported to everyone with the distance to the nearest target.
 */

["shto_vn_static_m101_02_base", "Fired", {
    params ["_gun", "", "", "", "", "_magazine", "_projectile"];
    if (!local _projectile) exitWith {};
    private _start = getPosASL _gun;
    [{
        (_this select 0) params ["_projectile", "_gun", "_magazine", "_start", "_last"];
        if (isNull _projectile || {!alive _projectile}) exitWith {
            [_this select 1] call CBA_fnc_removePerFrameHandler;
            ["shto_test_impact", [_last, _start, _magazine]] call CBA_fnc_globalEvent;
        };
        (_this select 0) set [4, getPosASL _projectile];
    }, 0, [_projectile, _gun, _magazine, _start, getPosASL _projectile]] call CBA_fnc_addPerFrameHandler;
}, true, [], true] call CBA_fnc_addClassEventHandler;
