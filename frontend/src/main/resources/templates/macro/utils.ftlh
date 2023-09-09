<#macro selectField fieldName fieldLabel options multiple=false  preSelect='X-NONE-X'  triggerEvent='X-NONE-X' >
    <label for="${fieldName}">${fieldLabel}</label>
    <select id="${fieldName}" name="${fieldName}"
            <#if multiple>
                multiple
            </#if>
<#if triggerEvent != 'X-NONE-X'>
    _="on change  debounced at 400ms send ${triggerEvent} to body"
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
