params ["_howitzer"];

if (!isNil "shto_sight_camera") then {shto_sight_camera cameraEffect ["terminate", "back"]};
shto_sight_camera = "camera" camCreate [0,0,0];
shto_sight_camera camSetFov 0.3;
shto_sight_camera attachTo [_howitzer, [0.2,1.3,1.7], "pos_gunner_dir", true];
shto_sight_camera setDir -45;
showCinemaBorder false;
shto_sight_camera cameraEffect ["internal", "BACK"];
95010 cutRsc ["shto_sight_reticle", "PLAIN", -1, true];