-- XSD schema
-- http://www.w3schools.com/schema/default.asp


CREATE XML SCHEMA COLLECTION ProductModelWarrAndMain AS 
N'<xsd:schema targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelWarrAndMain"
    xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelWarrAndMain"
    elementFormDefault="qualified"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema" >
  <xsd:annotation>
    <xsd:documentation>
      (c) 2008 Microsoft Corporation.  All rights reserved. The following schema for
      Microsoft SQL Server is presented in XML format and is for informational purposes
      only. Microsoft Corporation ("Microsoft") may have trademarks, copyrights, or
      other intellectual property rights covering subject matter in the schema.
      Microsoft does not make any representation or warranty regarding the schema
      or any product or item developed based on the schema. The schema is provided
      to you on an AS IS basis. Microsoft disclaims all express, implied and
      statutory warranties, including but not limited to the implied warranties of
      merchantability, fitness for a particular purpose, and freedom from infringement.
      Without limiting the generality of the foregoing, Microsoft does not make any
      warranty of any kind that any item developed based on the schema, or any portion
      of the schema, will not infringe any copyright, patent, trade secret, or other
      intellectual property right of any person or entity in any country. It is your
      responsibility to seek licenses for such intellectual property rights where
      appropriate. MICROSOFT SHALL NOT BE LIABLE FOR ANY DAMAGES OF ANY KIND ARISING
      OUT OF OR IN CONNECTION WITH THE USE OF THE SCHEMA, INCLUDING WITHOUT LIMITATION,
      ANY DIRECT, INDIRECT, INCIDENTAL, CONSEQUENTIAL (INCLUDING ANY LOST PROFITS),
      PUNITIVE OR SPECIAL DAMAGES, WHETHER OR NOT MICROSOFT HAS BEEN ADVISED OF SUCH DAMAGES.
    </xsd:documentation>
  </xsd:annotation>
	<xsd:element name="Warranty"  >
		<xsd:complexType>
			<xsd:sequence>
				<xsd:element name="WarrantyPeriod" type="xsd:string"  />
				<xsd:element name="Description" type="xsd:string"  />
			</xsd:sequence>
		</xsd:complexType>
	</xsd:element>

	<xsd:element name="Maintenance"  >
		<xsd:complexType>
			<xsd:sequence>
				<xsd:element name="NoOfYears" type="xsd:string"  />
				<xsd:element name="Description" type="xsd:string"  />
			</xsd:sequence>
		</xsd:complexType>
	</xsd:element>
</xsd:schema>
';

DROP XML SCHEMA COLLECTION ProductModelWarrAndMain;

------------------------------------------------------------------------------ DMV XML
-- viewing stored schemas
select * from sys.xml_schema_collections;	-- 1 row for each registered schema collection
select * from sys.xml_schema_namespaces		-- 1 row for each namespace defined by an XSD
select * from sys.xml_schema_components		-- returns a row for each component is each schema

/*
xml_schema_namespace(Relational_schema ,XML_schema_collection_name , [ Namespace ] )	
*/

SELECT xml_schema_namespace(N'production',N'ProductDescriptionSchemaCollection')

-- tieto 2 selecty s˙ identickÈ
-- vr·tia komponenty objektov pre schÈmu 'ProductDescriptionSchemaCollection'
select cm.* from sys.xml_schema_collections as cl inner join 
	sys.xml_schema_components as cm on (cl.xml_collection_id = cm.xml_collection_id)
	where cl.name='ProductDescriptionSchemaCollection';

select * from sys.xml_schema_components where xml_collection_id=65539	

-- vr·ù namespaces pre schÈmu ktor· m· v mene '%Resume%'
select N.* 
	FROM sys.xml_schema_namespaces as N INNER JOIN sys.xml_schema_collections as SC
	ON N.xml_collection_id = SC.xml_collection_id
WHERE SC.name LIKE '%Resume%';	


--------------------------------------------------------------------------- xml_schema_namespace
/*
xml_schema_namespace(Relational_schema ,XML_schema_collection_name , [ Namespace ] )	
*/

SELECT xml_schema_namespace(N'production',N'ProductDescriptionSchemaCollection')

-- tento selekt vr·ti schÈmu XSD ktor· sa vytvorila CREATE XML SCHEMA COLLECTION ProductModelWarrAndMain...
SELECT xml_schema_namespace(N'dbo',N'ProductModelWarrAndMain')
