params ["_pallet","_supply"];
if (!isServer) exitWith {};

private _palletClass = typeOf _pallet;

private _cratesCount = getNumber (configFile >> "CfgVehicles" >> _palletClass >> "crateCount");
private _cratesClass = getText (configFile >> "CfgVehicles" >> _palletClass >> "crateClass");

private _supplyClass = typeOf _supply;
private _availableSupply = _supply getVariable ["shto_cratesleft",-1];
private _removedCount = 0;

if (!((_availableSupply - _cratesCount) < 0)) then { _removedCount = _cratesCount } else { _removedCount = _availableSupply};

if (_availableSupply < 0) then {
  [_pallet] call shto_fnc_initPallet; //if a number of crates available hasn't been specified (e.g regular ammo truck) then just refil the pallet
} else {
  [_pallet, _removedCount] call shto_fnc_initPallet;
  if (_supplyClass isKindOF "shto_vn_m101_he_container_x504") then {
    [_supply,_removedCount] call shto_fnc_removeCrates;
  } else {
    _supply setVariable ["shto_cratesleft",(_availableSupply - _removedCount),true];
  };
};
