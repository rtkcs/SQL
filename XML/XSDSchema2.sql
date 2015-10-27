select top 10 
	name, 
	object_id, 
	schema_id, 
	parent_object_id, 
	type_desc, 
	create_date,
	modify_date
from sys.all_objects as SQLObject for XML AUTO,ELEMENTS, ROOT('SQLObjects'), XMLSCHEMA