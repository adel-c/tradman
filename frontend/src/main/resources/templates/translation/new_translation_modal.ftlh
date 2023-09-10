<#import "../macro/utils.ftlh" as u>

<#macro readOnlyField fieldLabel fieldName value>
    <label for="${fieldName}">${fieldLabel}</label>
    <input id="${fieldName}" type="text" name="${fieldName}" readonly value="${value}"/>
</#macro>
<dialog open id="modal" _="on closeModal remove me"
        <#--        on closeModal add .modal-is-closing then wait for animationend then remove me-->
>
    <#assign hasATraslation= translation?has_content/>

    <article style="width: 40vw;max-width: 100vw">
        <#if hasATraslation>
            <h3>Edit Translation</h3>
        <#else >
            <h3>New Translation</h3>
        </#if>

        <form hx-post="/translation" hx-history="false" _="on htmx:afterRequest trigger closeModal">
            <#if hasATraslation>
                <@readOnlyField fieldName="key" fieldLabel="Key" value=translation.key/>
                <div class="grid">
                    <div>
                        <@readOnlyField fieldName="partner" fieldLabel="Partner" value=translation.partner/>
                    </div>
                    <div>
                        <@readOnlyField fieldName="country" fieldLabel="Country" value=translation.country/>
                    </div>
                    <div>
                        <@readOnlyField fieldName="profile" fieldLabel="Profile" value=translation.profile/>
                    </div>
                    <div>
                        <@readOnlyField fieldName="lang" fieldLabel="Language" value=translation.lang/>
                    </div>
                </div>

            <#else >
                <@u.selectField fieldName="key" fieldLabel="Key" options=translationKeys/>
                <div class="grid">
                    <div>
                        <@u.selectField fieldName="partner" fieldLabel="Partner" options=partners/>
                    </div>
                    <div>
                        <@u.selectField fieldName="country" fieldLabel="Country" options=countries/>
                    </div>
                    <div>
                        <@u.selectField fieldName="profile" fieldLabel="Profile" options=profiles />
                    </div>
                    <div>
                        <@u.selectField fieldName="lang" fieldLabel="Language" options=languages/>
                    </div>
                </div>

            </#if>
            <label for="value">value</label>
            <input id="value" type="text" name="value" value="${hasATraslation?then(translation.value,'')}" autocomplete="off"/>
            <footer class="grid">

                <button _="on click halt the event then trigger closeModal" role="button">Close</button>
                <button>Submit</button>
            </footer>
        </form>
    </article>
</dialog>
