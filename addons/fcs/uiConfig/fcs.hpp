
#define COLOR_NOTEPADTEXT {0.41, 0.23, 0.22, 0.75}
#define COLOR_TITLETEXT {0.21, 0.13, 0.12, 0.85}
#define COLOR_BALLPENTEXT {0.38, 0.44, 0.61, 0.95}
#define UIY_CALC_A		((((getResolution select 4) min 1.2) / 1.2) / 25)
#define TXT_L (UIY_CALC_A * 0.95)
#define FONT1			"tt2020base_vn"
#define FONT1_B			"tt2020base_vn_bold"
#define FONT2			"tt2020style_e_vn"
#define FONT2_B			"tt2020style_e_vn_bold"
#define FONT3			"caveat"
#define RELX (safezoneH * 1.9)
#define RELWIDTH (safezoneH * 1.9)


// missionconfigfile >> "shto_calculator"
class shto_calculator {
    idd = 20001;
    movingEnable = true;
    onLoad = "_this call shot_over_fcs_fnc_initDialog";
	onUnload = "[] call shot_over_fcs_fnc_saveView; [] call shot_over_fcs_fnc_openMinimized;";
	onKeyUp = "_this call shot_over_fcs_fnc_dialogKeyUp;";
    class Controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Yax, v1.063, #Corono)
		////////////////////////////////////////////////////////
		class RscPicture_1201: RscPicture
		{
			idc = 1200;
			text = "vn\modules_f_vietnam\data\vn_displayartillery\mapfolder.paa";
			x = 0.36186 * RELX + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.26093 * RELWIDTH;
			h = 0.561 * safezoneH;
		};
		class RscPicture_1202: RscPicture
		{
			idc = 1201;
			text = "vn\ui_f_vietnam\ui\taskroster\img\papersheet_Placeholder.paa";
			x = 0.381047 * RELX + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0997674 * RELWIDTH;
			h = 0.462 * safezoneH;
		};
		class RscPicture_1200: RscPicture
		{
			idc = 1202;
			text = "vn\ui_f_vietnam\ui\taskroster\img\papersheet_Placeholder.paa";
			x = 0.503837 * RELX + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0997674 * RELWIDTH;
			h = 0.462 * safezoneH;
		};
		class TitleBase: RscText
		{
			idc = 1000;
			text = "FIREMISSION 1/1"; //--- ToDo: Localize;
			x = 0.39707 * RELX + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0758837 * RELWIDTH;
			h = 0.022 * safezoneH;
			font = "Caveat";
			sizeEx = 0.055;
			colorText[] = COLOR_TITLETEXT;
			shadow = 0;
		};
		class TextBase: RscText
		{
			idc = 1002;
			text = "Own Grid"; //--- ToDo: Localize;
			x = 0.384884 * RELX + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0345349 * RELWIDTH;
			h = 0.022 * safezoneH;
			font = FONT3;
			sizeEx = 0.05;
			colorText[] = COLOR_NOTEPADTEXT;
			shadow = 0;
		};
		class RscText_1003: TextBase
		{
			idc = 1003;
			text = "Elevation"; //--- ToDo: Localize;
			x = 0.384884 * RELX + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0306977 * RELWIDTH;
			h = 0.022 * safezoneH;
		};
		class RscText_1004: TitleBase
		{
			idc = 1004;
			text = "FIRING UNIT"; //--- ToDo: Localize;
			x = 0.384884 * RELX + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0558837 * RELWIDTH;
			h = 0.022 * safezoneH;
		};
		class RscText_1001: TitleBase
		{
			idc = 1001;
			text = "TARGET INFO"; //--- ToDo: Localize;
			x = 0.384884 * RELX + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0758837 * RELWIDTH;
			h = 0.022 * safezoneH;
		};
		class RscText_1005: TextBase
		{
			idc = 1005;
			text = "Target Grid"; //--- ToDo: Localize;
			x = 0.384884 * RELX + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0383721 * RELWIDTH;
			h = 0.022 * safezoneH;
		};
		class RscText_1006: TextBase
		{
			idc = 1006;
			text = "Elevation"; //--- ToDo: Localize;
			x = 0.384884 * RELX + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0383721 * RELWIDTH;
			h = 0.022 * safezoneH;
		};
		class RscText_1007: TextBase
		{
			idc = 1007;
			text = "Shell Type"; //--- ToDo: Localize;
			x = 0.384884 * RELX + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0383721 * RELWIDTH;
			h = 0.022 * safezoneH;
		};
		class RscText_1008: TitleBase
		{
			idc = 1008;
			text = "NOTES"; //--- ToDo: Localize;
			x = 0.384884 * RELX + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0383721 * RELWIDTH;
			h = 0.022 * safezoneH;
		};
		class RscText_1010: TitleBase
		{
			idc = 1010;
			text = "SOLUTION"; //--- ToDo: Localize;
			x = 0.534535 * RELX + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0618837 * RELWIDTH;
			h = 0.022 * safezoneH;
		};
		class ButtonBase: RscButton
		{
			idc = 1011;
			text = "BACK"; //--- ToDo: Localize;
			x = 0.388721 * RELX + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0468605 * RELWIDTH;
			h = 0.022 * safezoneH;
			font = "Caveat";
			sizeEx = 0.055;
			colorText[] = COLOR_TITLETEXT;
			shadow = 0;
			colorBackground[] = {0,0,0,0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0.1};
			colorFocused[] = {0,0,0,0};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
            onButtonClick="[] call shot_over_fcs_fnc_saveView; [nil, -1] call shot_over_fcs_fnc_initDialog";
		};
		class RscText_1012: ButtonBase
		{
			idc = 1012;
			text = "NEXT"; //--- ToDo: Localize;
			x = 0.556744 * RELX + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0368605 * RELWIDTH;
			h = 0.022 * safezoneH;
            onButtonClick="[] call shot_over_fcs_fnc_saveView; [nil, 1] call shot_over_fcs_fnc_initDialog";
		};
		class RscText_1009: ButtonBase
		{
			idc = 1009;
			text = "CALC"; //--- ToDo: Localize;
			x = 0.450419 * RELX + safezoneX;
			y = 0.653 * safezoneH + safezoneY;
			w = 0.0303954 * RELWIDTH;
			h = 0.022 * safezoneH;
            onButtonClick="[false] spawn shot_over_fcs_fnc_calculateFromNotebook";
		};
		class BaseTextField: RscEdit
		{
			idc = 1400;
			x = 0.423255 * RELX + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0575581 * RELWIDTH;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = COLOR_BALLPENTEXT;
			font = "Caveat";
			shadow = 0;
			sizeEx = 0.05;
			tooltipColorBox[] = {0,0,0,0};
			colorBorder[] = {0, 0, 0, 0};
			style = "16 + 512";
			linespacing = 1;
			text = "__________";
			type = 0;
		};
		class BaseTextFieldUnderline: BaseTextField
		{
			idc = 1500;
			text = "";
			type = 2;
		};
		class RscEdit_1401: BaseTextField
		{
			idc = 1401;
			x = 0.423255 * RELX + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0575581 * RELWIDTH;
			h = 0.022 * safezoneH;
		};
		class RscEdit_1401U: RscEdit_1401 {idc = 1501; type = 2; text = "";};
		class RscEdit_1402: BaseTextField
		{
			idc = 1402;
			x = 0.423255 * RELX + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0575581 * RELWIDTH;
			h = 0.022 * safezoneH;
		};
		class RscEdit_1402U: RscEdit_1402 {idc = 1502; type = 2; text = "";};
		class RscEdit_1403: BaseTextField
		{
			idc = 1403;
			x = 0.423256 * RELX + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0575581 * RELWIDTH;
			h = 0.022 * safezoneH;
		};
		class RscEdit_1403U: RscEdit_1403 {idc = 1503; type = 2; text = "";};
		class RscCombo_2100: RscCombo
		{
			idc = 2100;
			x = 0.423256 * RELX + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0575581 * RELWIDTH;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = COLOR_BALLPENTEXT;
			font = "Caveat";
			shadow = 0;
			sizeEx = 0.05;
			tooltipColorBox[] = {0,0,0,0};
			colorBorder[] = {0, 0, 0, 0};
		};
		class RscEdit_1404: BaseTextField
		{
			idc = 1404;
			x = 0.388721 * RELX + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.082093 * RELWIDTH;
			h = 0.099 * safezoneH;
			text = "_____________________________________________________________________________________________________________";
		};
		class RscEdit_1404U: RscEdit_1404 { idc = 1504; type = 2; text = ""; };
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

