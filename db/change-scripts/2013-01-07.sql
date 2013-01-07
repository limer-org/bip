CREATE TABLE IF NOT EXISTS `fin` (
  `FIN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FIN_TYPE` int(11) NOT NULL,
  `FIN_SOURCE` int(11) NOT NULL,
  `FIN_YEAR` smallint(6) NOT NULL,
  `FIN_AMOUNT` double NOT NULL,
  `FIN_FROM` varchar(256) COLLATE utf8_bin NULL,
  `FIN_PRJ_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`FIN_ID`),
  KEY `FIN_PRJ_ID` (`FIN_PRJ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `fin`
  ADD CONSTRAINT `fin_ibfk_1` FOREIGN KEY (`FIN_PRJ_ID`) REFERENCES `prj` (`PRJ_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
  
  
CREATE TABLE IF NOT EXISTS `fin_hist` (
  `FIN_HIST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FIN_ID` int(11) NOT NULL,
  `FIN_AMOUNT` double NOT NULL,
  PRIMARY KEY (`FIN_HIST_ID`),
  KEY `FIN_ID` (`FIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `fin_hist`
  ADD CONSTRAINT `fin_hist_ibfk_1` FOREIGN KEY (`FIN_ID`) REFERENCES `fin` (`FIN_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
  
  
ALTER TABLE  `inf` ADD  `INF_SHOW_FIN_TYPE` INT NULL AFTER  `INF_SHOW_FILE_CAT`;

--wprowadz typ finansowania dla odpowiednich inf.