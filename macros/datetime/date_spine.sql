{% macro date_spine(datepart, start_date, end_date) %}
    {{ return(adapter.dispatch('date_spine', packages = dbt_utils._get_utils_namespaces())(datepart, start_date, end_date)) }}
{%- endmacro %}