<div>Total elements: ${totalElement} / page size: ${pageSize}</div>


<table>
    <thead>

    <tr>



        <th hx-get="translation/translation-table-header" >Partner</th>
        <th>Country</th>
        <th>Profile</th>
        <th>language</th>
        <th>key</th>
        <th>value</th>

    </tr>
    </thead>

    <tbody>
    <#include "./translation_table_rows.ftlh"/>
    </tbody>
</table>
