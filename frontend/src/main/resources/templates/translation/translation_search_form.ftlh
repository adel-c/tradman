<#import "../macro/utils.ftlh" as u>

<form id="translation_search_form" hx-history="false" onsubmit="return false;"
      hx-trigger="translation-clear-search-form from:body"
      hx-get="translation/translation-search-form" hx-swap="outerHTML">


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
<#--            <@u.selectField fieldName="languages" fieldLabel="Language" options=languages multiple=true/>-->

            <label for="countriess">countries</label>
            <select id="countriess" name="countriess"
                    _="on change show <option/> in #languages when its value contains my @data-country end on change log @data-country "

            >
                <option value="fr" data-country="en;fr"  >fr</option>
                <option value="es" data-country="en;es">es</option>
                <option value="gb"  data-country="en">gb</option>
                <option value="ca" data-country="ca;fr">ca</option>

            </select>

            <label for="languages">languages</label>
            <select id="languages" name="languages"
                        multiple

            >
                <option value="fr"  >fr</option>
                <option value="es"  >es</option>
                <option value="en">en</option>
                <option value="ca">ca</option>

            </select>
        </div>
    </div>

    <label for="key">Key</label>
    <input id="key" type="search" name="key"
    <#if preselectKey??>
    value="${preselectKey}"
    </#if>
    />

    <div class="search-form-buttons">
        <div  role="button" onclick="htmx.trigger('body','translation-clear-search-form')"
        >Clear
        </div>
        <div  role="button" onclick="downloadExportFor(this,'/api/download-file')"
        >Export
        </div>

        <div role="button" <#--_="on click trigger RELOAD_TRANSLATION_TABLE" -->

                onclick="htmx.trigger('body','${trigger_reload_translation_table}')">Search
        </div>


    </div>

</form>
