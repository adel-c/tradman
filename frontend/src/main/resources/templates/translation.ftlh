<#import "./macro/layout.ftlh" as l>
<#import "./macro/utils.ftlh" as u>
<#import "./translation/translation_utils.ftlh" as tu>

<@l.main title="Translations">

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


    <table>
        <thead>
        <tr>
            <th>Partner</th>
            <th>Country</th>
            <th>Profile</th>
            <th>language</th>
            <th>key</th>
            <th>value</th>

        </tr>
        </thead>
        <tbody  id="translation_table_rows">

        <#list translations as translation>
            <@tu.translationRow translation=translation/>
        </#list>
        </tbody>

    </table>


</@l.main>
