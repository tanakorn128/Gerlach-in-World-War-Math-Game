# MainMenu

extends Node

#class_name

"""
	No description available. Please make a request on GitHub issue tracker.
"""

#-------------------------------------------------
#      Sub-Classes
#-------------------------------------------------

#-------------------------------------------------
#      Signals
#-------------------------------------------------

#-------------------------------------------------
#      Constants
#-------------------------------------------------

const BTN_MODULATE_COLOR = [
	ColorPalette.C_SUCCESS,
	ColorPalette.C_WARNING,
	ColorPalette.C_DANGER
]

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var main_tab_container = $MainTabContainer
onready var player_stat = main_tab_container.tabs_player_stats.stat_tab_container

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	_update_general_stat()
	_update_my_score_stat()
	_update_game_log()
	_update_version_label()
	_update_settings_session()

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_MainTabContainer_normal_mode_selected() -> void:
	GameMode.current_mode = GameMode.Mode.NORMAL
	GameResetter.reset()
	PuzzlePool.shuffle_scene_order()
	NextSceneCtrler.go_to_new_puzzle()

func _on_MainTabContainer_practice_mode_begin() -> void:
	GameMode.current_mode = GameMode.Mode.PRACTICE
	PuzzlePool.shuffle_scene_order()
	NextSceneCtrler.go_to_new_puzzle()

func _on_MainTabContainer_request_save_settings() -> void:
	_save_setting_configs()

func _on_MainTabContainer_request_update_sfx_volume(value : float) -> void:
	Settings.sfx_vol = value
	Settings.update_sfx_bus()

func _on_MainTabContainer_request_update_bgm_volume(value : float) -> void:
	Settings.bgm_vol = value
	Settings.update_bgm_bus()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _update_general_stat():
	player_stat.update_total_score(PlayerStat.get_total_earned_score())
	player_stat.update_total_win_lose(PlayerStat.get_total_won(), PlayerStat.get_total_lost())
	player_stat.update_time_elapsed(PlayerStat.time_elapsed)
	player_stat.update_total_games_played(GameLog.log_list.size())
	player_stat.update_total_played(PlayerStat.get_total_stages_played())
	player_stat.update_avg_score(GameLog.get_average_score())
	
	var log_stage_data = GameLog.get_log_best_score()
	if log_stage_data != null:
		player_stat.update_high_score(log_stage_data.total_score)
	else:
		player_stat.update_high_score(0)

func _update_my_score_stat():
	# Create stats score tabs by available difficulities
	for i in GlobalDifficulty.Difficulty.size():
		var stats_score_tabs = player_stat.create_stats_score_tabs()
		stats_score_tabs.diff_button_label.text = GlobalDifficulty.DIFFICULTY_NAMES[i]
		stats_score_tabs.set_info_score_per_puzzle(GlobalConstant.SCORES[i])
		stats_score_tabs.set_info_score_time_bonus(GlobalDifficulty.get_score_time_bonus(i))
		stats_score_tabs.set_diff_btn_self_modulate_color(BTN_MODULATE_COLOR[i])
		
		for j in GlobalConstant.STAGES_DATA.size():
			var stage_data : GameDBStageData = GlobalConstant.STAGES_DATA[j]
			stats_score_tabs.add_data(
				stage_data.stage_name,
				PlayerStat.get_stat_from_stage(stage_data, i).won,
				PlayerStat.get_stat_from_stage(stage_data, i).lost,
				PlayerStat.get_stat_from_stage(stage_data, i).get_total_earned_score(),
				PlayerStat.get_stat_from_stage(stage_data, i).get_average_score()
			)

func _update_game_log():
	# Trim the last x entries. Let x be the maximum display size.
	var trim_begin = int(clamp(GameLog.log_list.size() - GlobalConstant.MAX_GAME_LOG_DISPLAY_SIZE, 0, GameLog.log_list.size() - 1))
	var trim_end = GameLog.log_list.size() - 1
	var trimmed_log : Array = GameLog.log_list.slice(trim_begin, trim_end)
	
	var log_id = trim_begin + 1
	for i in trimmed_log:
		i = i as GameLog.LogListData
		
		var total_score : int # Total score earned for each log
		var total_win : int # Total puzzles won for each log
		
		for j in i.log_stages:
			j = j as GameLog.LogStageData
			total_score += j.score
			total_win += 1 if j.score != 0 else 0
		
		main_tab_container.tabs_game_log.add_log(
			i.log_stages,
			log_id, # Log ID
			total_score,
			total_win, # Total wins
			i.timestamp
		)
		
		log_id += 1

func _update_version_label():
	main_tab_container.tabs_settings.set_version_label(str("v", ProjectSettings.get_setting("application/config/version")))

func _save_setting_configs():
	Settings.save()

func _update_settings_session():
	main_tab_container.tabs_settings.set_sfx_vol(Settings.sfx_vol)
	main_tab_container.tabs_settings.set_bgm_vol(Settings.bgm_vol)

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
