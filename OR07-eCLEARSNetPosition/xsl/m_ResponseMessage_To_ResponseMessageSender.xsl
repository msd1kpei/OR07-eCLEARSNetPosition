<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns1="http://www.kpei.co.id/schema/EqNetPosition.001" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:tns="http://xmlns.oracle.com/MW-OSB/sendResponeMsg/sendResponsemsg" xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:client="http://xmlns.oracle.com/ARIS_KPEI_PROJECT/OR07_eCLEARSNetPosition/NetPositionAck" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns2="http://www.kpei.co.id/ResponseMessage" xmlns:bpmn="http://schemas.oracle.com/bpm/xpath" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl ns1 plnk wsdl client xsd ns2 tns soap xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref bpmn ldap">
   <xsl:template match="/">
      <ns2:ResponseMessage>
         <ns2:receiveDateTime>
            <xsl:value-of select="/ns2:ResponseMessage/ns2:receiveDateTime"/>
         </ns2:receiveDateTime>
         <ns2:status>
            <xsl:value-of select="/ns2:ResponseMessage/ns2:status"/>
         </ns2:status>
         <xsl:if test="/ns2:ResponseMessage/ns2:description">
            <ns2:description>
               <xsl:if test="/ns2:ResponseMessage/ns2:description/@xsi:nil">
                  <xsl:attribute name="xsi:nil">
                     <xsl:value-of select="/ns2:ResponseMessage/ns2:description/@xsi:nil"/>
                  </xsl:attribute>
               </xsl:if>
               <xsl:value-of select="/ns2:ResponseMessage/ns2:description"/>
            </ns2:description>
         </xsl:if>
         <ns2:reffMessage>
            <xsl:value-of select="/ns2:ResponseMessage/ns2:reffMessage"/>
         </ns2:reffMessage>
         <ns2:sourceMessage>
            <xsl:value-of select="/ns2:ResponseMessage/ns2:sourceMessage"/>
         </ns2:sourceMessage>
      </ns2:ResponseMessage>
   </xsl:template>
</xsl:stylesheet>
