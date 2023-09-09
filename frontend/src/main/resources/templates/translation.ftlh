<#import "./macro/layout.ftlh" as l>
<#import "./macro/utils.ftlh" as u>
<#import "./translation/translation_utils.ftlh" as tu>

<@l.main title="Translations">
    <button _="on click toggle .clicked">
        Toggle the "clicked" class on me
    </button>


    <button hx-get="/translation/new" <#--hx-trigger="load,click"--> hx-target="body" hx-swap="beforeend">Add Translation</button>



    <div hx-indicator="#translation_loading_indicator"
         hx-trigger="load"
         hx-get="translation/translation-search-form"
    hx-on="click ">
<#--<#include "./translation/translation_search_form.ftlh">-->
    </div>
    <div hx-indicator="#translation_loading_indicator"
         hx-include="#translation_search_form"
         hx-trigger="RELOAD_TRANSLATION_TABLE from:body"
         hx-post="translation/translation-table">

    </div>

    <div>
        <img alt="loading translations..." id="translation_loading_indicator" class="htmx-indicator" src="/rings.svg">
    </div>

</@l.main>
