<%@ page language="java"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>

<html:html locale="true">
<head>
<title><bean:message key="prompt.admin.users.title" /></title>
<link rel="stylesheet" href="<html:rewrite href="css/layout.css"/>" />
</head>

<body>
<div class="top"><img src="<html:rewrite href='img/logo.jpg'/>" /></div>
<div class="menu">
<b><bean:message key="prompt.admin.index.title" /></b>
<ul>
	<li><html:link action="showcriticalitems">Bestände prüfen</html:link></li>
	<li><html:link action="showallusers">Alle Benutzer anzeigen</html:link></li>
</ul>
</div>
<div class="main">

<!--Ausgabe von Fehlermeldungen-->
<html:errors />

<!--Seiteninhalt-->
<table class="list">
	<thead>
		<tr>
			<th>eMail-Adresse</th>
			<th>Vorname</th>
			<th>Nachname</th>
			<th>Stadt</th>
			<th>Land</th>
		</tr>
	</thead>
	<tbody>
<logic:iterate id="account" name="accounts">
	<tr>
		<td><bean:write name="account" property="email"/></td>
		<td><bean:write name="account" property="firstname"/></td>
		<td><bean:write name="account" property="lastname"/></td>
		<td><bean:write name="account" property="city"/></td>
		<td><bean:write name="account" property="country"/></td>
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
