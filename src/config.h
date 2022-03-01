static int topbar = 1;                                   // -b  option; if 0, dmenu appears at bottom
static unsigned int lines = 0;                           // -l option; if nonzero, dmenu uses vertical list with given number of lines
static const char *prompt = NULL;                        // -p  option; prompt to the left of input field
static const char worddelimiters[] = " ";                // word delimiter for kill-word (Ctrl-w)
static const char *fonts[] = { "MesloLGS NF:size=10" };  // -fn option overrides fonts[0]; default X11 font or font set

#define COL_FG "#cccccc"
#define COL_FG_HI "#eeeeee"

#define COL_BG_NORM "#222222"
#define COL_BG_SEL "#00665a"

static const char *colors[SchemeLast][2] = {
	//                        <fg>       <bg>
	[SchemeNorm] =          { COL_FG,    COL_BG_NORM },
	[SchemeNormHighlight] = { COL_FG_HI, COL_BG_NORM },
	[SchemeSel] =           { COL_FG,    COL_BG_SEL },
	[SchemeSelHighlight] =  { COL_FG_HI, COL_BG_SEL },
	[SchemeOut] =           { "#000000", "#00ffff" },
	[SchemeOutHighlight] =  { "#000000", "#00ffff" },
};
