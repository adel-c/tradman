<#import "./translation_utils.ftlh" as tu>

<table>
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
        <@tu.translationRow translation=translation/>
    </#list>


    </tbody>
</table>
