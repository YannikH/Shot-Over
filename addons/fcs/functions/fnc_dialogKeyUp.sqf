#include "..\script_component.hpp"

/*
 * Author: YannikH, toadball, Andx
 * KeyUp handler of the FDC notebook: CBA keybinds do not fire while a dialog is open, so the notebook's own
 * keybinds ("Open FDC Notebook" toggles, "Close FDC Notebook" closes) are checked here and close it.
 *
 * Arguments:
 * 0: Display <DISPLAY>
 * 1: Key (DIK code) <NUMBER>
 * 2: Shift <BOOL>
 * 3: Ctrl <BOOL>
 * 4: Alt <BOOL>
 *
 * Return Value:
 * True if the key closed the notebook <BOOL>
 *
 * Example:
 * _this call shot_over_fcs_fnc_dialogKeyUp
 *
 * Public: No
 */

params [["_display", displayNull, [displayNull]], ["_key", -1, [0]], ["_shift", false, [false]], ["_ctrl", false, [false]], ["_alt", false, [false]]];

private _isKeybind = ["shto_keybind_togglenotebook", "shto_keybind_closenotebook"] findIf {
    private _keybind = ["Shot, Over!", _x] call CBA_fnc_getKeybind;
    !isNil "_keybind" && {(_keybind select 5) isEqualTo [_key, [_shift, _ctrl, _alt]]}
} != -1;
if (!_isKeybind) exitWith {false};

if (dialog) then {
    closeDialog 2;
} else {
    MINIMIZED_LAYER cutText ["", "PLAIN"];
};
true
