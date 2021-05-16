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
    class shto_vn_static_m101_02_base: vn_b_army_static_m101_02 {
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
    class shto_vn_static_m101_01: shto_vn_static_m101_02_base {
      //picture = "\vn\static_f_vietnam\ui\pic_vn_static_m101_01_ca.paa";
      model = "\vn\static_f_vietnam\m101\vn_b_static_m101_02";
    };
    class ACE_Track;
    class shto_vn_m101_shell: ACE_Track {
        displayName = "M1 105mm HE Shell";
        magazineBase = "shto_105mm_mag_he_x1_c";
        model = "\vn\static_f_vietnam\m101\proxy\vn_b_static_m101_shell_prop.p3d";
        ace_cargo_size = 1;
        class ACE_Actions {};
        //editorPreview = "\vn\editorpreviews_f_vietnam\magazines\preview_vn_22mm_he_mag.jpg";
    };
    class shto_vn_m101_shell_he: shto_vn_m101_shell { displayName = "M1 105mm HE Shell"; magazineBase = "shto_105mm_mag_he_x1_c"; };
    class shto_vn_m101_shell_ab: shto_vn_m101_shell { displayName = "M1 105mm AB Shell"; magazineBase = "shto_105mm_mag_ab_x1_c"; };
    class shto_vn_m101_shell_frag: shto_vn_m101_shell { displayName = "M546 105mm FRAG Shell"; magazineBase = "shto_105mm_mag_frag_x1_c"; };
    class shto_vn_m101_shell_wp: shto_vn_m101_shell { displayName = "M60 105mm WP Shell"; magazineBase = "shto_105mm_mag_wp_x1_c"; };
    class shto_vn_m101_shell_smk: shto_vn_m101_shell { displayName = "M60 105mm Smoke Shell"; magazineBase = "shto_105mm_mag_chem_x1_c"; };
    class shto_vn_m101_shell_illum: shto_vn_m101_shell { displayName = "M314 105mm LUME Shell"; magazineBase = "shto_105mm_mag_lume_x1_c"; };

    class vn_b_ammobox_12;
    class shto_vn_crate_base: vn_b_ammobox_12 {
      scope = 1;
      scopeCurator = 1;
      TransportMaxWeapons = 0;
      TransportMaxItems = 0;
      TransportMaxMagazines = 0;
      TransportMaxBackpacks = 0;
      maximumLoad = 0;
      ace_dragging_canDrag = 1;
      ace_cargo_size = 2;
      ace_dragging_dragPosition[] = {0, 1.2, 0};
      ace_dragging_dragDirection = 0;
      ace_dragging_canCarry = 1;
      ace_dragging_carryPosition[] = {0, 1.2, 0};
      ace_dragging_carryDirection = 0;
      openVariant = "shto_vn_crate_open_base";
      //model = "\vn\static_f_vietnam\m101\proxy\vn_b_static_m101_crate_prop.p3d";
    };
    class shto_vn_crate_open_base: shto_vn_crate_base {
      model = "\vn\static_f_vietnam\m101\proxy\vn_b_static_m101_crate_open_prop.p3d";
    };
    class shto_vn_m101_he_crate: shto_vn_crate_base {
      scope = 2;
      ace_dragging_canDrag = 2;

			displayName = "M1 105mm HE x2 Crate";
      openVariant = "shto_vn_m101_he_crate_open";
		};
    class shto_vn_m101_he_crate_open: shto_vn_crate_open_base {
			displayName = "M1 105mm HE x2 Crate (Open)";
      shellType = "shto_vn_m101_shell_he";
		};
    class shto_vn_m101_ab_crate: shto_vn_m101_he_crate {
			displayName = "M1 105mm AB x2 Crate";
      openVariant = "shto_vn_m101_ab_crate_open";
		};
    class shto_vn_m101_ab_crate_open: shto_vn_m101_he_crate_open {
			displayName = "M1 105mm AB x2 Crate (Open)";
      shellType = "shto_vn_m101_shell_ab";
		};
    class shto_vn_m101_frag_crate: shto_vn_m101_he_crate {
			displayName = "M546 105mm FRAG x2 Crate";
      openVariant = "shto_vn_m101_frag_crate_open";
		};
    class shto_vn_m101_frag_crate_open: shto_vn_m101_he_crate_open {
			displayName = "M546 105mm FRAG x2 Crate (Open)";
      shellType = "shto_vn_m101_shell_frag";
		};
    class shto_vn_m101_wp_crate: shto_vn_m101_he_crate {
			displayName = "M60 105mm WP x2 Crate";
      openVariant = "shto_vn_m101_wp_crate_open";
		};
    class shto_vn_m101_wp_crate_open: shto_vn_m101_he_crate_open {
			displayName = "M60 105mm WP x2 Crate (Open)";
      shellType = "shto_vn_m101_shell_wp";
		};
    class shto_vn_m101_smoke_crate: shto_vn_m101_he_crate {
			displayName = "M60 105mm Smoke x2 Crate";
      openVariant = "shto_vn_m101_smoke_crate_open";
		};
    class shto_vn_m101_smoke_crate_open: shto_vn_m101_he_crate_open {
			displayName = "M60 105mm Smoke x2 Crate (Open)";
      shellType = "shto_vn_m101_shell_smk";
		};
    class shto_vn_m101_illum_crate: shto_vn_m101_he_crate {
			displayName = "M314 105mm LUME x2 Crate";
      openVariant = "shto_vn_m101_illum_crate_open";
		};
    class shto_vn_m101_illum_crate_open: shto_vn_m101_he_crate_open {
			displayName = "M314 105mm LUME x2 Crate (Open)";
      shellType = "shto_vn_m101_shell_illum";
		};

    class vn_b_pack_lw_06;
    class shto_rto_pack: vn_b_pack_lw_06 {
      displayName = "FDC Backpack (Shot, Over!)";
    };
    class vn_b_prop_prc77_01;
    class shto_vn_prop_prc77_01: vn_b_prop_prc77_01 {
      displayName = "PRC-77 Radio (Shot, Over!)";
      ace_dragging_canDrag = 1;
      ace_dragging_dragPosition[] = {0, 1.2, 0};
      ace_dragging_dragDirection = 0;
      ace_dragging_canCarry = 1;
      ace_dragging_carryPosition[] = {0, 1.2, 0};
      ace_dragging_carryDirection = 0;
      class AcreRacks {
        class Rack_1 {
          displayName = "Radio"; // Name is displayed in the interaction menu.
          shortName = "Radio";
          componentName = "ACRE_VRC64";
          allowedPositions[] = {"external"};
          disabledPositions[] = {};
          defaultComponents[] = {};
          mountedRadio = "ACRE_PRC77";                 // Predefined mounted radio
          isRadioRemovable = 0;
          intercom[] = {};                   // All units in intercom will be able to hear/send transmittions (ACE3 interaction menu) but they cannot manipulate the radio (GUI interface)
        };
      };
    };

    class Land_vn_us_common_pallet_01;
    class shto_vn_m101_he_pallet_x42: Land_vn_us_common_pallet_01 {
      displayName = "M1 105mm HE x42 Pallet";
      ace_dragging_canDrag = 1;
      ace_dragging_dragPosition[] = {0, 0.75, 0.75};
      ace_dragging_dragDirection = 0;
      ace_dragging_canCarry = 1;
      ace_dragging_carryPosition[] = {0, 0.75, 0.75};
      ace_dragging_carryDirection = 0;
      ace_cargo_size = 5;
      ace_cargo_canLoad = 1;
      crateCount = 21;
      crateClass = "shto_vn_m101_he_crate";
      yOffset = 0.2;
      class EventHandlers {
        class shto_palletInit {
          init = "_this call shto_fnc_initPallet;";
        };
      };
    };
    class shto_vn_m101_he_pallet_x24: shto_vn_m101_he_pallet_x42 {
      displayName = "M1 105mm HE x24 Pallet";
      crateCount = 12;
      crateClass = "shto_vn_m101_he_crate";
    };
    class shto_vn_m101_he_pallet_x18: shto_vn_m101_he_pallet_x42 {
      displayName = "M1 105mm HE 18 Pallet";
      crateCount = 9;
      crateClass = "shto_vn_m101_he_crate";
    };

    class shto_vn_m101_ab_pallet_x42: shto_vn_m101_he_pallet_x42 {
      displayName = "M1 105mm AB x42 Pallet";
      crateCount = 21;
      crateClass = "shto_vn_m101_ab_crate";
    };
    class shto_vn_m101_ab_pallet_x24: shto_vn_m101_ab_pallet_x42 {
      displayName = "M1 105mm AB x24 Pallet";
      crateCount = 12;
    };
    class shto_vn_m101_ab_pallet_x18: shto_vn_m101_ab_pallet_x42 {
      displayName = "M1 105mm AB x18 Pallet";
      crateCount = 9;
    };

    class shto_vn_m101_frag_pallet_x42: shto_vn_m101_he_pallet_x42 {
      displayName = "M546 105mm FRAG x42 Pallet";
      crateCount = 21;
      crateClass = "shto_vn_m101_frag_crate";
    };
    class shto_vn_m101_frag_pallet_x24: shto_vn_m101_frag_pallet_x42 {
      displayName = "M546 105mm FRAG x24 Pallet";
      crateCount = 12;
    };
    class shto_vn_m101_frag_pallet_x18: shto_vn_m101_frag_pallet_x42 {
      displayName = "M546 105mm FRAG x18 Pallet";
      crateCount = 9;
    };

    class shto_vn_m101_wp_pallet_x42: shto_vn_m101_he_pallet_x42 {
      displayName = "M60 105mm WP x42 Pallet";
      crateCount = 21;
      crateClass = "shto_vn_m101_wp_crate";
    };
    class shto_vn_m101_wp_pallet_x24: shto_vn_m101_wp_pallet_x42 {
      displayName = "M60 105mm WP x24 Pallet";
      crateCount = 12;
    };
    class shto_vn_m101_wp_pallet_x18: shto_vn_m101_wp_pallet_x42 {
      displayName = "M60 105mm WP x18 Pallet";
      crateCount = 9;
    };

    class shto_vn_m101_smk_pallet_x42: shto_vn_m101_he_pallet_x42 {
      displayName = "M60 105mm Smoke x42 Pallet";
      crateCount = 21;
      crateClass = "shto_vn_m101_smoke_crate";
    };
    class shto_vn_m101_smk_pallet_x24: shto_vn_m101_smk_pallet_x42 {
      displayName = "M60 105mm Smoke x24 Pallet";
      crateCount = 12;
    };
    class shto_vn_m101_smk_pallet_x18: shto_vn_m101_smk_pallet_x42 {
      displayName = "M60 105mm Smoke x18 Pallet";
      crateCount = 9;
    };

    class shto_vn_m101_illum_pallet_x42: shto_vn_m101_he_pallet_x42 {
      displayName = "M314 105mm LUME x42 Pallet";
      crateCount = 21;
      crateClass = "shto_vn_m101_smoke_crate";
    };
    class shto_vn_m101_illum_pallet_x24: shto_vn_m101_illum_pallet_x42 {
      displayName = "M314 105mm LUME x24 Pallet";
      crateCount = 12;
    };
    class shto_vn_m101_illum_pallet_x18: shto_vn_m101_illum_pallet_x42 {
      displayName = "M314 105mm LUME x18 Pallet";
      crateCount = 9;
    };


    class vn_us_komex_small_01;
    class shto_vn_m101_container_base: vn_us_komex_small_01 {
      scope = 1;
      displayName = "M1 105mm HE x 504 Cargo Container";
      crateCount = 252;
      crateClass = "shto_vn_m101_he_crate";
      class EventHandlers {
        class shto_palletInit {
          init = "_this call shto_fnc_fillContainer;";
        };
      };
    };
    class shto_vn_m101_he_container_x504: shto_vn_m101_container_base {
      scope = 2;
      displayName = "M1 105mm HE x 504 Cargo Container";
      crateClass = "shto_vn_m101_he_crate";
    };
    class shto_vn_m101_ab_container_x504: shto_vn_m101_container_base {
      scope = 2;
      displayName = "M1 105mm AB x 504 Cargo Container";
      crateClass = "shto_vn_m101_ab_crate";
    };
    class shto_vn_m101_frag_container_x504: shto_vn_m101_container_base {
      scope = 2;
      displayName = "M546 105mm FRAG x 504 Cargo Container";
      crateClass = "shto_vn_m101_frag_crate";
    };
    class shto_vn_m101_wp_container_x504: shto_vn_m101_container_base {
      scope = 2;
      displayName = "M60 105mm WP x 504 Cargo Container";
      crateClass = "shto_vn_m101_wp_crate";
    };
    class shto_vn_m101_smk_container_x504: shto_vn_m101_container_base {
      scope = 2;
      displayName = "M60 105mm Smoke x 504 Cargo Container";
      crateClass = "shto_vn_m101_smoke_crate";
    };
    class shto_vn_m101_illum_container_x504: shto_vn_m101_container_base {
      scope = 2;      
      displayName = "M314 105mm LUME x 504 Cargo Container";
      crateClass = "shto_vn_m101_illum_crate";
    };
};
