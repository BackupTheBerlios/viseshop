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
	message="true" name="user">
	<html:messages id="message" message="true" property="user"></html:messages>
</logic:messagesPresent> <logic:messagesPresent message="true"
	name="user">
	<html:messages id="message" message="true"
		property="<%=org.apache.struts.action.ActionMessages.GLOBAL_MESSAGE %>"></html:messages>
</logic:messagesPresent> <!--Seiteninhalt-->
<table class="list">
	<thead>
		<tr>
			<th><bean:message key="prompt.sharp" /></th>
			<th><bean:message key="prompt.itemname" /></th>
			<th align="right"><bean:message key="prompt.itemprice" /></th>
		</tr>
	</thead>
	<tbody>
		<bean:define id="items" name="commoditygroup" property="items" />
		<logic:iterate id="item" name="items">
			<tr>
				<td><bean:write name="item" property="id" /></td>
				<td><bean:write name="item" property="name" /></td>
				<td align="right"><bean:write name="item" property="price"
					formatKey="formatkey.price" /> &euro;</td>
				<td>
 					<jsp:useBean id="account" 
								 scope="session" 
								 beanName="account" 
								 type="org.hska.vislab.eshop.model.db.Account"/>
					<!-- Benutzer können nur Artikel einsehen -->
					<logic:equal value="false" name="account" property="administrator">
						<html:link action="/showitemdetails" paramName="item"
							paramProperty="id" paramId="itemid">
							<bean:message key="prompt.itemdetails" />
						</html:link>
					</logic:equal>								 
					<!-- Admin kann Artikel ändern -->			
					<logic:equal value="true" name="account" property="administrator">
						<html:link action="/edititemdetails" paramName="item"
							paramProperty="id" paramId="itemid">
							Bearbeiten
						</html:link>
					</logic:equal>								 	
				</td>
				<td><logic:lessEqual value="0" name="item" property="currentAmount">
						<img src="<html:rewrite href='img/red.gif'/>" />
					</logic:lessEqual>
					<logic:greaterThan value="0" name="item" property="currentAmount">
						<img src="<html:rewrite href='img/green.gif'/>" />
					</logic:greaterThan>
				</td>
			</tr>
		</logic:iterate>
	</tbody>
</table>
</div>

<div class="menu"><b><bean:write name="commoditygroup" property="name" /></b></br>
<html:link action="showshopindex">
	<bean:message key="prompt.back" />
</html:link></div>
<div class="userinfo"><jsp:include page="/pages/userinfo.jsp" /></div>
</body>
</html:html>
