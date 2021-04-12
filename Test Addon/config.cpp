class CfgPatches {
    class Shot_Over {
        name = "Shot, Over!";
        units[] = {};
        weapons[] = {};
        requiredVersion = 1;
        requiredAddons[] = {};
        author = "";
        authors[] = {""};
    };
};

// class cfgVehicles {
//     class vn_b_army_static_m101_02;
//     class shto_vn_static_m101_02_base : vn_b_army_static_m101_02 {
//         model = "\vn\static_f_vietnam\m101\vn_b_static_m101_01";
//         //crew = "B_UAV_AI";
//         class AnimationSources //removing shield actions
//         {
//             class m101_reload_source
//             {
//                 source = "user";
//                 animPeriod=5;
//                 initPhase=0.7;
//             };
//             class m101_revolving_source: m101_reload_source
//             {
//                 source = "user";
//                 animPeriod=0.2;
//                 initPhase=0;
//             };
//         };
//     };
//     class ACE_Track;
//     class shto_vn_m101_shell: ACE_Track {
//         displayName = "M101 HE Shell";
//         model = "\vn\static_f_vietnam\m101\proxy\vn_b_static_m101_shell_prop.p3d";
//         class ACE_Actions {};
//         editorPreview = "\vn\editorpreviews_f_vietnam\magazines\preview_vn_22mm_he_mag.jpg";
//     };
// };

class NewTurret;
class cfgVehicles {
    //Vanilla classes
    class LandVehicle;
    class StaticWeapon: LandVehicle {
      class Turrets {
				class MainTurret: NewTurret {};
      };
    };
    class StaticCannon: StaticWeapon {
      class Turrets: Turrets {
        class MainTurret: MainTurret { };
      };
    };

    //SOGPF classes
    class vn_howitzer_base: StaticCannon {
      class Turrets: Turrets {
				class MainTurret: MainTurret {};
      };
    };
    class vn_static_m101_base: vn_howitzer_base {
      class Turrets: Turrets {
				class MainTurret: MainTurret {};
      };
    };
    class vn_b_army_static_m101_01: vn_static_m101_base {
      //model = "\vn\static_f_vietnam\m101\vn_b_static_m101_01";
      class Turrets: Turrets {
				class MainTurret: MainTurret { };
      };
		};
    class vn_static_m101_02_base: vn_static_m101_base {
      //model = "\vn\static_f_vietnam\m101\vn_b_static_m101_02";
      class Turrets: Turrets {
				class MainTurret: MainTurret { };
      };
    };
    class vn_b_army_static_m101_02: vn_static_m101_02_base {
      class Turrets: Turrets {
				class MainTurret: MainTurret { };
      };
		};
    class shto_vn_static_m101_02_base : vn_b_army_static_m101_02 {
        //crew = "B_UAV_AI";
        displayName = "M101 Howitzer (Shot, Over!)";
        model = "\vn\static_f_vietnam\m101\vn_b_static_m101_01";
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"shto_howitzer_105mm_base"};
                magazines[] = {};
            };
          };
        class AnimationSources //removing shield actions
        {
            class m101_reload_source
            {
                source = "user";
                animPeriod=5;
                initPhase=0.7;
            };
            class m101_revolving_source: m101_reload_source
            {
                source = "user";
                animPeriod=0.2;
                initPhase=0;
            };
        };
    };
    
    class ACE_Track;
    class shto_vn_m101_shell: ACE_Track {
        displayName = "M1 105mm HE Shell";
        magazineBase = "shto_105mm_mag_he_x1_c";
        model = "\vn\static_f_vietnam\m101\proxy\vn_b_static_m101_shell_prop.p3d";
        class ACE_Actions {};
        editorPreview = "\vn\editorpreviews_f_vietnam\magazines\preview_vn_22mm_he_mag.jpg";
    };
    class shto_vn_m101_shell_he: shto_vn_m101_shell { displayName = "M1 105mm HE Shell"; magazineBase = "shto_105mm_mag_he_x1_c"; };
    class shto_vn_m101_shell_ab: shto_vn_m101_shell { displayName = "M1 105mm AB Shell"; magazineBase = "shto_105mm_mag_ab_x1_c"; };
    class shto_vn_m101_shell_frag: shto_vn_m101_shell { displayName = "M546 105mm FRAG Shell"; magazineBase = "shto_105mm_mag_frag_x1_c"; };
    class shto_vn_m101_shell_wp: shto_vn_m101_shell { displayName = "M60 105mm WP Shell"; magazineBase = "shto_105mm_mag_wp_x1_c"; };
    class shto_vn_m101_shell_smk: shto_vn_m101_shell { displayName = "M60 105mm Smoke Shell"; magazineBase = "shto_105mm_mag_chem_x1_c"; };
    class shto_vn_m101_shell_illum: shto_vn_m101_shell { displayName = "M314 105mm LUME Shell"; magazineBase = "shto_105mm_mag_lume_x1_c"; };
};

