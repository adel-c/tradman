<table id="translation_definition_table">
    <thead>
    <tr>
        <th>key</th>
        <th>expand</th>
    </tr>
    </thead>
    <tbody>

    <#list translationDefinitions as translationDefinition>
        <tr>

            <td>    ${translationDefinition.key} </td>
            <td>    ${translationDefinition.expand?c} </td>
        </tr>
    </#list>
    </tbody>

</table>

