    params ["_shell"];
    private _magBase = getText (configFile >> "cfgVehicles" >> typeOf _shell >> "magazineBase");
    private _charge = _shell getVariable ["shto_charge", 3];
    format ["%1%2", _magBase, _charge];