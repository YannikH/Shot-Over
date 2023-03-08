params ["_howitzer", "_vector"];
private _breechPos = _howitzer modelToWorld ([_howitzer, [0,-2,0.5]] call shot_over_shto_m101_fnc_posAlongRecoilAxis);
private _crew = nearestObjects [getPos _howitzer, ["Man"], 4];
{
	systemChat str (_x distance2D _breechPos);
	if ((_x distance2D _breechPos) < 0.35) then {
		[_x, _vector] remoteExec ["shot_over_shto_m101_fnc_forceRagdoll", _x];
	};
} forEach _crew;