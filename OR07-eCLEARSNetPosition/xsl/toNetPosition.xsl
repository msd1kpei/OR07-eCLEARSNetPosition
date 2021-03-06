<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xpath20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:inp1="http://www.kpei.co.id/schema/EqNetPosition.001" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:ns1="http://www.kpei.co.id/GE03-XMLUtility/types" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ns0="http://oracle.com/sca/soapservice/kpei/GE03-XMLUtility/GE03_XMLUtility" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns="http://www.kpei.co.id/razor/eCLEARSNetPosition" xmlns:tns="http://oracle.com/sca/soapservice/KPEIMID/OR07-eCLEARSNetPosition/OR07_eCLEARSNetPosition" xmlns:out1="http://kpei.co.id/MDwsReply.xsd" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl inp1 ns1 xsd wsdl ns0 tns out1 xpath20 bpws mhdr oraext dvm hwf med ids xdk xref ora socket ldap">
   <xsl:param name="xmlData.reply"/>
   <xsl:template match="/">
      <kpeiInbound>
         <header>
            <xsl:attribute name="id">
               <xsl:value-of select="/inp1:NetPosition/inp1:header/@id"/>
            </xsl:attribute>
            <asAt>
               <xsl:value-of select="/inp1:NetPosition/inp1:header/inp1:asAt"/>
            </asAt>
            <sourceSystem>
               <xsl:value-of select="/inp1:NetPosition/inp1:header/inp1:source"/>
            </sourceSystem>
         </header>
         <body>
            <content>
               <xsl:for-each select="/inp1:NetPosition/inp1:deals/inp1:deal">
                  <deal>
                     <dealHeader>
                        <dealId>
                           <xsl:value-of select="inp1:dealId"/>
                        </dealId>
                        <dealType>
                           <xsl:value-of select="$xmlData.reply/ns1:getXMLDataReply/ns1:xmlData[1.0]/ns1:Value"/>
                        </dealType>
                        <dealDate>
                           <xsl:value-of select="inp1:dealDate"/>
                        </dealDate>
                        <status>
                           <xsl:value-of select="$xmlData.reply/ns1:getXMLDataReply/ns1:xmlData[2.0]/ns1:Value"/>
                        </status>
                     </dealHeader>
                     <trade>
                        <tradeHeader>
                           <tradeId>
                              <xsl:value-of select="inp1:dealId"/>
                           </tradeId>
                           <tradeDate>
                              <xsl:value-of select="inp1:dealDate"/>
                           </tradeDate>
                           <xsl:choose>
                              <xsl:when test="inp1:trade/inp1:product/inp1:equity">
                                 <tradeType>
                                    <xsl:value-of select="inp1:trade/inp1:tradeType"/>
                                 </tradeType>
                              </xsl:when>
                              <xsl:otherwise>
                                 <tradeType>
                                    <xsl:text disable-output-escaping="no">CASH</xsl:text>
                                 </tradeType>
                              </xsl:otherwise>
                           </xsl:choose>
                           <counterparty>
                              <xsl:value-of select="inp1:trade/inp1:counterparty"/>
                           </counterparty>
                           <internalUnit>
                              <xsl:value-of select="$xmlData.reply/ns1:getXMLDataReply/ns1:xmlData[3.0]/ns1:Value"/>
                           </internalUnit>
                           <buySell>
                              <xsl:value-of select="inp1:trade/inp1:buySell"/>
                           </buySell>
                           <status>
                              <xsl:value-of select="$xmlData.reply/ns1:getXMLDataReply/ns1:xmlData[4.0]/ns1:Value"/>
                           </status>
                        </tradeHeader>
                        <product>
                           <xsl:if test="inp1:trade/inp1:product/inp1:equity">
                              <equity>
                                 <instrumentId>
                                    <xsl:value-of select="inp1:trade/inp1:product/inp1:equity/inp1:instrumentId"/>
                                 </instrumentId>
                                 <numberShares>
                                    <xsl:value-of select="oraext:query-database(concat(concat(&quot;SELECT split_ratio FROM corporate_actions WHERE instrument_code = '&quot;,inp1:trade/inp1:product/inp1:equity/inp1:instrumentId,&quot;' AND (ex_date &lt;= TO_DATE ('&quot;,inp1:dealDate,&quot;', 'yyyy-mm-dd') AND TO_DATE ('&quot;,inp1:dealDate,&quot;', 'yyyy-mm-dd') &lt; eff_date)&quot;),&quot;UNION ALL SELECT 1 AS split_ratio FROM DUAL WHERE NOT EXISTS (&quot;,concat(&quot;SELECT split_ratio FROM corporate_actions WHERE instrument_code = '&quot;,inp1:dealDate,&quot;' AND (ex_date &lt;= TO_DATE ('&quot;,inp1:trade/inp1:product/inp1:equity/inp1:instrumentId,&quot;', 'yyyy-mm-dd') AND TO_DATE ('&quot;,inp1:trade/inp1:product/inp1:equity/inp1:instrumentId,&quot;', 'yyyy-mm-dd') &lt; eff_date)&quot;),&quot;)&quot;),false(),false(),&quot;jdbc/ds_kpeimid&quot;) * inp1:trade/inp1:product/inp1:equity/inp1:numberShares"/>
                                 </numberShares>
                                 <exchangeCode>
                                    <xsl:value-of select="$xmlData.reply/ns1:getXMLDataReply/ns1:xmlData[5.0]/ns1:Value"/>
                                 </exchangeCode>
                                 <currency>
                                    <xsl:value-of select="inp1:trade/inp1:product/inp1:equity/inp1:settlement/inp1:currency"/>
                                 </currency>
                                 <paymentAmount>
                                    <paymentType>
                                       <xsl:value-of select="$xmlData.reply/ns1:getXMLDataReply/ns1:xmlData[6.0]/ns1:Value"/>
                                    </paymentType>
                                    <paymentAmount>
                                       <currency>
                                          <xsl:value-of select="inp1:trade/inp1:product/inp1:equity/inp1:settlement/inp1:currency"/>
                                       </currency>
                                       <amount>
                                          <xsl:value-of select="inp1:trade/inp1:product/inp1:equity/inp1:settlement/inp1:amount"/>
                                       </amount>
                                    </paymentAmount>
                                    <adjustedPaymentDate>
                                       <xsl:value-of select="inp1:trade/inp1:product/inp1:equity/inp1:settlement/inp1:paymentDate"/>
                                    </adjustedPaymentDate>
                                 </paymentAmount>
                              </equity>
                           </xsl:if>
                           <xsl:if test="inp1:trade/inp1:product/inp1:cashPayment">
                              <cashPayment>
                                 <amount>
                                    <xsl:attribute name="ccy">
                                       <xsl:value-of select="inp1:trade/inp1:product/inp1:cashPayment/inp1:currency"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="inp1:trade/inp1:product/inp1:cashPayment/inp1:amount"/>
                                 </amount>
                                 <paymentDate>
                                    <xsl:value-of select="inp1:trade/inp1:product/inp1:cashPayment/inp1:paymentDate"/>
                                 </paymentDate>
                              </cashPayment>
                           </xsl:if>
                        </product>
                        <extensions>
                           <xsl:for-each select="inp1:trade/inp1:extensions/inp1:extension">
                              <extension>
                                 <name>
                                    <xsl:value-of select="inp1:name"/>
                                 </name>
                                 <value>
                                    <xsl:value-of select="inp1:value"/>
                                 </value>
                              </extension>
                           </xsl:for-each>
                        </extensions>
                     </trade>
                  </deal>
               </xsl:for-each>
            </content>
         </body>
      </kpeiInbound>
   </xsl:template>
</xsl:stylesheet>
