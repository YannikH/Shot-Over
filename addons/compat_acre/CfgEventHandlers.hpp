class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_InitPost_EventHandlers {
    class shto_vn_prop_prc77_01 {
        class ADDON {
            serverInit = QUOTE(_this call FUNC(initRacks));
        };
    };
};
