<table id="translation_definition_table" role="grid">
    <thead>
    <tr>
        <th>key</th>
        <th></th>

    </tr>
    </thead>
    <tbody>

    <#list translationDefinitions as translationDefinition>
        <tr>

            <td>    ${translationDefinition.key} </td>
            <td>    <a href="/translation?key=${translationDefinition.key}">go to</a> </td>

        </tr>
    </#list>
    </tbody>

</table>

