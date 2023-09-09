<#import "../macro/utils.ftlh" as u>
<div id="modal" _="on closeModal add .closing then wait for animationend then remove me">
    <div class="modal-underlay" _="on click trigger closeModal"></div>
    <div class="modal-content">
        <#assign no_preselect= 'X-NONE-X'/>
        <#assign hasATraslation= translation?has_content/>
        <#assign partner= (hasATraslation)?then(translation.partner,no_preselect)/>
        <#assign country= (hasATraslation)?then(translation.country,no_preselect)/>
        <#assign profile= (hasATraslation)?then(translation.profile,no_preselect)/>
        <#assign language= (hasATraslation)?then(translation.lang,no_preselect)/>
        <#assign key= (hasATraslation)?then(translation.key,no_preselect)/>
        <h1>New Translation</h1>
        <form hx-post="/translation" hx-history="false" _="on htmx:afterRequest trigger closeModal">

            <@u.selectField fieldName="key" fieldLabel="Key" options=translationKeys
            disabled=hasATraslation
            preSelect=keyy />
            <div class="grid">
                <div>
                    <@u.selectField fieldName="partner" fieldLabel="Partner" options=partners
                    disabled=hasATraslation
                    preSelect=partner />
                </div>
                <div>
                    <@u.selectField fieldName="country" fieldLabel="Country" options=countries
                    disabled=hasATraslation preSelect=country/>
                </div>
                <div>
                    <@u.selectField fieldName="profile" fieldLabel="Profile" options=profiles disabled=hasATraslation
                    preSelect=profile/>
                </div>
                <div>
                    <@u.selectField fieldName="lang" fieldLabel="Language" options=languages disabled=hasATraslation
                    preSelect=language/>
                </div>
            </div>


            <label for="value">value</label>
            <input id="value" type="text" name="value"/>


            <button>Submit</button>
        </form>
        <button _="on click trigger closeModal">Close</button>
    </div>
</div>
