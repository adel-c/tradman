<#import "../macro/utils.ftlh" as u>
<div id="modal" _="on closeModal add .closing then wait for animationend then remove me">
    <div class="modal-underlay" _="on click trigger closeModal"></div>
    <div class="modal-content">
        <h1>New Translation</h1>
        <form hx-post="/translation" hx-history="false" hx-swap="innerHTML" hx-target="#translation_table_rows" _="on htmx:afterRequest trigger closeModal">

            <@u.selectField fieldName="key" fieldLabel="Key" options=translationKeys/>
            <@u.selectField fieldName="partner" fieldLabel="Partner" options=partners/>
            <@u.selectField fieldName="country" fieldLabel="Country" options=countries/>
            <@u.selectField fieldName="profile" fieldLabel="Profile" options=profiles/>
            <@u.selectField fieldName="lang" fieldLabel="Language" options=languages/>

            <label for="value">value</label>
            <input id="value" type="text" name="value"/>

            <button>submit</button>
        </form>
        <button _="on click trigger closeModal">Close</button>
    </div>
</div>
