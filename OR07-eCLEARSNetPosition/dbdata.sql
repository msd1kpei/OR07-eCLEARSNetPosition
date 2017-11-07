insert into xml_element_value (id, schemaname, xpath, val) 
    values (seq_xml_element_value.nextval, 'OR07-eCLEARSNetPosition','kpeiInbound/body/content/deal/dealHeader/dealType','CUSTOM');
insert into xml_element_value (id, schemaname, xpath, val) 
    values (seq_xml_element_value.nextval, 'OR07-eCLEARSNetPosition','kpeiInbound/body/content/deal/dealHeader/status','OPEN');
insert into xml_element_value (id, schemaname, xpath, val) 
    values (seq_xml_element_value.nextval, 'OR07-eCLEARSNetPosition','kpeiInbound/body/content/deal/trade/tradeHeader/internalUnit','KPEI');
insert into xml_element_value (id, schemaname, xpath, val) 
    values (seq_xml_element_value.nextval, 'OR07-eCLEARSNetPosition','kpeiInbound/body/content/deal/trade/tradeHeader/status','OPEN');
insert into xml_element_value (id, schemaname, xpath, val) 
    values (seq_xml_element_value.nextval, 'OR07-eCLEARSNetPosition','kpeiInbound/body/content/deal/trade/product/equity/exchangeCode','IDX');
insert into xml_element_value (id, schemaname, xpath, val) 
    values (seq_xml_element_value.nextval, 'OR07-eCLEARSNetPosition','kpeiInbound/body/content/deal/trade/product/equity/paymentAmount/paymentType','SETTLEMENT');
insert into xml_element_value (id, schemaname, xpath, val) 
    values (seq_xml_element_value.nextval, 'OR07-eCLEARSNetPosition','kpeiInbound/body/content/deal/trade/extensions/extension[1]/name','Account');
insert into xml_element_value (id, schemaname, xpath, val) 
    values (seq_xml_element_value.nextval, 'OR07-eCLEARSNetPosition','kpeiInbound/body/content/deal/trade/extensions/extension[2]/name','Dedicated');
insert into xml_element_value (id, schemaname, xpath, val) 
    values (seq_xml_element_value.nextval, 'OR07-eCLEARSNetPosition','kpeiInbound/body/content/deal/trade/extensions/extension[3]/name','Market');
insert into xml_element_value (id, schemaname, xpath, val) 
    values (seq_xml_element_value.nextval, 'OR07-eCLEARSNetPosition','kpeiInbound/body/content/deal/trade/extensions/extension[3]/name','Equity');

insert into logical_directory (logical_name, physical_directory) values ('OR07-eCLEARSNetPosition-local', 'F:\Share\razor\gateway\inbound\settlement\netPosition\queue');
insert into logical_directory (logical_name, physical_directory) values ('OR07-eCLEARSNetPosition-ext', 'F:\Share\razor_ext\gateway\inbound\settlement\netPosition\queue');
insert into logical_directory (logical_name, physical_directory) values ('OR07-eCLEARSNetPosition-drc', 'F:\Share\razor_drc\gateway\inbound\settlement\netPosition\queue');
