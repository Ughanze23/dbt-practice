{% macro limit_data_in_dev(column_name, days=3) %}

{% if target.name == 'dev'%}

    where {{column_name}} >= date_add('day',-{{days}},current_timestamp)

{% endif %}


{% endmacro %}