/* creating inf_hist table */
CREATE TABLE IF NOT EXISTS `inf_hist` (
  `INF_HIST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `INF_HIST_INF_ID` int(11) NOT NULL,
  `INF_CONTENT` text COLLATE utf8_bin NOT NULL,
  `INF_MODIFY_DATE` datetime NOT NULL,
  `INF_MODIFY_BY` int(11) NOT NULL,
  PRIMARY KEY (`INF_HIST_ID`),
  KEY `INF_MODIFY_BY` (`INF_MODIFY_BY`),
  KEY `INF_HIST_INF_ID` (`INF_HIST_INF_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;

ALTER TABLE  `inf_hist` ADD FOREIGN KEY ( `INF_HIST_INF_ID` ) REFERENCES  `inf` ( `INF_ID` );
ALTER TABLE  `inf_hist` ADD FOREIGN KEY ( `INF_MODIFY_BY` ) REFERENCES  `usr` ( `USR_ID` );

/* changes to inf table */
update `inf` set `INF_CREATE_BY` = 1 , `INF_CREATE_DATE` = NOW();

ALTER TABLE  `inf` 
CHANGE  `INF_CREATE_BY`  `INF_CREATE_BY` INT( 11 ) NOT NULL,
CHANGE  `INF_MODIFY_BY`  `INF_MODIFY_BY` INT( 11 ) NULL DEFAULT NULL;

ALTER TABLE  `inf` ADD INDEX (  `INF_CREATE_BY` );
ALTER TABLE  `inf` ADD INDEX (  `INF_MODIFY_BY` );

ALTER TABLE  `inf` ADD FOREIGN KEY (  `INF_CREATE_BY` ) REFERENCES  `usr` ( `USR_ID` );
ALTER TABLE  `inf` ADD FOREIGN KEY (  `INF_MODIFY_BY` ) REFERENCES  `usr` ( `USR_ID` );

ALTER TABLE  `inf` 
CHANGE  `INF_CREATE_DATE`  `INF_CREATE_DATE` DATETIME NOT NULL;


