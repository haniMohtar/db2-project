use military;

insert into equipment_type (type_id, type_name, category, cost) values
(1, 'Assault Rifle',            'Weapon',        1200.00),
(2, 'Armored Personnel Carrier','Vehicle',     450000.00),
(3, 'Combat Helicopter',        'Aircraft',   5000000.00),
(4, 'Night Vision Goggles',     'Optics',        3500.00),
(5, 'Field Radio',              'Communication', 2200.00),
(6, 'Body Armor',               'Protection',     800.00);

insert into specialty (specialty_id, specialty_name, description) values
(1, 'Marksman',           'Long range precision shooting'),
(2, 'Combat Medic',       'Battlefield first aid and evacuation'),
(3, 'Radio Operator',     'Field communication and signals'),
(4, 'Mechanic',           'Vehicle and weapon maintenance'),
(5, 'Pilot',              'Helicopter and aircraft operation'),
(6, 'Explosives Disposal','Detection and disposal of explosives');

insert into mission_history (mission_id, mission_name, objective, start_date, end_date, objective_accomplished) values
(1, 'Operation Cedar Shield', 'Secure the northern ridge',             '2025-03-01', '2025-03-20', 1),
(2, 'Border Patrol Alpha',    'Patrol and monitor the eastern border', '2025-05-10', '2025-06-10', 1),
(3, 'Flood Relief North',     'Deliver aid to flooded villages',       '2025-11-02', '2025-11-15', 1),
(4, 'Operation Night Watch',  'Hold the river crossing',               '2026-02-14', '2026-03-30', 0),
(5, 'Supply Convoy Delta',    'Escort supplies to the southern depot', '2026-06-01', '2026-06-12', 1),
(6, 'Mountain Recon',         'Survey the mountain passes',            '2026-09-20', null,         0);

insert into soldier (soldier_id, soldier_name, birth_date, enlist_date, retired, rank_name, salary, is_commander) values
(1,  'Karim Haddad',   '1975-04-12', '1996-09-01', 0, 'General',    9500.00, 1),
(2,  'Nadia Khoury',   '1980-07-23', '2001-09-01', 0, 'Colonel',    7800.00, 1),
(3,  'Omar Sleiman',   '1985-01-30', '2006-03-15', 0, 'Major',      6200.00, 1),
(4,  'Rami Nasser',    '1990-11-05', '2011-09-01', 0, 'Captain',    4800.00, 1),
(5,  'Layla Mansour',  '1992-06-18', '2013-02-01', 0, 'Lieutenant', 3900.00, 0),
(6,  'Tony Abboud',    '1988-09-09', '2008-09-01', 0, 'Sergeant',   2800.00, 0),
(7,  'Hassan Jaber',   '1995-03-14', '2015-09-01', 0, 'Sergeant',   2700.00, 0),
(8,  'Maya Fares',     '1998-12-02', '2018-09-01', 0, 'Sergeant',   2650.00, 0),
(9,  'Elie Saade',     '2000-05-27', '2020-09-01', 0, 'Private',    1500.00, 0),
(10, 'Sara Daher',     '2001-08-19', '2021-09-01', 0, 'Private',    1450.00, 0),
(11, 'Joseph Aoun',    '1970-02-03', '1991-09-01', 1, 'Colonel',    7000.00, 0),
(12, 'Zeina Karam',    '1993-10-11', '2014-09-01', 0, 'Sergeant',   2750.00, 0),
(13, 'Fadi Rizk',      '1996-04-25', '2016-09-01', 0, 'Sergeant',   2600.00, 0),
(14, 'Dina Bitar',     '1999-01-08', '2019-09-01', 0, 'Sergeant',   2550.00, 0),
(15, 'Bilal Sayegh',   '1999-07-30', '2019-09-01', 0, 'Corporal',   1900.00, 0);

