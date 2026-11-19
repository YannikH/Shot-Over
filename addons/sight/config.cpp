#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"shot_over_m101", "ace_interact_menu"};
        author = AUTHOR;
        authors[] = {"YannikH", "toadball", "Yax", "Andx"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

class IGUIBack;
class RscText;
class RscPicture;
class RscControlsGroupNoScrollbars;
#include "uiConfig\RscTitles.hpp"
