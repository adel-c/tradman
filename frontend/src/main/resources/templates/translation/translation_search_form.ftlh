<#import "../macro/utils.ftlh" as u>

<form id="translation_search_form" hx-history="false"  onsubmit="return false;">


    <div class="grid">
        <div>
            <@u.selectField fieldName="partners" fieldLabel="Partner" options=partners multiple=true />
        </div>
        <div>
            <@u.selectField fieldName="countries" fieldLabel="Country" options=countries multiple=true/>
        </div>
        <div>
            <@u.selectField fieldName="profiles" fieldLabel="Profile" options=profiles multiple=true/>
        </div>
        <div>
            <@u.selectField fieldName="languages" fieldLabel="Language" options=languages multiple=true/>
        </div>
    </div>

    <label for="key">key</label>
    <input id="key" type="text" name="key"/>

    <button onclick="htmx.trigger('body','downloadExport')" >Export</button>
    <button  _='on click make a URL from "/path/", "https://origin.example.com" called myURL log myURL' >XXXXXX</button>

    <button <#--_="on click trigger RELOAD_TRANSLATION_TABLE" --> onclick="htmx.trigger('body','${trigger_reload_translation_table}')">Search</button>
</form>
<a   hx-ext="my-ext" dl-base="/api/download-file" hx-include="#translation_search_form" hx-trigger="downloadExport from:body"  download hidden="hidden"></a>
