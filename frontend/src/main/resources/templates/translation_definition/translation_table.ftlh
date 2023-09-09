<table id="translation_table">
    <thead>
    <tr>
        <th>Partner</th>
        <th>Country</th>
        <th>Profile</th>
        <th>language</th>
        <th>key</th>
        <th>value</th>

    </tr>
    </thead>
    <tbody>

    <#list translations as translation>
        <tr>

            <td>    ${translation.partner} </td>
            <td>    ${translation.country} </td>
            <td>    ${translation.profile} </td>
            <td>    ${translation.lang} </td>
            <td>    ${translation.key} </td>
            <td>    ${translation.value} </td>

        </tr>
    </#list>
    </tbody>

</table>

