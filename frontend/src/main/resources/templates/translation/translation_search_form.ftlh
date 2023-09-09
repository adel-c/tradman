<#import "../macro/utils.ftlh" as u>

<form id="translation_search_form" hx-history="false"  onsubmit="return false;">


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

    <button <#--_="on click trigger RELOAD_TRANSLATION_TABLE" --> onclick="htmx.trigger('body','RELOAD_TRANSLATION_TABLE')">Search</button>
</form>

