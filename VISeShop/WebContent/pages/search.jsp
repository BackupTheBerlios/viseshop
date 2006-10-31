<%@ page language="java"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<html:html locale="true">
<head>
<title><bean:message key="welcome.title" /></title>
<link rel="stylesheet" href="<html:rewrite href="../css/layout.css"/>" />
<link rel="stylesheet" href="<html:rewrite href="css/layout.css"/>" />
</head>

<body>
<div class="top"><img src="<html:rewrite href='img/logo.jpg'/>" /></div>
<div class="main">
<!--Ausgabe von Fehlermeldungen-->
<logic:messagesPresent>
	<div class="errors">
		Bitte korrigieren Sie folgende Fehler:
		<ul>
			<html:messages id="actionmessages" property="search">
				<li><bean:write name="actionmessages" /></li>
			</html:messages>
		</ul>
	</div>
</logic:messagesPresent>
<!--Seiteninhalt-->
<h1>Produktsuche</h1>
<html:form action="search">
	<label>Suchtext</label>
	<html:text property="searchedtext"/>
	<br>
	<label>Obere Preisgrenze</label>
	<html:text property="upperprice"/>
	<br>
	<label>Untere Preisgrenze</label>
	<html:text property="lowerprice"/>
	
	<br />
	<div class="buttons"><html:submit>
		suchen
	</html:submit></div>
</html:form>

</div>
<div class="menu">
<%-- <logic:iterate id="commoditygroup" name="commoditygroups">
	<b><bean:write name="commoditygroup" property="name"/></b><br>
	<bean:define id="subgroups" name="commoditygroup" property="commoditygroups"/>
	<ul>
		<logic:iterate id="subgroup" name="subgroups">
			<li>
				<html:link action="/showgroupitems" paramName="subgroup" paramId="groupid" paramProperty="id">
					<bean:write name="subgroup" property="name"/>
				</html:link>
			</li>
		</logic:iterate>
	</ul>
	<br />
</logic:iterate> --%>

<html:link action="showshopindex">
	<bean:message key="prompt.back" />
</html:link>

</div>
<div class="userinfo">
	<jsp:include page="/pages/userinfo.jsp"/>
</div>
</body>
</html:html>
