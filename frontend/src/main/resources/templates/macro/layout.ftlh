<#macro main title >
    <!DOCTYPE html>
    <html lang="en"  data-theme="light">
    <head>
        <meta charset="UTF-8">
        <title>${title}</title>
        <script src="/webjars/htmx.org/1.9.4/dist/htmx.js" ></script>
<#--        <script src="/webjars/htmx.org/1.9.4/dist/ext/json-enc.js"></script>-->
<#--        <script src="/webjars/htmx.org/1.9.4/dist/ext/debug.js"></script>-->
        <script src="/webjars/hyperscript.org/0.9.11/dist/_hyperscript.js"></script>
        <link rel="stylesheet" href="/webjars/picocss__pico/1.5.10/css/pico.css"/>
        <link rel="stylesheet" href="/main_style.css"/>
        <link rel="stylesheet" href="/modal_style.css"/>

    </head>
    <body hx-history="false">
    <script type="text/javascript">
        function downloadExportFor(element,baseUrl,targetForm) {
            function computeUrlFrom(relativePath,parameters) {
                const host = location.href;
                const url = new URL(relativePath, host);
                for (const [key, value] of Object.entries(parameters)) {
                    url.searchParams.append(key, value);
                }
                return url.href;
            }
            let form;
            if(targetForm){
                form=htmx.find(targetForm);
            }else{
                 form=htmx.closest(element,"form");
            }
            let values = htmx.values(form);

            const url = computeUrlFrom(baseUrl,values);
            let link = document.createElement("a");
            link.hidden=true
            link.download="true"
            link.href=url

            element.parentElement.appendChild(link);
            link.click()
            link.remove()
        }

    </script>
    <div class="grid">
        <a href="/">Go To Page 1</a>

        <a href="/translation-definition">translation keys</a>
        <a href="/translation">translations</a>
    </div>

    <main id="mainContent" class="container">
            <#nested />
    </main>
    </body>
    </html>
</#macro>
