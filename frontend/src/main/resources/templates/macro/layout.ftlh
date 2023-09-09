<#macro main title >
    <!DOCTYPE html>
    <html lang="en"  data-theme="light">
    <head>
        <meta charset="UTF-8">
        <title>${title}</title>
        <script src="/webjars/htmx.org/1.9.4/dist/htmx.js" ></script>
        <script src="/webjars/htmx.org/1.9.4/dist/ext/json-enc.js"></script>
        <script src="/webjars/hyperscript.org/0.9.11/dist/_hyperscript.js"></script>
        <link rel="stylesheet" href="/webjars/picocss__pico/1.5.10/css/pico.css"/>
        <link rel="stylesheet" href="/main_style.css"/>
        <link rel="stylesheet" href="/modal_style.css"/>

    </head>
    <body>
    <script type="text/javascript">
        console.log(htmx);
        htmx.defineExtension('my-ext', {
            onEvent : function(name, evt) {
                if("htmx:trigger" === name){

                    console.log("Fired event: " + name, evt);
                    let target = evt.target;
                    let includeForm=target.getAttribute("hx-include");
                    let dlBaseUrl=target.getAttribute("dl-base");
                    let host = location.href;
                    let values = htmx.values(htmx.find(includeForm));
                    console.log(target)
                    console.log(values)
                    const myUrlWithParams = new URL(dlBaseUrl,host);
                    for (const [key, value] of Object.entries(values)) {
                        console.log(key+":"+value);
                        myUrlWithParams.searchParams.append(key, value);
                    }



                    console.log(myUrlWithParams.href);
                    target.href=myUrlWithParams.href;
                    target.click()
                }

            }
        })
    </script>
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
