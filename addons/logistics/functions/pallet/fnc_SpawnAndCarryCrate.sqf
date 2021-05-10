params ["_pallet"];

private _palletClass = typeOf _pallet;
private _cratesClass = getText (configFile >> "CfgVehicles" >> _palletClass >> "crateClass");
private _cratesArray = _pallet getVariable "shto_crateList";
private _crate = _cratesArray # ((count _cratesArray)-1);
systemChat str _crate;

private _carriedObj = ace_player getVariable "ace_dragging_carriedObject";
if (!isNil "_carriedObj" && !(isNull _carriedObj)) exitWith {};

private _newCrate = _cratesClass createVehicle (getPos _pallet);
[ace_player, _newCrate] call ace_dragging_fnc_startCarry;

deleteVehicle _crate;
private _cratesArray = _cratesArray - [_crate];
_pallet setVariable ["shto_crateList",_cratesArray,true];