class CfgWeapons {
    class mortar_155mm_AMOS;
    class vn_howitzer_105mm_base: mortar_155mm_AMOS { class Single1; };

    class shto_howitzer_105mm_base: vn_howitzer_105mm_base {
        scope = 1;
        autoReload = 0;
        modes[] = {"Single"};
        reloadTime = 0;
        magazineReloadTime = 0;
        displayName = "M101 105mm Howitzer";
        magazines[] = {
            "shto_105mm_mag_he_x1_c1","shto_105mm_mag_he_x1_c2", "shto_105mm_mag_he_x1_c3", "shto_105mm_mag_he_x1_c4", "shto_105mm_mag_he_x1_c5",
            "shto_105mm_mag_ab_x1_c1","shto_105mm_mag_ab_x1_c2", "shto_105mm_mag_ab_x1_c3", "shto_105mm_mag_ab_x1_c4", "shto_105mm_mag_ab_x1_c5",
            "shto_105mm_mag_frag_x1_c1","shto_105mm_mag_frag_x1_c2", "shto_105mm_mag_frag_x1_c3", "shto_105mm_mag_frag_x1_c4", "shto_105mm_mag_frag_x1_c5",
            "shto_105mm_mag_wp_x1_c1","shto_105mm_mag_wp_x1_c2", "shto_105mm_mag_wp_x1_c3", "shto_105mm_mag_wp_x1_c4", "shto_105mm_mag_wp_x1_c5",
            "shto_105mm_mag_chem_x1_c1","shto_105mm_mag_chem_x1_c2", "shto_105mm_mag_chem_x1_c3", "shto_105mm_mag_chem_x1_c4", "shto_105mm_mag_chem_x1_c5",
            "shto_105mm_mag_lume_x1_c1","shto_105mm_mag_lume_x1_c2", "shto_105mm_mag_lume_x1_c3", "shto_105mm_mag_lume_x1_c4", "shto_105mm_mag_lume_x1_c5"
        };
        class Single: Single1 {
            displayName = "";
            artilleryCharge = 1;
            reloadTime = 0.8;
        };
        class EventHandlers {
            class shot_over_fired {
                fired = "_this call shto_fnc_fired;";
            };
        };
    };
};

class CfgMagazines {
    class vn_cannon_m101_mag_he_x8;
    class shto_105mm_mag_he_x1_c1: vn_cannon_m101_mag_he_x8 { displayName = "M1 105mm HE "; displayNameShort = "105mm HE Chg. 1"; initSpeed = 86; count = 1; };
    class shto_105mm_mag_he_x1_c2: shto_105mm_mag_he_x1_c1 { initSpeed = 160; displayNameShort = "105mm HE Chg. 2"; };
    class shto_105mm_mag_he_x1_c3: shto_105mm_mag_he_x1_c1 { initSpeed = 240; displayNameShort = "105mm HE Chg. 3"; };
    class shto_105mm_mag_he_x1_c4: shto_105mm_mag_he_x1_c1 { initSpeed = 320; displayNameShort = "105mm HE Chg. 4"; };
    class shto_105mm_mag_he_x1_c5: shto_105mm_mag_he_x1_c1 { initSpeed = 400; displayNameShort = "105mm HE Chg. 5"; };

    class vn_cannon_m101_mag_ab_x8;
    class shto_105mm_mag_ab_x1_c1: vn_cannon_m101_mag_ab_x8 { displayName = "M1 105mm AB"; displayNameShort = "105mm AB Chg. 1"; initSpeed = 86; count = 1; };
    class shto_105mm_mag_ab_x1_c2: shto_105mm_mag_ab_x1_c1 { initSpeed = 160; displayNameShort = "105mm AB Chg. 2"; };
    class shto_105mm_mag_ab_x1_c3: shto_105mm_mag_ab_x1_c1 { initSpeed = 240; displayNameShort = "105mm AB Chg. 3"; };
    class shto_105mm_mag_ab_x1_c4: shto_105mm_mag_ab_x1_c1 { initSpeed = 320; displayNameShort = "105mm AB Chg. 4"; };
    class shto_105mm_mag_ab_x1_c5: shto_105mm_mag_ab_x1_c1 { initSpeed = 400; displayNameShort = "105mm AB Chg. 5"; };

