params ["", "_key", "_shift", "_ctrl", "_alt"];
{
	private _keybind = (["Shot, Over!", "shto_keybind_togglenotebook"] call CBA_fnc_getKeybind) # 5;
	if (
		(_key == _keybind # 0) &&
		(_shift == _keybind # 1 # 0) &&
		(_ctrl == _keybind # 1 # 1) &&
		(_alt == _keybind # 1 # 2)
	) exitWith {
		private _dialog = uiNamespace getVariable "shto_fcs_dialog";
		if (!isNull _dialog) then {
			if (dialog) then {
				closedialog 2;
			} else {
				95010 cutText ["", "PLAIN"];
			};
		};
	};
} forEach ["shto_keybind_togglenotebook", "shto_keybind_closenotebook"];