// import {LitElement, html, css} from 'https://unpkg.com/lit-element/lit-element.js?module';
import {LitElement, html, css} from 'lit-element/lit-element.js';

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

customElements.define('my-element', MyElement);
