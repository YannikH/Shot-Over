class cfgVehicles {
    //Vanilla classes
    class LandVehicle;
    class StaticWeapon: LandVehicle {
      class Turrets {
				class MainTurret: NewTurret {};
      };
    };
    class StaticCannon: StaticWeapon {
      class Turrets: Turrets {
        class MainTurret: MainTurret { };
      };
    };

    //SOGPF classes
    class vn_howitzer_base: StaticCannon {
      class Turrets: Turrets {
				class MainTurret: MainTurret {};
      };
    };
    class vn_static_m101_base: vn_howitzer_base {
      class Turrets: Turrets {
				class MainTurret: MainTurret {};
      };
    };
    class vn_b_army_static_m101_01: vn_static_m101_base {
      //model = "\vn\static_f_vietnam\m101\vn_b_static_m101_01";
      class Turrets: Turrets {
				class MainTurret: MainTurret { };
      };
		};
    class vn_static_m101_02_base: vn_static_m101_base {
      //model = "\vn\static_f_vietnam\m101\vn_b_static_m101_02";
      class Turrets: Turrets {
				class MainTurret: MainTurret { };
      };
    };
    class vn_b_army_static_m101_02: vn_static_m101_02_base {
      class Turrets: Turrets {
				class MainTurret: MainTurret { };
      };
		};
    class shto_vn_static_m101_02_base: vn_b_army_static_m101_02 {
      //crew = "B_UAV_AI";
      displayName = "M101 Howitzer (Shot, Over!)";
      model = "\vn\static_f_vietnam\m101\vn_b_static_m101_01";
      class Turrets: Turrets {
          class MainTurret: MainTurret {
              weapons[] = {"shto_howitzer_105mm_base"};
              magazines[] = {};
          };
        };
      class AnimationSources //removing shield actions
      {
          class m101_reload_source
          {
              source = "user";
              animPeriod=5;
              initPhase=0.7;
          };
          class m101_revolving_source: m101_reload_source
          {
              source = "user";
              animPeriod=0.2;
              initPhase=0;
          };
      };
    };
    class shto_vn_static_m101_01: shto_vn_static_m101_02_base {
      //picture = "\vn\static_f_vietnam\ui\pic_vn_static_m101_01_ca.paa";
      model = "\vn\static_f_vietnam\m101\vn_b_static_m101_02";
    };

    class vn_b_pack_lw_06;
    class shto_rto_pack: vn_b_pack_lw_06 {
      displayName = "FDC Backpack (Shot, Over!)";
    };
    class vn_b_prop_prc77_01;
    class shto_vn_prop_prc77_01: vn_b_prop_prc77_01 {
      displayName = "PRC-77 Radio (Shot, Over!)";
      ace_dragging_canDrag = 1;
      ace_dragging_dragPosition[] = {0, 1.2, 0};
      ace_dragging_dragDirection = 0;
      ace_dragging_canCarry = 1;
      ace_dragging_carryPosition[] = {0, 1.2, 0};
      ace_dragging_carryDirection = 0;
      class AcreRacks {
        class Rack_1 {
          displayName = "Radio"; // Name is displayed in the interaction menu.
          shortName = "Radio";
          componentName = "ACRE_VRC64";
          allowedPositions[] = {"external"};
          disabledPositions[] = {};
          defaultComponents[] = {};
          mountedRadio = "ACRE_PRC77";                 // Predefined mounted radio
          isRadioRemovable = 0;
          intercom[] = {};                   // All units in intercom will be able to hear/send transmittions (ACE3 interaction menu) but they cannot manipulate the radio (GUI interface)
        };
      };
    };

 
};
