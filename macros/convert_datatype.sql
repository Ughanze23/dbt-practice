{% macro convert_datatype(column_name, d_type) %}
    {% set d_types = [
        "INT64", "NUMERIC", "BIGNUMERIC", "FLOAT64", "STRING",
        "BYTES", "BOOL", "DATE", "DATETIME", "TIME",
        "TIMESTAMP", "GEOGRAPHY", "JSON", "ARRAY", "STRUCT",
        "RANGE<DATE>", "RANGE<DATETIME>", "RANGE<TIMESTAMP>", "INTERVAL"
    ] %}

    {% if d_type in d_types %}
        cast({{ column_name }} as {{ d_type }})
    {% else %}
        {{ log("Datatype '" ~ d_type ~ "' is not valid", info=True) }}
        {{ column_name }}  {# return original column #}
    {% endif %}
{% endmacro %}
