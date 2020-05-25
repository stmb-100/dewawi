SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contactid` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `name1` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `street` text NOT NULL,
  `postcode` varchar(12) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `archive`;
CREATE TABLE IF NOT EXISTS `archive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `month` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `clientid` int(11) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `bankaccount`;
CREATE TABLE IF NOT EXISTS `bankaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contactid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `iban` varchar(255) NOT NULL,
  `bic` varchar(255) NOT NULL,
  `accountnumber` varchar(255) NOT NULL,
  `bankcode` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `postcode` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timezone` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `name1` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `info` text NOT NULL,
  `taxnumber` varchar(255) NOT NULL,
  `vatin` varchar(255) NOT NULL,
  `taxfree` tinyint(3) NOT NULL,
  `debitornumber` varchar(255) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `discountrule` varchar(255) NOT NULL,
  `paymentmethod` varchar(255) NOT NULL,
  `paymentterm` varchar(255) NOT NULL,
  `cashdiscountdays` int(11) NOT NULL,
  `cashdiscountpercent` decimal(9,4) DEFAULT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(2) NOT NULL,
  `name` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `creditnote`;
CREATE TABLE IF NOT EXISTS `creditnote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creditnoteid` int(11) NOT NULL,
  `opportunityid` int(11) NOT NULL,
  `contactid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `info` text NOT NULL,
  `header` text NOT NULL,
  `footer` text NOT NULL,
  `vatin` varchar(255) NOT NULL,
  `creditnotedate` date NOT NULL,
  `orderdate` date NOT NULL,
  `deliverydate` date NOT NULL,
  `paymentmethod` varchar(255) NOT NULL,
  `shippingmethod` varchar(255) NOT NULL,
  `billingname1` varchar(255) NOT NULL,
  `billingname2` varchar(255) NOT NULL,
  `billingdepartment` varchar(255) NOT NULL,
  `billingstreet` text NOT NULL,
  `billingpostcode` varchar(255) NOT NULL,
  `billingcity` varchar(255) NOT NULL,
  `billingcountry` varchar(255) NOT NULL,
  `shippingname1` varchar(255) NOT NULL,
  `shippingname2` varchar(255) NOT NULL,
  `shippingdepartment` varchar(255) NOT NULL,
  `shippingstreet` text NOT NULL,
  `shippingpostcode` varchar(255) NOT NULL,
  `shippingcity` varchar(255) NOT NULL,
  `shippingcountry` varchar(255) NOT NULL,
  `shippingphone` varchar(255) NOT NULL,
  `subtotal` decimal(15,4) NOT NULL,
  `taxes` decimal(15,4) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `taxfree` tinyint(3) NOT NULL,
  `state` tinyint(3) NOT NULL,
  `completed` tinyint(3) NOT NULL,
  `cancelled` tinyint(3) NOT NULL,
  `contactperson` varchar(255) NOT NULL,
  `templateid` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `creditnotepos`;
CREATE TABLE IF NOT EXISTS `creditnotepos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creditnoteid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `taxrate` decimal(15,4) NOT NULL,
  `quantity` decimal(9,4) DEFAULT NULL,
  `total` decimal(15,4) NOT NULL,
  `uom` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `deliveryorder`;
CREATE TABLE IF NOT EXISTS `deliveryorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deliveryorderid` int(11) NOT NULL,
  `opportunityid` int(11) NOT NULL,
  `contactid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `info` text NOT NULL,
  `header` text NOT NULL,
  `footer` text NOT NULL,
  `vatin` varchar(255) NOT NULL,
  `deliveryorderdate` date NOT NULL,
  `orderdate` date NOT NULL,
  `deliverydate` date NOT NULL,
  `paymentmethod` varchar(255) NOT NULL,
  `shippingmethod` varchar(255) NOT NULL,
  `billingname1` varchar(255) NOT NULL,
  `billingname2` varchar(255) NOT NULL,
  `billingdepartment` varchar(255) NOT NULL,
  `billingstreet` text NOT NULL,
  `billingpostcode` varchar(255) NOT NULL,
  `billingcity` varchar(255) NOT NULL,
  `billingcountry` varchar(255) NOT NULL,
  `shippingname1` varchar(255) NOT NULL,
  `shippingname2` varchar(255) NOT NULL,
  `shippingdepartment` varchar(255) NOT NULL,
  `shippingstreet` text NOT NULL,
  `shippingpostcode` varchar(255) NOT NULL,
  `shippingcity` varchar(255) NOT NULL,
  `shippingcountry` varchar(255) NOT NULL,
  `shippingphone` varchar(255) NOT NULL,
  `subtotal` decimal(15,4) NOT NULL,
  `taxes` decimal(15,4) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `taxfree` tinyint(3) NOT NULL,
  `state` tinyint(3) NOT NULL,
  `completed` tinyint(3) NOT NULL,
  `cancelled` tinyint(3) NOT NULL,
  `contactperson` varchar(255) NOT NULL,
  `templateid` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `deliveryorderpos`;
CREATE TABLE IF NOT EXISTS `deliveryorderpos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deliveryorderid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `taxrate` decimal(15,4) NOT NULL,
  `quantity` decimal(9,4) DEFAULT NULL,
  `total` decimal(15,4) NOT NULL,
  `uom` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `documentrelation`;
