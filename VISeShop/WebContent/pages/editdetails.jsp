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

<div class="main">
<!--Seiteninhalt--> 
<html:form action="saveitem?itemid=${item.id}" focus="name">
<p>
	<label>Artikelname</label>
	<html:text property="name" value="${item.name}" ></html:text>
	<br />
	<label>Beschreibung</label>
	<html:textarea property="description" value="${item.description}" rows="5" cols="60"/>
	<br />
	<label>URL zum Artikelbild</label>
	<html:text property="imgurl" value="${item.imgurl}"/>
	<br />
	<label>Preis</label>
	<html:text property="price" value="${item.price}" />
	<br />
</p>
	<html:submit>Speichern</html:submit>
</html:form>
</div>

<div class="menu"><html:link action="showshopindex">
	<bean:message key="prompt.back" />
</html:link></div>
<div class="userinfo"><jsp:include page="/pages/userinfo.jsp" /></div>
</body>
</html:html>