insert into base (base_id, base_name, location, base_type) values
(1, 'Fort Beirut',  'Beirut', 'Headquarters'),
(2, 'Camp Tyre',    'Tyre',   'Infantry Camp'),
(3, 'Airbase Rayak','Zahle',  'Air Base'),
(4, 'Depot Sidon',  'Sidon',  'Logistics Depot');

insert into unit (unit_id, base_id, sergeant_id, parent_unit_id, unit_name, unit_type) values
(1, 1, 6,  null, '1st Infantry Brigade',   'Brigade'),
(4, 3, 13, null, 'Air Wing',               'Wing'),
(2, 2, 7,  1,    '2nd Infantry Battalion', 'Battalion'),
(6, 4, 14, 1,    'Logistics Company',      'Company'),
(5, 3, 8,  4,    'Rotary Squadron',        'Squadron'),
(3, 2, 12, 2,    'Alpha Company',          'Company');

update soldier set unit_id = 1 where soldier_id in (1, 2, 6);
update soldier set unit_id = 2 where soldier_id in (3, 7, 9);
update soldier set unit_id = 3 where soldier_id in (4, 12, 10);
update soldier set unit_id = 4 where soldier_id in (13, 5);
update soldier set unit_id = 5 where soldier_id in (8, 15);
update soldier set unit_id = 6 where soldier_id = 14;

update base set commander_id = 1 where base_id = 1;
update base set commander_id = 3 where base_id = 2;
update base set commander_id = 2 where base_id = 3;
update base set commander_id = 4 where base_id = 4;

insert into equipment (equipment_id, unit_id, type_id, base_id, serial_no, equipment_condition) values
(1,  3,    1, 2, 'AR-0001',  'good'),
(2,  3,    1, 2, 'AR-0002',  'new'),
(3,  2,    1, 2, 'AR-0003',  'fair'),
(4,  2,    2, 2, 'APC-101',  'good'),
(5,  null, 2, 4, 'APC-102',  'poor'),
(6,  5,    3, 3, 'HEL-201',  'good'),
(7,  5,    3, 3, 'HEL-202',  'damaged'),
(8,  3,    4, 2, 'NVG-301',  'good'),
(9,  null, 4, 4, 'NVG-302',  'new'),
(10, 1,    5, 1, 'RAD-401',  'good'),
(11, 6,    5, 4, 'RAD-402',  'fair'),
(12, null, 6, 4, 'BA-501',   'decommissioned'),
(13, 1,    6, 1, 'BA-502',   'good');

insert into injury (injury_id, mission_id, soldier_id, injury_date, severity, description) values
(1, 1,    9,  '2025-03-08', 'minor',    'Sprained ankle during patrol'),
(2, 1,    4,  '2025-03-12', 'moderate', 'Shrapnel wound to the arm'),
(3, 2,    10, '2025-05-22', 'minor',    'Heat exhaustion'),
(4, null, 12, '2025-08-03', 'moderate', 'Fractured wrist in a training accident'),
(5, 4,    7,  '2026-03-02', 'severe',   'Gunshot wound to the leg'),
(6, 4,    3,  '2026-03-10', 'critical', 'Blast injury');

insert into participates_in (mission_id, unit_id, role) values
(1, 2, 'Main assault'),
(1, 3, 'Support'),
(1, 6, 'Logistics'),
(2, 3, 'Patrol'),
(3, 6, 'Relief supplies'),
(3, 5, 'Air transport'),
(4, 2, 'Main force'),
(4, 5, 'Air cover'),
(5, 6, 'Convoy escort'),
(6, 3, 'Reconnaissance'),
(6, 5, 'Aerial survey');

insert into is_certified_in (soldier_id, specialty_id, certified_date) values
(3,  5, '2009-05-05'),
(4,  1, '2012-06-10'),
(5,  3, '2014-03-20'),
(6,  6, '2010-09-09'),
(8,  4, '2019-07-07'),
(9,  1, '2021-05-01'),
(10, 2, '2022-02-14'),
(12, 2, '2016-04-12'),
(13, 5, '2017-10-01'),
(14, 4, '2020-01-15'),
(15, 3, '2020-06-06');