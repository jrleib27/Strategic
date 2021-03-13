use mma;

/** Getting comparator stats so I can investigate classes**/
SELECT *
from total_round_statistics;

/** getting round stats for winner and loser**/
SELECT s1.unique_round_id, f.ending_round, f.ending_time,
s1.fighter_name, s1.round_number, s1.total_strikes_attempted, s1.takedowns, s1.takedowns_attempted, s1.control_time AS fighter_control_time, 
s2.control_time AS opponent_control_time, s1.significant_strikes_standing_attempted, s1.significant_strikes_clinch_attempted,
s1.significant_strikes_ground_attempted
from fights as f
LEFT JOIN `total_round_statistics` as s1 ON f.winning_fighter_name=s1.fighter_name AND f.fight_id = s1.unique_fight_id 
LEFT JOIN `total_round_statistics` as s2 ON f.losing_fighter_name=s2.fighter_name AND f.fight_id = s2.unique_fight_id AND s1.round_number = s2.round_number;

SELECT s1.unique_round_id, f.ending_round, f.ending_time,
s1.fighter_name, s1.round_number, s1.total_strikes_attempted, s1.takedowns, s1.takedowns_attempted, s1.control_time AS fighter_control_time, 
s2.control_time AS opponent_control_time, s1.significant_strikes_standing_attempted, s1.significant_strikes_clinch_attempted,
s1.significant_strikes_ground_attempted
from fights as f
LEFT JOIN `total_round_statistics` as s2 ON f.winning_fighter_name=s2.fighter_name AND f.fight_id = s2.unique_fight_id 
LEFT JOIN `total_round_statistics` as s1 ON f.losing_fighter_name=s1.fighter_name AND f.fight_id = s1.unique_fight_id AND s1.round_number = s2.round_number;

