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
