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
<h1><bean:message key="prompt.welcome.greeting"/></h1>
<logic:messagesPresent property="success">
	<div class="success">
		<ul>
			<html:errors property="success" />
		</ul>
	</div>
</logic:messagesPresent>
</div>
<div class="menu">
<logic:iterate id="commoditygroup" name="commoditygroups">
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
</logic:iterate>
</div>
<div class="userinfo">
	<jsp:include page="/pages/userinfo.jsp"/>
</div>
</body>
</html:html>
