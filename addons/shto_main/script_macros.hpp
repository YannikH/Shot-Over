

#ifndef VERSION_CONFIG
    #define VERSION_CONFIG version = VERSION; versionStr = QUOTE(VERSION_STR); versionAr[] = {VERSION_AR}
#endif

#define TRIPLES(var1,var2,var3) var1##_##var2##_##var3
#define SUBPREFIX addons
#define QUOTE(var1) #var1
#define DFUNC(var1) TRIPLES(ADDON,fnc,var1)
#define DOUBLES(var1,var2) var1##_##var2
#define QFUNC(var1) QUOTE(DFUNC(var1))
#define COMPILE_FILE(var1) compile preprocessFileLineNumbers 'FUNC_PATH(var1)'
#define FUNC_PATH(var1) \COMPONENT\var1.sqf

#define PATHTOF(var1) \COMPONENT\functions\var1
#define QPATHTOF(var1) QUOTE(PATHTOF(var1))


#define COMPILE_FILE_CFG(var1) COMPILE_FILE_CFG_SYS(PREFIX,COMPONENT_F,var1)
#define COMPILE_FILE2(var1) COMPILE_FILE2_SYS('var1')
#define COMPILE_FILE2_CFG(var1) COMPILE_FILE2_CFG_SYS('var1')

#define COMPILE_FILE2_CFG_SYS(var1) compile preprocessFileLineNumbers var1
#define COMPILE_FILE2_SYS(var1) COMPILE_FILE2_CFG_SYS(var1)
#define PATHTO_SYS(var1,var2,var3) \var2\var3.sqf
#define COMPILE_FILE_SYS(var1,var2,var3) COMPILE_FILE2_SYS('PATHTO_SYS(var1,var2,var3)')


#ifdef __A3_DEBUG__
    #undef PREP
    #define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(DOUBLES(fnc,fncName).sqf)
#else
    #undef PREP
    #define PREP(fncName) [QPATHTOF(DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif


#define ADDON DOUBLES(PREFIX,COMPONENT)
#define MAIN_ADDON DOUBLES(PREFIX,main)