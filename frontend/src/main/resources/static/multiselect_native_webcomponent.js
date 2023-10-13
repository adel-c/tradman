class MultiselectWebcomponent extends HTMLElement {
    static formAssociated = true;
    options = [];
    searchbox =null;
    dropdown = null;
    dropdownWrapper = null;
    selected = null;
    buttons = null;
    actionBar = null;

    constructor() {
        super();

        // Keeping options
        this.querySelectorAll('option').forEach(option => this.options.push(option.cloneNode(true)));
        this.setValuesOnConstructor(this.getAttribute('value'));

        let htmlTemplateElement = this.querySelector('template');
        if(htmlTemplateElement){
            console.log("found template")
        }else{
            console.log("nop");

            let defaultTemplate =this.buildDefaultTemplate();
            console.log(defaultTemplate)
            this.appendChild(defaultTemplate)
            htmlTemplateElement = this.querySelector('template');
        }
        this.innerHTML='';
        const clone = htmlTemplateElement.content.cloneNode(true);
        this.appendChild(clone)

        this.searchbox = this.querySelector('.msw-searchbox');
        this.dropdown = this.querySelector('.msw-dropdown');
        this.dropdownWrapper = this.querySelector('.msw-dropdown-wrapper');
        this.selected = this.querySelector('.msw-selected');
        this.buttons = this.querySelector('.msw-buttons');
        this.actionBar = this.querySelector('.msw-actionbar');














        // Events
        this.addEventListener('click', () => this.onMultiselectClick());
        this.parentElement?.addEventListener('mouseleave', () => this.dropdown.style.display = 'none');
        this.dropdown.addEventListener('click', () => this.onDropdownClick());
        this.searchbox.addEventListener('keyup', (e) => this.onSearchboxKeyup(e));

        this.addClassToElement(this,"msw-parent");
        // Attributes
        this.addClassToElement(this.actionBar,this.getAttribute('actionbar'));
        this.addClassToElement(this.dropdown,this.getAttribute('dropdown'));
        this.addClassToElement(this.dropdownWrapper,this.getAttribute('dropdown-wrapper'));
        this.addClassToElement(this.selected,this.getAttribute('selected'));
        this.addClassToElement(this.searchbox,this.getAttribute('searchbox'));

        this.searchbox.placeholder = this.getAttribute('placeholder') || '';
        const disabled = this.getAttribute('disabled');
        if (disabled && disabled !== 'false') {
            this.searchbox.disabled = true;
        }
        // Build
        this.build();
    }
    buildDefaultTemplate(){
        let htmlString =
            //language=html
            `
                    <div class="msw-selected " style="display: flex; flex-wrap: wrap; flex-grow: 1;">

                    </div>
                    <div class="msw-actionbar">
                        <input type="search" class="msw-searchbox" style="flex-grow: 1;" placeholder=""/>
                        <div style="display: flex;" class="msw-buttons">
                            <button class="msw-selectallbutton " title="Select All">A</button>
                            <button class="msw-clearbutton " title="Clear Selection">C</button>
                        </div>
                    </div>
                    <div class="msw-dropdown-wrapper">
                        <div class="msw-dropdown" style="display: none; width: 100%; position: absolute; z-index: 2;">
                        </div>
                    </div>
            `;
         let defaultTemplate = new DOMParser().parseFromString(htmlString, "text/xml");
        let htmlTemplateElement = document.createElement('template');
        htmlTemplateElement.innerHTML=htmlString;
        return htmlTemplateElement
    }
    addClassToElement(element,className){
        if(className){
            element.classList.add(className)
        }
    }
    get name(){
        return this.getAttribute('name') || '';
    }
    set value(value) {
        for (const option of this.options) {
            option.selected = false;
        }
        if (!value || value.length == 0) {
            return;
        }
        for (const option of this.options) {
            if (value.includes(option.value)) {
                option.selected = true;
            }
        }
        this.build();
    }

    setValuesOnConstructor(value) {
        if (!value) {
            return;
        }
        const values = value.split(',');
        for (const option of this.options) {
            if (values.includes(option.value)) {
                option.selected = true;
            }
        }
    }

    get value() {
        const ret = [];
        for (const option of this.options) {
            if (option.selected) {
                ret.push(option.value);
            }
        }
        return ret;
    }

    set disabled(value) {
        this.setAttribute('disabled', value ? 'true' : 'false');
        this.searchbox.disabled = value;
        this.build();
    }

    get disabled() {
        const disabled = this.getAttribute('disabled');
        if (disabled && disabled !== 'false') {
            return true;
        }
        return false;
    }

    set placeholder(value) {
        this.setAttribute('placeholder', value);
        this.searchbox.placeholder = value;
    }

    get placeholder() {
        return this.getAttribute('placeholder');
    }

    clear() {
        this.options = [];
        this.build();
    }

    build() {
        this.selected.innerHTML = '';
        this.dropdown.innerHTML = '';
        this.buttons.innerHTML = '';
        for (const option of this.options) {
            if (option.selected) {
                this.selected.appendChild(this.buildSelectedItem(option));
            } else {
                this.dropdown.appendChild(this.buildDropdownItem(option));
            }
        }

        if (this.dropdown.innerHTML !== '') {
            this.buttons.appendChild(this.buildSelectAllButton());
        }
        if (this.selected.querySelectorAll('.msw-selecteditem').length > 0) {
            this.buttons.appendChild(this.buildClearButton());
        }
        this.dispatchEvent(new Event('change'));
    }

    buildSelectedItem(option) {
        const item = document.createElement('div');
        item.style.userSelect = 'none';
        item.style.webkitUserSelect = 'none';
        item.className = `msw-selecteditem ${this.getAttribute('selecteditem') || ''}`;
        item.innerHTML = option.textContent;
        item.dataset.value = option.value;
        if (!this.disabled) {
            item.addEventListener('click', (e) => this.onSelectedClick(e));
        }
        return item;
    }

    buildDropdownItem(option) {
        if (this.getAttribute('item')) {
            console.warn('[MultiSelectWebcomponent]: Use of attribute "item" is deprecated - it shall be removed in next versions. Use "dropdownitem" instead.');
        }
        const item = document.createElement('div');
        item.style.userSelect = 'none';
        item.style.webkitUserSelect = 'none';
        item.className = `msw-dropdownitem ${this.getAttribute('dropdownitem') || this.getAttribute('item') || ''}`;
        item.innerHTML = option.textContent;
        item.dataset.value = option.value;
        item.addEventListener('click', (e) => this.onItemClick(e));
        return item;
    }

    buildClearButton() {
        const button = document.createElement('button');
        button.className = `msw-clearbutton ${this.getAttribute('clearbutton') || ''}`;
        const buttonSpanClass = this.getAttribute('clearbuttonspan');
        if (buttonSpanClass == null) {
            button.textContent = 'C';
        } else {
            const span = document.createElement('span');
            span.className = `msw-clearbuttonspan ${buttonSpanClass}`;
            button.appendChild(span);
        }
        const buttonTitle = this.getAttribute('clearbuttontitle');
        button.title = buttonTitle ? buttonTitle : 'Clear Selection';
        button.addEventListener('click', (e) => this.onClearClick(e));
        button.disabled = this.disabled;
        return button;
    }

    buildSelectAllButton() {
        const button = document.createElement('button');
        button.className = `msw-selectallbutton ${this.getAttribute('selectallbutton') || ''}`;
        const buttonSpanClass = this.getAttribute('selectallbuttonspan');
        if (buttonSpanClass == null) {
            button.textContent = 'A';
        } else {
            const span = document.createElement('span');
            span.className = `msw-selectallbuttonspan ${buttonSpanClass}`;
            button.appendChild(span);
        }
        const buttonTitle = this.getAttribute('selectallbuttontitle');
        button.title = buttonTitle ? buttonTitle : 'Select All';
        button.addEventListener('click', (e) => this.onSelectAllClick(e));
        button.disabled = this.disabled;
        return button;
    }

    findOptionByValue(value) {
        for (const option of this.options) {
            if (value === option.value) {
                return option;
            }
        }
    }

    chooseOption(option) {
        if (option) {
            option.selected = true;
        }
        this.searchbox.value = '';
        this.build();
    }

    onItemClick(e) {
        this.chooseOption(this.findOptionByValue((e.currentTarget).dataset.value));
    }

    onSelectedClick(e) {
        const option = this.findOptionByValue((e.currentTarget).dataset.value);
        if (option) {
            option.selected = false;
        }
        this.build();
    }

    onClearClick(e) {
        this.options.forEach(option => option.selected = false);
        this.build();
        this.searchbox.value = '';
        this.searchbox.focus();
        e.stopPropagation();
    }

    onSelectAllClick(e) {
        this.options.forEach(option => option.selected = true);
        this.build();
        this.dropdown.style.display = 'none';
        this.searchbox.value = '';
        this.searchbox.focus();
        e.stopPropagation();
    }

    onMultiselectClick() {
        if (this.disabled === true) return;
        this.dropdown.style.display = 'block';
        this.searchbox.focus();
    }

    onDropdownClick() {
        this.searchbox.focus();
    }

    onSearchboxKeyup(e) {
        if ((e.key === 'Enter' || e.key === 'NumpadEnter') && this.searchbox.value !== '' && this.dropdown.firstChild) {
            this.chooseOption(this.findOptionByValue((this.dropdown.firstChild).dataset.value));
            this.searchbox.focus();
            return;
        }
        this.dropdown.innerHTML = '';
        if (this.searchbox.value === '') {
            for (const option of this.options) {
                if (!option.selected) {
                    this.dropdown.appendChild(this.buildDropdownItem(option)); // build with all
                }
            }
        } else {
            for (const option of this.options) {
                if (!option.selected && option.textContent && option.textContent.toLocaleUpperCase().indexOf(this.searchbox.value.toLocaleUpperCase()) >= 0) {
                    this.dropdown.appendChild(this.buildDropdownItem(option)); // build with search results
                }
            }
        }
        this.dropdown.style.display = 'block';
    }
}

customElements.define('multi-multi', MultiselectWebcomponent);
