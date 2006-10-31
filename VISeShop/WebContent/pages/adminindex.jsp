<%@ page language="java"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>

<html:html locale="true">
<head>
<title><bean:message key="prompt.admin.index.title" /></title>
<link rel="stylesheet" href="<html:rewrite href="css/layout.css"/>" />
</head>

<body>
<div class="top">
<img src="<html:rewrite href='img/logo.jpg'/>" />
</div>


<!--Ausgabe von Fehlermeldungen-->
<html:errors />

<logic:messagesPresent message="true" name="user">
	<html:messages id="message" message="true" property="user"></html:messages>
</logic:messagesPresent>

<logic:messagesPresent message="true" name="user">
	<html:messages id="message" message="true"
		property="<%=org.apache.struts.action.ActionMessages.GLOBAL_MESSAGE %>"></html:messages>
</logic:messagesPresent>

<!--Seiteninhalt-->
<div class="menu">
<b><bean:message key="prompt.admin.index.title" /></b>
<ul>
	<li><html:link action="showcriticalitems">Bestände prüfen</html:link></li>
	<li><html:link action="showallusers">Alle Benutzer anzeigen</html:link></li>
	<li><html:link action="showshopindex">Shopindex anzeigen</html:link></li>
</ul>
</div>
<div class="main">
<b><bean:message key="prompt.admin.index.criticalamounts"/></b>
<table class="list">
<thead>
	<tr>
		<th>#</th>
		<th>Artikelname</th>
		<th>Warengruppen</th>
		<th>Aktueller<br/>Bestand</th>
		<th>Kritischer<br/>Bestand</th>
	</tr>
</thead>
<tbody>
<logic:iterate id="item" name="criticalitems">
 	<tr>
		<td><bean:write name="item" property="id" /></td>
		<td><bean:write name="item" property="name" /></td>
		<bean:define name="item" property="commoditygroup" id="commoditygroup" />
		<td><bean:write name="commoditygroup" property="name" /></td>
		<td style="color: red"><bean:write name="item" property="currentAmount"/></td>
		<td><bean:write name="item" property="criticalAmount"/></td>
		<td><html:link action="/reorder" paramId="itemid" paramName="item" paramProperty="id">Nachbestellen</html:link></td>
	</tr> 
</logic:iterate>
</tbody>
</table>
</div>
<div class="userinfo">
	<jsp:include page="/pages/userinfo.jsp"/>
</div>
</body>
</html:html>
