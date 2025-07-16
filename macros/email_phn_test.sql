{% test test_email_pat(model,column_name) %} 

select * from {{model}}
where {{column_name}} not like '%@mail.com'
    
{% endtest %}


{% test test_email_doc(model,column_name) %} 

select * from {{model}}
where {{column_name}}  not like '%@hospital.com'
    
{% endtest %}