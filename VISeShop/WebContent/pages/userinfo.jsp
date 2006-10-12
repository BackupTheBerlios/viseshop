<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>

<logic:present name="account">
	<bean:message key="prompt.logedin" />
	<bean:write name="account" property="firstname" />
	<bean:write name="account" property="lastname" />
	<br />
	<b><html:link action="/logout"><bean:message key="prompt.logout"/></html:link></b>
	<br /><br />
	<b><html:link action="/showcart">[ <bean:message key="prompt.showbasket" /> ]</html:link></b>
</logic:present>

<logic:notPresent name="account">
	<logic:redirect action="/login" />
</logic:notPresent>
