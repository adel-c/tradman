<table id="translation_definition_table">
    <thead>
    <tr>
        <th>key</th>
        <th>definition</th>
        <th>expand</th>
    </tr>
    </thead>
    <tbody>

    <#list translationDefinitions as translationDefinition>
        <tr>

            <td>    ${translationDefinition.key} </td>
            <td>    ${translationDefinition.definition!''} </td>
            <td>    ${translationDefinition.expand?string('yes', 'no') } </td>
        </tr>
    </#list>
    </tbody>

</table>

