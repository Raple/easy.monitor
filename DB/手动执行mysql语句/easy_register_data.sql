-- --------------------------------------------------------
-- 主机:                           rdsa3nn976o0z040mn7t.mysql.rds.aliyuncs.com
-- 服务器版本:                        5.6.16-log - Source distribution
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- 正在导出表  etao_register.db_version 的数据：~10 rows (大约)
DELETE FROM `db_version`;
/*!40000 ALTER TABLE `db_version` DISABLE KEYS */;
INSERT INTO `db_version` (`id`, `from_version`, `current_version`, `last_update_datetime`) VALUES
	(1, 1, 2, '2016-03-14 18:25:23'),
	(2, 1, 3, '2016-03-14 18:25:23'),
	(3, 1, 4, '2016-03-14 18:25:23'),
	(4, 1, 5, '2016-03-14 18:25:24'),
	(5, 1, 6, '2016-03-14 18:25:24'),
	(6, 1, 7, '2016-03-14 18:25:24'),
	(7, 1, 8, '2016-03-14 18:25:24'),
	(8, 1, 9, '2016-03-14 18:25:24'),
	(9, 1, 10, '2016-03-14 18:25:24'),
	(10, 1, 11, '2016-03-14 18:25:24'),
	(11, 70, 71, '2016-03-18 22:45:30'),
	(12, 70, 72, '2016-03-18 22:45:47');
/*!40000 ALTER TABLE `db_version` ENABLE KEYS */;

-- 正在导出表  etao_register.regisrer_directory 的数据：~6 rows (大约)
DELETE FROM `regisrer_directory`;
/*!40000 ALTER TABLE `regisrer_directory` DISABLE KEYS */;
INSERT INTO `regisrer_directory` (`id`, `name`, `description`, `ping_api_path`, `version_api_path`, `create_date`, `directory_type`, `use_services_md5`, `api_list_md5`, `provider_node_count`) VALUES
	(1, 'ETaoERPService', 'erp接口服务', '', '', '2016-03-28 09:17:33', 1, '4D241ACF1BFF2761AB5A4B9CD5BF45C5', NULL, 1),
	(2, 'ETaoBH5WebSite', 'B端站点', '', '', '2016-03-28 09:17:57', 1, '4D241ACF1BFF2761AB5A4B9CD5BF45C5', NULL, 1),
	(3, 'ETaoINNER', '内部服务', '', '', '2016-03-28 09:18:23', 3, '4D241ACF1BFF2761AB5A4B9CD5BF45C5', NULL, 1),
	(4, 'ETaoCWebSite', 'C端站点', '', '', '2016-03-28 09:19:35', 1, '062A777C93F9AE2DA5EAFF2A471900C8', NULL, 1),
	(5, 'OrderDatabase', '订单数据访问接口', '', '', '2016-03-28 09:19:57', 2, NULL, '2B41884925F4707355AA749DA6C55894', 1),
	(6, 'ETaoBApiService', 'b端接口', '', '', '2016-03-28 09:20:23', 1, 'A6D3D30B518F9ADCE9372ABD738FA2C9', NULL, 1),
	(7, 'OrderCodeService', '获得订单支付码和取餐流水号服务', '', '', '2016-03-28 09:20:48', 2, NULL, '4794B4FDBA7AE3C18B0388DFF6B59CFC', 1),
	(8, 'WechatService', '微信接口调用服务', '', '', '2016-04-11 14:19:18', 2, NULL, '0B5751C97C183BA33FF43588FFE3AB97', 1);
/*!40000 ALTER TABLE `regisrer_directory` ENABLE KEYS */;

