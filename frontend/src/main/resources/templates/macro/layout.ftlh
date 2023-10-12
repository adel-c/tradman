<#macro main title >
    <!DOCTYPE html>
    <html lang="en" data-theme="light">
    <head>
        <meta charset="UTF-8">
        <title>${title}</title>
        <script type="importmap">
            {
             "imports": {
                 "lit": "/webjars/lit/2.8.0/index.js",
                 "lit/directives/class-map.js": "/webjars/lit/2.8.0/directives/class-map.js",
                 "lit-html/directives/class-map.js": "/webjars/lit-html/2.8.0/directives/class-map.js",
                 "@lit/reactive-element": "/webjars/lit__reactive-element/1.6.1/reactive-element.js",
                 "lit-html": "/webjars/lit-html/2.8.0/lit-html.js",
                 "lit-element/lit-element.js": "/webjars/lit-element/3.3.1/lit-element.js"
             }
         }
        </script>
        <script src="/static/multiselectalpine.js"></script>
        <script src="/webjars/htmx.org/1.9.6/dist/htmx.js"></script>
        <script src="/webjars/alpinejs/3.13.1/dist/cdn.js" defer></script>
<#--        <script src="https://cdn.tailwindcss.com"></script>-->
        <script defer src="https://unpkg.com/@alpinejs/focus@3.x.x/dist/cdn.min.js"></script>
        <#--        <script src="/webjars/htmx.org/1.9.4/dist/ext/json-enc.js"></script>-->
        <#--        <script src="/webjars/htmx.org/1.9.4/dist/ext/debug.js"></script>-->
        <script src="/webjars/hyperscript.org/0.9.11/dist/_hyperscript.js"></script>
<#--        <script src="/webjars/webcomponents__webcomponentsjs/2.7.0/webcomponents-loader.js"></script>-->
<#--        <script src="https://unpkg.com/@webcomponents/webcomponentsjs@latest/webcomponents-loader.js"></script>-->
<#--        <script type="module" src="/static/webComponents.js">-->
        <script type="module" src="/static/multiselect_native_webcomponent.js">

        </script>

        <link rel="stylesheet" href="/static/normalize.css"/>

        <link rel="stylesheet" href="/webjars/picocss__pico/1.5.10/css/pico.css"/>
<#--        <link rel="stylesheet" href="/static/style.css"/>-->
                <link rel="stylesheet" href="/static/main.css"/>
        <link rel="stylesheet" href="/static/multiselect.css"/>
        <#--        <link rel="stylesheet" href="/modal_style.css"/>-->

    </head>
    <body>

    <my-element hx-get="/machin" mood="great"></my-element>
    <my-element2 mood="great"></my-element2>

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

