SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

INSERT INTO `client` (`id`, `company`, `address`, `postcode`, `city`, `country`, `email`, `website`, `created`, `createdby`, `modified`, `modifiedby`, `locked`, `lockedtime`) VALUES
(1, 'Unternehmen', NULL, NULL, NULL, 'DE', NULL, NULL, NULL, 0, NULL, 0, 0, NULL);

INSERT INTO `config` (`id`, `timezone`, `language`, `clientid`, `created`, `createdby`, `modified`, `modifiedby`, `locked`, `lockedtime`) VALUES
(1, 'Europe/Berlin', 'de_DE', 1, NULL, 0, '2015-11-26 11:21:28', 1, 1, '2015-11-26 11:21:28');

INSERT INTO `country` (`id`, `code`, `name`, `language`, `clientid`, `created`, `createdby`, `modified`, `modifiedby`, `locked`, `lockedtime`) VALUES
(1, 'AF', 'Afghanistan', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(2, 'EG', 'Ägypten', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(3, 'AX', 'Åland', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(4, 'AL', 'Albanien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(5, 'DZ', 'Algerien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(6, 'VI', 'Amerikanische Jungferninseln', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(7, 'AS', 'Amerikanisch-Samoa', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(8, 'AD', 'Andorra', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(9, 'AO', 'Angola', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(10, 'AI', 'Anguilla', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(11, 'AQ', 'Antarktika', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(12, 'AG', 'Antigua und Barbuda', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(13, 'GQ', 'Äquatorialguinea', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(14, 'AR', 'Argentinien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(15, 'AM', 'Armenien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(16, 'AW', 'Aruba', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(17, 'AZ', 'Aserbaidschan', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(18, 'ET', 'Äthiopien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(19, 'AU', 'Australien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(20, 'BS', 'Bahamas', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(21, 'BH', 'Bahrain', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(22, 'BD', 'Bangladesch', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(23, 'BB', 'Barbados', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(24, 'TF', 'Bassas da India', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(25, 'BY', 'Belarus', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(26, 'BE', 'Belgien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(27, 'BZ', 'Belize', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(28, 'BJ', 'Benin', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(29, 'BM', 'Bermuda', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(30, 'BT', 'Bhutan', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(31, 'BO', 'Bolivien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(32, 'BA', 'Bosnien und Herzegowina', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(33, 'BW', 'Botsuana', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(34, 'BV', 'Bouvetinsel', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(35, 'BR', 'Brasilien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(36, 'VG', 'Britische Jungferninseln', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(37, 'IO', 'Britisches Territorium im Indischen Ozean', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(38, 'BN', 'Brunei Darussalam', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(39, 'BG', 'Bulgarien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(40, 'BF', 'Burkina Faso', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(41, 'BI', 'Burundi', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(42, 'CL', 'Chile', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(43, 'CN', 'China', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(44, 'FR', 'Clipperton', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(45, 'CK', 'Cookinseln', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(46, 'CR', 'Costa Rica', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(47, 'CI', 'Côte d´Ivoire', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(48, 'DK', 'Dänemark', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(49, 'DE', 'Deutschland', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(50, 'DM', 'Dominica', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(51, 'DO', 'Dominikanische Republik', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(52, 'DJ', 'Dschibuti', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(53, 'EC', 'Ecuador', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(54, 'SV', 'El Salvador', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(55, 'ER', 'Eritrea', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(56, 'EE', 'Estland', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(57, 'TF', 'Europa', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(58, 'FK', 'Falklandinseln', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(59, 'FO', 'Färöer', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(60, 'FJ', 'Fidschi', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(61, 'FI', 'Finnland', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(62, 'FX', 'France, Metropolitan', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(63, 'FR', 'Frankreich', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(64, 'TF', 'Französische Süd- und Antarktisgebiete', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(65, 'GF', 'Französisch-Guayana', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(66, 'PF', 'Französisch-Polynesien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(67, 'GA', 'Gabun', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(68, 'GM', 'Gambia', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(69, 'PS', 'Gazastreifen', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(70, 'GE', 'Georgien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(71, 'GH', 'Ghana', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(72, 'GI', 'Gibraltar', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(73, 'TF', 'Glorieuses', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(74, 'GD', 'Grenada', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(75, 'GR', 'Griechenland', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(76, 'GL', 'Grönland', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(77, 'GB', 'Großbritannien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(78, 'GP', 'Guadeloupe', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(79, 'GU', 'Guam', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(80, 'GT', 'Guatemala', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(81, 'GG', 'Guernsey', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(82, 'GN', 'Guinea', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(83, 'GW', 'Guinea-Bissau', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(84, 'GY', 'Guyana', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(85, 'HT', 'Haiti', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(86, 'HM', 'Heard und McDonaldinseln', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(87, 'HN', 'Honduras', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(88, 'HK', 'Hongkong', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(89, 'IN', 'Indien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(90, 'ID', 'Indonesien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(91, 'IM', 'Insel Man', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(92, 'IQ', 'Irak', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(93, 'IR', 'Iran', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(94, 'IE', 'Irland', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(95, 'IS', 'Island', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(96, 'IL', 'Israel', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(97, 'IT', 'Italien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(98, 'JM', 'Jamaika', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(99, 'JP', 'Japan', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(100, 'YE', 'Jemen', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(101, 'JE', 'Jersey', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(102, 'JO', 'Jordanien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(103, 'TF', 'Juan de Nova', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(104, 'KY', 'Kaimaninseln', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(105, 'KH', 'Kambodscha', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(106, 'CM', 'Kamerun', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(107, 'CA', 'Kanada', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(108, 'CV', 'Kap Verde', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(109, 'KZ', 'Kasachstan', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(110, 'QA', 'Katar', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(111, 'KE', 'Kenia', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(112, 'KG', 'Kirgisistan', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(113, 'KI', 'Kiribati', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(114, 'UM', 'Kleinere Amerikanische Überseeinseln', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(115, 'CC', 'Kokosinseln (Keelinginseln)', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(116, 'CO', 'Kolumbien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(117, 'KM', 'Komoren', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(118, 'CG', 'Kongo', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(119, 'CD', 'Kongo, Demokratische Republik', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(120, 'KP', 'Korea, Demokratische Volksrepublik', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(121, 'KR', 'Korea, Republik', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(122, 'HR', 'Kroatien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(123, 'CU', 'Kuba', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(124, 'KW', 'Kuwait', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(125, 'LA', 'Laos', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(126, 'LS', 'Lesotho', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(127, 'LV', 'Lettland', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(128, 'LB', 'Libanon', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(129, 'LR', 'Liberia', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(130, 'LY', 'Libyen', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(131, 'LI', 'Liechtenstein', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(132, 'LT', 'Litauen', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(133, 'LU', 'Luxemburg', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(134, 'MO', 'Macau', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(135, 'MG', 'Madagaskar', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(136, 'MW', 'Malawi', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(137, 'MY', 'Malaysia', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(138, 'MV', 'Malediven', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(139, 'ML', 'Mali', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(140, 'MT', 'Malta', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(141, 'MA', 'Marokko', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(142, 'MH', 'Marshallinseln', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(143, 'MQ', 'Martinique', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(144, 'MR', 'Mauretanien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(145, 'MU', 'Mauritius', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(146, 'YT', 'Mayotte', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(147, 'MK', 'Mazedonien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(148, 'MX', 'Mexiko', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(149, 'FM', 'Mikronesien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(150, 'MD', 'Moldau', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(151, 'MC', 'Monaco', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(152, 'MN', 'Mongolei', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(153, 'ME', 'Montenegro', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(154, 'MS', 'Montserrat', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(155, 'MZ', 'Mosambik', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(156, 'MM', 'Myanmar', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(157, 'NA', 'Namibia', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(158, 'NR', 'Nauru', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(159, 'NP', 'Nepal', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(160, 'NC', 'Neukaledonien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(161, 'NZ', 'Neuseeland', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(162, 'NI', 'Nicaragua', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(163, 'NL', 'Niederlande', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(164, 'AN', 'Niederländische Antillen', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(165, 'NE', 'Niger', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(166, 'NG', 'Nigeria', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(167, 'NU', 'Niue', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(168, 'MP', 'Nördliche Marianen', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(169, 'NF', 'Norfolkinsel', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(170, 'NO', 'Norwegen', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(171, 'OM', 'Oman', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(172, 'AT', 'Österreich', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(173, 'PK', 'Pakistan', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(174, 'PW', 'Palau', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(175, 'PA', 'Panama', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(176, 'PG', 'Papua-Neuguinea', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(177, 'PY', 'Paraguay', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(178, 'PE', 'Peru', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(179, 'PH', 'Philippinen', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(180, 'PN', 'Pitcairninseln', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(181, 'PL', 'Polen', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(182, 'PT', 'Portugal', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(183, 'PR', 'Puerto Rico', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(184, 'RE', 'Réunion', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(185, 'RW', 'Ruanda', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(186, 'RO', 'Rumänien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(187, 'RU', 'Russische Föderation', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(188, 'MF', 'Saint-Martin', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(189, 'SB', 'Salomonen', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(190, 'ZM', 'Sambia', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(191, 'WS', 'Samoa', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(192, 'SM', 'San Marino', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(193, 'ST', 'São Tomé und Príncipe', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(194, 'SA', 'Saudi-Arabien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(195, 'SE', 'Schweden', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(196, 'CH', 'Schweiz', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(197, 'SN', 'Senegal', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(198, 'RS', 'Serbien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(199, 'CS', 'Serbien und Montenegro', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(200, 'SC', 'Seychellen', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(201, 'SL', 'Sierra Leone', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(202, 'ZW', 'Simbabwe', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(203, 'SG', 'Singapur', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(204, 'SK', 'Slowakei', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(205, 'SI', 'Slowenien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(206, 'SO', 'Somalia', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(207, 'ES', 'Spanien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(208, 'SJ', 'Spitzbergen', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(209, 'LK', 'Sri Lanka', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(210, 'BL', 'St. Barthélemy', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(211, 'SH', 'St. Helena, Ascension und Tristan da Cunha', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(212, 'KN', 'St. Kitts und Nevis', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(213, 'LC', 'St. Lucia', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(214, 'PM', 'St. Pierre und Miquelon', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(215, 'VC', 'St. Vincent und die Grenadinen', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(216, 'ZA', 'Südafrika', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(217, 'SD', 'Sudan', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(218, 'GS', 'Südgeorgien und die Südlichen Sandwichinseln', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(219, 'SS', 'Südsudan', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(220, 'SR', 'Suriname', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(221, 'SZ', 'Swasiland', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(222, 'SY', 'Syrien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(223, 'TJ', 'Tadschikistan', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(224, 'TW', 'Taiwan', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(225, 'TZ', 'Tansania', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(226, 'TH', 'Thailand', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(227, 'TL', 'Timor-Leste', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(228, 'TG', 'Togo', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(229, 'TK', 'Tokelau', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(230, 'TO', 'Tonga', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(231, 'TT', 'Trinidad und Tobago', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(232, 'TF', 'Tromelin', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(233, 'TD', 'Tschad', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(234, 'CZ', 'Tschechische Republik', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(235, 'TN', 'Tunesien', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(236, 'TR', 'Türkei', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(237, 'TM', 'Turkmenistan', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(238, 'TC', 'Turks- und Caicosinseln', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(239, 'TV', 'Tuvalu', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(240, 'UG', 'Uganda', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(241, 'UA', 'Ukraine', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(242, 'HU', 'Ungarn', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(243, 'UY', 'Uruguay', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(244, 'UZ', 'Usbekistan', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(245, 'VU', 'Vanuatu', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(246, 'VA', 'Vatikanstadt', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(247, 'VE', 'Venezuela', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(248, 'AE', 'Vereinigte Arabische Emirate', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(249, 'US', 'Vereinigte Staaten', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(250, 'VN', 'Vietnam', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(251, 'WF', 'Wallis und Futuna', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(252, 'CX', 'Weihnachtsinsel', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(253, 'PS', 'Westjordanland', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(254, 'EH', 'Westsahara', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(255, 'CF', 'Zentralafrikanische Republik', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL),
(256, 'CY', 'Zypern', 'de_DE', 1, NULL, 0, NULL, 0, 0, NULL);

INSERT INTO `currency` (`id`, `code`, `name`, `symbol`, `ordering`, `clientid`, `created`, `createdby`, `modified`, `modifiedby`, `locked`, `lockedtime`, `deleted`) VALUES
(1, 'EUR', 'Euro', '€', 0, 1, NULL, 0, NULL, 0, 0, NULL, 0),
(2, 'GBP', 'British pound', '£', 0, 1, NULL, 0, NULL, 0, 0, NULL, 0),
(3, 'USD', 'US Dollar', '$', 0, 1, NULL, 0, NULL, 0, 0, NULL, 0);

INSERT INTO `increment` (`clientid`, `contactid`, `creditnoteid`, `deliveryorderid`, `invoiceid`, `purchaseorderid`, `quoteid`, `quoterequestid`, `reminderid`, `salesorderid`) VALUES
(1, 10000, 10000, 10000, 10000, 10000, 10000, 10000, 10000, 10000);

INSERT INTO `language` (`id`, `code`, `name`, `ordering`, `clientid`, `created`, `createdby`, `modified`, `modifiedby`, `locked`, `lockedtime`) VALUES
(1, 'de_DE', 'Deutsch', 1, 1, NULL, 0, NULL, 0, 0, NULL);

INSERT INTO `module` (`id`, `name`, `menu`, `ordering`, `active`, `created`, `createdby`, `modified`, `modifiedby`, `locked`, `lockedtime`) VALUES
(1, 'Admin', '{}', 1, 1, NULL, 0, '2015-11-24 14:40:56', 1, 0, '2015-11-24 14:40:56'),
(2, 'Contacts', '{\n "CONTACTS": {\n  "title":"CONTACTS",\n  "module":"contacts",\n  "controller":"contact",\n  "action":"index"\n }\n}', 1, 1, '2015-11-21 16:48:39', 1, '2015-11-24 14:40:57', 1, 0, '2015-11-24 14:40:57'),
(3, 'Items', '{\n "ITEMS": {\n  "title":"ITEMS",\n  "module":"items",\n  "controller":"item",\n  "action":"index"\n }\n}', 1, 1, '2015-11-21 16:48:52', 1, '2015-11-24 14:40:50', 1, 0, '2015-11-24 14:40:50'),
(4, 'Processes', '{\n "PROCESSES": {\n  "title":"PROCESSES",\n  "module":"processes",\n  "controller":"process",\n  "action":"index"\n }\n}', 1, 1, '2015-11-21 16:49:01', 1, '2015-11-24 14:40:45', 1, 0, '2015-11-24 14:40:45'),
(5, 'Sales', '{\n "SALES": {\n  "title":"SALES",\n  "module":"sales",\n  "childs": {\n   "10": {\n    "title":"QUOTES",\n    "module":"sales",\n    "controller":"quote",\n    "action":"index"\n   },\n   "20": {\n    "title":"SALES_ORDERS",\n    "module":"sales",\n    "controller":"salesorder",\n    "action":"index"\n   },\n   "30": {\n    "title":"INVOICES",\n    "module":"sales",\n    "controller":"invoice",\n    "action":"index"\n   },\n   "40": {\n    "title":"DELIVERY_ORDERS",\n    "module":"sales",\n    "controller":"deliveryorder",\n    "action":"index"\n   },\n   "50": {\n    "title":"CREDIT_NOTES",\n    "module":"sales",\n    "controller":"creditnote",\n    "action":"index"\n   }\n  }\n }\n}', 1, 1, '2015-11-21 16:52:09', 1, '2015-11-24 14:40:04', 1, 0, '2015-11-24 14:40:04'),
(6, 'Purchases', '{\n "PURCHASES": {\n  "title":"PURCHASES",\n  "module":"purchases",\n  "childs": {\n   "10": {\n    "title":"QUOTE_REQUESTS",\n    "module":"purchases",\n    "controller":"quoterequest",\n    "action":"index"\n   },\n   "20": {\n    "title":"PURCHASE_ORDERS",\n    "module":"purchases",\n    "controller":"purchaseorder",\n    "action":"index"\n   }\n  }\n }\n}', 1, 1, '2015-11-21 17:05:52', 1, '2015-11-24 14:39:48', 1, 0, '2015-11-24 14:39:48'),
(7, 'Statistics', '{\n "STATISTICS": {\n  "title":"STATISTICS",\n  "module":"statistics",\n  "controller":"index",\n  "action":"index"\n }\n}', 1, 1, '2015-11-21 17:05:52', 1, '2015-11-24 14:40:37', 1, 0, '2015-11-24 14:40:37'),
(8, 'eBay', '{\n "EBAY": {\n  "title":"EBAY",\n  "module":"ebay",\n  "controller":"index",\n  "action":"index"\n }\n}', 1, 0, '2015-11-21 17:25:03', 1, '2015-11-24 14:39:15', 1, 0, '2015-11-24 14:39:15'),
(9, 'Magento', '{\n "MAGENTO": {\n  "title":"MAGENTO",\n  "module":"magento",\n  "childs": {\n   "10": {\n    "title":"MENU_MAGENTO_ORDERS",\n    "module":"magento",\n    "controller":"order",\n    "action":"index"\n   },\n   "20": {\n    "title":"MENU_MAGENTO_ITEMS",\n    "module":"magento",\n    "controller":"item",\n    "action":"index"\n   },\n   "30": {\n    "title":"MENU_MAGENTO_CUSTOMERS",\n    "module":"magento",\n    "controller":"customer",\n    "action":"index"\n   }\n  }\n }\n}', 1, 0, '2015-11-24 14:38:48', 1, '2015-11-24 14:38:57', 1, 0, '2015-11-24 14:38:57');

INSERT INTO `paymentmethod` (`id`, `title`, `ordering`, `clientid`, `created`, `createdby`, `modified`, `modifiedby`, `locked`, `lockedtime`) VALUES
(1, 'Vorkasse/Überweisung', 0, 1, '2015-12-06 15:32:04', 1, NULL, 0, 0, NULL),
(2, 'auf Rechnung', 0, 1, '2015-12-06 15:32:18', 1, NULL, 0, 0, NULL),
(3, 'per Lastschrift', 0, 1, '2015-12-06 15:32:18', 1, NULL, 0, 0, NULL),
(4, 'Kreditkarte/EC-Karte', 0, 1, '2015-12-06 15:32:18', 1, NULL, 0, 0, NULL),
(5, 'Paypal', 0, 1, '2015-12-06 15:32:23', 1, NULL, 0, 0, NULL);

INSERT INTO `permission` (`id`, `userid`, `default`, `contacts`, `items`, `processes`, `purchases`, `sales`, `statistics`, `clientid`, `created`, `createdby`, `modified`, `modifiedby`, `locked`, `lockedtime`, `deleted`) VALUES
(1, 1, '{\"index\":[\"view\"]}', '{\r\n\"contact\":[\"add\",\"edit\",\"view\",\"delete\"]\r\n}', '{\"item\":[\"add\",\"edit\",\"view\",\"delete\"],\"inventory\":[\"add\",\"edit\",\"view\",\"delete\"],\r\n\"pricerule\":[\"add\",\"edit\",\"view\",\"delete\"]}', '{\r\n\"process\":[\"add\",\"edit\",\"view\",\"delete\"]\r\n}', '{\r\n\"quoterequest\":[\"add\",\"edit\",\"view\",\"delete\"],\r\n\"purchaseorder\":[\"add\",\"edit\",\"view\",\"delete\"]\r\n}', '{\r\n\"quote\":[\"add\",\"edit\",\"view\",\"delete\"],\r\n\"salesorder\":[\"add\",\"edit\",\"view\",\"delete\"],\r\n\"deliveryorder\":[\"add\",\"edit\",\"view\",\"delete\"],\r\n\"invoice\":[\"add\",\"edit\",\"view\",\"delete\"],\r\n\"creditnote\":[\"add\",\"edit\",\"view\",\"delete\"],\r\n\"reminder\":[\"add\",\"edit\",\"view\",\"delete\"]\r\n}', '{\r\n\"index\":[\"view\"]\r\n}', 1, '2020-06-23 15:05:06', 1, NULL, 0, 1, '2020-07-05 18:34:11', 0);

INSERT INTO `shippingmethod` (`id`, `title`, `ordering`, `clientid`, `created`, `createdby`, `modified`, `modifiedby`, `locked`, `lockedtime`) VALUES
(1, 'Paketversand', 0, 1, '2015-12-06 15:33:33', 1, NULL, 0, 0, NULL),
(2, 'per Spedition', 0, 1, '2015-12-06 15:35:14', 1, NULL, 0, 0, NULL),
(3, 'Expressversand', 0, 1, '2015-12-06 15:33:33', 1, NULL, 0, 0, NULL),
(4, 'Selbstabholung', 0, 1, '2015-12-06 15:35:52', 1, NULL, 0, 0, NULL);

INSERT INTO `state` (`id`, `title`, `standard`, `completed`, `cancelled`, `extra`, `module`, `controller`, `color`, `ordering`, `clientid`) VALUES
(1, 'PROCESSES_STATE_CREATED', 1, 0, 0, 'standard', 'processes', 'process', NULL, 1, 1),
(2, 'PROCESSES_STATE_IN_PROGRESS', 0, 0, 0, NULL, 'processes', 'process', '#D3D3D3', 2, 1),
(3, 'PROCESSES_STATE_PLEASE_CHECK', 0, 0, 0, NULL, 'processes', 'process', '#FFFF00', 3, 1),
(4, 'PROCESSES_STATE_PLEASE_DELETE', 0, 0, 0, NULL, 'processes', 'process', '#FF0000', 4, 1),
(5, 'PROCESSES_STATE_COMPLETED', 0, 1, 0, 'completed', 'processes', 'process', NULL, 5, 1),
(6, 'PROCESSES_STATE_CANCELLED', 0, 0, 1, 'cancelled', 'processes', 'process', NULL, 6, 1);

INSERT INTO `taxrate` (`id`, `name`, `rate`, `ordering`, `clientid`, `created`, `createdby`, `modified`, `modifiedby`, `locked`, `lockedtime`) VALUES
(1, 'MwSt.', 19.0000, 1, 1, '2015-12-03 17:06:12', 1, NULL, 0, 0, NULL),
(2, 'MwSt.', 7.0000, 2, 1, '2015-12-03 17:06:12', 1, NULL, 0, 0, NULL);

INSERT INTO `template` (`id`, `description`, `filename`, `logo`, `website`, `default`, `ordering`, `clientid`, `created`, `createdby`, `modified`, `modifiedby`, `locked`, `lockedtime`, `activated`, `deleted`) VALUES
(1, 'Vorlage', NULL, NULL, NULL, 1, 1, 1, NULL, 0, NULL, 0, 0, NULL, 1, 0);

INSERT INTO `textblock` (`id`, `text`, `module`, `controller`, `section`, `ordering`, `clientid`, `created`, `createdby`, `modified`, `modifiedby`) VALUES
(1, '<p>Sehr geehrte Damen und Herren,</p>\n<p>vielen Dank f&uuml;r Ihre Anfrage und dem damit verbundenen Interesse. Gerne m&ouml;chten wir Ihnen folgendes Angebot unterbreiten;</p>', 'sales', 'quote', 'header', 1, 1, NULL, 0, '2020-04-25 18:19:59', 1),
(2, '<p>Wir w&uuml;rden uns freuen Ihren Auftrag zu erhalten. Bei Fragen z&ouml;gern Sie nicht uns zu kontaktieren.<br />Wir hoffen auf Ihre Zustimmung und freuen uns auf die Zusammenarbeit.</p>\n<p><strong>Lieferung:</strong> Frei Baustelle Deutschland, ausgenommen deutsche Inseln. Abladen bauseits.<br /><strong>Lieferung:</strong> EXW ab Werk inkl. Verpackung gem&auml;&szlig; Incoterms 2010<br /><strong>Lieferung:</strong> CIP Bestimmungsort innerhalb Deutschlands gem&auml;&szlig; Incoterms 2010, ausgenommen Ost- und Nordseeinseln</p>\n<p><strong>Lieferzeit:</strong> 3-4 Werktage nach Zahlungseingang und technischer Kl&auml;rung<br /><strong>Lieferzeit:</strong> 4-5 Wochen nach Zahlungseingang und Kl&auml;rung aller technischen Fragen und Einzelheiten</p>\n<p><strong>Zahlungsbedingungen:</strong> Vorkasse ohne Abzug<br /><strong>Zahlungsbedingungen:</strong> 50% Vorkasse, Rest bei Fertigstellung jedoch vor Verladung der Ware ohne Abzug</p>\n<p>Die allgemeinen Gesch&auml;ftsbedingungen finden Sie auf unserer Homepage.<br />Irrt&uuml;mer, &Auml;nderungen und Zwischenverkauf vorbehalten.</p>', 'sales', 'quote', 'footer', 2, 1, NULL, 0, '2020-04-25 18:20:45', 1),
(3, '<p>Sehr geehrte Damen und Herren,</p>\n<p>Wir bedanken uns f&uuml;r Ihren Auftrag. Gem&auml;&szlig; unseren allgemeinen Gesch&auml;ftsbedingungen bet&auml;tigen wir den Eingang des Auftrages (evtl. entgegenstehenden Einkaufsbedingungen wird hiermit widersprochen):</p>\n<p>Bitte &uuml;berpr&uuml;fen Sie Ihre Adressdaten auf Richtigkeit, da sp&auml;tere &Auml;nderungen auf der Rechnung nicht m&ouml;glich sind.</p>', 'sales', 'salesorder', 'header', 1, 1, NULL, 0, '2020-04-25 19:19:52', 1),
(4, '<p>Bei R&uuml;ckfragen stehen wir Ihnen selbstverst&auml;ndlich jederzeit gerne zur Verf&uuml;gung.</p>\n<p><strong>Lieferung:</strong> Frei Baustelle Deutschland, ausgenommen deutsche Inseln. Abladen bauseits.<br /><strong>Lieferung:</strong> EXW ab Werk inkl. Verpackung gem&auml;&szlig; Incoterms 2010<br /><strong>Lieferung:</strong> CIP Bestimmungsort innerhalb Deutschlands gem&auml;&szlig; Incoterms 2010, ausgenommen Ost- und Nordseeinseln</p>\n<p><strong>Lieferzeit:</strong> 3-4 Werktage nach Zahlungseingang und technischer Kl&auml;rung<br /><strong>Lieferzeit:</strong> 4-5 Wochen nach Zahlungseingang und Kl&auml;rung aller technischen Fragen und Einzelheiten</p>\n<p><strong>Zahlungsbedingungen:</strong> Vorkasse ohne Abzug<br /><strong>Zahlungsbedingungen:</strong> 50% Vorkasse, Rest bei Fertigstellung jedoch vor Verladung der Ware ohne Abzug</p>\n<p>Die allgemeinen Gesch&auml;ftsbedingungen finden Sie auf unserer Homepage.<br />Irrt&uuml;mer, &Auml;nderungen und Zwischenverkauf vorbehalten.</p>', 'sales', 'salesorder', 'footer', 2, 1, NULL, 0, '2020-04-25 18:17:02', 1),
(5, '<p>Sehr geehrte Damen und Herren,</p>\n<p>vielen Dank f&uuml;r Ihr Vertrauen in unser Unternehmen. Hiermit stellen wir Ihnen folgende Leistungen in Rechnung;</p>', 'sales', 'invoice', 'header', 1, 1, NULL, 0, '2020-04-25 18:34:25', 1),
(6, '<p>Die Rechnung ist sofort f&auml;llig. Bitte &uuml;berweisen Sie den Rechnungsbetrag ohne Abz&uuml;ge auf unser Bankkonto.</p>\n<p>Zahlung innerhalb von 14 Tagen ab Rechnungseingang ohne Abz&uuml;ge an die unten angegebene Bankverbindung.</p>\n<p>Der Rechnungbetrag wird in den n&auml;chsten Tagen von Ihrem uns bekannten Bankkonto eingezogen.</p>\n<p>Betrag dankend per &Uuml;berweisung erhalten. / Der Betrag wurde per PayPal beglichen</p>\n<p>Bei R&uuml;ckfragen stehen wir Ihnen wie gewohnt jederzeit zur Verf&uuml;gung.</p>', 'sales', 'invoice', 'footer', 2, 1, NULL, 0, '2020-04-25 18:42:45', 1),
(7, '<p>Sehr geehrte Damen und Herren,</p>\n<p>wir bedanken uns f&uuml;r die gute Zusammenarbeit und liefern Ihnen vereinbarungsgem&auml;&szlig; folgende Waren;</p>', 'sales', 'deliveryorder', 'header', 1, 1, NULL, 0, '2020-04-25 18:55:20', 1),
(8, '<p>ACHTUNG: Reklamationsverhalten<br />Sollte es bei einer Anlieferung durch eine Spedition zu einem Transportschaden kommen, lassen Sie diesen bitte direkt auf den Papieren der Spedition vermerken. Sollte der Schaden nicht auf den Papieren der Spedition vermerkt sein, wird dieser von uns nicht anerkannt.</p>\n<p>Die gelieferte Ware bleibt bis zur vollst&auml;ndigen Bezahlung unser Eigentum.</p>\n<p>&nbsp;</p>\n<p>Ware ordnungsgem&auml;&szlig; erhalten: <br /><br /><br />___________________________<br />Datum, Unterschrift</p>', 'sales', 'deliveryorder', 'footer', 2, 1, NULL, 0, '2020-04-25 18:51:57', 1),
(9, '<p>Sehr geehrte Damen und Herren,</p>\n<p>gem&auml;&szlig; unserer Vereinbarung schreiben wir Ihnen folgende Leistungen gut;</p>', 'sales', 'creditnote', 'header', 1, 1, NULL, 0, '2020-04-25 18:55:57', 1),
(10, '<p>Wir &uuml;berweisen Ihnen den Gutschriftbetrag in den n&auml;chsten Tagen auf Ihr Bankkonto.</p>\n<p>F&uuml;r weitere Fragen stehen wir Ihnen sehr gerne zur Verf&uuml;gung.</p>', 'sales', 'creditnote', 'footer', 2, 1, NULL, 0, '2020-04-25 18:57:18', 1),
(11, NULL, 'sales', 'reminder', 'header', 1, 1, NULL, 0, '2020-04-25 18:55:57', 1),
(12, NULL, 'sales', 'reminder', 'footer', 2, 1, NULL, 0, '2020-04-25 18:57:18', 1),
(13, '<p>Sehr geehrte Damen und Herren,</p>\n<p>bitte erstellen Sie uns ein Angebot f&uuml;r die folgende Produkte/Leistungen;</p>', 'purchases', 'quoterequest', 'header', 1, 1, NULL, 0, '2020-04-25 19:07:43', 1),
(14, '<p>Bitte erstellen Sie uns ein ausf&uuml;hrliches Angebot mit genauer Angabe zu den Preisen, den Zahlungs- und Lieferungsbedingungen und der k&uuml;rzesten Lieferfrist.</p>\n<p>Geben Sie uns bitte Ihre Lieferzeit, Gew&auml;hrleistung und Zahlungsbedingungen an.</p>\n<p>Wir ben&ouml;tigen die Ware sp&auml;testens in 10 Tagen nach Auftragserteilung.</p>\n<p>Bitte nennen Sie uns Ihre Zahlungsbedingungen.</p>\n<p>Wir freuen uns auf Ihre baldige Antwort.</p>', 'purchases', 'quoterequest', 'footer', 2, 1, NULL, 0, '2020-04-25 19:12:29', 1),
(15, '<p>Sehr geehrte Damen und Herren,</p>\n<p>vielen Dank f&uuml;r Ihr Angebot, hiermit bestellen wir nachfolgende Positionen;</p>', 'purchases', 'purchaseorder', 'header', 1, 1, NULL, 0, '2020-04-25 19:18:56', 1),
(16, '<p>Wir bitten um schnellstm&ouml;gliche Lieferung.</p>', 'purchases', 'purchaseorder', 'footer', 2, 1, NULL, 0, '2020-04-25 19:22:49', 1);

INSERT INTO `uom` (`id`, `title`, `ordering`, `clientid`, `created`, `createdby`, `modified`, `modifiedby`, `locked`, `lockedtime`) VALUES
(1, 'Stück', 0, 1, '2015-12-06 15:39:14', 1, NULL, 0, 0, NULL),
(2, 'Pack.', 0, 1, '2015-12-06 15:41:43', 1, NULL, 0, 0, NULL),
(3, 'Std.', 0, 1, '2015-12-06 15:41:50', 1, NULL, 0, 0, NULL),
(4, 'kg', 0, 1, '2015-12-06 15:41:54', 1, NULL, 0, 0, NULL),
(5, 'm', 0, 1, '2015-12-06 15:41:57', 1, NULL, 0, 0, NULL);

INSERT INTO `user` (`id`, `username`, `password`, `name`, `email`, `admin`, `permissions`, `smtphost`, `smtpauth`, `smtpsecure`, `smtpuser`, `smtppass`, `clientid`, `created`, `createdby`, `modified`, `modifiedby`, `locked`, `lockedtime`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, 0, 0, NULL);

INSERT INTO `warehouse` (`id`, `title`, `description`, `clientid`, `created`, `createdby`, `modified`, `modifiedby`, `locked`, `lockedtime`) VALUES
(1, 'Hauptlager', 'Hauptlager', 1, NULL, 0, NULL, 0, 0, NULL);
