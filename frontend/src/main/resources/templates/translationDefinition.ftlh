<#import "./fragment/translation_definition_macros.ftlh" as f>
<!DOCTYPE html>


<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="/webjars/htmx.org/1.9.4/dist/htmx.js"></script>
    <link rel="stylesheet" href="/webjars/picocss__pico/1.5.10/css/pico.css"/>

</head>
<body>


<main id="mainContent" class="container">

    <form hx-post="/translation-definition" hx-history="false" hx-swap="beforebegin" hx-target="#translation_definition_table">
        <label for="key">key</label>
        <input id="key" type="text" name="key"/>

        <label for="expand">expand</label>
        <input id="expand" type="checkbox" name="expand" checked/>


        <button>submit</button>
    </form>

<table id="translation_definition_table">

    <#list translationDefinitions as translationDefinition>
        <@f.transaltionDefinitionRow translationDefinition=translationDefinition ></@f.transaltionDefinitionRow>
    </#list>
</table>

</main>
</body>
</html>
