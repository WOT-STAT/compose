select toUInt32(count())as count, countIf(length(results.order) > 0) / count() as hit, countIf(arraySum(results.shotDamage) > 0 or arraySum(results.fireDamage) > 0) / count()as damaged, countIf(ballisticResultServer_r <= 0.5) / count()as first50, countIf(ballisticResultServer_r <= 0.3333) / count() as first30, countIf(abs(serverShotDispersion / gunDispersion) between 0.999 and 1.001 or abs(clientShotDispersion / gunDispersion) between 0.999 and 1.001) / count() as full, countIf(abs(turretSpeed) + abs(vehicleRotationSpeed) < 1 and abs(vehicleSpeed) < 0.5) / count()as stopped, countIf(sqrt(pow(serverMarkerPoint_x - gunPoint_x, 2) + pow(serverMarkerPoint_y - gunPoint_y, 2) + pow(serverMarkerPoint_z - gunPoint_z, 2)) > 300) / count()as dist300 from Event_OnShot where battleMode = 'REGULAR';

select r, sum(count) over (rows between unbounded preceding and current row) as cum, round(cum / sum(count) over (), 2) as percent from (select round(ballisticResultServer_r, 2) as r, count() as count from Event_OnShot where ballisticResultServer_r < 1 and battleMode = 'REGULAR' group by r order by r);

select arenaTag, toUInt32(count(*))as count, toUInt32(countIf(result = 'lose'))as loseCount, toUInt32(countIf(result = 'win')) as winCount, avg(duration) as avgDuration, avgIf(duration, result = 'lose')as loseDuration, avgIf(duration, result = 'win') as winDuration, avg(personal.damageDealt) as damage, avgIf(personal.damageDealt, result = 'lose')as loseDamage, avgIf(personal.damageDealt, result = 'win') as winDamage, avg(personal.damageDealt + max2(personal.damageAssistedRadio, personal.damageAssistedTrack)) as mgSum, avgIf(personal.damageDealt + max2(personal.damageAssistedRadio, personal.damageAssistedTrack), result = 'lose')as loseMgSum, avgIf(personal.damageDealt + max2(personal.damageAssistedRadio, personal.damageAssistedTrack), result = 'win') as winMgSum, avg(personal.damageBlockedByArmor)as block, avgIf(personal.damageBlockedByArmor, result = 'lose') as loseBlock, avgIf(personal.damageBlockedByArmor, result = 'win')as winBlock, avg(personal.lifeTime)as lifeTime, avgIf(personal.lifeTime, result = 'lose') as loseLifeTime, avgIf(personal.lifeTime, result = 'win')as winLifeTime, avg(personal.damageAssistedRadio) as radio, avgIf(personal.damageAssistedRadio, result = 'lose')as loseRadio, avgIf(personal.damageAssistedRadio, result = 'win') as winRadio, avg(personal.kills) as kills, avgIf(personal.kills, result = 'lose')as loseKills, avgIf(personal.kills, result = 'win') as winKills from Event_OnBattleResult sample 500000 where battleMode = 'REGULAR' group by arenaTag order by count desc
