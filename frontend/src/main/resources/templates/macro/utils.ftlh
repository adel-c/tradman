<#macro selectField fieldName fieldLabel options multiple=false >
    <label for="${fieldName}">${fieldLabel}</label>
    <select id="${fieldName}" name="${fieldName}"
    <#if multiple>
        multiple
    </#if>
    >
        <#list options as option>
            <option value="${option.value}">${option.label}</option>
        </#list>
    </select>
</#macro>
