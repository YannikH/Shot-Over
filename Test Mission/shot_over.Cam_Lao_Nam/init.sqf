shto_interaction_distance = 5;
[] spawn {
    sleep 1;
    call compile preprocessFileLineNumbers "addHowitzerActions.sqf";
    call compile preprocessFileLineNumbers "addShellActions.sqf";
    shto_carry_mouseButtonEvent = findDisplay 46 displayAddEventHandler ["MouseButtonDown", "_this call shto_fnc_mouseButton;"];
};




["shto_vn_static_m101_02_base", "fired", {
    params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
    if (!isServer) exitWith {};
    _unit animatesource ["m101_reload_source",1, true];
    _unit animatesource ["m101_reload_source",0.9, 3];
    [_unit, velocity _projectile] call shto_fnc_tryRagdoll;
    _unit setVehicleAmmo 0;
    {_unit removeMagazine _x} forEach (magazines _unit);
}] call CBA_fnc_addClassEventHandler;

shto_fnc_tryRagdoll = compile preprocessFileLineNumbers "fnc_tryRagdoll.sqf";
shto_fnc_forceRagdoll = compile preprocessFileLineNumbers "fnc_forceRagdoll.sqf";
shto_fnc_posAlongRecoilAxis = compile preprocessFileLineNumbers "fnc_posAlongRecoilAxis.sqf";
shto_fnc_posAlongDirection = compile preprocessFileLineNumbers "fnc_posAlongDirection.sqf";
shto_fnc_getTE = compile preprocessFileLineNumbers "fnc_getTE.sqf";
shto_fnc_mouseButton = compile preprocessFileLineNumbers "fnc_mouseButton.sqf";
shto_fnc_attemptLoad = compile preprocessFileLineNumbers "fnc_attemptLoad.sqf";
shto_fnc_getMagazineFromShell = compile preprocessFileLineNumbers "fnc_getMagazineFromShell.sqf";