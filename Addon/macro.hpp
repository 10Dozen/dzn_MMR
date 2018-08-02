#define		TITLE		"dzn Multi Magazine Repack"
#define		SETNAME(X)	format["dzn_MMR_%1", X]
#define     ADDON       "MMR"
#define     PATH        "\dzn_MMR"
#define     FNC_PATH    "\dzn_MMR\functions\"

#define		GVAR(X)	    dzn_MMR_##X
#define 	QUOTE(s) 	#s
#define		SVAR(X)	    QUOTE(GVAR(X))