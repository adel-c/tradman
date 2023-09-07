<!-- FreeMarker macros have to be imported into a namespace.
	We strongly recommend sticking to 'spring'. -->
<#import "/spring.ftl" as spring/>
<html>
<form action="" method="POST">
    Name:

    <@spring.bind "personForm.name"/>
    <input type="text"
           name="${spring.status.expression}"
           value="${spring.status.value?html}"/><br />
    <#list spring.status.errorMessages as error> <b>${error}</b> <br /> </#list>
    <br />
    ...
    <input type="submit" value="submit"/>
</form>
...
</html>
