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
        this.leftClasses = {"side-value":true,"left-side-value":true,selected: false};
        this.rightClasses = {"side-value":true,"right-side-value":true,selected: false};

    }
    static get styles() {
        console.log("styles");
        return css`
          * {
            --toggleable-checkbox-radius: 30%;
            --toggleable-checkbox-border-color: #3a3939;
            --toggleable-checkbox-border-size: 1px;

          }

          .toggleable-checkbox {
            cursor: pointer;
            gap: 0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
          }

          .side-value {
            width: 50%;
            background-color: #AEB3BBFF;
            user-select: none;
            margin: 0;
            padding: 0;
          }

          .left-side-value {
        
            border-right: var(--toggleable-checkbox-border-size) solid var(--toggleable-checkbox-border-color);
            border-top-left-radius: var(--toggleable-checkbox-radius);
            border-bottom-left-radius: var(--toggleable-checkbox-radius);
            text-align: right;
          }

          .right-side-value {
            border-left: var(--toggleable-checkbox-border-size) solid var(--toggleable-checkbox-border-color);
            border-top-right-radius: var(--toggleable-checkbox-radius);
            border-bottom-right-radius: var(--toggleable-checkbox-radius);
          }

          .selected {
            background-color: #999999;
          }
        `;
    }

    render() {
        console.log("render");
        return html`
            <div class="toggleable-checkbox">
                 <input value="${this.value}" name="${this.name}" readonly hidden="hidden">
                <span class=${classMap(this.leftClasses)} @click="${this._toggleLeft}">${this.leftValue}</span>
                <span class=${classMap(this.rightClasses)} @click="${this._toggleRight}">${this.rightValue}</span>
                
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

class FancySelect extends HTMLSelectElement {
    constructor() {
        super(); // always call super() first in the ctor.
        this.addEventListener('click', e => this.innerHTML = "I was clicked");
    }
}

customElements.define('fancy-select', FancySelect, {extends: 'select'});

customElements.define('my-element2', MyElement2);
customElements.define('toggleable-checkbox', ToggleableCheckbox);

customElements.define('my-element', MyElement);
