params ["_howitzer"];
if (!local _howitzer) exitWith {};
private _originPos = _howitzer modelToWorld ((_howitzer selectionPosition "computer") vectorAdd [0,-0.5,0]);
//private _originPos = getPos _howitzer;
{
	private _pole = "Land_RedWhitePole_F" createVehicle [0,0,0];
	_pole setPos (_originPos getPos [_x, (direction _howitzer) - 45]);
} foreach [15, 30];