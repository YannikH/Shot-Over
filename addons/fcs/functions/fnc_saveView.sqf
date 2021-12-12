private _dialog = uiNamespace getVariable "shto_fcs_dialog";
private _openPage = missionNamespace getVariable ["shto_fcs_currentPage", 0];
private _missions = missionNamespace getVariable ["shto_fcs_pages", []];

private _ownPosStr = ctrlText  (1500);
private _ownElevStr = ctrlText  (1501);
private _tgtPosStr = ctrlText  (1502);
private _tgtElevStr = ctrlText  (1503);
private _notes = ctrlText  (1504);
private _shellType = lbCurSel (2100);

_missions set [_openPage, [
 _ownPosStr,
 _ownElevStr,
 _tgtPosStr,
 _tgtElevStr,
 _notes,
 _shellType
]];
missionNamespace setVariable ["shto_fcs_pages", _missions];