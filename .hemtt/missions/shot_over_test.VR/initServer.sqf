/*
 * Shot, Over! test range for the in-game test pass (GitHub issue #9), server side.
 * Builds the stations around the spawn on VR and handles the control board's scenario events
 * (initPlayerLocal.sqf). The numbers in the station texts are the sections of the checklist in #9.
 *
 * Layout (VR, north up): spawn and control board at 6144/7112, ammunition point south of it,
 * FDC to the west, the gun line at y 7040 facing south, the targets south of the guns.
 */

// --- helpers ---------------------------------------------------------------------------

shto_test_fnc_marker = {
    params ["_name", "_pos", "_text", ["_type", "mil_flag"], ["_color", "ColorBLUFOR"]];
    private _marker = createMarker [_name, _pos];
    _marker setMarkerTypeLocal _type;
    _marker setMarkerColorLocal _color;
    _marker setMarkerText _text;
};

shto_test_fnc_spawn = {
    params ["_class", "_pos", ["_dir", 0]];
    private _object = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
    _object setDir _dir;
    _object setPosATL _pos;
    _object
};

// --- spawn, arsenal, control board -------------------------------------------------------

["respawn_west", [6144, 7112, 0], "Spawn / respawn", "respawn_inf"] call shto_test_fnc_marker;

private _arsenal = ["B_supplyCrate_F", [6152, 7116, 0]] call shto_test_fnc_spawn;
clearItemCargoGlobal _arsenal;
clearMagazineCargoGlobal _arsenal;
clearWeaponCargoGlobal _arsenal;
clearBackpackCargoGlobal _arsenal;
[_arsenal, true, true] call ace_arsenal_fnc_initBox;

shto_test_board = ["Land_MapBoard_01_Wall_F", [6138, 7118, 0]] call shto_test_fnc_spawn;
publicVariable "shto_test_board";

// --- gun line (sections 1, 2, 3): A and B for players, C with an AI gunner ------------------

shto_test_guns = [
    ["Gun A (02_base)", ["shto_vn_static_m101_02_base", [6130, 7040, 0], 180] call shto_test_fnc_spawn],
    ["Gun B (01)", ["shto_vn_static_m101_01", [6150, 7040, 0], 180] call shto_test_fnc_spawn],
    ["Gun C (AI gunner)", ["shto_vn_static_m101_02_base", [6170, 7040, 0], 180] call shto_test_fnc_spawn]
];
publicVariable "shto_test_guns";
["shto_test_gunline", [6150, 7046, 0], "Gun line A B C (1-3)"] call shto_test_fnc_marker;

shto_test_fnc_aiGunner = {
    params ["_gun"];
    if (alive gunner _gun) exitWith {};
    createVehicleCrew _gun;
    {
        _x disableAI "AUTOTARGET";
        _x disableAI "TARGET";
    } forEach crew _gun;
};
[(shto_test_guns select 2) select 1] call shto_test_fnc_aiGunner;

// --- ammunition point (sections 4, 5) -------------------------------------------------------

shto_test_fnc_stockAmmunition = {
    {deleteVehicle _x} forEach (missionNamespace getVariable ["shto_test_ammo", []]);
    private _objects = [];
    // one closed crate of every type, and the loose shells of every type, charge 1
    {
        _objects pushBack ([format ["shto_vn_m101_%1_crate", _x], [6128 + _forEachIndex * 4, 7078, 0]] call shto_test_fnc_spawn);
    } forEach ["he", "ab", "frag", "wp", "smoke", "illum", "icm"];
    {
        _objects pushBack ([format ["shto_vn_m101_shell_%1", _x], [6128 + _forEachIndex * 4, 7072, 0.1]] call shto_test_fnc_spawn);
    } forEach ["he", "ab", "frag", "wp", "smk", "illum", "icm"];
    // a shell set to charge 3, to check the charge is shown and kept
    private _shell = ["shto_vn_m101_shell_he", [6160, 7072, 0.1]] call shto_test_fnc_spawn;
    _shell setVariable ["shto_charge", 3, true];
    _objects pushBack _shell;
    // the three pallet sizes, of different types
    {
        _objects pushBack ([_x, [6130 + _forEachIndex * 8, 7088, 0]] call shto_test_fnc_spawn);
    } forEach ["shto_vn_m101_he_pallet_x42", "shto_vn_m101_frag_pallet_x24", "shto_vn_m101_icm_pallet_x18"];
    // two containers: HE, and FRAG (its smaller pallets were AB)
    {
        _objects pushBack ([_x, [6178 + _forEachIndex * 10, 7090, 0], 90] call shto_test_fnc_spawn);
    } forEach ["shto_vn_m101_he_container_x504", "shto_vn_m101_frag_container_x504"];
    shto_test_ammo = _objects;
};
call shto_test_fnc_stockAmmunition;
["shto_test_ammopoint", [6150, 7084, 0], "Ammunition point (4, 5)"] call shto_test_fnc_marker;

