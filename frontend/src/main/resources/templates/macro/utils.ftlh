<#macro selectField fieldName fieldLabel options >
    <label for="${fieldName}">${fieldLabel}</label>
    <select id="${fieldName}" name="${fieldName}">
        <#list options as option>
            <option value="${option.value}">${option.label}</option>
        </#list>
    </select>
</#macro>
