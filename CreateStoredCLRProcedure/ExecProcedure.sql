USE [MIM]
GO

exec CreateEntity 'Currency';
--exec CreateEntity 'Pricelevel';

exec CreateEntity 'Language';
exec CreateEntity 'Country';
exec CreateEntity 'Location';
exec CreateEntity 'Territory';
exec CreateEntity 'OrganizationalLevel';
exec CreateEntity 'MailingGroup';
exec CreateEntity 'JobResponsibility';

exec CreateEntity 'Contact';
exec CreateEntity 'Customer';
exec CreateRelations 'ContactBusinessRelation';
exec CreateEntity 'ContactMailingGroup';
exec CreateEntity 'ContactJobResponsibility';

exec CreateEntity 'Manufacturer';
exec CreateEntity 'Vendor';

exec CreateEntity 'Item';
exec CreateEntity 'Opportunity';
exec CreateEntity 'SalesHeader';
exec CreateEntity 'SalesLine';
exec CreateEntity 'SalesInvoiceHeader';
exec CreateEntity 'SalesInvoiceLine';

exec DeleteRecord;