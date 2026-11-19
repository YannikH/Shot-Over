#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            "shto_vn_m101_shell_he",
            "shto_vn_m101_shell_ab",
            "shto_vn_m101_shell_frag",
            "shto_vn_m101_shell_wp",
            "shto_vn_m101_shell_smk",
            "shto_vn_m101_shell_illum",
            "shto_vn_m101_shell_icm",
            "shto_vn_m101_he_crate",
            "shto_vn_m101_ab_crate",
            "shto_vn_m101_frag_crate",
            "shto_vn_m101_wp_crate",
            "shto_vn_m101_smoke_crate",
            "shto_vn_m101_illum_crate",
            "shto_vn_m101_icm_crate",
            "shto_vn_m101_he_pallet_x42",
            "shto_vn_m101_he_pallet_x24",
            "shto_vn_m101_he_pallet_x18",
            "shto_vn_m101_ab_pallet_x42",
            "shto_vn_m101_ab_pallet_x24",
            "shto_vn_m101_ab_pallet_x18",
            "shto_vn_m101_frag_pallet_x42",
            "shto_vn_m101_frag_pallet_x24",
            "shto_vn_m101_frag_pallet_x18",
            "shto_vn_m101_wp_pallet_x42",
            "shto_vn_m101_wp_pallet_x24",
            "shto_vn_m101_wp_pallet_x18",
            "shto_vn_m101_smk_pallet_x42",
            "shto_vn_m101_smk_pallet_x24",
            "shto_vn_m101_smk_pallet_x18",
            "shto_vn_m101_illum_pallet_x42",
            "shto_vn_m101_illum_pallet_x24",
            "shto_vn_m101_illum_pallet_x18",
            "shto_vn_m101_icm_pallet_x42",
            "shto_vn_m101_icm_pallet_x24",
            "shto_vn_m101_icm_pallet_x18",
            "shto_vn_m101_he_container_x504",
            "shto_vn_m101_ab_container_x504",
            "shto_vn_m101_frag_container_x504",
            "shto_vn_m101_wp_container_x504",
            "shto_vn_m101_smk_container_x504",
            "shto_vn_m101_illum_container_x504"
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"shot_over_main", "loadorder_f_vietnam", "ace_cargo", "ace_dragging", "ace_repair", "ace_interact_menu"};
        author = AUTHOR;
        authors[] = {"YannikH", "toadball", "Yax", "Andx"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
