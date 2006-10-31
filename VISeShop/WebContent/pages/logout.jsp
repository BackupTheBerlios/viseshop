<%@ page language="java"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<html:html locale="true">
<head>
<title><bean:message key="welcome.title" /></title>
<link rel="stylesheet" href="<html:rewrite href='css/layout.css'/>" />
<meta http-equiv="refresh"
	content="2; URL=<html:rewrite action='/login.do'/>">
</head>

<body>
<div class="top"><img src="<html:rewrite href='img/logo.jpg'/>" /></div>
<div class="main" align="center">
<b>Sie wurden erfolgreich vom System abgemeldet!</b><br />
Sie werden gleich weiter geleitet...</div>
</body>
</html:html>
