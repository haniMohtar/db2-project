drop database if exists military;
create database military;
use military;

create table equipment_type (
    type_id      int auto_increment not null,
    type_name    varchar(48) unique not null,
    category     varchar(48) null,
    cost         decimal(10,2) not null default 0,
    constraint PK_EQUIPMENT_TYPE primary key (type_id)
);

create table specialty (
    specialty_id    int auto_increment not null,
    specialty_name  varchar(48) unique not null,
    description     text null,
    constraint PK_SPECIALTY primary key (specialty_id)
);

create table mission_history (
    mission_id              int auto_increment not null,
    mission_name            varchar(48) not null,
    objective               text null,
    start_date              date not null,
    end_date                date null,
    objective_accomplished  boolean not null default 0,
    constraint PK_MISSION_HISTORY primary key (mission_id)
);

create table base (
    base_id       int auto_increment not null,
    commander_id  int null,
    base_name     varchar(48) not null,
    location      varchar(64) null,
    base_type     varchar(64) null,
    constraint PK_BASE primary key (base_id)
);

create table soldier (
    soldier_id    int auto_increment not null,
    unit_id       int null,
    soldier_name  varchar(48) not null,
    birth_date    date not null,
    enlist_date   date not null,
    retired       boolean not null default 0,
    rank_name     varchar(48) not null,
    salary        decimal(10,2) not null default 0,
    is_commander  boolean not null default 0,
    constraint PK_SOLDIER primary key (soldier_id)
);

create table unit (
    unit_id         int auto_increment not null,
    base_id         int not null,
    sergeant_id     int not null,
    parent_unit_id  int null,
    unit_name       varchar(48) not null,
    unit_type       varchar(48) null,
    constraint PK_UNIT primary key (unit_id),
    constraint FK_UNIT_STATIONED_AT_BASE foreign key (base_id) references base (base_id),
    constraint FK_UNIT_LED_BY_SOLDIER foreign key (sergeant_id) references soldier (soldier_id),
    constraint FK_UNIT_PART_OF_UNIT foreign key (parent_unit_id) references unit (unit_id)
);

create table equipment (
    equipment_id         int auto_increment not null,
    unit_id              int null,
    type_id              int not null,
    base_id              int not null,
    serial_no            varchar(128) unique not null,
    equipment_condition  varchar(30) not null default 'good',
    constraint PK_EQUIPMENT primary key (equipment_id),
    constraint FK_EQUIPMENT_ASSIGNED_TO_UNIT foreign key (unit_id) references unit (unit_id),
    constraint FK_EQUIPMENT_IS_OF_TYPE_EQUIPMENT_TYPE foreign key (type_id) references equipment_type (type_id),
    constraint FK_EQUIPMENT_STORED_AT_BASE foreign key (base_id) references base (base_id)
);

create table injury (
    injury_id    int auto_increment not null,
    mission_id   int null,
    soldier_id   int not null,
    injury_date  date not null,
    severity     varchar(30) not null,
    description  text null,
    constraint PK_INJURY primary key (injury_id),
    constraint FK_INJURY_OCCURS_DURING_MISSION_HISTORY foreign key (mission_id) references mission_history (mission_id),
    constraint FK_INJURY_SUFFERED_BY_SOLDIER foreign key (soldier_id) references soldier (soldier_id)
);

create table participates_in (
    mission_id  int not null,
    unit_id     int not null,
    role        varchar(48) null,
    constraint PK_PARTICIPATES_IN primary key (mission_id, unit_id),
    constraint FK_PARTICIPATES_IN_MISSION_HISTORY foreign key (mission_id) references mission_history (mission_id) on delete cascade,
    constraint FK_PARTICIPATES_IN_UNIT foreign key (unit_id) references unit (unit_id) on delete cascade
);

create table is_certified_in (
    soldier_id      int not null,
    specialty_id    int not null,
    certified_date  date null,
    constraint PK_IS_CERTIFIED_IN primary key (soldier_id, specialty_id),
    constraint FK_IS_CERTIFIED_IN_SOLDIER foreign key (soldier_id) references soldier (soldier_id) on delete cascade,
    constraint FK_IS_CERTIFIED_IN_SPECIALTY foreign key (specialty_id) references specialty (specialty_id) on delete cascade
);

alter table soldier
    add constraint FK_SOLDIER_SERVES_IN_UNIT foreign key (unit_id) references unit (unit_id);

alter table base
    add constraint FK_BASE_COMMANDED_BY_SOLDIER foreign key (commander_id) references soldier (soldier_id);

alter table equipment_type
    add constraint CK_EQUIPMENT_TYPE_COST check (cost >= 0);

alter table equipment
    add constraint CK_EQUIPMENT_CONDITION check (equipment_condition in ('new','good','fair','poor','damaged','decommissioned'));

alter table injury
    add constraint CK_INJURY_SEVERITY check (severity in ('minor','moderate','severe','critical'));

alter table soldier
    add constraint CK_SOLDIER_SALARY check (salary >= 0);

alter table soldier
    add constraint CK_SOLDIER_DATES check (enlist_date >= birth_date);

alter table mission_history
    add constraint CK_MISSION_DATES check (end_date is null or end_date >= start_date);

alter table mission_history
    add constraint CK_MISSION_DONE check (not objective_accomplished or end_date is not null);