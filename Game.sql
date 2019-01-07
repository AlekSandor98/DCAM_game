DROP TABLE track
DROP TABLE build_team
DROP TABLE tim
DROP TABLE zad_team
DROP TABLE ZADachi
Drop table hard_razd
Drop table team
DROP TABLE hardness
DROP TABLE razdel
DROP TABLE build

CREATE TABLE tim (
	st time NOT NULL,
	fn time NOT NULL,
)


CREATE TABLE [team] (
	team_id smallint IDENTITY (1,1) NOT NULL,
	name varchar(150) NOT NULL,
	players text NOT NULL,
	[login] varchar (50) NOT NULL,
	[pass] varchar (50) NOT NULL,
	sum_mon float NOT NULL,
	sum_st float NOT NULL,
	d_mon float NOT NULL,
	d_st float NOT NULL,
	bank smallint NOT NULL,
	bm smallint NOT NULL,
	mv smallint NOT NULL,
	mn smallint NOT NULL,
	mn_st smallint NOT NULL,
CONSTRAINT [PK_TEAM] PRIMARY KEY ([team_id] ASC) WITH (IGNORE_DUP_KEY = OFF)
)

CREATE TABLE [build] (
	build_id smallint IDENTITY (1,1) NOT NULL,
	name varchar(30) NOT NULL,
CONSTRAINT [PK_BUILD] PRIMARY KEY ([build_id] ASC) WITH (IGNORE_DUP_KEY = OFF)
)

CREATE TABLE [build_team] (
	team_id smallint NOT NULL,
	build_id smallint NOT NULL,
	stat smallint NOT NULL,
CONSTRAINT [PK_BT] PRIMARY KEY ([build_id],[team_id] ASC) WITH (IGNORE_DUP_KEY = OFF)
)

CREATE TABLE [hardness] (
	hard_id smallint IDENTITY (1,1) NOT NULL,
	name varchar (30) NOT NULL,
	CONSTRAINT [PK_HARD] PRIMARY KEY ([hard_id] ASC) WITH (IGNORE_DUP_KEY = OFF)
)

CREATE TABLE [razdel] (
	razd_id smallint IDENTITY (1,1) NOT NULL,
	name varchar (50) NOT NULL,
	CONSTRAINT [PK_RAZD] PRIMARY KEY ([razd_id] ASC) WITH (IGNORE_DUP_KEY = OFF)
)

CREATE TABLE [hard_razd] (
	team_id smallint NOT NULL,
	razd_id smallint NOT NULL,
	hard_id smallint NOT NULL,
	stat smallint
	CONSTRAINT [PK_HR] PRIMARY KEY ([team_id],[razd_id],[hard_id] ASC) WITH (IGNORE_DUP_KEY = OFF)
)

CREATE TABLE [zadachi] (
	zad_id int IDENTITY (1,1) NOT NULL,
	razd_id smallint NOT NULL,
	hard_id smallint NOT NULL,
	number varchar (5) NOT NULL,
	price smallint NOT NULL,
	profit smallint NOT NULL,
	otvet varchar (50) NOT NULL,
	CONSTRAINT [PK_ZAD] PRIMARY KEY ([zad_id] ASC) WITH (IGNORE_DUP_KEY = OFF)
)

CREATE TABLE [zad_team] (
	team_id smallint NOT NULL,
	zad_id int NOT NULL,
	stat smallint NOT NULL,
	CONSTRAINT [PK_ZT] PRIMARY KEY ([zad_id], [team_id] ASC) WITH (IGNORE_DUP_KEY = OFF)
)

CREATE TABLE [track] (
	track_id int IDENTITY (1,1) NOT NULL,
	team_id smallint NOT NULL,
	tex varchar(8000) NOT NULL,
	car varchar(8000) NOT NULL,
	stat smallint NOT NULL,
	CONSTRAINT [PK_TR] PRIMARY KEY ([track_id] ASC) WITH (IGNORE_DUP_KEY = OFF)
)


ALTER TABLE [track] WITH CHECK ADD CONSTRAINT [tr_fk0] FOREIGN KEY ([team_id]) REFERENCES [team]([team_id])
  ON UPDATE CASCADE 
  ON DELETE CASCADE
ALTER TABLE [track] CHECK CONSTRAINT [tr_fk0]

ALTER TABLE [hard_razd] WITH CHECK ADD CONSTRAINT [hr_fk0] FOREIGN KEY ([team_id]) REFERENCES [team]([team_id])
  ON UPDATE CASCADE 
  ON DELETE CASCADE
ALTER TABLE [hard_razd] CHECK CONSTRAINT [hr_fk0]

ALTER TABLE [hard_razd] WITH CHECK ADD CONSTRAINT [hr_fk1] FOREIGN KEY ([razd_id]) REFERENCES [razdel]([razd_id])
  ON UPDATE CASCADE 
  ON DELETE CASCADE
ALTER TABLE [hard_razd] CHECK CONSTRAINT [hr_fk1]

ALTER TABLE [hard_razd] WITH CHECK ADD CONSTRAINT [hr_fk2] FOREIGN KEY ([hard_id]) REFERENCES [hardness]([hard_id])
  ON UPDATE CASCADE 
  ON DELETE CASCADE
ALTER TABLE [hard_razd] CHECK CONSTRAINT [hr_fk2]

ALTER TABLE [zadachi] WITH CHECK ADD CONSTRAINT [zad_fk0] FOREIGN KEY ([razd_id]) REFERENCES [razdel]([razd_id])
  ON UPDATE CASCADE 
  ON DELETE CASCADE
