#include "script_component.hpp"

class CfgPatches
{
    class ADDON
    {
        name = COMPONENT_NAME;
        units[] = {
            "shto_vn_static_m101_02_base",
            "shto_vn_static_m101_01",
            "shto_vn_prop_prc77_01"
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"shot_over_main", "loadorder_f_vietnam", "ace_interact_menu"};
        author = AUTHOR;
        authors[] = {"YannikH", "toadball", "Yax", "Andx"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

class NewTurret;
#include "config\CfgVehicles.hpp"
#include "config\CfgWeapons.hpp"
#include "config\CfgMagazines.hpp"
#include "config\CfgAmmo.hpp"