		class SolutionTable: RscListNBox {
            idc = 1800;
			x = 0.503837 * RELX + safezoneX;
			y = 0.3 * safezoneH + safezoneY;
			w = 0.0997674 * RELWIDTH;
			h = 0.32 * safezoneH;
            columns[] = {0.05,0.35,0.7};
            rowHeight = 0.04 * safeZoneH;
            sizeEx = "0.03 * safeZoneH";
            font = "Caveat";
            drawSideArrows = 1;
            idcLeft = -1;
            idcRight = -1;
            colorText[] = {0, 0, 0, 1};
            shadow = "0";
            colorSelectBackground[] = {0, 0, 0, 0.025};
            colorSelectBackground2[] = {0, 0, 0, 0.025};
            colorScrollbar[] = {0.95,0,0.95,1};
            //class ListScrollBar: ScrollBar{
            //    color[] = {0,0,0,0.6};
            //};
		};
		class SolutionTableUnderlines: SolutionTable {
            idc = 1801;
			colorText[] = COLOR_BALLPENTEXT;
		};
		class RscText_1013: TitleBase
		{
			idc = 1013;
			text = "Direction: "; //--- ToDo: Localize;
			x = 0.506837 * RELX + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0997674 * RELWIDTH;
			h = 0.022 * safezoneH;
		};
		class RscText_1014: TitleBase
		{
			idc = 1014;
			text = ""; //--- ToDo: Localize;
			x = 0.54837 * RELX + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0997674 * RELWIDTH;
			h = 0.022 * safezoneH;
			colorText[] = COLOR_BALLPENTEXT;
		};
		class RscText_1015: TitleBase
		{
			idc = 1015;
			text = "Distance: "; //--- ToDo: Localize;
			x = 0.506837 * RELX + safezoneX;
			y = 0.663 * safezoneH + safezoneY;
			w = 0.0997674 * RELWIDTH;
			h = 0.022 * safezoneH;
		};
		class RscText_1016: TitleBase
		{
			idc = 1016;
			text = ""; //--- ToDo: Localize;
			x = 0.54837 * RELX + safezoneX;
			y = 0.663 * safezoneH + safezoneY;
			w = 0.0997674 * RELWIDTH;
			h = 0.022 * safezoneH;
			colorText[] = COLOR_BALLPENTEXT;
		};
		class RscText_1017: TitleBase
		{
			idc = 1017;
			text = ""; //--- ToDo: Localize;
			x = 0.506837 * RELX + safezoneX;
			y = 0.623 * safezoneH + safezoneY;
			w = 0.0997674 * RELWIDTH;
			h = 0.022 * safezoneH;
			colorText[] = COLOR_BALLPENTEXT;
		};
		class RscText_1018: TitleBase
		{
			idc = 1018;
			text = ""; //--- ToDo: Localize;
			x = 0.384884 * RELX + safezoneX;
			y = 0.623 * safezoneH + safezoneY;
			w = 0.0977674 * RELWIDTH;
			h = 0.022 * safezoneH;
			colorText[] = COLOR_BALLPENTEXT;
		};

	};
};

