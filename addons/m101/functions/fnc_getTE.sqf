params ["_vehicle"];
private _elevation = (_vehicle animationPhase "maingun")  * 57.2958; // around osaveze
private _direction = (_vehicle animationPhase "mainturret") * 57.2958; // around otocvez
[_direction, _elevation]