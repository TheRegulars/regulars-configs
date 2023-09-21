<%
teamplay_modes = frozenset([
	'cra_ft', 'ica', 'ictf', 'ift', 'ikh', 'itdm', 'nexball',
	'okctf', 'sumo', 'ca', 'ctf', 'tdm', 'kh'
])
bots_mode = frozenset([
	'ift', 'itdm', 'ictf', 'tdm', 'cra_ft', 'ica', 'ikh', 'dm', 'duel', 'kh', 'ca', 'ctf', 'idm'
])
nades_modes = frozenset(['ift', 'itdm', 'ictf', 'ica', 'ikh', 'iduel', 'idm'])
powerup_modes = frozenset(['itdm', 'ictf', 'idm', 'iduel', 'ikh'])
%>
"Call a vote"
% if server == 'pub':
	"Rebalance Teams" "vcall rebalance"
	"Average Rebalance Teams" "vcall avgrebalance"
	"End Match" "vcall endmatch"
	"Restart Map" "vcall restart"
	"Reset Map" "vcall resetmatch"
	"Speedcaps" "vcall speedcaps"
	"Extend Match Time" "vcall extendmatchtime"
	"Call another vote" "vhelp; toggleconsole"
% else:
	"Base Votes"
		"End Match" "vcall endmatch"
		"Restart Map" "vcall restart"
		"Reset Map" "vcall resetmatch"
		"Extend Match Time" "vcall extendmatchtime"
	"Base Votes"

	"Game modes"
		"Aimduel" "vcall aimduel"
		"Nexball" "vcall nexball"
		"CRA FT" "vcall cra_ft"
		"Overkill CTF" "vcall overkill_ctf"
		"Sumo" "vcall sumo"

		"Instagib modes"
			"Insta CTF" "vcall insta_ctf"
			"Insta DM" "vcall insta_dm"
			"Insta Duel" "vcall insta_duel"
			"Insta Race" "vcall insta_race"
			"Insta Freeze Tag" "vcall insta_ft"
			"Insta Clan Arena" "vcall insta_ca"
			"Insta Key Hunt" "vcall insta_kh"
			"Insta TDM" "vcall insta_tdm"
		"Instagib modes"

		"Vanilla modes (All weapons)"
			"Vanilla Duel" "vcall vanilla_duel"
			"Vanilla DM" "vcall vanilla_dm"
			"Vanilla CA" "vcall vanilla_ca"
			"Vanilla TDM" "vcall vanilla_tdm"
			"Vanilla CTF" "vcall vanilla_ctf"
			"Vanilla FT" "vcall vanilla_ft"
			"Vanilla KH" "vcall vanilla_kh"
		"Vanilla modes (All weapons)"
	"Game modes"

%if mode in teamplay_modes:
	"Team Votes"
		"Rebalance Teams" "vcall rebalance"
		"Average Rebalance Teams" "vcall avgrebalance"
		"Randomize Teams" "vcall shuffleteams"
		"Autobalance ON" "vcall autobalance_on"
		"Autobalance OFF" "vcall autobalance_off"
	"Team Votes"

	"Team size Votes"
		"Allow all players to play" "vcall allplayers"
		"1on1" "vcall 1on1"
		"2on2" "vcall 2on2"
		"3on3" "vcall 3on3"
		"4on4" "vcall 4on4"
		"5on5" "vcall 5on5"
		"6on6" "vcall 6on6"
		"7on7" "vcall 7on7"
		"8on8" "vcall 8on8"
	"Team size Votes"
%endif

%if mode in bots_mode:
	"Bot Votes"
		"Disable Bots" "vcall nobots"
%if mode in ('duel', 'iduel'):
		"Enable Bots" "vcall bots2"
%else:
		"2 Bots" "vcall bots2"
		"4 Bots" "vcall bots4"
		"6 Bots" "vcall bots6"
		"8 Bots" "vcall bots8"
%endif
	"Bot Votes"
%endif

	"Extra Votes"
%if mode in nades_modes:
		"Toggle nades" "vcall nades"
%endif
%if mode in ('ctf', 'ictf'):
		"Autocap ON" "vcall autocap_on"
		"Autocap OFF" "vcall autocap_off"
		"Speedcaps" "vcall speedcaps"
%endif
%if mode in powerup_modes:
		"Toggle powerups" "vcall powerups"
%endif
%if mode == 'ictf':
		"Toggle friendly push" "vcall friendlypush"
		"Toggle friendly hook" "vcall friendlyhook"
%endif
	"Extra Votes"

	"Call another vote" "vhelp; toggleconsole"
% endif
"Call a vote"

%if server == 'mars':
	"Request timeout" "timeout"
	"Stop timeout" "timein"
% endif

"Settings"
	"Show capture time records" "seta notification_CHOICE_CTF_CAPTURE_BROKEN 2; seta notification_CHOICE_CTF_CAPTURE_TIME 2; seta notification_CHOICE_CTF_CAPTURE_UNBROKEN 2; sendcvar notification_CHOICE_CTF_CAPTURE_BROKEN; sendcvar notification_CHOICE_CTF_CAPTURE_TIME; sendcvar notification_CHOICE_CTF_CAPTURE_UNBROKEN"
	"Hide capture time records" "seta notification_CHOICE_CTF_CAPTURE_BROKEN 1; seta notification_CHOICE_CTF_CAPTURE_TIME 1; seta notification_CHOICE_CTF_CAPTURE_UNBROKEN 1; sendcvar notification_CHOICE_CTF_CAPTURE_BROKEN; sendcvar notification_CHOICE_CTF_CAPTURE_TIME; sendcvar notification_CHOICE_CTF_CAPTURE_UNBROKEN"
	"1st/3rd person view" "toggle chase_active"
	"Display Gun Model" "toggle r_drawviewmodel"

	"Observer camera"
		"Increase speed" "weapnext"
		"Decrease speed" "weapprev"
		"Wall collision on" "-use"
		"Wall collision off" "+use"
	"Observer camera"
"Settings"

"Play a minigame" "defer 0.5 \"cl_cmd hud minigame\""
