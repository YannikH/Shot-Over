class CfgVehicles {
    class ACE_Track;
    class shto_vn_m101_shell: ACE_Track {
        displayName = CSTRING(m101_shell_DisplayName);
        scope = 1;
        scopeCurator = 1;
        editorCategory = "shot_over";
        editorSubcategory = "shot_over_ammunition";
        magazineBase = "shto_105mm_mag_he_x1_c";
        model = "\vn\static_f_vietnam\m101\proxy\vn_b_static_m101_shell_prop.p3d";
        ace_cargo_size = 1;
        class ACE_Actions {};
        //editorPreview = "\vn\editorpreviews_f_vietnam\magazines\preview_vn_22mm_he_mag.jpg";
    };
    class shto_vn_m101_shell_he: shto_vn_m101_shell { scope = 2; scopeCurator = 2; displayName = CSTRING(m101_shell_he_DisplayName); magazineBase = "shto_105mm_mag_he_x1_c"; };
    class shto_vn_m101_shell_ab: shto_vn_m101_shell { scope = 2; scopeCurator = 2; displayName = CSTRING(m101_shell_ab_DisplayName); magazineBase = "shto_105mm_mag_ab_x1_c"; };
    class shto_vn_m101_shell_frag: shto_vn_m101_shell { scope = 2; scopeCurator = 2; displayName = CSTRING(m101_shell_frag_DisplayName); magazineBase = "shto_105mm_mag_frag_x1_c"; };
    class shto_vn_m101_shell_wp: shto_vn_m101_shell { scope = 2; scopeCurator = 2; displayName = CSTRING(m101_shell_wp_DisplayName); magazineBase = "shto_105mm_mag_wp_x1_c"; };
    class shto_vn_m101_shell_smk: shto_vn_m101_shell { scope = 2; scopeCurator = 2; displayName = CSTRING(m101_shell_smk_DisplayName); magazineBase = "shto_105mm_mag_chem_x1_c"; };
    class shto_vn_m101_shell_illum: shto_vn_m101_shell { scope = 2; scopeCurator = 2; displayName = CSTRING(m101_shell_illum_DisplayName); magazineBase = "shto_105mm_mag_lume_x1_c"; };
    class shto_vn_m101_shell_icm: shto_vn_m101_shell { scope = 2; scopeCurator = 2; displayName = CSTRING(m101_shell_icm_DisplayName); magazineBase = "shto_105mm_mag_icm_x1_c"; };

    class shto_vn_m101_shell_casing: ACE_Track {
        displayName = CSTRING(m101_shell_casing_DisplayName);
        model = "\vn\static_f_vietnam\m101\proxy\vn_b_static_m101_shell_empty_prop.p3d";
        ace_cargo_size = 1;
    };

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
      editorCategory = "shot_over";
      editorSubcategory = "shot_over_ammunition";
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
      // "Unpack Crate" is added in XEH_postInit
    };
    class shto_vn_crate_open_base: shto_vn_crate_base {
      model = "\vn\static_f_vietnam\m101\proxy\vn_b_static_m101_crate_open_prop.p3d";
    };
    class shto_vn_m101_he_crate: shto_vn_crate_base {
      scope = 2;
      scopeCurator = 2;
            displayName = CSTRING(m101_he_crate_DisplayName);
      openVariant = "shto_vn_m101_he_crate_open";
        };
    class shto_vn_m101_he_crate_open: shto_vn_crate_open_base {
            displayName = CSTRING(m101_he_crate_open_DisplayName);
      shellType = "shto_vn_m101_shell_he";
        };
    class shto_vn_m101_ab_crate: shto_vn_crate_base {
      scope = 2;
      scopeCurator = 2;
            displayName = CSTRING(m101_ab_crate_DisplayName);
      openVariant = "shto_vn_m101_ab_crate_open";
        };
    class shto_vn_m101_ab_crate_open: shto_vn_crate_open_base {
            displayName = CSTRING(m101_ab_crate_open_DisplayName);
      shellType = "shto_vn_m101_shell_ab";
        };
    class shto_vn_m101_frag_crate: shto_vn_crate_base {
      scope = 2;
      scopeCurator = 2;
            displayName = CSTRING(m101_frag_crate_DisplayName);
      openVariant = "shto_vn_m101_frag_crate_open";
        };
    class shto_vn_m101_frag_crate_open: shto_vn_crate_open_base {
            displayName = CSTRING(m101_frag_crate_open_DisplayName);
      shellType = "shto_vn_m101_shell_frag";
        };
    class shto_vn_m101_wp_crate: shto_vn_crate_base {
      scope = 2;
      scopeCurator = 2;
            displayName = CSTRING(m101_wp_crate_DisplayName);
      openVariant = "shto_vn_m101_wp_crate_open";
        };
    class shto_vn_m101_wp_crate_open: shto_vn_crate_open_base {
            displayName = CSTRING(m101_wp_crate_open_DisplayName);
      shellType = "shto_vn_m101_shell_wp";
        };
    class shto_vn_m101_smoke_crate: shto_vn_crate_base {
      scope = 2;
      scopeCurator = 2;
            displayName = CSTRING(m101_smoke_crate_DisplayName);
      openVariant = "shto_vn_m101_smoke_crate_open";
        };
    class shto_vn_m101_smoke_crate_open: shto_vn_crate_open_base {
            displayName = CSTRING(m101_smoke_crate_open_DisplayName);
      shellType = "shto_vn_m101_shell_smk";
        };
    class shto_vn_m101_illum_crate: shto_vn_crate_base {
      scope = 2;
      scopeCurator = 2;
            displayName = CSTRING(m101_illum_crate_DisplayName);
      openVariant = "shto_vn_m101_illum_crate_open";
        };
    class shto_vn_m101_illum_crate_open: shto_vn_crate_open_base {
            displayName = CSTRING(m101_illum_crate_open_DisplayName);
      shellType = "shto_vn_m101_shell_illum";
        };
    class shto_vn_m101_icm_crate: shto_vn_crate_base {
      scope = 2;
      scopeCurator = 2;
            displayName = CSTRING(m101_icm_crate_DisplayName);
      openVariant = "shto_vn_m101_icm_crate_open";
        };
    class shto_vn_m101_icm_crate_open: shto_vn_crate_open_base {
            displayName = CSTRING(m101_icm_crate_open_DisplayName);
      shellType = "shto_vn_m101_shell_icm";
        };

    class Land_vn_us_common_pallet_01;
    class shto_vn_m101_pallet_base: Land_vn_us_common_pallet_01 {
      displayName = CSTRING(m101_pallet_base_DisplayName);
      scope = 1;
      scopeCurator = 1;
      editorCategory = "shot_over";
      editorSubcategory = "shot_over_supplies";
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
    };
    class shto_vn_m101_he_pallet_x42: shto_vn_m101_pallet_base {
      scope = 2;
      scopeCurator = 2;
    };
    class shto_vn_m101_he_pallet_x24: shto_vn_m101_he_pallet_x42 {
      displayName = CSTRING(m101_he_pallet_x24_DisplayName);
      crateCount = 12;
      crateClass = "shto_vn_m101_he_crate";
    };
    class shto_vn_m101_he_pallet_x18: shto_vn_m101_he_pallet_x42 {
      displayName = CSTRING(m101_he_pallet_x18_DisplayName);
      crateCount = 9;
      crateClass = "shto_vn_m101_he_crate";
    };

    class shto_vn_m101_ab_pallet_x42: shto_vn_m101_pallet_base {
      scope = 2;
      scopeCurator = 2;
      displayName = CSTRING(m101_ab_pallet_x42_DisplayName);
      crateCount = 21;
      crateClass = "shto_vn_m101_ab_crate";
    };
    class shto_vn_m101_ab_pallet_x24: shto_vn_m101_ab_pallet_x42 {
      displayName = CSTRING(m101_ab_pallet_x24_DisplayName);
      crateCount = 12;
    };
    class shto_vn_m101_ab_pallet_x18: shto_vn_m101_ab_pallet_x42 {
      displayName = CSTRING(m101_ab_pallet_x18_DisplayName);
      crateCount = 9;
    };

    class shto_vn_m101_frag_pallet_x42: shto_vn_m101_pallet_base {
      scope = 2;
      scopeCurator = 2;
      displayName = CSTRING(m101_frag_pallet_x42_DisplayName);
      crateCount = 21;
      crateClass = "shto_vn_m101_frag_crate";
    };
    class shto_vn_m101_frag_pallet_x24: shto_vn_m101_frag_pallet_x42 {
      displayName = CSTRING(m101_frag_pallet_x24_DisplayName);
      crateCount = 12;
    };
    class shto_vn_m101_frag_pallet_x18: shto_vn_m101_frag_pallet_x42 {
      displayName = CSTRING(m101_frag_pallet_x18_DisplayName);
      crateCount = 9;
    };

    class shto_vn_m101_wp_pallet_x42: shto_vn_m101_pallet_base {
      scope = 2;
      scopeCurator = 2;
      displayName = CSTRING(m101_wp_pallet_x42_DisplayName);
      crateCount = 21;
      crateClass = "shto_vn_m101_wp_crate";
    };
    class shto_vn_m101_wp_pallet_x24: shto_vn_m101_wp_pallet_x42 {
      displayName = CSTRING(m101_wp_pallet_x24_DisplayName);
      crateCount = 12;
    };
    class shto_vn_m101_wp_pallet_x18: shto_vn_m101_wp_pallet_x42 {
      displayName = CSTRING(m101_wp_pallet_x18_DisplayName);
      crateCount = 9;
    };

    class shto_vn_m101_smk_pallet_x42: shto_vn_m101_pallet_base {
      scope = 2;
      scopeCurator = 2;
      displayName = CSTRING(m101_smk_pallet_x42_DisplayName);
      crateCount = 21;
      crateClass = "shto_vn_m101_smoke_crate";
    };
    class shto_vn_m101_smk_pallet_x24: shto_vn_m101_smk_pallet_x42 {
      displayName = CSTRING(m101_smk_pallet_x24_DisplayName);
      crateCount = 12;
    };
    class shto_vn_m101_smk_pallet_x18: shto_vn_m101_smk_pallet_x42 {
      displayName = CSTRING(m101_smk_pallet_x18_DisplayName);
      crateCount = 9;
    };

    class shto_vn_m101_illum_pallet_x42: shto_vn_m101_pallet_base {
      scope = 2;
      scopeCurator = 2;
      displayName = CSTRING(m101_illum_pallet_x42_DisplayName);
      crateCount = 21;
      crateClass = "shto_vn_m101_illum_crate";
    };
    class shto_vn_m101_illum_pallet_x24: shto_vn_m101_illum_pallet_x42 {
      displayName = CSTRING(m101_illum_pallet_x24_DisplayName);
      crateCount = 12;
    };
    class shto_vn_m101_illum_pallet_x18: shto_vn_m101_illum_pallet_x42 {
      displayName = CSTRING(m101_illum_pallet_x18_DisplayName);
      crateCount = 9;
    };

    class shto_vn_m101_icm_pallet_x42: shto_vn_m101_pallet_base {
      scope = 2;
      scopeCurator = 2;
      displayName = CSTRING(m101_icm_pallet_x42_DisplayName);
      crateCount = 21;
      crateClass = "shto_vn_m101_icm_crate";
    };
    class shto_vn_m101_icm_pallet_x24: shto_vn_m101_icm_pallet_x42 {
      displayName = CSTRING(m101_icm_pallet_x24_DisplayName);
      crateCount = 12;
    };
    class shto_vn_m101_icm_pallet_x18: shto_vn_m101_icm_pallet_x42 {
      displayName = CSTRING(m101_icm_pallet_x18_DisplayName);
      crateCount = 9;
    };


    class vn_us_komex_small_01;
    class shto_vn_m101_container_base: vn_us_komex_small_01 {
      scope = 1;
      scopeCurator = 1;
      editorCategory = "shot_over";
      editorSubcategory = "shot_over_supplies";
      displayName = CSTRING(m101_container_base_DisplayName);
      // crates of 2 rounds, 504 rounds; the stock is a number, the container shows no crates
      crateCount = 252;
      crateClass = "shto_vn_m101_he_crate";
    };
    class shto_vn_m101_he_container_x504: shto_vn_m101_container_base {
      scope = 2;
      scopeCurator = 2;
      displayName = CSTRING(m101_he_container_x504_DisplayName);
      crateClass = "shto_vn_m101_he_crate";
      palletClasses[] = {"shto_vn_m101_he_pallet_x42","shto_vn_m101_he_pallet_x24","shto_vn_m101_he_pallet_x18"};
    };
    class shto_vn_m101_ab_container_x504: shto_vn_m101_container_base {
      scope = 2;
      scopeCurator = 2;
      displayName = CSTRING(m101_ab_container_x504_DisplayName);
      crateClass = "shto_vn_m101_ab_crate";
      palletClasses[] = {"shto_vn_m101_ab_pallet_x42","shto_vn_m101_ab_pallet_x24","shto_vn_m101_ab_pallet_x18"};
    };
    class shto_vn_m101_frag_container_x504: shto_vn_m101_container_base {
      scope = 2;
      scopeCurator = 2;
      displayName = CSTRING(m101_frag_container_x504_DisplayName);
      crateClass = "shto_vn_m101_frag_crate";
      palletClasses[] = {"shto_vn_m101_frag_pallet_x42","shto_vn_m101_frag_pallet_x24","shto_vn_m101_frag_pallet_x18"};
    };
    class shto_vn_m101_wp_container_x504: shto_vn_m101_container_base {
      scope = 2;
      scopeCurator = 2;
      displayName = CSTRING(m101_wp_container_x504_DisplayName);
      crateClass = "shto_vn_m101_wp_crate";
      palletClasses[] = {"shto_vn_m101_wp_pallet_x42","shto_vn_m101_wp_pallet_x24","shto_vn_m101_wp_pallet_x18"};
    };
    class shto_vn_m101_smk_container_x504: shto_vn_m101_container_base {
      scope = 2;
      scopeCurator = 2;
      displayName = CSTRING(m101_smk_container_x504_DisplayName);
      crateClass = "shto_vn_m101_smoke_crate";
      palletClasses[] = {"shto_vn_m101_smk_pallet_x42","shto_vn_m101_smk_pallet_x24","shto_vn_m101_smk_pallet_x18"};
    };
    class shto_vn_m101_illum_container_x504: shto_vn_m101_container_base {
      scope = 2;
      scopeCurator = 2;
      displayName = CSTRING(m101_illum_container_x504_DisplayName);
      crateClass = "shto_vn_m101_illum_crate";
      palletClasses[] = {"shto_vn_m101_illum_pallet_x42","shto_vn_m101_illum_pallet_x24","shto_vn_m101_illum_pallet_x18"};
    };
};
