<#import "./macro/layout.ftlh" as l>

<@l.main title="Translations">

    <form hx-post="/translation" hx-history="false" hx-swap="outerHTML" hx-target="#translation_definition_table">
        <label for="key">key</label>
        <select id="key"  name="key">
            <#list translationKeys as key>
                <option value="${key}" >${key} ${key_index} ${key_has_next?string('yes', 'no')}</option>
            </#list>
        </select>


        <button>submit</button>
    </form>





</@l.main>
