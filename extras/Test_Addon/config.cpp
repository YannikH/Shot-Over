class CfgPatches {
    class Shot_Over {
        name = "Shot, Over!";
        units[] = {};
        weapons[] = {};
        requiredVersion = 1;
        requiredAddons[] = {};
        author = "";
        authors[] = {""};
    };
};

// class cfgVehicles {
//     class vn_b_army_static_m101_02;
//     class shto_vn_static_m101_02_base : vn_b_army_static_m101_02 {
//         model = "\vn\static_f_vietnam\m101\vn_b_static_m101_01";
//         //crew = "B_UAV_AI";
//         class AnimationSources //removing shield actions
//         {
//             class m101_reload_source
//             {
//                 source = "user";
//                 animPeriod=5;
//                 initPhase=0.7;
//             };
//             class m101_revolving_source: m101_reload_source
//             {
//                 source = "user";
//                 animPeriod=0.2;
//                 initPhase=0;
//             };
//         };
//     };
//     class ACE_Track;
//     class shto_vn_m101_shell: ACE_Track {
//         displayName = "M101 HE Shell";
//         model = "\vn\static_f_vietnam\m101\proxy\vn_b_static_m101_shell_prop.p3d";
//         class ACE_Actions {};
//         editorPreview = "\vn\editorpreviews_f_vietnam\magazines\preview_vn_22mm_he_mag.jpg";
//     };
// };

class NewTurret;
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgMagazines.hpp"
