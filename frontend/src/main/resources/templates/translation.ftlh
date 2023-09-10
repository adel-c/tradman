<#import "./macro/layout.ftlh" as l>
<#import "./macro/utils.ftlh" as u>
<#import "./translation/translation_utils.ftlh" as tu>

<@l.main title="Translations">
    <button _="on click toggle .clicked">
        Toggle the "clicked" class on me
    </button>


    <button hx-get="/translation/new" <#--hx-trigger="load,click"--> hx-target="body" hx-swap="beforeend">Add
        Translation
    </button>



<#--    <div hx-indicator="#translation_loading_indicator"
         hx-trigger="load"
         hx-get="translation/translation-search-form"
    hx-on="click ">

    </div>
    -->

    <div>
        <#include "./translation/translation_search_form.ftlh">
    </div>

    <#include "./translation/translation_table_body.ftlh">


    <div>
        <img style="background-color: var(--primary);border-radius: 50%" alt="loading translations..." id="translation_loading_indicator" class="htmx-indicator" src="/rings.svg"/>
    </div>

</@l.main>
