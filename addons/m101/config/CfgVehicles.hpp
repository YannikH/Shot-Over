class CfgVehicles {
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
      //model = "\vn\static_f_vietnam\m101\vn_b_static_m101_01.p3d";
      class Turrets: Turrets {
                class MainTurret: MainTurret { };
      };
        };
    class vn_static_m101_02_base: vn_static_m101_base {
      //model = "\vn\static_f_vietnam\m101\vn_b_static_m101_02.p3d";
      class Turrets: Turrets {
                class MainTurret: MainTurret { };
      };
    };
    class vn_b_army_static_m101_02: vn_static_m101_02_base {
      class Turrets: Turrets {
                class MainTurret: MainTurret {
                    class ViewOptics;
                    class ViewGunner;
                };
      };
        };
    class shto_vn_static_m101_02_base: vn_b_army_static_m101_02 {
      //crew = "B_UAV_AI";
      displayName = CSTRING(static_m101_02_base_DisplayName);
      scope = 2;
      scopeCurator = 2;
      editorSubcategory = "shot_over_guns";
      // no artillery computer: the firing data comes from the FDC notebook
      artilleryScanner = 0;
      // ACE's azimuth/elevation readout in mils for the gunner; it would otherwise follow artilleryScanner and stay off
      ace_artillerytables_showGunLaying = 1;
      model = "\vn\static_f_vietnam\m101\vn_b_static_m101_01.p3d";
      class Turrets: Turrets {
          class MainTurret: MainTurret {
              weapons[] = {"shto_howitzer_105mm_base"};
              magazines[] = {};
              // no vanilla range, elevation and heading overlay; ACE's readout replaces it.
              // The views set their own, which wins over the turret's while in that view.
              turretInfoType = "";
              class ViewOptics: ViewOptics {
                  turretInfoType = "";
              };
              class ViewGunner: ViewGunner {
                  turretInfoType = "";
              };
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
      slingLoadCargoMemoryPoints[] = {"pos_cargo", "pos_gunner", "recoil"};
    };
    class shto_vn_static_m101_01: shto_vn_static_m101_02_base {
      //picture = "\vn\static_f_vietnam\ui\pic_vn_static_m101_01_ca.paa";
      model = "\vn\static_f_vietnam\m101\vn_b_static_m101_02.p3d";
    };

    class vn_b_pack_lw_06;
    class shto_rto_pack: vn_b_pack_lw_06 {
      displayName = CSTRING(rto_pack_DisplayName);
    };
    class vn_b_prop_prc77_01;
    class shto_vn_prop_prc77_01: vn_b_prop_prc77_01 {
      displayName = CSTRING(prop_prc77_01_DisplayName);
      scope = 2;
      scopeCurator = 2;
      editorCategory = "shot_over";
      editorSubcategory = "shot_over_supplies";
      ace_dragging_canDrag = 1;
      ace_dragging_dragPosition[] = {0, 1.2, 0};
      ace_dragging_dragDirection = 0;
      ace_dragging_canCarry = 1;
      ace_dragging_carryPosition[] = {0, 1.2, 0};
      ace_dragging_carryDirection = 0;
      // the ACRE radio rack is added by compat_acre when ACRE is loaded
    };

 
};
