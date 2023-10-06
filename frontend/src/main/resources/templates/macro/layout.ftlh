<#macro main title >
    <!DOCTYPE html>
    <html lang="en" data-theme="light">
    <head>
        <meta charset="UTF-8">
        <title>${title}</title>
        <script src="/webjars/htmx.org/1.9.4/dist/htmx.js"></script>
        <#--        <script src="/webjars/htmx.org/1.9.4/dist/ext/json-enc.js"></script>-->
        <#--        <script src="/webjars/htmx.org/1.9.4/dist/ext/debug.js"></script>-->
        <script src="/webjars/hyperscript.org/0.9.11/dist/_hyperscript.js"></script>

        <meta name="htmx-config" content='{"globalViewTransitions":"true"}'>
<script type="module" src="/static/index-9968bab0.js"></script>
<script type="module" src="/static/Button.js"></script>
<script type="module" src="/static/Card.js"></script>
        <link rel="stylesheet" href="/static/normalize.css"/>
        <link rel="stylesheet" href="/webjars/picocss__pico/1.5.10/css/pico.css"/>
<#--        <link rel="stylesheet" href="/static/style.css"/>-->
                <link rel="stylesheet" href="/static/main.css"/>
        <#--        <link rel="stylesheet" href="/modal_style.css"/>-->

    </head>
    <body>
    <script type="text/javascript">
        function downloadExportFor(element, baseUrl, targetForm) {
            function computeUrlFrom(relativePath, parameters) {
                const host = location.href;
                const url = new URL(relativePath, host);
                for (const [key, value] of Object.entries(parameters)) {
                    url.searchParams.append(key, value);
                }
                return url.href;
            }

            let form;
            if (targetForm) {
                form = htmx.find(targetForm);
            } else {
                form = htmx.closest(element, "form");
            }
            let values = htmx.values(form);

            const url = computeUrlFrom(baseUrl, values);
            let link = document.createElement("a");
            link.hidden = true
            link.download = "true"
            link.href = url

            element.parentElement.appendChild(link);
            link.click()
            link.remove()
        }

    </script>



<#--        <aside style="width: 10vw;float: left;padding: var(--block-spacing-vertical) 0;" >-->

<#--            <nav>-->
<#--                <ul>-->
<#--                    <li><strong>Trads</strong></li>-->
<#--                </ul>-->
<#--                <ul>-->
<#--                    <li><a href="/translation-definition" >translation keys</a></li>-->
<#--                    <li><a href="/translation">translations</a></li>-->
<#--                </ul>-->
<#--            </nav>-->
<#--        </aside>-->

    <div class="parent">
        <header class=" section">Header</header>
        <aside class="left-side section" >
            <nav>
                <ul>
                    <li><strong>Trads</strong></li>
                </ul>
                <ul>
                    <li><a href="/translation-definition" >translation keys</a></li>
                    <li><a href="/translation">translations</a></li>
                </ul>
            </nav>
        </aside>
        <main id="mainContent" class="section "><#nested /></main>
        <div class="right-side section" >Right Sidebar</div>
        <footer class="section">Footer</footer>
    </div>
    </body>
    </html>
</#macro>

