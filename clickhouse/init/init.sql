create database if not exists WOT;

CREATE USER if not exists public IDENTIFIED WITH no_password
  DEFAULT DATABASE WOT
  SETTINGS
    add_http_cors_header = 1,
    max_execution_time = 600,
    max_temporary_columns = 100,
    max_memory_usage = '2G',
    max_query_size = '10M',
    readonly = 2;

CREATE QUOTA public
  KEYED BY forwarded_ip_address
    FOR RANDOMIZED INTERVAL 1 MINUTE MAX queries = 240, result_rows = 100000, execution_time = 20,
    FOR RANDOMIZED INTERVAL 1 HOUR MAX queries = 3000, result_rows = '5M', execution_time = 600,
    FOR RANDOMIZED INTERVAL 1 DAY MAX queries = 50000, result_rows = '50M', execution_time = 2000
TO public;

GRANT SELECT ON WOT.Event_OnBattleStart TO public;
GRANT SELECT ON WOT.Event_OnBattleResult TO public;
GRANT SELECT ON WOT.Event_OnShot TO public;
GRANT SELECT ON WOT.Event_OnLootboxOpen TO public;
GRANT SELECT ON WOT.description TO public;
GRANT SELECT ON WOT.TankList TO public;
GRANT SELECT ON WOT.Lootboxes TO public;
GRANT SELECT ON WOT.Arenas TO public;
GRANT SELECT ON WOT.Customizations TO public;
GRANT SELECT ON WOT.Artefacts TO public;

GRANT SELECT ON WOT.player_coverage_mv TO public;
GRANT SELECT ON WOT.player_coverage_mv_tankLevel TO public;
GRANT SELECT ON WOT.player_coverage_mv_tankType TO public;
GRANT SELECT ON WOT.player_coverage_mv_tankLevel_tankType TO public;
GRANT SELECT ON WOT.accuracy_hit_points_mv TO public;
GRANT SELECT ON WOT.team_results_mv TO public;
GRANT SELECT ON WOT.Event_OnShot_health_damage_mv TO public;
GRANT SELECT ON WOT.Event_OnShot_safe_damage_count_by_base_mv TO public;

GRANT SELECT ON WOT.lootbox_equipment_mv TO public;
GRANT SELECT ON WOT.lootbox_crewbook_mv TO public;
GRANT SELECT ON WOT.lootbox_item_mv TO public;
GRANT SELECT ON WOT.lootbox_boosters_mv TO public;
GRANT SELECT ON WOT.lootbox_customizations_mv TO public;
GRANT SELECT ON WOT.lootbox_premium_mv TO public;
GRANT SELECT ON WOT.lootbox_free_xp_mv TO public;
GRANT SELECT ON WOT.lootbox_gold_mv TO public;
GRANT SELECT ON WOT.lootbox_credits_mv TO public;
GRANT SELECT ON WOT.lootbox_vehicle_mv TO public;
GRANT SELECT ON WOT.lootbox_lootbox_mv TO public;
