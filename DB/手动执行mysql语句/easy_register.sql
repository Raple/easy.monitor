
            CREATE TABLE db_version ( id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, from_version INT NOT NULL, current_version INT NOT NULL, last_update_datetime DATETIME NOT NULL );
        

            INSERT INTO db_version(from_version,current_version,last_update_datetime) VALUES(1,2,now());
        
CREATE TABLE `regisrer_directory` ( 	`id` int NOT NULL AUTO_INCREMENT, 	`name` varchar(50) NULL, 	`description` varchar(100) NULL, 	`ping_api_path` varchar(255) NULL, 	`version_api_path` varchar(255) NULL, 	`create_date` datetime NOT NULL, 	PRIMARY KEY (`id`)  ); CREATE TABLE `register_node` ( 	`id` int NOT NULL AUTO_INCREMENT, 	`url` varchar(255) NULL, 	`ip` varchar(30) NULL, 	`description` varchar(100) NULL, 	`weight` int NOT NULL, 	`status` tinyint NOT NULL, 	`create_date` datetime NOT NULL, 	`directory_id` int NOT NULL, 	PRIMARY KEY (`id`)  ); CREATE TABLE `register_relation` ( 	`consumer_id` int NOT NULL, 	`consumer_name` varchar(50) NOT NULL, 	`provider_id` int NOT NULL, 	`provider_name` varchar(50) NOT NULL );

            INSERT INTO db_version(from_version,current_version,last_update_datetime) VALUES(1,3,now());
        

		alter table regisrer_directory
			add column directory_type tinyint;
		

            INSERT INTO db_version(from_version,current_version,last_update_datetime) VALUES(1,4,now());
        

		alter table register_node 
			add column directory_name varchar(100) ;
		

            INSERT INTO db_version(from_version,current_version,last_update_datetime) VALUES(1,5,now());
        

		alter table register_relation
			add column id int not null,
			add column create_date datetime not null;
		alter table register_relation 
			modify id int auto_increment primary key;
		

            INSERT INTO db_version(from_version,current_version,last_update_datetime) VALUES(1,6,now());
        

		CREATE TABLE `register_user` (
			`id` int NOT NULL AUTO_INCREMENT,
			`username` varchar(50) NOT NULL,
			`name` varchar(50) NOT NULL,
			`create_date` datetime NOT NULL,
			`password` varchar(100) NULL,
			PRIMARY KEY (`id`) 
		);
		

            INSERT INTO db_version(from_version,current_version,last_update_datetime) VALUES(1,7,now());
        

		alter table regisrer_directory
			add column use_services_md5 varchar(32),
			add column api_list_md5 varchar(32);
		

            INSERT INTO db_version(from_version,current_version,last_update_datetime) VALUES(1,8,now());
        

		CREATE TABLE `register_apis` (
			`id` int NOT NULL AUTO_INCREMENT,
			`api_name` varchar(100) NULL,
			`directory_id` int NOT NULL,
			PRIMARY KEY (`id`) 
		);
		

            INSERT INTO db_version(from_version,current_version,last_update_datetime) VALUES(1,9,now());
        

		alter table register_apis
			add column directory_name varchar(50);
		

            INSERT INTO db_version(from_version,current_version,last_update_datetime) VALUES(1,10,now());
        

			alter table regisrer_directory
			add column provider_node_count int default 0 comment '服务提供者数量';	
		

            INSERT INTO db_version(from_version,current_version,last_update_datetime) VALUES(1,11,now());
        
