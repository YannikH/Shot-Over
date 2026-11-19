/*
 * Shot, Over! test range, player side: loadout, briefing with the grids, the control board's actions
 * (teleports, scenarios, diagnostics) and the impact reports. The scenarios run on the server
 * (initServer.sqf). The numbers are the sections of the checklist in GitHub issue #9.
 */
params ["_player"];

// the FDC slot starts with the FDC backpack; everyone else picks it from the arsenal if needed
shto_test_fnc_loadout = {
    if (vehicleVarName player == "shto_test_p1") then {
        removeBackpack player;
        player addBackpack "shto_rto_pack";
    };
};
call shto_test_fnc_loadout;
_player addEventHandler ["Respawn", {call shto_test_fnc_loadout}];

["shto_test_notify", {
    params ["_text"];
    hint _text;
}] call CBA_fnc_addEventHandler;

// where the round burst, against the nearest target: the check of the notebook's solutions
["shto_test_impact", {
    params ["_impact", "_start", "_magazine"];
    private _targets = missionNamespace getVariable ["shto_test_targets", []];
    if (_targets isEqualTo []) exitWith {};
    private _nearest = [_targets, [], {_impact distance2D (_x select 1)}, "ASCEND"] call BIS_fnc_sortBy;
    (_nearest select 0) params ["_name", "_pos"];
    private _miss = _impact distance2D _pos;
    // along the line of fire: positive is long, negative is short
    private _alongLine = (_start distance2D _impact) - (_start distance2D _pos);
    private _text = format ["%1: %2 m from %3 (%4 m %5), range %6 m", getText (configFile >> "CfgMagazines" >> _magazine >> "displayNameShort"), round _miss, _name, round abs _alongLine, ["short", "long"] select (_alongLine > 0), round (_start distance2D _impact)];
    systemChat _text;
    diag_log format ["[SHOT OVER TEST] impact %1", _text];
    private _marker = createMarkerLocal [format ["shto_test_impact_%1", diag_tickTime], ASLToAGL _impact];
    _marker setMarkerTypeLocal "mil_dot";
    _marker setMarkerColorLocal "ColorOrange";
    _marker setMarkerTextLocal str round _miss;
}] call CBA_fnc_addEventHandler;

// --- briefing: grids and heights for the notebook -------------------------------------------

[{!isNil "shto_test_targets" && {!isNil "shto_test_guns"}}, {
    private _line = {
        params ["_name", "_pos"];
        format ["%1: grid %2, elevation %3 m", _name, [_pos, true] call ace_common_fnc_getMapGridFromPos, round getTerrainHeightASL _pos]
    };
    private _guns = shto_test_guns apply {[_x select 0, getPosASL (_x select 1)] call _line};
    private _targets = shto_test_targets apply {_x call _line};

    player createDiaryRecord ["Diary", ["Grids", format [
        "For the FDC notebook (6). Enter grids without spaces.<br/><br/>Guns:<br/>%1<br/><br/>Targets:<br/>%2<br/><br/>Each impact is reported in the chat and as an orange dot on the map, with its distance from the nearest target. VR is flat: heights above or below the gun need another map.",
        _guns joinString "<br/>", _targets joinString "<br/>"
    ]]];

    player createDiaryRecord ["Diary", ["Test stations", "
Numbers are the sections of the checklist in GitHub issue #9. The control board next to the arsenal has teleports, scenarios and diagnostics.<br/><br/>
<marker name='shto_test_gunline'>Gun line</marker>: guns A and B for players, gun C with an AI gunner for the lanyard (Fire Howitzer) and the knock-down dummy. All face south, towards the targets (1-3).<br/>
<marker name='shto_test_ammopoint'>Ammunition point</marker>: one crate of every type, the seven loose shells (and an HE shell set to charge 3), HE x42, FRAG x24 and ICM x18 pallets, HE and FRAG containers (4, 5). 'Restock ammunition point' puts everything back.<br/>
<marker name='shto_test_fdc'>FDC</marker>: the FDC backpack on the ground and the PRC-77 radio on the table (6, 8). The FDC slot wears an FDC backpack.<br/>
Targets T1 to T4 straight south of gun B at 500 m, 2 km, 4.5 km and 6.5 km, T5 off the axis at about 3.2 km (6).<br/><br/>
Zeus (7): 'Take Zeus' on the control board. Settings: there are none; keybinds under Options, Controls, Configure Addons, Shot, Over!
"]];
}] call CBA_fnc_waitUntilAndExecute;

// --- control board -------------------------------------------------------------------------

[{!isNil "shto_test_board"}, {
    private _add = {
        params ["_title", "_code", ["_args", []]];
        shto_test_board addAction [_title, _code, _args, 1.5, false, true, "", "true", 5];
    };
    private _teleport = {
        params ["", "", "", "_pos"];
        player setPosATL _pos;
    };
    // the caller is added when the action is used, so it is the current unit after a respawn
    private _server = {
        params ["", "_caller", "", "_args"];
        _args params ["_event", "_params"];
        [_event, _params + [_caller]] call CBA_fnc_serverEvent;
    };

    {
        _x params ["_name", "_pos"];
        [format ["<t color='#9fd3ff'>Teleport: %1</t>", _name], _teleport, _pos] call _add;
    } forEach [
        ["Gun line (behind the guns)", [6150, 7048, 0]],
        ["Ammunition point", [6150, 7066, 0]],
        ["FDC", [6106, 7084, 0]],
        ["Target T2 (2 km)", [6150, 5060, 0]],
        ["Spawn", [6144, 7108, 0]]
    ];

    {
        _x params ["_title", "_event", "_params"];
        [format ["<t color='#ffb84d'>%1</t>", _title], _server, [_event, _params]] call _add;
    } forEach [
        ["Restock ammunition point", "shto_test_restock", []],
        ["Gun C: AI gunner in", "shto_test_aiGunner", [true]],
        ["Gun C: AI gunner out", "shto_test_aiGunner", [false]],
        ["Place AI dummy behind gun C's breech", "shto_test_dummy", []],
        ["Take Zeus", "shto_test_zeus", []]
    ];

    ["<t color='#a0ffa0'>Show gun states</t>", {
        hint ((shto_test_guns apply {
            _x params ["_name", "_gun"];
            format ["%1\nbreech %2, magazines %3\ngunner %4, local here: %5", _name, (_gun animationSourcePhase "m101_reload_source") toFixed 2, magazines _gun, [name gunner _gun, "none"] select isNull gunner _gun, local _gun]
        }) joinString "\n\n");
    }] call _add;
    ["<t color='#a0ffa0'>Show stock of pallets and containers</t>", {
        hint (((nearestObjects [player, ["shto_vn_m101_pallet_base", "shto_vn_m101_container_base"], 100]) apply {
            format ["%1: %2 left, %3 crate objects", getText (configOf _x >> "displayName"), _x getVariable ["shto_cratesleft", "-"], count (_x getVariable ["shto_crateList", []])]
        }) joinString "\n");
    }] call _add;
    ["<t color='#a0ffa0'>Show shells near me</t>", {
        hint (((nearestObjects [player, ["shto_vn_m101_shell"], 15]) apply {
            format ["%1: charge %2", getText (configOf _x >> "displayName"), _x getVariable ["shto_charge", 1]]
        }) joinString "\n");
    }] call _add;
    ["<t color='#a0ffa0'>Show per-frame handler count</t>", {
        hint format ["CBA per-frame handlers on this machine: %1", count (missionNamespace getVariable ["cba_common_perFrameHandlerArray", []])];
    }] call _add;
}] call CBA_fnc_waitUntilAndExecute;