    class vn_cannon_m101_mag_frag_x8;
    class shto_105mm_mag_frag_x1_c1: vn_cannon_m101_mag_frag_x8 { displayName = "M546 105mm FRAG"; displayNameShort = "105mm FRAG Chg. 1"; initSpeed = 86; count = 1; };
    class shto_105mm_mag_frag_x1_c2: shto_105mm_mag_frag_x1_c1 { initSpeed = 160; displayNameShort = "105mm FRAG Chg. 2"; };
    class shto_105mm_mag_frag_x1_c3: shto_105mm_mag_frag_x1_c1 { initSpeed = 240; displayNameShort = "105mm FRAG Chg. 3"; };
    class shto_105mm_mag_frag_x1_c4: shto_105mm_mag_frag_x1_c1 { initSpeed = 320; displayNameShort = "105mm FRAG Chg. 4"; };
    class shto_105mm_mag_frag_x1_c5: shto_105mm_mag_frag_x1_c1 { initSpeed = 400; displayNameShort = "105mm FRAG Chg. 5"; };

    class vn_cannon_m101_mag_wp_x8;
    class shto_105mm_mag_wp_x1_c1: vn_cannon_m101_mag_wp_x8 { displayName = "M60 105mm WP"; displayNameShort = "105mm WP Chg. 1"; initSpeed = 86; count = 1; };
    class shto_105mm_mag_wp_x1_c2: shto_105mm_mag_wp_x1_c1 { initSpeed = 160; displayNameShort = "105mm WP CHG. 2"; };
    class shto_105mm_mag_wp_x1_c3: shto_105mm_mag_wp_x1_c1 { initSpeed = 240; displayNameShort = "105mm WP CHG. 3"; };
    class shto_105mm_mag_wp_x1_c4: shto_105mm_mag_wp_x1_c1 { initSpeed = 320; displayNameShort = "105mm WP CHG. 4"; };
    class shto_105mm_mag_wp_x1_c5: shto_105mm_mag_wp_x1_c1 { initSpeed = 400; displayNameShort = "105mm WP CHG. 5"; };

    class vn_cannon_m101_mag_chem_x8;
    class shto_105mm_mag_chem_x1_c1: vn_cannon_m101_mag_chem_x8 { displayName = "M60 105mm Smoke"; displayNameShort = "105mm Smoke Chg. 1"; initSpeed = 86; count = 1; };
    class shto_105mm_mag_chem_x1_c2: shto_105mm_mag_chem_x1_c1 { initSpeed = 160; displayNameShort = "105mm Smoke CHG. 2"; };
    class shto_105mm_mag_chem_x1_c3: shto_105mm_mag_chem_x1_c1 { initSpeed = 240; displayNameShort = "105mm Smoke CHG. 3"; };
    class shto_105mm_mag_chem_x1_c4: shto_105mm_mag_chem_x1_c1 { initSpeed = 320; displayNameShort = "105mm Smoke CHG. 4"; };
    class shto_105mm_mag_chem_x1_c5: shto_105mm_mag_chem_x1_c1 { initSpeed = 400; displayNameShort = "105mm Smoke CHG. 5"; };

    class vn_cannon_m101_mag_lume_x8;
    class shto_105mm_mag_lume_x1_c1: vn_cannon_m101_mag_lume_x8 { displayName = "M314 105mm LUME"; displayNameShort = "105mm LUME Chg. 1"; initSpeed = 86; count = 1; };
    class shto_105mm_mag_lume_x1_c2: shto_105mm_mag_lume_x1_c1 { initSpeed = 160; displayNameShort = "105mm LUME Chg. 2"; };
    class shto_105mm_mag_lume_x1_c3: shto_105mm_mag_lume_x1_c1 { initSpeed = 240; displayNameShort = "105mm LUME Chg. 3"; };
    class shto_105mm_mag_lume_x1_c4: shto_105mm_mag_lume_x1_c1 { initSpeed = 320; displayNameShort = "105mm LUME Chg. 4"; };
    class shto_105mm_mag_lume_x1_c5: shto_105mm_mag_lume_x1_c1 { initSpeed = 400; displayNameShort = "105mm LUME Chg. 5"; };
};