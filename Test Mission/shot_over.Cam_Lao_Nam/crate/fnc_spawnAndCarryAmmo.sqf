params ["_shellClass"];
private _newShell = _shellClass createVehicle (getPos player);

private _carriedObj = ace_player getVariable "ace_dragging_carriedObject";
if (!isNil "_carriedObj" && !(isNull _carriedObj)) exitWith {};
[ace_player, _newShell] call ace_dragging_fnc_startCarry;
[] spawn {
    sleep 0.1;
    [localize "STR_ACE_Dragging_Drop", "Load", localize "STR_ace_dragging_RaiseLowerRotate"] call ace_interaction_fnc_showMouseHint;
};