CREATE TABLE IF NOT EXISTS `documentrelation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contactid` int(11) NOT NULL,
  `documentid` int(11) NOT NULL,
  `module` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ebayhistory`;
CREATE TABLE IF NOT EXISTS `ebayhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) NOT NULL,
  `orderid` varchar(255) NOT NULL,
  `contactid` int(11) NOT NULL,
  `invoiceid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ebayuser`;
CREATE TABLE IF NOT EXISTS `ebayuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) NOT NULL,
  `catid` int(11) NOT NULL,
  `templateid` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `token` text NOT NULL,
  `production` int(11) NOT NULL,
  `compatability` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `devid` varchar(255) NOT NULL,
  `appid` varchar(255) NOT NULL,
  `certid` varchar(255) NOT NULL,
  `serverurl` varchar(255) NOT NULL,
  `clientid` int(11) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `email`;
CREATE TABLE IF NOT EXISTS `email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contactid` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (id),
  KEY (contactid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `footer`;
CREATE TABLE IF NOT EXISTS `footer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `templateid` int(11) NOT NULL,
  `column` int(11) NOT NULL,
  `text` text NOT NULL,
  `width` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `internet`;
CREATE TABLE IF NOT EXISTS `internet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contactid` int(11) NOT NULL,
  `internet` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (id),
  KEY (contactid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoiceid` int(11) NOT NULL,
  `opportunityid` int(11) NOT NULL,
  `contactid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `info` text NOT NULL,
  `header` text NOT NULL,
  `footer` text NOT NULL,
  `vatin` varchar(255) NOT NULL,
  `invoicedate` date NOT NULL,
  `orderdate` date NOT NULL,
  `deliverydate` date NOT NULL,
  `paymentmethod` varchar(255) NOT NULL,
  `shippingmethod` varchar(255) NOT NULL,
  `billingname1` varchar(255) NOT NULL,
  `billingname2` varchar(255) NOT NULL,
  `billingdepartment` varchar(255) NOT NULL,
  `billingstreet` text NOT NULL,
  `billingpostcode` varchar(255) NOT NULL,
  `billingcity` varchar(255) NOT NULL,
  `billingcountry` varchar(255) NOT NULL,
  `shippingname1` varchar(255) NOT NULL,
  `shippingname2` varchar(255) NOT NULL,
  `shippingdepartment` varchar(255) NOT NULL,
  `shippingstreet` text NOT NULL,
  `shippingpostcode` varchar(255) NOT NULL,
  `shippingcity` varchar(255) NOT NULL,
  `shippingcountry` varchar(255) NOT NULL,
  `shippingphone` varchar(255) NOT NULL,
  `subtotal` decimal(15,4) NOT NULL,
  `taxes` decimal(15,4) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `taxfree` tinyint(3) NOT NULL,
  `state` tinyint(3) NOT NULL,
  `completed` tinyint(3) NOT NULL,
  `cancelled` tinyint(3) NOT NULL,
  `contactperson` varchar(255) NOT NULL,
  `ebayorderid` varchar(255) DEFAULT NULL,
  `templateid` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `invoicepos`;
CREATE TABLE IF NOT EXISTS `invoicepos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoiceid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `taxrate` decimal(15,4) NOT NULL,
  `quantity` decimal(9,4) DEFAULT NULL,
  `total` decimal(15,4) NOT NULL,
  `uom` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `barcode` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `info` text NOT NULL,
  `quantity` decimal(10,0) NOT NULL,
  `inventory` int(11) NOT NULL,
  `weight` decimal(15,4) NOT NULL,
  `cost` decimal(15,4) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `margin` decimal(15,4) NOT NULL,
  `taxid` int(11) NOT NULL,
  `uomid` int(11) NOT NULL,
  `manufacturerid` int(11) NOT NULL,
  `manufacturersku` varchar(255) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `contactid` int(11) NOT NULL,
  `docid` int(11) NOT NULL,
  `doctype` varchar(255) NOT NULL,
  `invoiceid` int(11) NOT NULL,
  `creditnoteid` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `comment` varchar(255) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `taxrate` decimal(15,4) NOT NULL,
  `quantity` decimal(9,4) DEFAULT NULL,
  `total` decimal(15,4) NOT NULL,
  `uom` varchar(255) NOT NULL,
  `warehouseid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `magentocustomer`;
CREATE TABLE IF NOT EXISTS `magentocustomer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contactid` int(11) NOT NULL,
  `magentocustomerid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `magentohistory`;
CREATE TABLE IF NOT EXISTS `magentohistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `magentocustomerid` varchar(255) NOT NULL,
  `orderid` varchar(255) NOT NULL,
  `contactid` int(11) NOT NULL,
  `invoiceid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `magentouser`;
CREATE TABLE IF NOT EXISTS `magentouser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) NOT NULL,
  `catid` int(11) NOT NULL,
  `templateid` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `clientid` int(11) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `manufacturer`;
