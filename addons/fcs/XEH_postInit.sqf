_action = ["SHTO_FDC_Notebook","Open FDC Notebook","vn\modules_f_vietnam\data\vn_displayartillery\mapfolder.paa",{
	createDialog "shto_calculator";
},{
	(backpack player) isKindOf "shto_rto_pack"
}] call ace_interact_menu_fnc_createAction;
["Man", 1, ["ACE_SelfActions", "ACE_Equipment"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ["SHTO_FDC_Notebook_hide","Hide FDC Notebook","vn\modules_f_vietnam\data\vn_displayartillery\mapfolder.paa",{
	95010 cutText ["", "PLAIN"];
},{
	private _dialog = uiNamespace getVariable "shto_fcs_dialog";
	(!isNull _dialog)
}] call ace_interact_menu_fnc_createAction;
["Man", 1, ["ACE_SelfActions", "ACE_Equipment"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ["SHTO_FDC_Notebook","Open FDC Notebook","vn\modules_f_vietnam\data\vn_displayartillery\mapfolder.paa",{
	createDialog "shto_calculator";
},{
	(((getBackpackCargo _target) findIf {(_x # 0 == "shto_rto_pack")}) > -1)
}, nil, nil, [0,0,-0.4], shto_interaction_distance] call ace_interact_menu_fnc_createAction;
["GroundWeaponHolder", 0, [], _action, true] call ace_interact_menu_fnc_addActionToClass;


[
	"Shot, Over!",
	"shto_keybind_togglenotebook",
	"Open FDC Notebook",
	{},{
		if (!((backpack player) isKindOf "shto_rto_pack")) exitWith {};
		private _dialog = uiNamespace getVariable "shto_fcs_dialog";
		if (!dialog) then {
			createDialog "shto_calculator";
		} else {
			closedialog 2;
		};
	},
	[207, [false, false, false]]
] call CBA_fnc_addKeybind;
[
	"Shot, Over!",
	"shto_keybind_closenotebook",
	"Close FDC Notebook",
	{},{
		private _dialog = uiNamespace getVariable "shto_fcs_dialog";
		if (!isNull _dialog) then {
			if (dialog) then {
				closedialog 2;
			} else {
				95010 cutText ["", "PLAIN"];
			};
		};
	},
	[207, [false, true, false]]
] call CBA_fnc_addKeybind;