-- 正在导出表  etao_register.register_apis 的数据：~24 rows (大约)
DELETE FROM `register_apis`;
/*!40000 ALTER TABLE `register_apis` DISABLE KEYS */;
INSERT INTO `register_apis` (`id`, `api_name`, `directory_id`, `directory_name`) VALUES
	(1, '/Add', 5, 'OrderDatabase'),
	(2, '/FindAll', 5, 'OrderDatabase'),
	(3, '/FindBy', 5, 'OrderDatabase'),
	(4, '/OrderIsPay', 5, 'OrderDatabase'),
	(5, '/QureyByPage', 5, 'OrderDatabase'),
	(6, '/Remove', 5, 'OrderDatabase'),
	(7, '/RemoveAll', 5, 'OrderDatabase'),
	(8, '/SelectToBillOrder', 5, 'OrderDatabase'),
	(9, '/Select', 5, 'OrderDatabase'),
	(10, '/Update', 5, 'OrderDatabase'),
	(11, '/UpdateForBill', 5, 'OrderDatabase'),
	(12, '/UpdateOrderRefundStatus', 5, 'OrderDatabase'),
	(13, 'FoodOrderCode/GetFoodCode', 7, 'OrderCodeService'),
	(14, 'PayCode/GetPayCode', 7, 'OrderCodeService'),
	(15, 'WeChat/GetWeixinConfig', 8, 'WechatService'),
	(16, 'WeChat/GetJssdkModel', 8, 'WechatService'),
	(17, 'WeChat/CheckOpenIdIsFollow', 8, 'WechatService'),
	(18, 'WeChat/RefreshAccessToken', 8, 'WechatService'),
	(19, 'WeChat/CheckOpenIdIsFollow', 8, 'WechatService'),
	(20, 'WeChat/SendTemplateMessage', 8, 'WechatService'),
	(21, 'WeChat/GetOAuthUrl', 8, 'WechatService'),
	(22, 'WeChat/GetOAuthAccessToken', 8, 'WechatService'),
	(23, 'WeChat/RefreshOAuthAccessToken', 8, 'WechatService'),
	(24, 'WeChat/GetUserInfo', 8, 'WechatService');
/*!40000 ALTER TABLE `register_apis` ENABLE KEYS */;

-- 正在导出表  etao_register.register_node 的数据：~6 rows (大约)
DELETE FROM `register_node`;
/*!40000 ALTER TABLE `register_node` DISABLE KEYS */;
INSERT INTO `register_node` (`id`, `url`, `ip`, `description`, `weight`, `status`, `create_date`, `directory_id`, `directory_name`) VALUES
	(1, 'http://123.56.246.166', '123.56.246.166:80', '', 10, 1, '2016-03-29 13:57:39', 1, 'ETaoERPService'),
	(2, 'database', 'database', '订单数据访问层', 100, 1, '2016-03-29 13:57:42', 5, 'OrderDatabase'),
	(3, 'http://123.56.246.166', '123.56.246.166:80', 'ETaoBH5站点', 10, 1, '2016-03-29 13:58:30', 2, 'ETaoBH5WebSite'),
	(4, 'http://123.56.246.166:9898/', '123.56.246.166:9898', '', 10, 1, '2016-03-29 16:24:39', 3, 'ETaoINNER'),
	(5, 'http://10.172.154.142:9999/api/', '10.172.154.142:9999', '订单支付和取餐号', 10, 1, '2016-03-29 18:05:28', 7, 'OrderCodeService'),
	(6, 'http://123.56.246.166', '123.56.246.166:80', 'ETAOB端接口', 10, 1, '2016-03-29 18:08:13', 6, 'ETaoBApiService'),
	(7, 'http://123.56.246.166', '123.56.246.166:80', '', 10, 1, '2016-03-29 19:15:17', 4, 'ETaoCWebSite'),
	(8, 'http://10.172.154.142:9991/api/', '10.172.154.142:9991', '微信接口调用服务', 10, 1, '2016-04-11 14:22:01', 8, 'WechatService');
/*!40000 ALTER TABLE `register_node` ENABLE KEYS */;

-- 正在导出表  etao_register.register_relation 的数据：~5 rows (大约)
DELETE FROM `register_relation`;
/*!40000 ALTER TABLE `register_relation` DISABLE KEYS */;
INSERT INTO `register_relation` (`consumer_id`, `consumer_name`, `provider_id`, `provider_name`, `id`, `create_date`) VALUES
	(4, 'ETaoCWebSite', 7, 'OrderCodeService', 2, '0001-01-01 00:00:00'),
	(3, 'ETaoINNER', 8, 'WechatService', 3, '0001-01-01 00:00:00'),
	(2, 'ETaoBH5WebSite', 8, 'WechatService', 4, '0001-01-01 00:00:00'),
	(6, 'ETaoBApiService', 7, 'OrderCodeService', 5, '0001-01-01 00:00:00'),
	(6, 'ETaoBApiService', 8, 'WechatService', 6, '0001-01-01 00:00:00'),
	(1, 'ETaoERPService', 8, 'WechatService', 7, '0001-01-01 00:00:00');
/*!40000 ALTER TABLE `register_relation` ENABLE KEYS */;

-- 正在导出表  etao_register.register_user 的数据：~0 rows (大约)
DELETE FROM `register_user`;
/*!40000 ALTER TABLE `register_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `register_user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
