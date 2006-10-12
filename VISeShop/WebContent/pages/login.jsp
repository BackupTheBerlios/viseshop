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
<!--Ausgabe von Fehlermeldungen-->
<html:errors />

<div class="top"><img src="<html:rewrite href='img/logo.jpg'/>" /></div>

<div class="main">
<logic:messagesPresent message="true" name="user">
	<html:messages id="message" message="true" property="user"></html:messages>
</logic:messagesPresent>

<logic:messagesPresent message="true" name="user">
	<html:messages id="message" message="true"
		property="<%=org.apache.struts.action.ActionMessages.GLOBAL_MESSAGE %>"></html:messages>
</logic:messagesPresent>

<!--Seiteninhalt-->
<html:form action="loginsubmit" focus="email">
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
