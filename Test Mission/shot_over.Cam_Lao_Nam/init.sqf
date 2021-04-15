shto_interaction_distance = 5;
[] spawn {
    sleep 1;
    call compile preprocessFileLineNumbers "addHowitzerActions.sqf";
    call compile preprocessFileLineNumbers "addShellActions.sqf";
    call compile preprocessFileLineNumbers "addCrateActions.sqf";
    shto_carry_mouseButtonEvent = findDisplay 46 displayAddEventHandler ["MouseButtonDown", "_this call shto_fnc_mouseButton;"];

    
    _action = ["SHTO_FDC_Notebook","FDC Notebook","vn\modules_f_vietnam\data\vn_displayartillery\mapfolder.paa",{
        createDialog "shto_calculator";
    },{
        (backpack player) isKindOf "shto_rto_pack"
    }] call ace_interact_menu_fnc_createAction;
    ["Man", 1, ["ACE_SelfActions", "ACE_Equipment"], _action, true] call ace_interact_menu_fnc_addActionToClass;
    
    _action = ["SHTO_FDC_Notebook","FDC Notebook","vn\modules_f_vietnam\data\vn_displayartillery\mapfolder.paa",{
        createDialog "shto_calculator";
    },{
        (((getBackpackCargo _target) findIf {(_x # 0 == "shto_rto_pack")}) > -1)
    }, nil, nil, [0,0,-0.4], shto_interaction_distance] call ace_interact_menu_fnc_createAction;
    ["GroundWeaponHolder", 0, [], _action, true] call ace_interact_menu_fnc_addActionToClass;

    [
        "Shot, Over!",
        "shto_keybind_togglenotebook",
        "Open FDC Notebook",
        {},{
            if (!((backpack player) isKindOf "shto_rto_pack")) exitWith {};
            private _dialog = uiNamespace getVariable "shto_fcs_dialog";
            if (!dialog) then {
                createDialog "shto_calculator";
            } else {
                closedialog 2;
            };
        },
        [201, [false, false, false]]
    ] call CBA_fnc_addKeybind;
    [
        "Shot, Over!",
        "shto_keybind_closenotebook",
        "Close FDC Notebook",
        {},{
            private _dialog = uiNamespace getVariable "shto_fcs_dialog";
            if (!isNull _dialog) then {
                if (dialog) then {
                    closedialog 2;
                } else {
                    95010 cutText ["", "PLAIN"];
                };
            };
        },
        [201, [false, true, false]]
    ] call CBA_fnc_addKeybind;
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
shto_fnc_setupSupplyTruck = compile preprocessFileLineNumbers "fnc_setupSupplyTruck.sqf";
shto_fnc_spawnAndCarry = compile preprocessFileLineNumbers "fnc_spawnAndCarry.sqf";
shto_fnc_remoteFireHowitzer = compile preprocessFileLineNumbers "fnc_remoteFireHowitzer.sqf";
shto_fnc_unpackCrate = compile preprocessFileLineNumbers "fnc_unpackCrate.sqf";

shto_fnc_getRangeTable = compile preprocessFileLineNumbers "fcs\fnc_getRangeTable.sqf";
shto_fnc_getFiringSolutionForTable = compile preprocessFileLineNumbers "fcs\fnc_getFiringSolutionForTable.sqf";
shto_fnc_getFiringSolutionsForMagazines = compile preprocessFileLineNumbers "fcs\fnc_getFiringSolutionsForMagazines.sqf";

shto_fnc_initDialog = compile preprocessFileLineNumbers "fcs\fnc_initDialog.sqf";
shto_fnc_calculateFromNotebook = compile preprocessFileLineNumbers "fcs\fnc_calculateFromNotebook.sqf";
shto_fnc_saveView = compile preprocessFileLineNumbers "fcs\fnc_saveView.sqf";
shto_fnc_openMinimized = compile preprocessFileLineNumbers "fcs\fnc_openMinimized.sqf";
shto_fnc_dialogKeyUp = compile preprocessFileLineNumbers "fcs\fnc_dialogKeyUp.sqf";

private _m101Magazines = ["shto_105mm_mag_ab_x1_c1","shto_105mm_mag_ab_x1_c2","shto_105mm_mag_ab_x1_c3","shto_105mm_mag_ab_x1_c4","shto_105mm_mag_ab_x1_c5"];
[_m101Magazines, 5500, -50] spawn shto_fnc_getFiringSolutionsForMagazines;
//["shto_105mm_mag_ab_x1_c1", -5, 66, false, {code to run when done}] spawn shto_fnc_getRangeTable;