-- povolenie Full Text Search na datab·ze, je to to istÈ ako zaökrtnutie 
-- check boxu naDatabase Properties \ Files \ Use full-text indexing
sp_fulltext_database 'enable' 


-- pre kaûd˙ tabulku, ktor· sa ide indexovaù treba prim·rny kæ˙Ë
ALTER TABLE [dbo].[ContactBase] ADD  CONSTRAINT [cndx_PrimaryKey_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]

-- FREETEXT - pouûÌva synonim· podæa zvolenÈho jazyka
select FullName,Telephone1, Telephone2, Telephone3, MobilePhone
from dbo.ContactBase
where FREETEXT((Telephone1, Telephone2, Telephone3, MobilePhone), '0904875151');

-- CONTAINS - hæad· Ëi sa danÈ slovo vyskytuje v texte, je moûnÈ hæadaù aj podla LANGUAGE
select FullName,Telephone1, Telephone2, Telephone3, MobilePhone
from dbo.ContactBase
where CONTAINS(*, '555-0123') --, LANGUAGE 1042);


select FullName,Telephone1, Telephone2, Telephone3, MobilePhone
from dbo.ContactBase
where Telephone1 like '0904875151';	--7 sec


-- vöetky jazyky ktorÈ sa pouûÌvaj˙ na SQL-i
select * from sys.syslanguages 

-- tu s˙ podporovanÈ jazyky ktorÈ sa daj˙ pouûiù na Full Text Search, podmnoûina sys.syslanguages
select * From sys.fulltext_languages

-- kde je uloûenÈ spracovanie jednotliv˝ch typov dokumentov
select document_type, path from sys.fulltext_document_types



--DBCC DROPCLEANBUFFERS