CREATE TABLE IF NOT EXISTS `manufacturer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `menu` text NOT NULL,
  `ordering` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `paymentmethod`;
CREATE TABLE IF NOT EXISTS `paymentmethod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `phone`;
CREATE TABLE IF NOT EXISTS `phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contactid` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (id),
  KEY (contactid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `process`;
CREATE TABLE IF NOT EXISTS `process` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quoteid` int(11) NOT NULL,
  `salesorderid` int(11) NOT NULL,
  `invoiceid` int(11) NOT NULL,
  `prepaymentinvoiceid` int(11) NOT NULL,
  `deliveryorderid` int(11) NOT NULL,
  `creditnoteid` int(11) NOT NULL,
  `purchaseorderid` varchar(255) NOT NULL,
  `customerid` int(11) NOT NULL,
  `supplierid` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `info` text NOT NULL,
  `notes` text NOT NULL,
  `header` text NOT NULL,
  `footer` text NOT NULL,
  `vatin` varchar(255) NOT NULL,
  `processdate` date NOT NULL,
  `salesorderdate` date NOT NULL,
  `invoicedate` date NOT NULL,
  `invoicetotal` decimal(15,4) NOT NULL,
  `prepaymentinvoicedate` date NOT NULL,
  `deliveryorderdate` date NOT NULL,
  `creditnotedate` date NOT NULL,
  `purchaseorderdate` date NOT NULL,
  `paymentmethod` varchar(255) NOT NULL,
  `shippingmethod` varchar(255) NOT NULL,
  `shipmentnumber` varchar(255) NOT NULL,
  `shipmentdate` date NOT NULL,
  `deliverydate` date NOT NULL,
  `deliverystatus` varchar(255) NOT NULL,
  `itemtype` varchar(255) NOT NULL,
  `suppliername` varchar(255) NOT NULL,
  `supplierordered` tinyint(4) NOT NULL,
  `suppliersalesorderid` varchar(255) NOT NULL,
  `suppliersalesorderdate` date NOT NULL,
  `supplierinvoiceid` varchar(255) NOT NULL,
  `supplierinvoicedate` date NOT NULL,
  `supplierinvoicetotal` decimal(15,4) NOT NULL,
  `supplierpaymentdate` date NOT NULL,
  `supplierdeliverydate` date NOT NULL,
  `supplierorderstatus` varchar(255) NOT NULL,
  `servicedate` date NOT NULL,
  `servicecompleted` tinyint(4) NOT NULL,
  `billingname1` varchar(255) NOT NULL,
  `billingname2` varchar(255) NOT NULL,
  `billingdepartment` varchar(255) NOT NULL,
  `billingstreet` text NOT NULL,
  `billingpostcode` varchar(255) NOT NULL,
  `billingcity` varchar(255) NOT NULL,
  `billingcountry` varchar(255) NOT NULL,
  `shippingname1` varchar(255) NOT NULL,
  `shippingname2` varchar(255) NOT NULL,
  `shippingdepartment` varchar(255) NOT NULL,
  `shippingstreet` text NOT NULL,
  `shippingpostcode` varchar(255) NOT NULL,
  `shippingcity` varchar(255) NOT NULL,
  `shippingcountry` varchar(255) NOT NULL,
  `shippingphone` varchar(255) NOT NULL,
  `subtotal` decimal(15,4) NOT NULL,
  `taxes` decimal(15,4) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `paymentdate` date NOT NULL,
  `prepayment` tinyint(1) NOT NULL,
  `prepaymenttotal` decimal(15,4) NOT NULL,
  `prepaymentdate` date NOT NULL,
  `paymentstatus` varchar(255) NOT NULL,
  `creditnote` tinyint(1) NOT NULL,
  `creditnotetotal` decimal(15,4) NOT NULL,
  `editpositionsseparately` tinyint(4) NOT NULL,
  `taxfree` tinyint(3) NOT NULL,
  `state` tinyint(3) NOT NULL,
  `completed` tinyint(3) NOT NULL,
  `cancelled` tinyint(3) NOT NULL,
  `contactperson` varchar(255) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `processpos`;
CREATE TABLE IF NOT EXISTS `processpos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `processid` int(11) NOT NULL,
  `deliveryorderid` int(11) NOT NULL,
  `purchaseorderid` varchar(255) NOT NULL,
  `supplierid` varchar(255) NOT NULL,
  `itemid` int(11) NOT NULL,
  `notes` text NOT NULL,
  `deliveryorderdate` date NOT NULL,
  `itemtype` varchar(255) NOT NULL,
  `purchaseorderdate` date NOT NULL,
  `shippingmethod` varchar(255) NOT NULL,
  `shipmentnumber` varchar(255) NOT NULL,
  `shipmentdate` date NOT NULL,
  `deliverydate` date NOT NULL,
  `deliverystatus` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `taxrate` decimal(15,4) NOT NULL,
  `quantity` decimal(9,4) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `uom` varchar(255) NOT NULL,
  `suppliername` varchar(255) NOT NULL,
  `suppliersalesorderid` varchar(255) NOT NULL,
  `suppliersalesorderdate` date NOT NULL,
  `supplierinvoiceid` varchar(255) NOT NULL,
  `supplierinvoicedate` date NOT NULL,
  `supplierinvoicetotal` decimal(15,4) NOT NULL,
  `supplierpaymentdate` date NOT NULL,
  `supplierdeliverydate` date NOT NULL,
  `supplierorderstatus` varchar(255) NOT NULL,
  `servicedate` date NOT NULL,
  `serviceexecutedby` varchar(255) NOT NULL,
  `servicecompleted` tinyint(4) NOT NULL,
  `ordering` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `purchaseorder`;
CREATE TABLE IF NOT EXISTS `purchaseorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchaseorderid` int(11) NOT NULL,
  `opportunityid` int(11) NOT NULL,
  `contactid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `info` text NOT NULL,
  `header` text NOT NULL,
  `footer` text NOT NULL,
  `vatin` varchar(255) NOT NULL,
  `purchaseorderdate` date NOT NULL,
  `orderdate` date NOT NULL,
  `deliverydate` date NOT NULL,
  `paymentmethod` varchar(255) NOT NULL,
  `shippingmethod` varchar(255) NOT NULL,
  `billingname1` varchar(255) NOT NULL,
  `billingname2` varchar(255) NOT NULL,
  `billingdepartment` varchar(255) NOT NULL,
  `billingstreet` text NOT NULL,
  `billingpostcode` varchar(255) NOT NULL,
  `billingcity` varchar(255) NOT NULL,
  `billingcountry` varchar(255) NOT NULL,
  `shippingname1` varchar(255) NOT NULL,
  `shippingname2` varchar(255) NOT NULL,
  `shippingdepartment` varchar(255) NOT NULL,
  `shippingstreet` text NOT NULL,
  `shippingpostcode` varchar(255) NOT NULL,
  `shippingcity` varchar(255) NOT NULL,
  `shippingcountry` varchar(255) NOT NULL,
  `shippingphone` varchar(255) NOT NULL,
  `subtotal` decimal(15,4) NOT NULL,
  `taxes` decimal(15,4) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `taxfree` tinyint(3) NOT NULL,
  `state` tinyint(3) NOT NULL,
  `completed` tinyint(3) NOT NULL,
  `cancelled` tinyint(3) NOT NULL,
  `contactperson` varchar(255) NOT NULL,
  `templateid` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `purchaseorderpos`;
CREATE TABLE IF NOT EXISTS `purchaseorderpos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchaseorderid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `taxrate` decimal(15,4) NOT NULL,
  `quantity` decimal(9,4) DEFAULT NULL,
  `total` decimal(15,4) NOT NULL,
  `uom` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `quote`;
CREATE TABLE IF NOT EXISTS `quote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quoteid` int(11) NOT NULL,
  `opportunityid` int(11) NOT NULL,
  `contactid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `info` text NOT NULL,
  `header` text NOT NULL,
  `footer` text NOT NULL,
  `vatin` varchar(255) NOT NULL,
  `quotedate` date NOT NULL,
  `orderdate` date NOT NULL,
  `deliverydate` date NOT NULL,
  `paymentmethod` varchar(255) NOT NULL,
  `shippingmethod` varchar(255) NOT NULL,
  `billingname1` varchar(255) NOT NULL,
  `billingname2` varchar(255) NOT NULL,
  `billingdepartment` varchar(255) NOT NULL,
  `billingstreet` text NOT NULL,
  `billingpostcode` varchar(255) NOT NULL,
  `billingcity` varchar(255) NOT NULL,
  `billingcountry` varchar(255) NOT NULL,
  `shippingname1` varchar(255) NOT NULL,
  `shippingname2` varchar(255) NOT NULL,
  `shippingdepartment` varchar(255) NOT NULL,
  `shippingstreet` text NOT NULL,
  `shippingpostcode` varchar(255) NOT NULL,
  `shippingcity` varchar(255) NOT NULL,
  `shippingcountry` varchar(255) NOT NULL,
  `shippingphone` varchar(255) NOT NULL,
  `subtotal` decimal(15,4) NOT NULL,
  `taxes` decimal(15,4) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `taxfree` tinyint(3) NOT NULL,
  `state` tinyint(3) NOT NULL,
  `completed` tinyint(3) NOT NULL,
  `cancelled` tinyint(3) NOT NULL,
  `contactperson` varchar(255) NOT NULL,
  `templateid` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `quotepos`;
CREATE TABLE IF NOT EXISTS `quotepos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quoteid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `taxrate` decimal(15,4) NOT NULL,
  `quantity` decimal(9,4) DEFAULT NULL,
  `total` decimal(15,4) NOT NULL,
  `uom` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `quoterequest`;
CREATE TABLE IF NOT EXISTS `quoterequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quoterequestid` int(11) NOT NULL,
  `opportunityid` int(11) NOT NULL,
  `contactid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `info` text NOT NULL,
  `header` text NOT NULL,
  `footer` text NOT NULL,
  `vatin` varchar(255) NOT NULL,
  `quoterequestdate` date NOT NULL,
  `orderdate` date NOT NULL,
  `deliverydate` date NOT NULL,
  `paymentmethod` varchar(255) NOT NULL,
  `shippingmethod` varchar(255) NOT NULL,
  `billingname1` varchar(255) NOT NULL,
  `billingname2` varchar(255) NOT NULL,
  `billingdepartment` varchar(255) NOT NULL,
  `billingstreet` text NOT NULL,
  `billingpostcode` varchar(255) NOT NULL,
  `billingcity` varchar(255) NOT NULL,
  `billingcountry` varchar(255) NOT NULL,
  `shippingname1` varchar(255) NOT NULL,
  `shippingname2` varchar(255) NOT NULL,
  `shippingdepartment` varchar(255) NOT NULL,
  `shippingstreet` text NOT NULL,
  `shippingpostcode` varchar(255) NOT NULL,
  `shippingcity` varchar(255) NOT NULL,
  `shippingcountry` varchar(255) NOT NULL,
  `shippingphone` varchar(255) NOT NULL,
  `subtotal` decimal(15,4) NOT NULL,
  `taxes` decimal(15,4) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `taxfree` tinyint(3) NOT NULL,
  `state` tinyint(3) NOT NULL,
  `completed` tinyint(3) NOT NULL,
  `cancelled` tinyint(3) NOT NULL,
  `contactperson` varchar(255) NOT NULL,
  `templateid` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `quoterequestpos`;
CREATE TABLE IF NOT EXISTS `quoterequestpos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quoterequestid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `taxrate` decimal(15,4) NOT NULL,
  `quantity` decimal(9,4) DEFAULT NULL,
  `total` decimal(15,4) NOT NULL,
  `uom` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `salesorder`;
CREATE TABLE IF NOT EXISTS `salesorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salesorderid` int(11) NOT NULL,
  `opportunityid` int(11) NOT NULL,
  `contactid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `info` text NOT NULL,
  `header` text NOT NULL,
  `footer` text NOT NULL,
  `vatin` varchar(255) NOT NULL,
  `salesorderdate` date NOT NULL,
  `orderdate` date NOT NULL,
  `deliverydate` date NOT NULL,
  `paymentmethod` varchar(255) NOT NULL,
  `shippingmethod` varchar(255) NOT NULL,
  `billingname1` varchar(255) NOT NULL,
  `billingname2` varchar(255) NOT NULL,
  `billingdepartment` varchar(255) NOT NULL,
  `billingstreet` text NOT NULL,
  `billingpostcode` varchar(255) NOT NULL,
  `billingcity` varchar(255) NOT NULL,
  `billingcountry` varchar(255) NOT NULL,
  `shippingname1` varchar(255) NOT NULL,
  `shippingname2` varchar(255) NOT NULL,
  `shippingdepartment` varchar(255) NOT NULL,
  `shippingstreet` text NOT NULL,
  `shippingpostcode` varchar(255) NOT NULL,
  `shippingcity` varchar(255) NOT NULL,
  `shippingcountry` varchar(255) NOT NULL,
  `shippingphone` varchar(255) NOT NULL,
  `subtotal` decimal(15,4) NOT NULL,
  `taxes` decimal(15,4) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `taxfree` tinyint(3) NOT NULL,
  `state` tinyint(3) NOT NULL,
  `completed` tinyint(3) NOT NULL,
  `cancelled` tinyint(3) NOT NULL,
  `contactperson` varchar(255) NOT NULL,
  `templateid` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `salesorderpos`;
CREATE TABLE IF NOT EXISTS `salesorderpos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salesorderid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `taxrate` decimal(15,4) NOT NULL,
  `quantity` decimal(9,4) DEFAULT NULL,
  `total` decimal(15,4) NOT NULL,
  `uom` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `shipmenttracking`;
CREATE TABLE IF NOT EXISTS `shipmenttracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carrier` varchar(255) NOT NULL,
  `clientid` int(11) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `shippingaddress`;
CREATE TABLE IF NOT EXISTS `shippingaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contactid` int(11) NOT NULL,
  `name1` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `street` text NOT NULL,
  `postcode` varchar(12) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `shippingmethod`;
CREATE TABLE IF NOT EXISTS `shippingmethod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `state`;
CREATE TABLE IF NOT EXISTS `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `standard` tinyint(4) NOT NULL,
  `completed` tinyint(4) NOT NULL,
  `cancelled` tinyint(4) NOT NULL,
  `extra` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `taxrate`;
CREATE TABLE IF NOT EXISTS `taxrate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `rate` decimal(15,4) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `template`;
CREATE TABLE IF NOT EXISTS `template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `default` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  `activated` int(11) NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `textblock`;
CREATE TABLE IF NOT EXISTS `textblock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `module` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `section` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `uom`;
CREATE TABLE IF NOT EXISTS `uom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `permissions` text NOT NULL,
  `smtphost` varchar(255) NOT NULL,
  `smtpauth` varchar(255) NOT NULL,
  `smtpsecure` varchar(255) NOT NULL,
  `smtpuser` varchar(255) NOT NULL,
  `smtppass` varchar(32) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE IF NOT EXISTS `warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `clientid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `lockedtime` datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
