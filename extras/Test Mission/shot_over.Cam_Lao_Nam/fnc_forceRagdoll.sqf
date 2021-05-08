params ["_unit", "_vector"];
private "_rag";
_unit allowDamage false;
_rag = "Land_Can_V3_F" createVehicleLocal [0,0,0];
_rag setMass 1e10;
_rag attachTo [_unit, [0,0,0], "Spine3"];
systemChat str _this;
_rag setVelocity ((vectorNormalized _vector) vectorMultiply -25);
detach _rag;
0 = [_rag, _unit] spawn {
	deleteVehicle (_this # 0);
	(_this # 1) allowDamage true;
};