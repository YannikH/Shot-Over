# Main

`shot_over_main`: the base every other component requires.

- `script_mod.hpp`: prefix `shot_over`, mod name, version (`script_version.hpp`, set by HEMTT's `pre_build/set_version.rhai` hook)
- `script_macros.hpp`: CBA's and ACE's macros (`GVAR`, `FUNC`, `QPATHTOF`, `LLSTRING`, ...) with ACE3's cache-aware `PREP`; the headers come from the vendored `include/` folder
- `CfgEditorCategories.hpp`: the "Shot, Over!" Eden category and its subcategories (`shot_over_guns`, `shot_over_ammunition`, `shot_over_supplies`) the other components use
- `CfgModuleCategories.hpp`: the original mod's faction and vehicle class `shot_over`, unused by its own classes

The mod name in `CfgPatches` reads "Shot Over": a comma cannot go into a macro argument (`QUOTE`), everything players see says "Shot, Over!".

## Dependencies

- CBA_A3 (`cba_main`), ACE3 (`ace_common`)
