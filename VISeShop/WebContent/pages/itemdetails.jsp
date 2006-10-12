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

<div class="main"><!--Ausgabe von Fehlermeldungen--> <html:errors /> <logic:messagesPresent
	message="true" name="amount">
	<html:messages id="message" message="true" property="user"></html:messages>
</logic:messagesPresent> <!--Seiteninhalt--> <html:form
	action="addtocart">
	<table>
		<tr>
			<td><b><bean:write name="item" property="id" /></b></td>
			<td style="font-size: large"><bean:write name="item" property="name" /></td>
		</tr>
		<tr>
			<td colspan="2" rowspan="1"><pre><bean:write name="item"
				property="description" /></pre></td>
		</tr>
		<tr align="right">
			<td colspan="2" rowspan="1" style="font-size: large"><bean:message
				key="prompt.itemprice" />&nbsp;<bean:write name="item"
				property="price" formatKey="formatkey.price" /> &euro;</td>
		</tr>
		<logic:lessEqual value="0" name="item" property="currentAmount">
			<tr>
				<td>
				<div style="color: red;">Artikel leider nicht mehr lieferbar!</div>
				</td>
			</tr>
		</logic:lessEqual>
		<logic:greaterThan value="0" name="item" property="currentAmount">
			<tr>
				<td colspan="3" rowspan="1"><html:text property="amount" value="1"
					style="width:40px;" /> <html:submit style="width:100px;">
					<bean:message key="prompt.order" />
				</html:submit></td>
			</tr>
		</logic:greaterThan>
	</table>
	<input type="hidden" name="itemId"
		value="<bean:write name='item' property='id'/>">
</html:form></div>

<div class="menu"><html:link action="showshopindex">
	<bean:message key="prompt.back" />
</html:link></div>
<div class="userinfo"><jsp:include page="/pages/userinfo.jsp" /></div>
</body>
</html:html>
