<#import "./macro/layout.ftlh" as l>
<#import "./macro/utils.ftlh" as u>
<#import "./translation/translation_utils.ftlh" as tu>

<@l.main title="Translations">

    <div class="p-6 space-y-4 h-1" role="button"  hx-get="/translation/new" <#--hx-trigger="load,click"--> hx-target="body" hx-swap="beforeend">Add
        Translation
    </div>



<#--    <div hx-indicator="#translation_loading_indicator"
         hx-trigger="load"
         hx-get="translation/translation-search-form"
    hx-on="click ">

    </div>
    -->

    <div>
        <#include "./translation/translation_search_form.ftlh">
    </div>
    <div hx-indicator="#translation_loading_indicator"
         hx-include="#translation_search_form"
         hx-trigger="${trigger_reload_translation_table} from:body, load"
         hx-post="translation/translation-table/0">

    </div>

    <div>
        <img style="background-color: var(--primary);border-radius: 50%" alt="loading translations..." id="translation_loading_indicator" class="htmx-indicator" src="/rings.svg"/>
    </div>

</@l.main>
