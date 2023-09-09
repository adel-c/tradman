<#import "./translation_utils.ftlh" as tu>
<#list translations as translation>
    <@tu.translationRow translation=translation/>
</#list>
