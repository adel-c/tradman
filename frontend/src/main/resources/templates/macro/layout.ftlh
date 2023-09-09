<#macro main title >
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>${title}</title>
        <script src="/webjars/htmx.org/1.9.4/dist/htmx.js"></script>
        <script src="/webjars/htmx.org/1.9.4/dist/ext/json-enc.js"></script>
        <script src="/webjars/hyperscript.org/0.9.11/dist/_hyperscript.js"></script>
        <link rel="stylesheet" href="/webjars/picocss__pico/1.5.10/css/pico.css"/>
        <link rel="stylesheet" href="/main_style.css"/>

    </head>
    <body>

    <div class="grid">
        <a href="/">Go To Page 1</a>

        <a href="/translation-definition">setting definition</a>
        <a href="/translation">settings</a>
    </div>

    <main id="mainContent" class="container">
            <#nested />
    </main>
    </body>
    </html>
</#macro>
