#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"shot_over_m101", "acre_main", "acre_sys_rack"};
        // Loaded only when ACRE2 is loaded
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = {"YannikH", "toadball", "Yax", "Andx"};
        url = "https://github.com/Andx667/Shot-Over";
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
