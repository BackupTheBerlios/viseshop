<%@ page language="java"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>

<html:html locale="true">
<head>
<title><bean:message key="prompt.login.title" /></title>
<link rel="stylesheet" href="<html:rewrite href="css/layout.css"/>" />
<html:base />
</head>

<body>

<div class="top"><img src="<html:rewrite href='img/logo.jpg'/>" /></div>

<div class="main"/>
<!--Seiteninhalt-->
<html:form action="loginsubmit" focus="email">
	<!--Ausgabe von Fehlermeldungen-->
<logic:messagesPresent property="login">
	<div class="errors">
		Bitte korrigieren Sie folgende Fehler:
		<ul>
			<html:errors property="login" />
		</ul>
	</div>
</logic:messagesPresent>
	<label><bean:message key="prompt.email" /></label>
	<html:text property="email" value="HansDampf@test.net"/>
	<br>
	<label><bean:message key="prompt.password" /></label>
	<html:password property="password" value="12345"/>
	<br>

	<div class="buttons"><html:submit>
		<bean:message key="button.submit" />
	</html:submit></div>
</html:form>
</div>
</body>
</html:html>
