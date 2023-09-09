<#import "../macro/utils.ftlh" as u>
<div _="on translation_form_changed_value from body debounced at 400ms send ${trigger_reload_translation_table} to body"></div>
<form id="translation_search_form" hx-history="false" onsubmit="return false;"
      hx-trigger="translation-clear-search-form from:body"
      hx-get="translation/translation-search-form"

>


    <div class="grid">
        <div>
            <@u.selectField fieldName="partners" fieldLabel="Partner" options=partners multiple=true
            triggerEvent='translation_form_changed_value' />
        </div>
        <div>
            <@u.selectField fieldName="countries" fieldLabel="Country" options=countries multiple=true
            triggerEvent='translation_form_changed_value'
            />
        </div>
        <div>
            <@u.selectField fieldName="profiles" fieldLabel="Profile" options=profiles multiple=true
            triggerEvent='translation_form_changed_value'
            />
        </div>
        <div>
            <@u.selectField fieldName="languages" fieldLabel="Language" options=languages multiple=true
            triggerEvent='translation_form_changed_value'
            />
        </div>
    </div>

    <label for="key">key</label>
    <input id="key" type="text" name="key" _="on keyup debounced at 400ms send translation_form_changed_value to body"/>

<div class="grid">
    <button onclick="htmx.trigger('body','translation-clear-search-form')"
    >clear
    </button>
    <button onclick="downloadExportFor(this,'/api/download-file')"
    >Export
    </button>

    <button <#--_="on click trigger RELOAD_TRANSLATION_TABLE" -->

            onclick="htmx.trigger('body','${trigger_reload_translation_table}')">Search
    </button>
</div>

</form>
