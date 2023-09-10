<div hx-indicator="#translation_loading_indicator"
     hx-include="#translation_search_form"
     hx-trigger="${trigger_reload_translation_table} from:body<#if reloadOnDisplay??>, load</#if>"
     hx-post="translation/translation-table/0"
     hx-vals='${querySort}'
     hx-swap="outerHTML"
     id="translation-table"

>

    <div>Total elements: ${totalElement} / page size: ${pageSize}</div>


    <table>
        <thead>

        <tr>


            <th      hx-vals='js:{addToSort: event.ctrlKey}'    hx-target="#translation-table" hx-trigger="click" hx-swap="outerHTML" hx-post="translation/translation-table/sort/PARTNER">
                    Partner
            </th>
            <th      hx-vals='js:{addToSort: event.ctrlKey}'    hx-target="#translation-table" hx-swap="outerHTML" hx-post="translation/translation-table/sort/COUNTRY">

                Country
            </th>
            <th      hx-vals='js:{addToSort: event.ctrlKey}'    hx-target="#translation-table" hx-swap="outerHTML" hx-post="translation/translation-table/sort/PROFILE">
                Profile
            </th>
            <th      hx-vals='js:{addToSort: event.ctrlKey}'    hx-target="#translation-table" hx-swap="outerHTML"
                hx-post="translation/translation-table/sort/LANGUAGE">language
            </th>
            <th      hx-vals='js:{addToSort: event.ctrlKey}'    hx-target="#translation-table" hx-swap="outerHTML" hx-post="translation/translation-table/sort/KEY">
                key
            </th>
            <th      hx-vals='js:{addToSort: event.ctrlKey}'    hx-target="#translation-table" hx-swap="outerHTML" hx-post="translation/translation-table/sort/VALUE">
                value
            </th>
            <th></th>
        </tr>
        </thead>

        <tbody>
        <#include "./translation_table_rows.ftlh"/>
        </tbody>
    </table>
</div>
