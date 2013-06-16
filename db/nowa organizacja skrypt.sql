DROP PROCEDURE IF EXISTS AddNGO;
DELIMITER go
CREATE PROCEDURE AddNGO( IN app_id INT )

INSERT INTO `usr` (`USR_NAME`, `USR_PASS`, `USR_FIRSTNAME`, `USR_LASTNAME`, `USR_EMAIL`, `USR_APP_ID`) VALUES
('admin_app_' + app_id , 'k@lafio4', 'Izabela', 'Kaczmarczyk', 'izabela.szczepanik@gazeta.pl', app_id);

INSERT INTO `authassignment` (`itemname`, `userid`, `bizrule`, `data`) VALUES 
('superadmin', LAST_INSERT_ID(), NULL , NULL);

INSERT INTO `inf` (`INF_APP_ID`, `INF_NAME`, `INF_CONTENT`, `INF_OBLIGATORY`, `INF_DISPLAY_ORDER`, `INF_SHOW`, `INF_BIP`, `INF_SIT_ID`, `INF_TYPE`, `INF_INF_ID`, `INF_SHOW_PRJ_CAT`, `INF_SHOW_FILE_CAT`, `INF_SHOW_FIN_TYPE`, `INF_SHOW_CTRL`, `INF_CREATE_DATE`, `INF_CREATE_BY`, `INF_MODIFY_DATE`, `INF_MODIFY_BY`, `INF_INFO_CREATED_BY`, `INF_INFO_CREATE_DATE`) VALUES
(app_id, 'Pełna nazwa organizacji ', 0x3c703e53746f7761727a79737a656e6965204d69c5826fc59b6e696b266f61637574653b7720537461727963682053616d6f63686f64266f61637574653b773c2f703e, 1, 10, 1, 1, 1, 1, NULL, NULL, 3, NULL, 0, '2013-01-05 00:00:00', 1, '2013-04-07 12:31:52', 1, 'Jan Nowak', '2010-03-20 13:00:00'),
(app_id, 'Adres siedziby/biura/miejsca działalności', 0x3c616464726573733e0d0a3c703e53746f7761727a79737a656e6965204d69c5826fc59b6e696b266f61637574653b7720537461727963682053616d6f63686f64266f61637574653b773c2f703e0d0a3c703e756c2e205069c582737564736b6965676f2031352f353c2f703e0d0a3c703e34302d303031204b61746f776963653c2f703e0d0a3c703e74656c2f6661783a20333220333536373839303c2f703e0d0a3c703e652d6d61696c3a20626975726f40736d73732e706c3c2f703e0d0a3c703e266e6273703b3c2f703e0d0a3c2f616464726573733e, 1, 20, 1, 1, 1, 1, NULL, NULL, NULL, NULL, 0, '2013-01-06 12:06:04', 1, '2013-03-30 13:16:56', 15, '', '0000-00-00 00:00:00'),
(app_id, '', 0x3c703e43656c656d20647a6961c582616c6e6fc59b63692053746f7761727a79737a656e6961206a6573743a3c2f703e0d0a3c756c3e0d0a3c6c693e7374776f727a656e696520666f72756d2077796d69616e7920706f676cc48564266f61637574653b77206920646fc59b77696164637a65c58420706fc59b72266f61637574653b642077c58261c59b63696369656c692c2075c5bc79746b6f776e696b266f61637574653b7720692073796d706174796b266f61637574653b7720737461727963682073616d6f63686f64266f61637574653b773c2f6c693e0d0a3c6c693e75706f77737a6563686e69656e696520776965647a7920746563686e69637a6e656a2c20656b6f6e6f6d69637a6e656a206920656b6f6c6f6769637a6e656a207a7769c4857a616e656a207a2075c5bc79746b6f77616e69656d20737461727963682073616d6f63686f64266f61637574653b77266e6273703b3c2f6c693e0d0a3c6c693e6f7267616e697a6f77616e6965206b6f6e74616b74266f61637574653b77206b6f6c65c5bc65c584736b6963682077c59b72266f61637574653b642075c5bc79746b6f776e696b266f61637574653b7720692073796d706174796b266f61637574653b7720737461727963682073616d6f63686f64266f61637574653b773c2f6c693e0d0a3c6c693e6f7267616e697a6f77616e69652073706f746b61c58420746f7761727a79736b6f2d6479736b7573796a6e7963682075c5bc79746b6f776e696b266f61637574653b7720737461727963682073616d6f63686f64266f61637574653b7720772063656c752077796d69616e7920646fc59b77696164637a65c5843c2f6c693e0d0a3c6c693e6f7267616e697a6f77616e69652074757279737479637a6e7963682072616a64266f61637574653b772073616d6f63686f646f777963683c2f6c693e0d0a3c2f756c3e0d0a3c703e266e6273703b3c2f703e, 1, 30, 1, 1, 3, 1, NULL, NULL, NULL, NULL, 0, '2013-01-06 12:06:04', 1, '2013-04-07 12:29:07', 1, '', '0000-00-00 00:00:00'),
(app_id, 'Informacja  o  możliwościach kontaktu ', 0x3c703e426975726f2073746f7761727a79737a656e696120637a796e6e65206a65737420636f647a69656e6e6965207720676f647a2e206f6420392e303020646f2031372e30303c2f703e, 1, 50, 1, 1, 1, 1, NULL, NULL, NULL, NULL, 0, '2013-01-06 12:06:04', 1, '2013-03-29 14:58:02', 15, '', '0000-00-00 00:00:00'),
(app_id, 'Sposób dostępności dla osób niepełnosprawnych ', 0x3c703e4272616b20646f7374c499707520266e646173683b20626975726f207a6e616a64756a65207369c499206e61207069657277737a796d207069c49974727a652077206b616d69656e6963792062657a2077696e64792e3c2f703e, 1, 60, 1, 1, 1, 1, NULL, NULL, NULL, NULL, 0, '2013-01-06 12:06:04', 1, '2013-03-29 14:58:20', 15, '', '0000-00-00 00:00:00'),
(app_id, 'Numer KRS', 0x3c703e3c7370616e207374796c653d22636f6c6f723a20233030303066663b223e3c6120687265663d2268747470733a2f2f656d732e6d732e676f762e706c2f6b72732f7779737a756b6977616e6965706f646d696f7475223e303030303131313131313c2f613e3c2f7370616e3e3c2f703e, 1, 70, 1, 1, 1, 1, NULL, NULL, NULL, NULL, 0, '2013-01-06 12:06:04', 1, '2013-03-29 14:59:24', 15, '', '0000-00-00 00:00:00'),
(app_id, 'Numer NIP', 0x3c703e3939392d3838382d37372d36363c2f703e, 1, 80, 1, 1, 1, 1, NULL, NULL, NULL, NULL, 0, '2013-01-06 12:06:04', 1, '2013-03-29 15:00:04', 15, '', '0000-00-00 00:00:00'),
(app_id, 'Numer konta bankowego', 0x3c703e42414e4b20504f4c534b493c2f703e0d0a3c703e393920383838382037373737203636363620353535352034343434203333333320266e6273703b3c2f703e, 1, 90, 1, 1, 1, 1, NULL, NULL, NULL, NULL, 0, '2013-01-06 12:06:04', 1, '2013-03-29 15:00:27', 15, '', '0000-00-00 00:00:00'),
(app_id, 'Aktualne składy osobowe organów statutowych ', 0x3c703e5a61727ac485642053746f7761727a79737a656e69613a3c2f703e0d0a3c703e4a616e696e61204b6f77616c736b6120266e646173683b207072657a65733c2f703e0d0a3c703e4a616b204e6f77616b20266e646173683b20776963657072657a65733c2f703e0d0a3c703e4164616d205769c59b6e696577736b6920266e646173683b20736b6172626e696b3c2f703e0d0a3c703e266e6273703b3c2f703e0d0a3c703e4b6f6d69736a6120526577697a796a6e613a3c2f703e0d0a3c703e4461726975737a20506f6c616b20266e646173683b2070727a65776f646e69637ac48563793c2f703e0d0a3c703e416e6e6120506f6c61c584736b6120266e646173683b20637ac5826f6e656b3c2f703e0d0a3c703e4b617461727a796e6120506f6c20266e646173683b20637ac5826f6e656b3c2f703e, 1, 100, 1, 1, 1, 1, NULL, NULL, NULL, NULL, 0, '2013-01-06 12:06:04', 1, '2013-03-29 15:00:56', 15, '', '0000-00-00 00:00:00'),
(app_id, '', 0x3c703e507261636f776e6963792062697572613a3c2f703e0d0a3c703e4a616e696e61204b6f77616c736b613a206b6f6f7264796e61746f726b612070726f6a656b74752026626471756f3b4d6f6461206e61207769656b6f7765206175746f26726471756f3b3c2f703e0d0a3c703e74656c2e203332203939392038382037372c20652d6d61696c3a206a616e696e6140736d73732e706c3c2f703e0d0a3c703e266e6273703b3c2f703e0d0a3c703e4a616b204e6f77616b3a206b6f6f7264796e61746f722070726f6a656b74752026626471756f3b5275737a616a6d792072617a656d26726471756f3b3c2f703e0d0a3c703e74656c2e203332203939392038382037372c20652d6d61696c3a206a616e40736d73732e706c3c2f703e0d0a3c703e266e6273703b3c2f703e0d0a3c703e4b617461727a796e612057696c6b3a206b7369c499676f77613c2f703e0d0a3c703e74656c2e203332203939392038382037372c20652d6d61696c3a206b617461727a796e6140736d73732e706c3c2f703e, 0, 110, 1, 1, 6, 1, NULL, NULL, NULL, NULL, 0, '2013-01-06 12:06:04', 1, '2013-04-17 14:25:45', 15, '', '0000-00-00 00:00:00'),
(app_id, 'Imię i Nazwisko', 0x3c703e4a616e204b6f77616c736b693c2f703e, 1, 120, 1, 1, 13, 1, NULL, NULL, NULL, NULL, 0, '2013-01-06 12:06:04', 1, '2013-03-29 16:45:26', 15, '', '0000-00-00 00:00:00'),
(app_id, 'E-mail', 0x3c703e6a616e40736d73732e706c3c2f703e, 1, 130, 1, 1, 13, 1, NULL, NULL, NULL, NULL, 0, '2013-01-06 12:06:04', 1, '2013-03-29 16:45:42', 15, '', '0000-00-00 00:00:00'),
(app_id, 'Telefon, fax', 0x3c616464726573733e3c61626272207469746c653d2254656c65666f6e223e74656c3a3c2f616262723e20282b343829266e6273703b3c7370616e3e333220333536373839303c2f7370616e3e3c6272202f3e206661783a20282b343829266e6273703b3c7370616e3e333220333536373839303c2f7370616e3e3c2f616464726573733e, 1, 140, 1, 1, 13, 1, NULL, NULL, NULL, NULL, 0, '2013-01-06 12:06:04', 1, '2013-03-29 16:46:14', 15, '', '0000-00-00 00:00:00'),
(app_id, 'Adres', 0x3c616464726573733e5069c582737564736b6965676f2031352f3520287069657277737a65207069c49974726f293c6272202f3e204b61746f776963652c2034302d3030313c2f616464726573733e, 1, 150, 1, 1, 13, 1, NULL, NULL, NULL, NULL, 0, '2013-01-06 12:06:04', 1, '2013-03-29 16:46:32', 15, '', '0000-00-00 00:00:00'),
(app_id, 'Misja', 0x3c703e4d69736ac4852073746f7761727a79737a656e6961206a65737420706f70756c6172797a6f77616e69652077c59b72266f61637574653b64206d6965737a6b61c58463266f61637574653b7720506f6c736b6920696465692075c5bc79746b6f77616e696120737461727963682073616d6f63686f64266f61637574653b772e3c2f703e, 0, 160, 1, 1, 3, 1, NULL, NULL, NULL, NULL, 0, '2013-01-06 12:06:04', 1, '2013-03-29 15:03:48', 15, '', '0000-00-00 00:00:00'),
(app_id, 'Opisy świadczonych usług bezpłatnie', 0x3c703e3c7370616e207374796c653d22636f6c6f723a20233030303030303b223e3c7370616e207374796c653d22666f6e742d66616d696c793a202754696d6573204e657720526f6d616e272c2073657269663b223e3c7370616e207374796c653d22666f6e742d73697a653a20736d616c6c3b223e53746f7761727a79737a616e6965206f666572756a65206e617374c49970756ac4856365207573c5827567693a3c2f7370616e3e3c2f7370616e3e3c2f7370616e3e3c2f703e0d0a3c703e3c7370616e207374796c653d22636f6c6f723a20233030303030303b223e3c7370616e207374796c653d22666f6e742d66616d696c793a202754696d6573204e657720526f6d616e272c2073657269663b223e3c7370616e207374796c653d22666f6e742d73697a653a20736d616c6c3b223e2d20706f6d6f6320737065636a616c69737479637a6e6120772072656e6f7761636a6920737461727963682073616d6f63686f64266f61637574653b773c2f7370616e3e3c2f7370616e3e3c2f7370616e3e3c2f703e0d0a3c703e3c7370616e207374796c653d22636f6c6f723a20233030303030303b223e3c7370616e207374796c653d22666f6e742d66616d696c793a202754696d6573204e657720526f6d616e272c2073657269663b223e3c7370616e207374796c653d22666f6e742d73697a653a20736d616c6c3b223e2d206d6fc5bc6c69776fc59bc4872075637a6573746e6963747761207720696e7465726e65746f77796d20666f72756d2075c5bc79746b6f776e696b266f61637574653b7720737461727963682073616d6f63686f64266f61637574653b773c2f7370616e3e3c2f7370616e3e3c2f7370616e3e3c2f703e0d0a3c703e3c7370616e207374796c653d22636f6c6f723a20233030303030303b223e3c7370616e207374796c653d22666f6e742d66616d696c793a202754696d6573204e657720526f6d616e272c2073657269663b223e3c7370616e207374796c653d22666f6e742d73697a653a20736d616c6c3b223e2d206d6fc5bc6c69776fc59bc4872075637a6573746e696374776120772072616a646163682073616d6f63686f646f77796368206f7267616e697a6f77616e7963682070727a657a2073746f7761727a79737a656e6965203c2f7370616e3e3c2f7370616e3e3c2f7370616e3e3c2f703e0d0a3c703e3c7370616e207374796c653d22636f6c6f723a20233030303030303b223e3c7370616e207374796c653d22666f6e742d66616d696c793a202754696d6573204e657720526f6d616e272c2073657269663b223e3c7370616e207374796c653d22666f6e742d73697a653a20736d616c6c3b223e2d206d6fc5bc6c69776fc59bc4872075637a6573746e696374776120772073706f746b616e6961636820746f7761727a79736b6f2d6479736b7573796a6e7963682075c5bc79746b6f776e696b266f61637574653b7720737461727963682073616d6f63686f64266f61637574653b77266e6273703b3c2f7370616e3e3c2f7370616e3e3c2f7370616e3e3c2f703e, 1, 190, 1, 1, 4, 1, NULL, NULL, NULL, NULL, 0, '2013-01-06 12:06:04', 1, '2013-03-29 15:04:21', 15, '', '0000-00-00 00:00:00'),
(app_id, 'Warunki/zasady świadczonych usług bezpłatnie', 0x3c703e57737a7973746b69652077796d69656e696f6e65207779c5bc656a207573c58275676920646f7374c499706e652073c48520646c61206b61c5bc64656a207a61696e74657265736f77616e656a206f736f62792e204a6564796ec485206b6f6e6965637a6e6fc59b6369c485206a65737420706f73696164616e6965207374617265676f2073616d6f63686f64752e3c2f703e, 0, 200, 1, 1, 4, 1, 19, NULL, NULL, NULL, 0, '2013-01-06 12:06:04', 1, '2013-03-29 15:04:37', 15, '', '0000-00-00 00:00:00'),
(app_id, 'Realizowane projekty ', '', 1, 240, 1, 1, 7, 2, NULL, 1, NULL, NULL, 0, '2013-01-06 12:06:04', 1, '2013-03-29 16:55:58', 15, '', '0000-00-00 00:00:00'),
(app_id, 'Zrealizowane projekty ', NULL, 1, 250, 1, 1, 7, 2, NULL, 2, NULL, NULL, 0, '2013-01-06 12:06:04', 1, '2012-11-19 22:53:34', 1, NULL, NULL),
(app_id, 'Sprawozdania ze zrealizowanych projektów dla grantodawców ', 0x57696e646f7773206973207265696e76656e746564207769746820616e20616c6c2d6e657720746f75636820696e746572666163652c2057696e646f77732053746f72652c20616e642064657620706c6174666f726d2074686174206c65747320796f752073656c6c2061707073206163726f73732074686520676c6f62652e, 0, 260, 0, 1, 7, 1, NULL, NULL, NULL, NULL, 0, '2013-01-06 12:06:04', 1, NULL, NULL, NULL, NULL),
(app_id, '', NULL, 1, 270, 1, 1, 8, 1, NULL, NULL, 1, NULL, 0, '2013-01-06 12:06:04', 1, '2012-12-15 15:42:29', 1, NULL, NULL),
(app_id, 'Zbiórki publiczne ', '', 0, 280, 1, 1, 9, 2, NULL, NULL, 2, NULL, 0, '2013-01-06 12:06:04', 1, '2013-03-29 16:57:09', 15, '', '0000-00-00 00:00:00'),
(app_id, 'Środki publiczne', '', 1, 300, 1, 1, 9, 2, NULL, NULL, NULL, 2, 0, '2013-01-06 12:06:04', 1, '2013-03-29 14:48:48', 15, '', '0000-00-00 00:00:00'),
(app_id, 'Środki prywatne', '', 1, 330, 1, 1, 9, 2, NULL, NULL, NULL, 1, 0, '2013-01-06 12:06:04', 1, '2013-03-29 16:57:25', 15, '', '0000-00-00 00:00:00'),
(app_id, NULL, NULL, 0, 370, 1, 1, 10, 1, NULL, NULL, NULL, NULL, 1, '2013-01-06 12:06:04', 1, '2013-02-24 12:53:00', 1, NULL, NULL),
(app_id, '', 0x3c703e3c7374726f6e673e57206a616b692073706f73266f61637574653b62206d6fc5bc6e6120757a79736b61c48720696e666f726d61636a652c206b74266f61637574653b7265206e6965207a6f737461c582792075646f7374c499706e696f6e652077204249503f3c2f7374726f6e673e3c2f703e0d0a3c703e5a676f646e6965207a207573746177c485206f20646f7374c49970696520646f20696e666f726d61636a69207075626c69637a6e656a2c20696e666f726d61636a61207075626c69637a6e612c206b74266f61637574653b7261206e6965207a6f737461c582612075646f7374c499706e696f6e612077204269756c6574796e696520496e666f726d61636a69205075626c69637a6e656a2c2075646f7374c499706e69616e61206a657374206e6120776e696f73656b207a61696e74657265736f77616e65676f20287a612077796ac485746b69656d20696e666f726d61636a6920707261776e6965206368726f6e696f6e7963682c206f206b74266f61637574653b72796368206d6f776120706f6e69c5bc656a292e3c6272202f3e3c6272202f3e55646f7374c499706e69656e696520696e666f726d61636a69206e6120776e696f73656b206e617374c49970756a65202262657a207a62c499646e656a207a77c5826f6b69222c206e69652070266f61637574653bc5ba6e69656a206e69c5bc2077207465726d696e696520313420646e69206f6420646e6961207ac5826fc5bc656e696120776e696f736b752e204a65c5bc656c6920696e666f726d61636a61207075626c69637a6e61206e6965206d6fc5bc65206279c4872075646f7374c499706e696f6e6120772074796d207465726d696e69652c20706f646d696f74206f626f7769c4857a616e7920646f206a656a2075646f7374c499706e69656e696120706f77696164616d696120776e696f736b6f64617763c499206f20706f776f64616368206f70266f61637574653bc5ba6e69656e6961206f72617a206f207465726d696e69652c2077206a616b696d2075646f7374c499706e6920696e666f726d61636ac4992c206e69652064c58275c5bc737a796d206a65646e616b206e69c5bc2032206d69657369c4856365206f6420646e6961207ac5826fc5bc656e696120776e696f736b752e3c6272202f3e3c6272202f3e496e666f726d61636a61207075626c69637a6e612c206b74266f61637574653b7261206d6fc5bc65206279c487206e69657a77c5826f637a6e69652075646f7374c499706e696f6e612c206a6573742075646f7374c499706e69616e61207720666f726d6965207573746e656a206c756220706973656d6e656a2062657a20706973656d6e65676f20776e696f736b752e3c6272202f3e3c6272202f3e496e7374797475636a612075646f7374c499706e69616ac485636120696e666f726d61636ac499206d61206f626f7769c4857a656b20756d6fc5bc6c697769c487206a656a20736b6f70696f77616e69652c2077796472756b6f77616e69652c2070727a6573c582616e6965206c75622070727a656e69657369656e6965206e6120706f77737a6563686e69652075c5bc7977616e79206e6fc59b6e696b20696e666f726d617479637a6e792e3c6272202f3e3c6272202f3e4a65c5bc656c6920696e666f726d61636a61207075626c69637a6e61206e6965206d6fc5bc65206279c4872075646f7374c499706e696f6e6120772073706f73266f61637574653b62206c7562207720666f726d6965206f6b7265c59b6c6f6e79636820776520776e696f736b752c20706f646d696f74206f626f7769c4857a616e7920646f2075646f7374c499706e69656e696120706f77696164616d696120706973656d6e696520776e696f736b6f64617763c499206f2070727a79637a796e616368206272616b75206d6fc5bc6c69776fc59b63692075646f7374c499706e69656e696120696e666f726d61636a69207a676f646e6965207a20776e696f736b69656d20692077736b617a756a652c2077206a616b692073706f73266f61637574653b62206c75622077206a616b69656a20666f726d696520696e666f726d61636a61206d6fc5bc65206279c4872075646f7374c499706e696f6e61206e69657a77c5826f637a6e69652e20572074616b696d2070727a797061646b752c206a65c5bc656c692077207465726d696e696520313420646e69206f6420706f776961646f6d69656e696120776e696f736b6f6461776361206e6965207ac5826fc5bc7920776e696f736b75206f2075646f7374c499706e69656e696520696e666f726d61636a6920772073706f73266f61637574653b62206c7562207720666f726d69652077736b617a616e796368207720706f776961646f6d69656e69752c20706f7374c499706f77616e6965206f2075646f7374c499706e69656e696520696e666f726d61636a6920756d61727a61207369c4992e3c6272202f3e3c6272202f3e4f646d6f77612075646f7374c499706e69656e696120696e666f726d61636a69207075626c69637a6e656a206f72617a20756d6f727a656e696520706f7374c499706f77616e6961206f2075646f7374c499706e69656e696520696e666f726d61636a692070727a657a206f7267616e206e617374c49970756ac48520772064726f647a6520646563797a6a692061646d696e697374726163796a6e656a2e3c2f703e0d0a3c703e3c7374726f6e673e4b6965647920646f7374c4997020646f20696e666f726d61636a69207075626c69637a6e656a206a657374206f6772616e69637a6f6e793f3c2f7374726f6e673e3c2f703e0d0a3c703e507261776f20646f20696e666f726d61636a69207075626c69637a6e656a20706f646c656761206f6772616e69637a656e69752077207a616b72657369652069206e61207a61736164616368206f6b7265c59b6c6f6e79636820772070727a65706973616368206f206f6368726f6e696520696e666f726d61636a69206e69656a61776e796368206f72617a206f206f6368726f6e696520696e6e7963682074616a656d6e69632075737461776f776f206368726f6e696f6e7963682e3c2f703e0d0a3c703e507261776f20646f20696e666f726d61636a69207075626c69637a6e656a20706f646c656761206f6772616e69637a656e6975207a6520777a676cc4996475206e61207072797761746e6fc59bc487206f736f62792066697a79637a6e656a206c75622074616a656d6e6963c4992070727a65647369c49962696f7263792e204f6772616e69637a656e696520746f206e696520646f7479637a7920696e666f726d61636a69206f206f736f62616368207065c5826e69c485637963682066756e6b636a65207075626c69637a6e652c206d616ac48563796368207a7769c4857a656b207a207065c5826e69656e69656d20747963682066756e6b636a692c20772074796d206f20776172756e6b61636820706f776965727a656e696120692077796b6f6e7977616e69612066756e6b636a692c206f72617a2070727a797061646b752c20676479206f736f62612066697a79637a6e61206c75622070727a65647369c49962696f7263612072657a79676e756ac485207a2070727a7973c5827567756ac4856365676f20696d2070726177612e3c2f703e0d0a3c703e3c7374726f6e673e57206a616b692073706f73266f61637574653b62207ac5826fc5bc79c48720776e696f73656b3f3c2f7374726f6e673e3c2f703e0d0a3c703e576e696f73656b20706973656d6e79206f2075646f7374c499706e69656e696520696e666f726d61636a69207075626c69637a6e656a2e20466f726d6120776e696f736b75206a65737420646f776f6c6e612e204d6fc5bc6e6120736b6f727a79737461c487207a20676f746f7765676f20666f726d756c61727a612c206b74266f61637574653b7279207a616d6965737a637a6f6e79206a65737420706f6e69c5bc656a2e20572063656c7520757a79736b616e6961206f64706f776965647a69206e6120776e696f73656b206f20646f7374c4997020646f20696e666f726d61636a69207075626c69637a6e656a206e69652073c4852077796d6167616e652064616e65206f736f626f776520776e696f736b6f64617763792e204b6f6e6965637a6e65206e61746f6d696173742073c4852064616e65206b6f6e74616b746f77652c206e702e20616472657320652d6d61696c2c206e61206b74266f61637574653b7279207a6f7374616e69652070727a6573c582616e61206f64706f77696564c5ba2e2044616e65206f736f626f77652077796d6167616e652073c485206e61746f6d6961737420772070727a797061646b75206b69656479206f7267616e20777964616a6520646563797a6ac4992061646d696e697374726163796a6ec485206f206f646d6f7769652075646f7374c499706e69656e696120696e666f726d61636a69207075626c69637a6e656a206c756220756d6f727a656e697520706f7374c499706f77616e69612e204a65c59b6c6920776e696f736b6f6461776361206e6120657461706965207ac5826fc5bc656e696120776e696f736b75206e696520706f64612064616e796368206f736f626f777963682c20746f20772070727a797061646b75206b6f6e6965637a6e6fc59b636920777964616e696120646563797a6a692061646d696e697374726163796a6e656a2c2062c499647a69652070726f737a6f6e79206f2069636820757a757065c5826e69656e69652e3c2f703e0d0a3c703e576e696f736b69206f2075646f7374c499706e69656e696520696e666f726d61636a69207075626c69637a6e656a206d6fc5bc6e6120736bc582616461c4872062657a706fc59b7265646e696f207720626975727a652053746f7761727a79737a656e69612070727a792e20756c2e205069c582737564736b6965676f2031352f352077204b61746f776963616368202849207069c49974726f292e20576e696f736b69206d6fc5bc6e612074616bc5bc6520736bc582616461c487207a6120706f6d6f63c4852074656c65666f6e7520692074656c6566616b737520286e756d65723a2033322033353637383930292c20706f637a7479202861647265733a2034302d303031204b61746f776963652c20756c2e205069c582737564736b6965676f2031352f3529206c756220706f637a747920656c656b74726f6e69637a6e656a202861647265733a20626975726f40736d73732e706c292e3c2f703e0d0a3c703e3c6120687265663d22687474703a2f2f69736162656c2e64726c2e706c2f6269702f6d6174657269616c792f576e696f73656b5f6f5f696e665f7075626c2e646f6322207461726765743d225f626c616e6b223e577a266f61637574653b7220776e696f736b75206f2075646f7374c499706e69656e696520696e666f726d61636a69207075626c69637a6e656a3c2f613e3c2f703e0d0a3c703e266e6273703b3c2f703e, 1, 400, 1, 1, 11, 1, NULL, NULL, NULL, NULL, 0, '2013-01-06 12:06:04', 1, '2013-03-29 16:53:32', 15, '', '0000-00-00 00:00:00'),
(app_id, NULL, 0x20, 1, 420, 0, 1, 9, 1, 35, NULL, NULL, NULL, 0, '2013-01-06 12:06:04', 1, NULL, NULL, NULL, NULL),
(app_id, '', 0x3c703e3c7374726f6e673e5374726f6e612047c582266f61637574653b776e613c2f7374726f6e673e202d207a61776965726120696e666f726d61636a65206f67266f61637574653b6c6e65206e612074656d61742053746f7761727a79737a656e6961204d69c5826fc59b6e696b266f61637574653b7720537461727963682053616d6f63686f64266f61637574653b77206f72617a206f646e6fc59b6e696b6920646f206b6174616c6f67266f61637574653b773b3c2f703e0d0a3c703e3c7374726f6e673e4d656e753c2f7374726f6e673e202d207a617769657261206f646e6fc59b6e696b6920646f206b6174616c6f67266f61637574653b7720706f677275706f77616e79636820776564c5827567206b727974657269266f61637574653b772074656d617479637a6e7963683b3c2f703e0d0a3c703e3c7374726f6e673e496e666f726d61636a65206e696575646f7374c499706e696f6e652077204249503c2f7374726f6e673e202d207a61776965726120696e666f726d61636a65206f20646f6b756d656e74616368206e696575646f7374c499706e696f6e7963682077204269756c6574796e696520496e666f726d61636a69205075626c69637a6e656a2c2073706f736f6261636820692070726f636564757261636820757a79736b616e696120646f7374c499707520646f207479636820646f6b756d656e74266f61637574653b77206f72617a206f206f6772616e69637a656e6961636820646f7374c499707520646f20696e666f726d61636a69207075626c69637a6e656a2077796e696b616ac48563796368207a2075737461773b3c2f703e0d0a3c703e3c7374726f6e673e496e737472756b636a61206b6f727a797374616e6961207a204249503c2f7374726f6e673e202d207a617769657261206f70697320656c656d656e74266f61637574653b77207a6e616a64756ac48563796368207369c499206e61207374726f6e6965204269756c6574796e7520496e666f726d61636a69205075626c69637a6e656a3b3c2f703e0d0a3c703e3c7374726f6e673e4d6f6475c582207779737a756b756ac48563793c2f7374726f6e673e20266e646173683b20756d6fc5bc6c69776961207779737a756b6977616e696520696e666f726d61636a69207a6e616a64756ac48563796368207369c4992077204249503c2f703e0d0a3c703e3c7374726f6e673e526564616b636a61204249503c2f7374726f6e673e20266e646173683b207a61776965726120696d69c4992069206e617a7769736b6f2c206e756d65722074656c65666f6e752c206e756d65722074656c6566616b7375206920616472657320706f637a747920656c656b74726f6e69637a6e656a20636f206e616a6d6e69656a206a65646e656a207a206f73266f61637574653b62207265646167756ac48563796368207374726f6ec4992067c582266f61637574653b776ec485204249503b3c2f703e0d0a3c703e3c7374726f6e673e446f6b756d656e74792077205044463c2f7374726f6e673e202d20437ac499c59bc48720646f6b756d656e74266f61637574653b772075646f7374c499706e696f6e796368207720424950207a61706973616e61206a657374207720666f726d61636965205044462e20416279206a65206f64637a797461c4872074727a656261206d6965c487206e61206b6f6d70757465727a65207a61696e7374616c6f77616e792062657a70c58261746e792070726f6772616d204163726f626174205265616465722e3c6272202f3e4e616c65c5bc79206b6c696b6ec485c4873a203c6120687265663d22687474703a2f2f7777772e61646f62652e636f6d2f70726f64756374732f6163726f6261747265616473746570322e68746d6c223e687474703a2f2f7777772e61646f62652e636f6d2f70726f64756374732f6163726f6261747265616473746570322e68746d6c3c2f613e2c2061627920706f627261c4872074c4992061706c696b61636ac4992e20266e6273703b3c2f703e, 1, 440, 1, 1, 12, 1, NULL, NULL, NULL, NULL, 0, '2013-01-06 12:06:04', 1, '2013-03-29 16:54:11', 15, '', '0000-00-00 00:00:00'),
(app_id, 'Status Organizacji Pożytku Publicznego', 0x3c703e74616b3c2f703e, 0, 15, 1, 1, 1, 1, NULL, NULL, NULL, NULL, 0, '2013-01-05 00:28:37', 1, '2013-03-29 12:55:18', 15, '', '0000-00-00 00:00:00'),
(app_id, 'Numer REGON', 0x3c703e3939393838373736363c2f703e, 1, 85, 1, 1, 1, 1, NULL, NULL, NULL, NULL, 0, '2013-04-07 00:00:00', 1, '2013-04-20 13:28:43', 15, '', '0000-00-00 00:00:00'),
(app_id, '', NULL, 0, 10, 0, 1, 15, 1, NULL, NULL, 5, NULL, 0, '2013-04-07 00:00:00', 1, '2013-04-07 21:29:48', 1, NULL, NULL);

go
DELIMITER ;
