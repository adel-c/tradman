<#import "../macro/utils.ftlh" as u>

<#macro readOnlyField fieldLabel fieldName value>
    <label for="${fieldName}">${fieldLabel}</label>
    <input id="${fieldName}" type="text" name="${fieldName}" readonly value="${value}"/>
</#macro>
<dialog  x-data="{open:true}"  id="new_translation_modal"  @close-modal = "open=false;setTimeout(()=>$refs.modal.remove(),300)"
        x-transition.duration.300ms
         x-ref="modal"
         @htmx:load="console.log($event);$refs.modal.showModal()"
        x-show="open"

>
    <#assign hasATraslation= translation?has_content/>

    <article style="width: 40vw;max-width: 100vw">
        <#if hasATraslation>
            <h3>Edit Translation</h3>
        <#else >
            <h3>New Translation</h3>
        </#if>

        <form hx-post="/translation" hx-history="false" <#--_="on htmx:afterRequest transition opacity to 0  trigger closeModal"-->
              @htmx:after-request.camel="$dispatch('close-modal')"
              @htmx:validation:failed="console.log('failed',$event)"
              @submit="console.log($event)"
              hx-swap="none">
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
            <input id="value" type="text"  name="value" value="${hasATraslation?then(translation.value,'')}" autocomplete="off"
            @htmx:validation:validate="console.log($event,$el,$el.value);if($el.value === 'aa'){$el.setCustomValidity('')}else{$el.setCustomValidity('cfo')};"
            @change="console.log($event,$el,$el.value);if($el.value === 'aa'){$el.setCustomValidity('')}else{$el.setCustomValidity('cfo')};"
            />
            <footer class="grid">

                <button <#--_="on click halt the event then trigger closeModal" --> @click.prevent="$dispatch('close-modal')" role="button">Close</button>
                <button x-data="{disableSave:false}" @htmx:before-request="disableSave=true" :disabled="disableSave" >Submit</button>
            </footer>
        </form>
    </article>
</dialog>
