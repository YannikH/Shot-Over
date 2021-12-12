
private _howitzer = vehicle player;
private _sideBarWidth = ((safeZoneW - (safeZoneH*1.4))/2);
private _reticleDialog = uiNamespace getVariable "shto_sight_reticle";
waitUntil {
	private _elevation = ((_howitzer animationPhase "maingun")  * 57.2958) / 360 * 6400;
	private _cur = _howitzer getVariable ["shto_sight_quadrant", 0000];
	systemChat str _elevation;
	private _diff = (_cur - _elevation) max -20 min 20;
	private _range = (_sideBarWidth * 0.2) / 20;
	private _newPosition = (
		safeZoneX + (_sideBarWidth * 0.5) +
		(_diff * _range) -
		(_sideBarWidth * 0.05)
	);
	systemChat str _newPosition;
	(_reticleDialog displayCtrl 1202) ctrlSetPositionX _newPosition;
	(_reticleDialog displayCtrl 1202) ctrlCommit 0;
	isNil "shto_sight_camera"
};