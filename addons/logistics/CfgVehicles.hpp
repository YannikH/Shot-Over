class cfgVehicles {
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
    class shto_vn_m101_shell_icm: shto_vn_m101_shell { displayName = "M444 105mm ICM Shell"; magazineBase = "shto_105mm_mag_icm_x1_c"; };

    class ThingX;
    class ReammoBox_F: ThingX {
      class ACE_Actions { class ACE_MainActions; };
    };
    class vn_ammobox_base: ReammoBox_F {
      class ACE_Actions: ACE_Actions {
				class ACE_MainActions: ACE_MainActions { };
      };
    };
    class vn_b_ammobox_01: vn_ammobox_base {
      class ACE_Actions: ACE_Actions {
				class ACE_MainActions: ACE_MainActions { };
      };
    };
    class vn_b_ammobox_11: vn_b_ammobox_01 {
      class ACE_Actions: ACE_Actions {
				class ACE_MainActions: ACE_MainActions { };
      };
    };
    class vn_b_ammobox_12: vn_b_ammobox_11 {
      class ACE_Actions: ACE_Actions {
				class ACE_MainActions: ACE_MainActions { };
      };
    };
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
      ace_dragging_carryPosition[] = {0, 1.2, 0.25};
      ace_dragging_carryDirection = 0;
      openVariant = "shto_vn_crate_open_base";
      //model = "\vn\static_f_vietnam\m101\proxy\vn_b_static_m101_crate_prop.p3d";

      // class ACE_Actions: ACE_Actions {
			// 	class ACE_MainActions: ACE_MainActions {
			// 		class SHTO_UnpackCrate {
			// 			displayName = "Unpack Crate";
			// 			condition = "(alive _target) && (!(_target getVariable [""shto_crateIsOpen"",false]))";
			// 			statement = "	_target remoteExec [""shot_over_logistics_fnc_unpackCrate"", _target]; _target setVariable [""shto_crateIsOpen"",true];";
			// 		};
			// 	};
			// };


    };
    class shto_vn_crate_open_base: shto_vn_crate_base {
      model = "\vn\static_f_vietnam\m101\proxy\vn_b_static_m101_crate_open_prop.p3d";
    };
    class shto_vn_m101_he_crate: shto_vn_crate_base {
      scope = 2;
			displayName = "M1 105mm HE x2 Crate";
      openVariant = "shto_vn_m101_he_crate_open";
		};
    class shto_vn_m101_he_crate_open: shto_vn_crate_open_base {
			displayName = "M1 105mm HE x2 Crate (Open)";
      shellType = "shto_vn_m101_shell_he";
		};
    class shto_vn_m101_ab_crate: shto_vn_crate_base {
      scope = 2;
			displayName = "M1 105mm AB x2 Crate";
      openVariant = "shto_vn_m101_ab_crate_open";
		};
    class shto_vn_m101_ab_crate_open: shto_vn_crate_open_base {
			displayName = "M1 105mm AB x2 Crate (Open)";
      shellType = "shto_vn_m101_shell_ab";
		};
    class shto_vn_m101_frag_crate: shto_vn_crate_base {
      scope = 2;
			displayName = "M546 105mm FRAG x2 Crate";
      openVariant = "shto_vn_m101_frag_crate_open";
		};
    class shto_vn_m101_frag_crate_open: shto_vn_crate_open_base {
			displayName = "M546 105mm FRAG x2 Crate (Open)";
      shellType = "shto_vn_m101_shell_frag";
		};
    class shto_vn_m101_wp_crate: shto_vn_crate_base {
      scope = 2;
			displayName = "M60 105mm WP x2 Crate";
      openVariant = "shto_vn_m101_wp_crate_open";
		};
    class shto_vn_m101_wp_crate_open: shto_vn_crate_open_base {
			displayName = "M60 105mm WP x2 Crate (Open)";
      shellType = "shto_vn_m101_shell_wp";
		};
    class shto_vn_m101_smoke_crate: shto_vn_crate_base {
      scope = 2;
			displayName = "M60 105mm Smoke x2 Crate";
      openVariant = "shto_vn_m101_smoke_crate_open";
		};
    class shto_vn_m101_smoke_crate_open: shto_vn_crate_open_base {
			displayName = "M60 105mm Smoke x2 Crate (Open)";
      shellType = "shto_vn_m101_shell_smk";
		};
    class shto_vn_m101_illum_crate: shto_vn_crate_base {
      scope = 2;
			displayName = "M314 105mm LUME x2 Crate";
      openVariant = "shto_vn_m101_illum_crate_open";
		};
    class shto_vn_m101_illum_crate_open: shto_vn_crate_open_base {
			displayName = "M314 105mm LUME x2 Crate (Open)";
      shellType = "shto_vn_m101_shell_icm";
		};
    class shto_vn_m101_icm_crate: shto_vn_crate_base {
      scope = 2;
			displayName = "M444 105mm ICM x2 Crate";
      openVariant = "shto_vn_m101_illum_crate_open";
		};
    class shto_vn_m101_icm_crate_open: shto_vn_crate_open_base {
			displayName = "M444 105mm ICM x2 Crate (Open)";
      shellType = "shto_vn_m101_shell_icm";
		};

    class Land_vn_us_common_pallet_01;
    class shto_vn_m101_pallet_base: Land_vn_us_common_pallet_01 {
      displayName = "M1 105mm HE x42 Pallet";
      scope = 1;
      ace_dragging_canDrag = 1;
      ace_dragging_dragPosition[] = {0, 1.2, 0};
      ace_dragging_dragDirection = 0;
      ace_dragging_canCarry = 1;
      ace_dragging_carryPosition[] = {0, 1.2, 0.75};
      ace_dragging_carryDirection = 0;
      ace_cargo_size = 5;
      ace_cargo_canLoad = 1;
      crateCount = 21;
      crateClass = "shto_vn_m101_he_crate";
      yOffset = 0.2;
      class EventHandlers {
        class shto_palletInit {
          init = "_this call shot_over_logistics_fnc_initPallet;";
        };
      };
    };
    class shto_vn_m101_he_pallet_x42: shto_vn_m101_pallet_base {
      scope = 2;
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

    class shto_vn_m101_ab_pallet_x42: shto_vn_m101_pallet_base {
      scope = 2;
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

    class shto_vn_m101_frag_pallet_x42: shto_vn_m101_pallet_base {
      scope = 2;
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

    class shto_vn_m101_wp_pallet_x42: shto_vn_m101_pallet_base {
      scope = 2;
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

    class shto_vn_m101_smk_pallet_x42: shto_vn_m101_pallet_base {
      scope = 2;
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

    class shto_vn_m101_illum_pallet_x42: shto_vn_m101_pallet_base {
      scope = 2;
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

    class shto_vn_m101_icm_pallet_x42: shto_vn_m101_pallet_base {
      scope = 2;
      displayName = "M444 105mm ICM x42 Pallet";
      crateCount = 21;
      crateClass = "shto_vn_m101_icm_crate";
    };
    class shto_vn_m101_icm_pallet_x24: shto_vn_m101_icm_pallet_x42 {
      displayName = "M444 105mm ICM x24 Pallet";
      crateCount = 12;
    };
    class shto_vn_m101_icm_pallet_x18: shto_vn_m101_icm_pallet_x42 {
      displayName = "M444 105mm ICM x18 Pallet";
      crateCount = 9;
    };


    class vn_us_komex_small_01;
    class shto_vn_m101_container_base: vn_us_komex_small_01 {
      scope = 1;
      displayName = "M1 105mm HE x 504 Cargo Container";
      crateCount = 504;
      crateClass = "shto_vn_m101_he_crate";
      class EventHandlers {
        class shto_palletInit {
          init = "_this call shot_over_logistics_fnc_fillContainer;";
        };
      };
    };
    class shto_vn_m101_he_container_x504: shto_vn_m101_container_base {
      scope = 2;
      displayName = "M1 105mm HE x 504 Cargo Container";
      crateClass = "shto_vn_m101_he_crate";
      palletClasses[] = {"shto_vn_m101_he_pallet_x42","shto_vn_m101_he_pallet_x24","shto_vn_m101_he_pallet_x18"};
    };
    class shto_vn_m101_ab_container_x504: shto_vn_m101_container_base {
      scope = 2;
      displayName = "M1 105mm AB x 504 Cargo Container";
      crateClass = "shto_vn_m101_ab_crate";
      palletClasses[] = {"shto_vn_m101_ab_pallet_x42","shto_vn_m101_ab_pallet_x24","shto_vn_m101_ab_pallet_x18"};
    };
    class shto_vn_m101_frag_container_x504: shto_vn_m101_container_base {
      scope = 2;
      displayName = "M546 105mm FRAG x 504 Cargo Container";
      crateClass = "shto_vn_m101_frag_crate";
      palletClasses[] = {"shto_vn_m101_frag_pallet_x42","shto_vn_m101_ab_pallet_x24","shto_vn_m101_ab_pallet_x18"};
    };
    class shto_vn_m101_wp_container_x504: shto_vn_m101_container_base {
      scope = 2;
      displayName = "M60 105mm WP x 504 Cargo Container";
      crateClass = "shto_vn_m101_wp_crate";
      palletClasses[] = {"shto_vn_m101_wp_pallet_x42","shto_vn_m101_wp_pallet_x24","shto_vn_m101_wp_pallet_x18"};
    };
    class shto_vn_m101_smk_container_x504: shto_vn_m101_container_base {
      scope = 2;
      displayName = "M60 105mm Smoke x 504 Cargo Container";
      crateClass = "shto_vn_m101_smoke_crate";
      palletClasses[] = {"shto_vn_m101_smk_pallet_x42","shto_vn_m101_smk_pallet_x24","shto_vn_m101_smk_pallet_x18"};
    };
    class shto_vn_m101_illum_container_x504: shto_vn_m101_container_base {
      scope = 2;
      displayName = "M314 105mm LUME x 504 Cargo Container";
      crateClass = "shto_vn_m101_illum_crate";
      palletClasses[] = {"shto_vn_m101_illum_pallet_x42","shto_vn_m101_illum_pallet_x24","shto_vn_m101_illum_pallet_x18"};
    };
};
