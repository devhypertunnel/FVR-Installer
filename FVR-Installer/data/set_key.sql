-- Download: `“C:\Program Files\FactualVR\FactualPlatform\Server\mysql\bin\mysqldump.exe” --all-databases -uroot -pFactualVR01 > dump.sql`
-- Install: `type set_key.sql | “C:\Program Files\FactualVR\FactualPlatform\Server\mysql\bin\mysql.exe” -uroot -pFactualVR01`

USE `bitnami_df`;
USE `bitnami_dreamfactory`;

LOCK TABLES `app` WRITE;
/*!40000 ALTER TABLE `app` DISABLE KEYS */;
UPDATE `bitnami_dreamfactory`.`app` SET `api_key` = 'fvr' WHERE (`id` = '4');
/*!40000 ALTER TABLE `app` ENABLE KEYS */;
UNLOCK TABLES;