class CfgVehicles {
    class vn_b_prop_prc77_01;
    class shto_vn_prop_prc77_01: vn_b_prop_prc77_01 {
        class AcreRacks {
            class Rack_1 {
                displayName = CSTRING(Rack_DisplayName); // shown in the interaction menu
                shortName = CSTRING(Rack_ShortName);
                componentName = "ACRE_VRC64";
                allowedPositions[] = {"external"};
                disabledPositions[] = {};
                defaultComponents[] = {};
                mountedRadio = "ACRE_PRC77";
                isRadioRemovable = 0;
                // units in the intercom can hear and send transmissions (ACE interaction menu) but not use the radio's GUI
                intercom[] = {};
            };
        };
    };
};
