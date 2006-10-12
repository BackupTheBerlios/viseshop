<%@ page language="java"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<html:html locale="true">
<head>
<title><bean:message key="welcome.title" /></title>
<link rel="stylesheet" href="<html:rewrite href="css/layout.css"/>" />
</head>

<body>
<div class="top"><img src="<html:rewrite href='img/logo.jpg'/>" /></div>
<div class="main">
<!--Ausgabe von Fehlermeldungen--> 
<html:errors /> 

<!--Seiteninhalt-->
M&ouml;chten sie diese Bestellung wirklich abschicken?
<table class="list">
	<thead>
		<tr>
			<th><bean:message key="prompt.sharp" /></th>
			<th><bean:message key="prompt.itemname" /></th>
			<th>Menge</th>
			<th align="right"><bean:message key="prompt.itemprice"/> &frasl;St&uuml;ck </th>
		</tr>
	</thead>
	<tbody>
		<logic:iterate id="orderitem" name="orderitems">
			<bean:define id="item" property="item" name="orderitem"/>
			<tr>
				<td><bean:write name="item" property="id"/></td>
				<td><bean:write name="item" property="name"/></td>
				<td><bean:write name="orderitem" property="amount"/></td>
				<td align="right"><bean:write name="item" property="price" formatKey="foramtkey.price"/> &euro;</td>
		</logic:iterate>
	<tr>
		<td rowspan="1" colspan="4" align="right" style="font-size: large;">
			Gesamtsumme: <bean:write name="total" formatKey="formkey.price"/> &euro;
		</td>
	</tr>
	</tbody>
</table>
<div class="backbutton"><html:link action="/submitorder">Abschicken!</html:link></div>
</div>

<div class="menu">
<html:link action="showshopindex">
	<bean:message key="prompt.back" />
</html:link></div>
<div class="userinfo"><jsp:include page="/pages/userinfo.jsp" /></div>
</body>
</html:html>
