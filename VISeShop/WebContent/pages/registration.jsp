<%@ page language="java"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<html:html locale="true">
<head>
<title><bean:message key="prompt.register.title" /></title>
<link rel="stylesheet" href="<html:rewrite href="css/layout.css"/>" />
</head>

<body>
<div class="top"><img src="<html:rewrite href='img/logo.jpg'/>" /></div>
<div class="main">
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
<html:form action="registersubmit" focus="firstname">
	<h3><bean:message key="prompt.register" /></h3>
	<label><bean:message key="prompt.email" /></label>
	<b><bean:write name="email"/></b>
	<br><br>
	<label><bean:message key="prompt.firstname" /></label>
	<html:text property="firstname" />
	<br>
	<label><bean:message key="prompt.lastname" /></label>
	<html:text property="lastname" />
	<br>
	<label><bean:message key="prompt.street" /></label>
	<html:text property="street" />
	<br>
	<label><bean:message key="prompt.zipcode" /></label>
	<html:text property="zipcode" />
	<br>
	<label><bean:message key="prompt.city" /></label>
	<html:text property="city" />
	<br>
	<label><bean:message key="prompt.country" /></label>
	<html:text property="country" />
	<br>
	<label><bean:message key="prompt.password" /></label>
	<html:password property="password" />
	<br>
	<label><bean:message key="prompt.password_retype" /></label>
	<html:password property="password_retype" />
	<br>
	<br>
	<div class="buttons"><html:submit>
		<bean:message key="button.submit" />
	</html:submit></div>
</html:form>
</div>
</body>
</html:html>
