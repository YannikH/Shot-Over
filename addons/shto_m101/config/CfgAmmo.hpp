class CfgAmmo {
	class vn_shell_105mm_m1_ab_ammo;
	class shto_vn_shell_105mm_m444_icm_ammo: vn_shell_105mm_m1_ab_ammo {
		submunitionAmmo[] = {"vn_rpg2_rocket_ammo",1};
		submunitionConeAngle = 30;
		submunitionConeType[] = {"randomcenter",42};
		submunitionInitSpeed = 0;
		submunitionParentSpeedCoef = 1;
		triggerDistance = 100;
		triggerSpeedCoef[] = {0.5,1};
	};
};