import {LitElement, html, css} from 'https://unpkg.com/lit-element/lit-element.js?module';
// import {LitElement, html, css} from '/webjars/lit-element/3.3.1/lit-element.js';

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

customElements.define('my-element', MyElement);
