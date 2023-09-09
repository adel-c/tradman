<#macro selectField fieldName fieldLabel options multiple=false disabled=false preSelect='X-NONE-X' >
    <label for="${fieldName}">${fieldLabel}</label>
    <select id="${fieldName}" name="${fieldName}"
            <#if multiple>
                multiple
            </#if>
            <#if disabled>
                disabled
            </#if>
    >
        <#list options as option>
            <option value="${option.value}"
                <#if option.value == preSelect>
                    selected
                </#if>
            >${option.label}</option>
        </#list>
    </select>
</#macro>
