# WoW Mythic+ Affixes for Jekyll

[![Gem Version](https://badge.fury.io/rb/jekyll-wowaffixes.svg)](https://badge.fury.io/rb/jekyll-wowaffixes)

## Usage

### Calculate

```bash
jekyll wowaffixess --region eu
```

### Render

```html
<div class="row text-center">
    {% for id in site_data_affixes['current'] %}
    {% assign affix = site.data.affixes.list | where: 'id', id %}
    <div class="col">
        <a href="https://ru.wowhead.com/affix={{ id }}" data-wh-rename-link="false">
            {% if affix[0].note %}
            <img src="/assets/img/roles/{{ affix[0].note.role }}.jpg" title="{{ affix[0].note.text }}" class="note" />
            {% endif %}
            <img src="/assets/img/affixes/{{ id }}.jpg" class="rounded-circle" width="36px"/><br />
            {{ affix[0].name }}
        </a>
    </div>
    {% endfor %}
</div>
```

### Result

![Result](https://github.com/forestguild/affixes/blob/master/screenshot.png)
