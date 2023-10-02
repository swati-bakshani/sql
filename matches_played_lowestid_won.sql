create table players
(player_id int,
group_id int);

insert into players values (15,1);
insert into players values (25,1);
insert into players values (30,1);
insert into players values (45,1);
insert into players values (10,2);
insert into players values (35,2);
insert into players values (50,2);
insert into players values (20,3);
insert into players values (40,3);

create table matches
(
match_id int,
first_player int,
second_player int,
first_score int,
second_score int);

insert into matches values (1,15,45,3,0);
insert into matches values (2,30,25,1,2);
insert into matches values (3,30,15,2,0);
insert into matches values (4,40,20,5,2);
insert into matches values (5,35,50,1,1);

select * from matches m
select * from players
with player_score as(
select first_player as player_id, first_score as score from matches
union all
select second_player as player_id, second_score as score from matches
),
final_score as(
select ps.player_id, p.group_id,sum(score) as score
from player_score ps
inner join players p on p.player_id=ps.player_id
group by ps.player_id,p.group_id
),
--select * from final_score
final_rank as(
select player_id,group_id,score,RANK() over (partition by group_id order by score DESC,player_id ASC) as rnk
from final_score
group by player_id
)
--select * from final_rank
select player_id,group_id,score
from final_rank
where rnk = 1