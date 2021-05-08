params ["_target", "_coordinates"];
private _elevation = (_target animationPhase "maingun")  * 57.2958; // around osaveze
private _direction = (_target animationPhase "mainturret") * 57.2958; // around otocvez
private _origin = _target selectionPosition "osaveze";
private _vectToCoordinates = _coordinates call CBA_fnc_vect2polar;
private _vect = [
	(_vectToCoordinates # 0),
	-_direction + (_vectToCoordinates # 1),
	-_elevation + (_vectToCoordinates # 2)
] call CBA_fnc_polar2vect;
_origin vectorAdd _vect;