class RscTitles {
	class shto_calculator_minimized {
		idd = 20001;
		onLoad = "[_this # 0, 0, true] call shot_over_fcs_fnc_initDialog";
		//onLoad = "";
		movingEnable = 1;
		duration = 9999999;
		fadein = 0;
		fadeout = 0;
		//controlsBackground[] = { };
		//objects[] = { };
		class Controls {
			////////////////////////////////////////////////////////
			// GUI EDITOR OUTPUT START (by Yax, v1.063, #Corono)
			////////////////////////////////////////////////////////
			#define LINEHEIGHT (0.025 * safeZoneH)
			#define LINE(N) (LINEHEIGHT * N)
			#define HEIGHT (0.45 * safeZoneH)
			#define TOP (safeZoneY + safeZoneH - HEIGHT)
			#define SECONDSET (LINEHEIGHT * 10)
			#define WIDTH (0.2 * safeZoneH)
			#define NOTEBOOKWIDTH (0.525 * safeZoneH)
			class RscPicture_1201: RscPicture
			{
				idc = 1200;
				text = "vn\modules_f_vietnam\data\vn_displayartillery\mapfolder.paa";
				x = safeZoneX - (NOTEBOOKWIDTH/2);
				y = safeZoneY + safeZoneH - (0.5 * safeZoneH);
				w = NOTEBOOKWIDTH;
				h = 0.5 * safezoneH;
			};
			class RscPicture_1202: RscPicture
			{
				idc = 1201;
				text = "vn\ui_f_vietnam\ui\taskroster\img\papersheet_Placeholder.paa";
				x = safeZoneX + (0.025 * safeZoneH);
				y = safeZoneY + safeZoneH - (0.45 * safeZoneH);
				w = WIDTH;
				h = 0.4 * safeZoneH;
			};
			class TitleBase: RscText
			{
				idc = 1010;
				text = "SOLUTION"; //--- ToDo: Localize;
				x = safeZoneX + (0.025 * safeZoneH) + (WIDTH*0.05);
				y = safeZoneY + safeZoneH - (0.45 * safeZoneH);
				w = (WIDTH*0.9);
				h = LINEHEIGHT;
				font = "Caveat";
				sizeEx = 0.03 * safeZoneH;
				colorText[] = COLOR_TITLETEXT;
				shadow = 0;
				style = 2;
			};
			class SolutionTable: RscListNBox {
				idc = 1800;
				x = safeZoneX + (0.025 * safeZoneH);
				y = safeZoneY + safeZoneH - (0.45 * safeZoneH) + (0.025 * safezoneH);
				w = WIDTH;
				h = 0.35 * safeZoneH;
				columns[] = {0.05,0.35,0.7};
				rowHeight = 0.04 * safeZoneH;
				sizeEx = "0.03 * safeZoneH";
				font = "Caveat";
				drawSideArrows = 1;
				idcLeft = -1;
				idcRight = -1;
				colorText[] = {0, 0, 0, 1};
				shadow = "0";
				colorSelectBackground[] = {0, 0, 0, 0.025};
				colorSelectBackground2[] = {0, 0, 0, 0.025};
				colorScrollbar[] = {0.95,0,0.95,1};
				//class ListScrollBar: ScrollBar{
				//	color[] = {0,0,0,0.6};
				//};
			};
			class SolutionTableUnderlines: SolutionTable {
				idc = 1801;
				colorText[] = COLOR_BALLPENTEXT;
			};
			class RscText_1013: TitleBase
			{
				idc = 1013;
				text = "Direction: "; //--- ToDo: Localize;
				y = TOP + SECONDSET + LINE(1);
				style = 0;
			};
			class RscText_1014: TitleBase
			{
				idc = 1014;
				text = ""; //--- ToDo: Localize;
				y = TOP + SECONDSET + LINE(1);
				style = 2;
				colorText[] = COLOR_BALLPENTEXT;
			};
			class RscText_1015: TitleBase
			{
				idc = 1015;
				text = "Distance: "; //--- ToDo: Localize;
				y = TOP + SECONDSET + LINE(2);
				style = 0;
			};
			class RscText_1016: TitleBase
			{
				idc = 1016;
				text = ""; //--- ToDo: Localize;
				y = TOP + SECONDSET + LINE(2);
				style = 2;
				colorText[] = COLOR_BALLPENTEXT;
			};
			class RscText_1017: TitleBase
			{
				idc = 1017;
				text = ""; //--- ToDo: Localize;
				y = TOP + SECONDSET + LINE(0);
				colorText[] = COLOR_BALLPENTEXT;
				style = 0;
			};
			class RscText_1012: TitleBase
			{
				idc = 1012;
				text = "NEXT"; //--- ToDo: Localize;
				y = TOP + SECONDSET + LINE(4);
				style = 1;
			};
		};
	}; // notebook minimized
};