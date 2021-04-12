    private _nearHowitzers = nearestObjects [getPos player, ["shto_vn_static_m101_02_base"], 5];
    if (count _nearHowitzers == 0) exitWith {
        hint "No howitzer nearby";
    };
    private _howitzer = _nearHowitzers # 0;
    private _canLoad = ((_howitzer animationSourcePhase "m101_reload_source") > 0.69) && ((_howitzer animationSourcePhase "m101_reload_source") < 0.71);
    if (count (magazines _howitzer) > 0) exitWith {};
    if (!_canLoad) exitWith {
        hint "The breech isn't empty";
    };
    private _breechPos = _howitzer modelToWorld ([_howitzer, [0,-1.5,0.5]] call shto_fnc_posAlongRecoilAxis);
    private _shell = ace_player getVariable "ace_dragging_carriedObject";
    if ((_shell distance _breechPos) > 1) exitWith {
        hint "The shell is too far away from the breech";
    };
    [ace_player, _shell] call ace_dragging_fnc_dropObject;
    deleteVehicle _shell;
    private _magazine = [_shell] call shto_fnc_getMagazineFromShell;
    _howitzer addMagazine _magazine;
    _howitzer loadMagazine [[0], "shto_howitzer_105mm_base", _magazine];
    _howitzer animatesource ["m101_reload_source",0.3,2];