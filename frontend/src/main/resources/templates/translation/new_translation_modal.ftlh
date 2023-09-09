<#import "../macro/utils.ftlh" as u>
<div id="modal" _="on closeModal add .closing then wait for animationend then remove me">
    <div class="modal-underlay" _="on click trigger closeModal"></div>
    <div class="modal-content">
        <h1>New Translation</h1>
        <form hx-post="/translation" hx-history="false" _="on htmx:afterRequest trigger closeModal">

            <@u.selectField fieldName="key" fieldLabel="Key" options=translationKeys/>
            <div class="grid">
                <div>
                    <@u.selectField fieldName="partner" fieldLabel="Partner" options=partners/>
                </div>
                <div>
                    <@u.selectField fieldName="country" fieldLabel="Country" options=countries/>
                </div>
                <div>
                    <@u.selectField fieldName="profile" fieldLabel="Profile" options=profiles/>
                </div>
                <div>
                    <@u.selectField fieldName="lang" fieldLabel="Language" options=languages/>
                </div>
            </div>



            <label for="value">value</label>
            <input id="value" type="text" name="value"/>

            <button>Submit</button>
        </form>
        <button _="on click trigger closeModal">Close</button>
    </div>
</div>
