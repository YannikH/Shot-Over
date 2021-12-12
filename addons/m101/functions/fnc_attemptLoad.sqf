params ["_unit", "_howitzer"];
private _canLoad = ((_howitzer animationSourcePhase "m101_reload_source") > 0.69) && ((_howitzer animationSourcePhase "m101_reload_source") < 0.71);
if (count (magazines _howitzer) > 0) exitWith {};
if (!_canLoad) exitWith {
    hint "The breech isn't empty";
};
private _breechPos = _howitzer modelToWorld ([_howitzer, [0,-1.5,0.5]] call shot_over_m101_fnc_posAlongRecoilAxis);
private _shell = _unit getVariable "ace_dragging_carriedObject";
if ((_shell distance _breechPos) > 1) exitWith {
    hint "The shell is too far away from the breech";
};
[_unit, _shell] call ace_dragging_fnc_dropObject;
deleteVehicle _shell;
private _magazine = [_shell] call shot_over_m101_fnc_getMagazineFromShell;

_weapon = (weapons _howitzer) select 0;
_howitzer loadMagazine [[0], "shto_howitzer_105mm_base", _magazine];
_howitzer removeWeapon _weapon;
_howitzer addMagazine _magazine;
_howitzer addWeapon _weapon;
_howitzer selectWeapon _weapon;
reload _howitzer;


_howitzer animatesource ["m101_reload_source",0.3,2];