<#import "../macro/utils.ftlh" as u>
<form hx-post="/translation" hx-history="false" hx-swap="innerHTML" hx-target="#translation_table_rows">

    <@u.selectField fieldName="key" fieldLabel="Key" options=translationKeys/>
    <@u.selectField fieldName="partner" fieldLabel="Partner" options=partners/>
    <@u.selectField fieldName="country" fieldLabel="Country" options=countries/>
    <@u.selectField fieldName="profile" fieldLabel="Profile" options=profiles/>
    <@u.selectField fieldName="lang" fieldLabel="Language" options=languages/>

    <label for="value">value</label>
    <input id="value" type="text" name="value"/>

    <button>submit</button>
</form>
