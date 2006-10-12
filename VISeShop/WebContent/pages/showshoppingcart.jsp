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
<div class="top">
<img src="<html:rewrite href='img/logo.jpg'/>" />
</div>
<div class="main"><!--Ausgabe von Fehlermeldungen--> <html:errors /> <logic:messagesPresent
	message="true" name="user">
	<html:messages id="message" message="true" property="user"></html:messages>
</logic:messagesPresent> <logic:messagesPresent message="true"
	name="user">
	<html:messages id="message" message="true"
		property="<%=org.apache.struts.action.ActionMessages.GLOBAL_MESSAGE %>"></html:messages>
</logic:messagesPresent> <!--Seiteninhalt-->
<h1><bean:message key="prompt.welcome.greeting" /></h1>
<table>
	<thead>
		<tr>
			<th>#</th>
			<th>Artikelname</th>
			<th>Anzahl</th>
			<th>Einzelpreis</th>
		</tr>
	</thead>
	<tbody>
		<logic:iterate id="orderitem" name="orderitems">
			<bean:define name="orderitem" id="item" property="item" />
			<tr>
				<td><bean:write name="item" property="id" /></td>
				<td><bean:write name="item" property="name" /></td>
				<td><bean:write name="orderitem" property="amount" /></td>
				<td><bean:write name="item" property="price" formatKey="formatkey.price" /> &euro;</td>
				<td><html:link action="/removefromcart" paramName="item" paramId="itemid" paramProperty="id">
					<img src="<html:rewrite href='img/delete.gif'/>" />
				</html:link></td>
			</tr>
		</logic:iterate>
		<tr>
			<td colspan="4" rowspan="1"
				style="font-size: large; text-align: right;"><bean:message
				key="prompt.totalsum" />&nbsp;<bean:write name="totalsum"
				formatKey="formatkey.price" /> &euro;<br />
			</td>
		</tr>
		<tr><td></td>
			<td></td>
			<td></td>
			<td>
				<div class="backbutton">
					<html:link action="/confirmorder">Bestellung abschicken!</html:link>
				</div>
			</td>
		</tr>
	</tbody>
</table>
</div>

<div class="menu"><b><bean:message key="prompt.shoppingcart" /></b><br />
<html:link action="showshopindex">
	<bean:message key="prompt.back"/>
</html:link>
</div>
<div class="userinfo"><jsp:include page="/pages/userinfo.jsp" /></div>
</body>
</html:html>
