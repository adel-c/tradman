<#list translations as translation>
        <tr
                <#if hasNextPage && !translation_has_next>
                    hx-indicator="#translation_loading_indicator"
                    hx-include="#translation_search_form"
                    hx-post="translation/translation-table/rows/${nextPage}"
                    hx-trigger="revealed"
                    hx-swap="afterend"
                </#if>

        >

            <td>    ${translation.partner} </td>
            <td>    ${translation.country} </td>
            <td>    ${translation.profile} </td>
            <td>    ${translation.lang} </td>
            <td>    ${translation.key} </td>
            <td>    ${translation.value} </td>
            <td>   <button
                        hx-params="none"
                        hx-get="/translation/update/${translation.partner}/${translation.country}/${translation.profile}/${translation.lang}/${translation.key}"
                        <#--hx-trigger="load,click"--> hx-target="body" hx-swap="beforeend">edit</button> </td>
        </tr>
    </#list>

