<#import "./macro/layout.ftlh" as l>

<@l.main title="Translation keys">
    <form hx-post="/translation-definition" hx-history="false" hx-swap="outerHTML" hx-target="#translation_definition_table">
        <label for="key">key</label>
        <input id="key" type="text" name="key" required/>


        <button>submit</button>
    </form>

    <#include "./translation_definition/translation_definition_table.ftlh"/>
</@l.main>


