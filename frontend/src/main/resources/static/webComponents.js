// import {LitElement, html, css} from 'https://unpkg.com/lit-element/lit-element.js?module';
import {css, html, LitElement} from 'lit-element/lit-element.js';
import {classMap} from 'lit/directives/class-map.js';

class ToggleableCheckbox extends LitElement {
    static formAssociated = true;
    static get properties() {
        return {
            leftValue: {type: String},
            rightValue: {type: String},
            noValue: {type: String},
            value:{type:String},
            name:{type:String}
        }
    }

    constructor() {
        super();
        this.leftClasses = {selected: false};
        this.rightClasses = {selected: false};

    }
    static get styles() {
        return css`
          .selected { color: green; }
        `;
    }

    render() {
        return html`
            <input value="${this.value}" name="${this.name}" readonly hidden="hidden">
            <div class=${classMap(this.leftClasses)} @click="${this._toggleLeft}">${this.leftValue}</div>
            <div class=${classMap(this.rightClasses)} @click="${this._toggleRight}">${this.rightValue}</div>`;
    }
    _toggleLeft(e) {
        console.log(e);
        if(this.value ===this.leftValue){
            this.value=this.noValue;
        }else{
            this.value=this.leftValue;
        }
        this._updateClass();
    }

    _updateClass() {

        this.leftClasses.selected=this.value===this.leftValue;
        this.rightClasses.selected=this.value===this.rightValue;

    }
    // createRenderRoot() {
    //     return this; // will render the template without shadow DOM
    // }
    _toggleRight(e) {
        console.log(e);
        if(this.value ===this.rightValue){
            this.value=this.noValue;
        }else{
            this.value=this.rightValue;
        }
        this._updateClass();
    }
}
class MyElement extends LitElement {

    static get properties() {
        return {
            mood: {type: String}
        }
    }

    static get styles() {
        return css`.mood { color: green; }`;
    }

    render() {
        return html`Web Components are <span class="mood">${this.mood} </span>!`;
    }
}
class MyElement2 extends LitElement {

    static get properties() {
        return {
            mood: {type: String}
        }
    }

    static get styles() {
        return css`.mood { color: green; }`;
    }

    render() {
        return html`Web Components are <span class="mood">${this.mood} 22222</span>!`;
    }
}

customElements.define('my-element2', MyElement2);
customElements.define('toggleable-checkbox', ToggleableCheckbox);

customElements.define('my-element', MyElement);