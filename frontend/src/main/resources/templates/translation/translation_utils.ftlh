<#macro translationRow translation >
    <tr>

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
</#macro>
