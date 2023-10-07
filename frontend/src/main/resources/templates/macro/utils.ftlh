<#macro selectField fieldName fieldLabel options multiple=false  preSelect='X-NONE-X' >
    <label for="${fieldName}">${fieldLabel}</label>
    <select id="${fieldName}" name="${fieldName}"
            <#if multiple>
                multiple
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
<#macro toggleableCheckbox fieldName leftValue rightValue noValue currentValue=noValue >
    <div class="toggleable-checkbox" x-data="{leftValue:'${leftValue}', rightValue:'${rightValue}', noValue:'${noValue}', currentValue:'${currentValue}' }" >
        <input name="${fieldName}" readonly hidden="hidden"  :value="currentValue" />
        <span  class="toggleable-checkbox__left-side-value toggleable-checkbox__side-value"
               :class="{ 'toggleable-checkbox__selected': currentValue===leftValue }"
               @click="currentValue = (currentValue==leftValue)?noValue:leftValue" x-text="leftValue"></span>
        <span  class="toggleable-checkbox__right-side-value toggleable-checkbox__side-value"
               :class="{ 'toggleable-checkbox__selected': currentValue===rightValue }"
               @click="currentValue = (currentValue==rightValue)?noValue:rightValue" x-text="rightValue"></span>


    </div>
</#macro>
