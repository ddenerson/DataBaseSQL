
/* 1 - Utilize o dataset público “thelook_ecommerce”, que está presente no projeto“bigquery-public-data” para trazer 
o identificador único dos usuários, o primeiro nome, email e idade, ordernados pela data de criação do cadastro. */

SELECT id AS id_usuarios,
       first_name AS Primeiro_Nome,
       email AS Email,
       age AS Idade,
       created_at AS DtCriacao
       FROM `bigquery-public-data.thelook_ecommerce.users`
ORDER BY created_at


/* 2 - No mesmo dataset do exercício anterior, extraia os pedidos que tenham status “Shipped” ou “Processing” */

SELECT u.first_name as First_Nome,
  u.email as Email,
  u.age as Age,
  o.status as Status,
  u.created_at as DtofCreate
FROM `bigquery-public-data.thelook_ecommerce.users` as u
JOIN `bigquery-public-data.thelook_ecommerce.order_items` as o on u.id = o.user_id
WHERE status = 'Shipped' or status= 'Processing'
ORDER BY DtofCreate

/* 3 - Considerando o mesmo exercício anterior, traga os pedidos que sejam foram criados no dia “2022-04-05” e, 
ao mesmo tempo, tenham status “Cancelled”.  */

SELECT o.status as Status,
       u.created_at as DtofCreate
FROM `bigquery-public-data.thelook_ecommerce.users` as u
JOIN `bigquery-public-data.thelook_ecommerce.order_items` as o on u.id = o.user_id
WHERE u.created_at =  '2022-04-05' AND status = 'Cancelled' 

/* 4 - O time de marketing deseja fazer uma campanha em um país específico, com o mesmo dataset dos itens anteriores. 
Para isso, eles te pedem os e-mails de todos os clientes que moram no Brasil. */

SELECT u.first_name AS First_Name,
       u.email AS Email,
       u.age AS Age,
       o.status AS Status,
       u.created_at AS DtofCreateFROM `bigquery-public-data.thelook_ecommerce.users` AS u
JOIN `bigquery-public-data.thelook_ecommerce.order_items` AS o ON u.id = o.user_idWHERE country = 'Brasil'
ORDER BY DtofCreate

/* 5 - No mesmo dataset anterior, traga o nome dos usuários e o id de seus pedidos. */

SELECT o.user_id AS idPedido,
       u.first_name AS First_Name,
       u.created_at AS CreatedAt
FROM `bigquery-public-data.thelook_ecommerce.users` AS u
JOIN `bigquery-public-data.thelook_ecommerce.order_items` AS o ON u.id = o.user_id
WHERE country = 'Brasil'
ORDER BY u.created_at DESC


/* 6 - Vá ao dataset público “baseball” e na tabela “schedules” traga os |identificadores únicos|, 
o |nome do time da casa| e o |nome do time de fora de casa dos jogos| em que a |duração foi maior 
ou igual a 250 minutos| e |menos de 25 mil espectadores|.*/


SELECT gameid AS game_Key,
       seasonid AS season_Key,
       homeTeamid AS homeTeam_Key,
       awayTeamid AS awayTeam_Key,
       homeTeamName AS Home_Team,
       awayTeamName AS Visit_Team,
       attendance AS numberOfPeople
FROM bigquery-PUBLIC-data.baseball.schedules
WHERE duration_minutes >= 250
AND attendance < 25000


/* 7- No mesmo dataset e tabela, retorne os jogos que começaram entre maio e junho
de 2016. */

SELECT gameid AS game_Key,
       seasonid AS season_Key,
       homeTeamid AS homeTeam_Key,
       awayTeamid AS awayTeam_Key,
       homeTeamName AS Home_Team,
       awayTeamName AS Visit_Team,
       attendance AS numberOfPeople,
       startTime AS BeginGames
FROM bigquery-PUBLIC-data.baseball.schedules
WHERE startTime BETWEEN "2016-05-01" AND "2016-06-30"
ORDER BY startTime DESC
  
 /* 8 - DESAFIO: No mesmo dataset anterior, descubra o nome dos times que tenham 
 somente 6 caracteres, usando o like. Retorne de forma única. */ 
 
 SELECT gameid AS game_Key,
       seasonid AS season_Key,
       homeTeamid AS homeTeam_Key,
       awayTeamid AS awayTeam_Key,
       homeTeamName AS Home_Team,
       awayTeamName AS Visit_Team,
       attendance AS numberOfPeople,
       startTime AS BeginGamesFROM bigquery-PUBLIC-data.baseball.schedules
WHERE homeTeamName LIKE '______'
  AND awayTeamName LIKE '______'
  
  
 /* 9) Estatísticas do campo "attendance" Retornar, em uma única consulta, os valores de média, máximo, mínimo, 
 contagem e soma do campo "attendance" da tabela "schedules" no dataset "baseball".Mesmo que a contagem e soma 
 de torcedores não tenham um significado direto para análise de negócio, esses valores devem ser incluídos na consulta.
 */
 
 SELECT AVG(attendance) AS AVG_attendance,
       MAX(attendance) AS MAX_attendance,
       MIN(attendance) AS MIN_attendance,
       COUNT(attendance) AS COUNT_attendance,
       SUM(attendance) AS SUM_attendance
FROM  bigquery-public-data.baseball.schedules 
 

/* 10) Jogos disputados em casa por time e ano.No mesmo dataset e tabela do exercício anterior, retornar:A quantidade de 
jogos disputados em casa por cada time a cada ano.A soma dos minutos jogados em casa por ano.Ordenar os resultados de 
forma decrescente pelo ano e crescente pelo nome do time. */

SELECT COUNT(gameId) AS games,
       SUM(duration_minutes) AS sum_minutes,
       homeTeamName AS homeTeam,
       YEAR AS yearsPlay
FROM bigquery-PUBLIC-data.baseball.schedules
GROUP BY 3,4
ORDER BY yearsPlay DESC,homeTeamName ASC

/* 11) Média de duração das viagens por tipo de cliente e anoNo mesmo dataset anterior, calcular a média de duração das 
viagens por tipo de cliente ("subscriber_type") separada por ano. */

SELECT AVG(duration_minutes) AS average,
       subscriber_type AS tips_of_clint,
       EXTRACT(YEAR FROM start_time) AS YEAR
FROM bigquery-PUBLIC-data.austin_bikeshare.bikeshare_trips
GROUP BY 2,3
ORDER BY YEAR;