ALTER TABLE [zadachi] CHECK CONSTRAINT [zad_fk0]

ALTER TABLE [zadachi] WITH CHECK ADD CONSTRAINT [zad_fk1] FOREIGN KEY ([hard_id]) REFERENCES [hardness]([hard_id])
  ON UPDATE CASCADE 
  ON DELETE CASCADE
ALTER TABLE [zadachi] CHECK CONSTRAINT [zad_fk1]

ALTER TABLE [zad_team] WITH CHECK ADD CONSTRAINT [zt_fk0] FOREIGN KEY ([zad_id]) REFERENCES [zadachi]([zad_id])
  ON UPDATE CASCADE 
  ON DELETE CASCADE
ALTER TABLE [zad_team] CHECK CONSTRAINT [zt_fk0]

ALTER TABLE [zad_team] WITH CHECK ADD CONSTRAINT [zt_fk1] FOREIGN KEY ([team_id]) REFERENCES [team]([team_id])
  ON UPDATE CASCADE 
  ON DELETE CASCADE
ALTER TABLE [zad_team] CHECK CONSTRAINT [zt_fk1]

ALTER TABLE [build_team] WITH CHECK ADD CONSTRAINT [bt_fk0] FOREIGN KEY ([team_id]) REFERENCES [team]([team_id])
  ON UPDATE CASCADE 
  ON DELETE CASCADE
ALTER TABLE [build_team] CHECK CONSTRAINT [bt_fk0]

ALTER TABLE [build_team] WITH CHECK ADD CONSTRAINT [bt_fk1] FOREIGN KEY ([build_id]) REFERENCES [build]([build_id])
  ON UPDATE CASCADE 
  ON DELETE CASCADE
ALTER TABLE [build_team] CHECK CONSTRAINT [bt_fk1]


INSERT INTO tim VALUES ('16:00', '23:35')

INSERT INTO hardness VALUES ('Просто')
INSERT INTO hardness VALUES ('Средне')
INSERT INTO hardness VALUES ('Сложно')

INSERT INTO razdel VALUES ('Геометрия')
INSERT INTO razdel VALUES ('Теория чисел')
INSERT INTO razdel VALUES ('Разнобой без геометрии')
INSERT INTO razdel VALUES ('Комбинаторика')
INSERT INTO razdel VALUES ('Многочлены')

INSERT INTO build VALUES ('КПМ')
INSERT INTO build VALUES ('НК')
INSERT INTO build VALUES ('ГК')
INSERT INTO build VALUES ('ЛК')
INSERT INTO build VALUES ('БИО')
INSERT INTO build VALUES ('АК')

INSERT INTO build VALUES ('Светофор')
INSERT INTO build VALUES ('Благоустройство территорий')
INSERT INTO build VALUES ('Бассейн')
INSERT INTO build VALUES ('Футбольное поле')
INSERT INTO build VALUES ('12 общежитие')

INSERT INTO build VALUES ('Столовая')
INSERT INTO build VALUES ('Лаборатория')



INSERT INTO zadachi VALUES (1,1, 'A', 300, 2400, '61')
INSERT INTO zadachi VALUES (1,1, 'B', 300, 2400, '8')

INSERT INTO zadachi VALUES (1,2, 'A', 600, 6000, '39')

INSERT INTO zadachi VALUES (1,3, 'A', 1000, 12000, '11')

INSERT INTO zadachi VALUES (2,1, 'A', 300, 2400, '87')
INSERT INTO zadachi VALUES (2,1, 'B', 300, 2400, '0')

INSERT INTO zadachi VALUES (2,2, 'A', 600, 6000, '735')

INSERT INTO zadachi VALUES (2,3, 'A', 1000, 12000, '18')

INSERT INTO zadachi VALUES (3,1, 'A', 300, 2400, '9')
INSERT INTO zadachi VALUES (3,1, 'B', 300, 2400, '1')

INSERT INTO zadachi VALUES (3,2, 'A', 600, 6000, '12')

INSERT INTO zadachi VALUES (3,3, 'A', 1000, 12000, '5')


INSERT INTO zadachi VALUES (4,1, 'A', 300, 2400, '35')
INSERT INTO zadachi VALUES (4,1, 'B', 300, 2400, '30')

INSERT INTO zadachi VALUES (4,2, 'A', 600, 6000, '49')

INSERT INTO zadachi VALUES (4,3, 'A', 1000, 12000, '100')


INSERT INTO zadachi VALUES (5,1, 'A', 300, 2400, '2')
INSERT INTO zadachi VALUES (5,1, 'B', 300, 2400, '1025')

INSERT INTO zadachi VALUES (5,2, 'A', 600, 6000, '0')

INSERT INTO zadachi VALUES (5,3, 'A', 1000, 12000, '-3')


go
drop view chemp
go
Create view chemp (name, id, razd_id, hard_id, kol) as
(select team.name, team.team_id, t1.razd_id, t1.hard_id, isnull(kol,0) as kol
from team inner join
(select team_id, razd_id, hard_id from hard_razd) as t1 on team.team_id = t1.team_id
left join
(select c.name, a.team_id, razd_id, hard_id, count(*) as kol
from zad_team a inner join zadachi b on a.zad_id = b.zad_id inner join team c on c.team_id = a.team_id 
where stat = 100
group by c.name, a.team_id, razd_id, hard_id) as t2

on t2.team_id = t1.team_id and t2.razd_id = t1.razd_id and t2.hard_id = t1.hard_id
)
