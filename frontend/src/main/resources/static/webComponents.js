// import {LitElement, html, css} from 'https://unpkg.com/lit-element/lit-element.js?module';
import {css, html, LitElement} from 'lit-element/lit-element.js';
import {classMap} from 'lit/directives/class-map.js';

class ToggleableCheckbox extends LitElement {
    static formAssociated = true;
    static get properties() {
        console.log("properties");
        return {
            leftValue: {type: String},
            rightValue: {type: String},
            noValue: {type: String},
            value:{type:String},
            name:{type:String}
        }
    }

    constructor() {
        console.log("constructor");
        super();
        this.leftClasses = {selected: false};
        this.rightClasses = {selected: false};

    }
    static get styles() {
        console.log("styles");
        return css`
          .selected { color: green; }
        `;
    }

    render() {
        console.log("render");
        return html`
            <div>
                 <input value="${this.value}" name="${this.name}" readonly hidden="hidden">
                <div class=${classMap(this.leftClasses)} @click="${this._toggleLeft}">${this.leftValue}</div>
                <slot></slot>
                <div class=${classMap(this.rightClasses)} @click="${this._toggleRight}">${this.rightValue}</div>
                
            </div>`;

    }
    _toggleLeft(e) {
        console.log("tl");
        this._toggleValue(this.leftValue)
    }
    _toggleRight(e) {
        console.log("tg");
        this._toggleValue(this.rightValue)
    }
    _updateClass() {
        console.log("updateClass");
        this.leftClasses.selected=this.value===this.leftValue;
        this.rightClasses.selected=this.value===this.rightValue;
    }
    // createRenderRoot() {
    //     return this; // will render the template without shadow DOM
    // }

    _toggleValue(expected){
        console.log("tv");
        if(this.value ===expected){
            this.value=this.noValue;
        }else{
            this.value=expected;
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
