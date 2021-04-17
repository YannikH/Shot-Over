params ["_pallet","_cratesCount","_cratesClass","_yPos"];
if (!isServer) exitWith {};

private _palletClass = typeOf _pallet;
private _cratesCount = getNumber (configFile >> "CfgVehicles" >> _palletClass >> "crateCount");
private _cratesClass = getText (configFile >> "CfgVehicles" >> _palletClass >> "crateClass");
private _yPos = getNumber (configFile >> "CfgVehicles" >> _palletClass >> "yOffset");

private _bas = floor (_cratesCount / 3);
private _exs = _cratesCount mod 3;
systemChat str _exs;
private _curLevel = 0;
private _cratesArray = [];

for [{_level = 1}, {_level <= _bas}, {_level = _level + 1}] do {
   _xPos = -0.35;
   for [{_box = 0}, {_box < 3}, {_box = _box + 1}] do {
     //private _crate = _cratesClass createVehicle getPos _pallet;
     private _crate = createSimpleObject  [_cratesClass, (getPosASL _pallet)];
     _cratesArray pushBack _crate;
     systemChat str _cratesArray;
     if ((_level mod 2) > 0) then {
       _crate attachTo [_pallet, [0.0, _xPos, _yPos]];
       _crate setVectorDirAndUp [[0,1,0], [0,0,1]];
     } else {
       _crate attachTo [_pallet, [_xPos, 0.0, _yPos]];
       _crate setVectorDirAndUp [[1,0,0], [0,0,1]];
     };
     _xPos = _xPos + 0.35;
   };
   _yPos = _yPos + 0.2;
   _curLevel = _level;
};

if (_exs > 0) then {
 _curLevel = _curLevel + 1;
 _xPos = -0.35;
 for [{_box = 0}, {_box < _exs}, {_box = _box + 1}] do {
   //private _crate = _cratesClass createVehicle getPos _pallet;
   private _crate = createSimpleObject  [_cratesClass, getPosASL _pallet];
   _cratesArray pushBack _crate;
   systemChat str _cratesArray;
   if ((_curLevel mod 2) > 0) then {
     _crate attachTo [_pallet, [0.0, _xPos, _yPos]];
     _crate setVectorDirAndUp [[0,1,0], [0,0,1]];
   } else {
     _crate attachTo [_pallet, [_xPos, 0.0, _yPos]];
     _crate setVectorDirAndUp [[1,0,0], [0,0,1]];
   };
   _xPos = _xPos + 0.35;
 };
};

_pallet setVariable ["shto_crateList",_cratesArray,true];
systemChat str _pallet getVariable "shto_crateList";
