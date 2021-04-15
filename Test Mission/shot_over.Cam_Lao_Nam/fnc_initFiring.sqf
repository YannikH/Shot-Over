shto_fnc_initFiring = {
	_this spawn {
		params ["_howitzer", "_gunner"];
		private _startTime = time;
		hint str ["firing", typeof _howitzer, typeof _gunner];
		reload _howitzer;
		_gunner disableAI "ALL";
		_howitzer loadMagazine [[0], "shto_howitzer_105mm_base", (magazines _howitzer) # 0];
		_howitzer setWeaponReloadingTime [_gunner, "shto_howitzer_105mm_base", 0];
		waitUntil {
			hint str [gunner _howitzer, currentMagazine _howitzer];
			reload _howitzer;
			_howitzer setWeaponReloadingTime [_gunner, "shto_howitzer_105mm_base", 0];
			//_gunner fireAtTarget [objNull];
			(time > (_startTime + 2)) || (count (magazines _howitzer) == 0)
		};
	};
};