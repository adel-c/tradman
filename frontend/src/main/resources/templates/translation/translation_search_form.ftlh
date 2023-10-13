<#import "../macro/utils.ftlh" as u>

<form id="translation_search_form" hx-history="false" onsubmit="return false;"
      hx-trigger="translation-clear-search-form from:body"
      hx-get="translation/translation-search-form" hx-swap="outerHTML">

<#--    <@u.multiSelect "aze" "name" partners></@u.multiSelect>-->
    <div style="padding: 4rem"></div>
<#--    <select id="aaa" name="machin" multiple>-->
<#--        <option value="AA">A</option>-->
<#--        <option value="BB">B</option>-->
<#--        <option value="CC">C</option>-->
<#--    </select>-->
    <input type="text" class=" " placeholder="" style="" value="mamaa"/>
    <div style="width: 30rem">
        <multi-multi
                name="turcmuche"
                <#--            selecteditem="badge bg-primary pt-1 m-1"-->
                <#--            dropdown="border"-->
                <#--            dropdownitem="p-1"-->
                <#--            selectallbutton="btn btn-sm btn-light"-->
                <#--            selectallbuttonspan="bi-check2-all text-success"-->
                <#--            clearbutton="btn btn-sm btn-light"-->
                <#--            clearbuttonspan="bi-x-circle text-danger"-->
        >
            <template>
                LALALAL
                <div class="msw-actionbar">
                    <input type="search" class="msw-searchbox" style="flex-grow: 1;" placeholder=""/>
                    <div style="display: flex;" class="msw-buttons">
                        <button class="msw-selectallbutton " title="Select All">A</button>
                        <button class="msw-clearbutton " title="Clear Selection">C</button>
                    </div>
                </div>
                <div class="msw-selected " style="display: flex; flex-wrap: wrap; flex-grow: 1;">

                </div>

                <div class="msw-dropdown-wrapper">
                    <div class="msw-dropdown" style="display: none; width: 100%; position: absolute; z-index: 2;">
                    </div>
                </div>
            </template>
            <option value="AA">A</option>
            <option value="BB">B</option>
            <option value="CC">C</option>
            <option value="CD">D</option>
        </multi-multi>
    </div>

    <div style="padding: 4rem"></div>
    <div class="grid">
        <div>
        <toggleable-checkbox style="width: 9rem" name="leCHAMPS" leftValue="MACHIN" rightValue="TRUC" noValue="WALOU" value="WALOU"></toggleable-checkbox>



        </div>
<div>
    <div class="toggleable-checkbox" x-data="{leftValue:'MACHIN', rightValue:'TRUC', noValue:'WALOU', currentValue:'WALOU' }" >
        <input name="leCHAMPS2" readonly hidden="hidden"  :value="currentValue" />
        <span  class="toggleable-checkbox__left-side-value toggleable-checkbox__side-value"
               :class="currentValue===leftValue?'toggleable-checkbox__selected':''"
               @click="currentValue = (currentValue==leftValue)?noValue:leftValue" x-text="leftValue"></span>
        <span  class="toggleable-checkbox__right-side-value toggleable-checkbox__side-value"
               :class="currentValue===rightValue?'toggleable-checkbox__selected':''"
               @click="currentValue = (currentValue==rightValue)?noValue:rightValue" x-text="rightValue"></span>


    </div>
</div>
        <div>
            <@u.toggleableCheckbox fieldName="leChamp3" leftValue="MACHIN" rightValue="TRUC" noValue="WALOU" ></@u.toggleableCheckbox>
        </div>
        <div>
            <@u.toggleableCheckbox fieldName="lautre" leftValue="gauche" rightValue="droite" noValue="rien" ></@u.toggleableCheckbox>
        </div>
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
                    _="on change show <option/> in #languages when its @data-country contains my value"

            >
                <option value="fr">fr</option>
                <option value="es" >es</option>
                <option value="en">en</option>
                <option value="ca">ca</option>

            </select>

            <label for="languages">languages</label>
            <select id="languages" name="languages"
                        multiple

            >
                <option value="fr" data-country="gb;fr" >fr</option>
                <option value="es" data-country="gb;es" >es</option>
                <option value="en" data-country="gb;fr">en</option>
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
