<div hx-indicator="#translation_loading_indicator"
     hx-include="#translation_search_form"
     hx-trigger="${trigger_reload_translation_table} from:body"
     hx-post="translation/translation-table/0"
     hx-vals='${querySort}'
     hx-swap="outerHTML"
>

<div>Total elements: ${totalElement} / page size: ${pageSize}</div>


<table>
    <thead>

    <tr>



        <th hx-get="translation/translation-table-header" >Partner</th>
        <th>Country</th>
        <th>Profile</th>
        <th>language</th>
        <th>key</th>
        <th>value</th>

    </tr>
    </thead>

    <tbody>
    <#include "./translation_table_rows.ftlh"/>
    </tbody>
</table>
</div>
