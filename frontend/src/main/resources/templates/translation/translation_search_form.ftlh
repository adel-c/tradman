<#import "../macro/utils.ftlh" as u>
<form id="translation_search_form" hx-post="/translation" hx-history="false" hx-swap="innerHTML" hx-target="#translation_table_rows">


    <div class="grid">
        <div>
            <@u.selectField fieldName="partner" fieldLabel="Partner" options=partners/>
        </div>
        <div>
            <@u.selectField fieldName="country" fieldLabel="Country" options=countries/>
        </div>
        <div>
            <@u.selectField fieldName="profile" fieldLabel="Profile" options=profiles/>
        </div>
        <div>
            <@u.selectField fieldName="lang" fieldLabel="Language" options=languages/>
        </div>
    </div>

    <label for="key">key</label>
    <input id="key" type="text" name="key"/>

    <button>submit</button>
</form>
