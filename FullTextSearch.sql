-- povolenie Full Text Search na datab�ze, je to to ist� ako za�krtnutie 
-- check boxu naDatabase Properties \ Files \ Use full-text indexing
sp_fulltext_database 'enable' 


-- pre ka�d� tabulku, ktor� sa ide indexova� treba prim�rny k���
ALTER TABLE [dbo].[ContactBase] ADD  CONSTRAINT [cndx_PrimaryKey_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]

-- FREETEXT - pou��va synonim� pod�a zvolen�ho jazyka
select FullName,Telephone1, Telephone2, Telephone3, MobilePhone
from dbo.ContactBase
where FREETEXT((Telephone1, Telephone2, Telephone3, MobilePhone), '0904875151');

-- CONTAINS - h�ad� �i sa dan� slovo vyskytuje v texte, je mo�n� h�ada� aj podla LANGUAGE
select FullName,Telephone1, Telephone2, Telephone3, MobilePhone
from dbo.ContactBase
where CONTAINS(*, '555-0123') --, LANGUAGE 1042);


select FullName,Telephone1, Telephone2, Telephone3, MobilePhone
from dbo.ContactBase
where Telephone1 like '0904875151';	--7 sec


-- v�etky jazyky ktor� sa pou��vaj� na SQL-i
select * from sys.syslanguages 

-- tu s� podporovan� jazyky ktor� sa daj� pou�i� na Full Text Search, podmno�ina sys.syslanguages
select * From sys.fulltext_languages

-- kde je ulo�en� spracovanie jednotliv�ch typov dokumentov
select document_type, path from sys.fulltext_document_types



--DBCC DROPCLEANBUFFERS