// --- FDC (sections 6, 8): the backpack on the ground, the PRC-77 radio -----------------------

private _holder = ["GroundWeaponHolder", [6104, 7080, 0]] call shto_test_fnc_spawn;
_holder addBackpackCargoGlobal ["shto_rto_pack", 1];
["Land_CampingTable_F", [6108, 7080, 0]] call shto_test_fnc_spawn;
["shto_vn_prop_prc77_01", [6108, 7080, 0.8]] call shto_test_fnc_spawn;
["shto_test_fdc", [6106, 7084, 0], "FDC: backpack, PRC-77 (6, 8)"] call shto_test_fnc_marker;

// --- targets (section 6): straight south of gun B at four distances, one off the axis --------

shto_test_targets = [
    ["T1", [6150, 6540, 0]],
    ["T2", [6150, 5040, 0]],
    ["T3", [6150, 2540, 0]],
    ["T4", [6150, 540, 0]],
    ["T5", [7150, 4040, 0]]
];
{
    _x params ["_name", "_pos"];
    ["Sign_Arrow_Large_F", _pos] call shto_test_fnc_spawn;
    [format ["shto_test_target_%1", _name], _pos, _name, "mil_destroy", "ColorOPFOR"] call shto_test_fnc_marker;
} forEach shto_test_targets;
publicVariable "shto_test_targets";

// --- Zeus (section 7) --------------------------------------------------------------------

shto_test_curator = (createGroup sideLogic) createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "NONE"];
// all loaded addons: the mission itself only declares A3_Characters_F
shto_test_curator setVariable ["Addons", 3, true];
shto_test_curator setVariable ["owner", "objNull"];
shto_test_curator setVariable ["showNotification", false];
// a scripted module never runs its init unless activated
shto_test_curator setVariable ["bis_fnc_initModules_disableAutoActivation", false, true];
shto_test_curator setVariable ["bis_fnc_initModules_activate", true];
shto_test_curator addCuratorEditableObjects [vehicles + allUnits, true];

// --- scenario events (raised from the control board, the caller added last) ---------------

["shto_test_restock", {
    params ["_caller"];
    call shto_test_fnc_stockAmmunition;
    shto_test_curator addCuratorEditableObjects [shto_test_ammo, true];
    ["shto_test_notify", ["Ammunition point restocked"], _caller] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;

["shto_test_aiGunner", {
    params ["_add", "_caller"];
    private _gun = (shto_test_guns select 2) select 1;
    if (_add) then {
        [_gun] call shto_test_fnc_aiGunner;
    } else {
        {deleteVehicle _x} forEach crew _gun;
    };
    ["shto_test_notify", [["Gun C: AI gunner removed", "Gun C: AI gunner in"] select _add], _caller] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;

// an AI soldier standing where the recoil knocks units down, behind gun C's breech
["shto_test_dummy", {
    params ["_caller"];
    if (!isNil "shto_test_dummyUnit") then {deleteVehicle shto_test_dummyUnit};
    private _gun = (shto_test_guns select 2) select 1;
    private _pos = _gun modelToWorld ([_gun, [0, -2, 0.5]] call shot_over_m101_fnc_posAlongRecoilAxis);
    shto_test_dummyUnit = (createGroup west) createUnit ["B_Soldier_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
    shto_test_dummyUnit setPosATL [_pos select 0, _pos select 1, 0];
    shto_test_dummyUnit setDir getDir _gun;
    shto_test_dummyUnit disableAI "MOVE";
    shto_test_dummyUnit disableAI "PATH";
    ["shto_test_notify", ["AI dummy placed behind gun C's breech"], _caller] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;

["shto_test_zeus", {
    params ["_caller"];
    unassignCurator shto_test_curator;
    [{
        params ["_caller"];
        _caller assignCurator shto_test_curator;
        ["shto_test_notify", ["Zeus assigned to you"], _caller] call CBA_fnc_targetEvent;
    }, [_caller], 1] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
