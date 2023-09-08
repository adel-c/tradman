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

    <form hx-post="/translation-definition" hx-history="false" hx-swap="outerHTML" hx-target="#translation_definition_table">
        <label for="key">key</label>
        <input id="key" type="text" name="key"/>
        <label for="definition">definition</label>
        <input id="definition" type="text" name="definition"/>
        <label for="expand">expand</label>
        <input id="expand" type="checkbox" name="expand" checked/>


        <button>submit</button>
    </form>

<#include "./translation_definition/translation_definition_table.ftlh"/>

</main>
</body>
</html>
