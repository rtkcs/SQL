create table widgets(
  WidgetId uniqueidentifier primary key,
  name nvarchar(25)
);
GO

insert into widgets (name) 
output inserted.WidgetId, inserted.name 
values ('one'),('two'),('three');
GO

DROP table widgets;

create table widgets(
  WidgetId int primary key identity(1,1),
  name nvarchar(25)
);
GO

insert into widgets (name) 
output inserted.WidgetId, inserted.name 
values ('one'),('two'),('three');
GO

DROP table widgets;

--------------------------------------------------------
declare @RangeStart int=0;
declare @RangeEnd int=101;
declare @RangeStep int =1;

with numberRange(ItemValue) as (
  
  select ItemValue from
  ( select @RangeStart as ItemValue ) as t
    union all
    select ItemValue + @RangeStep from numberRange where ItemValue < @RangeEnd
)

select ItemValue from numberRange 
OPTION(maxrecursion 101);

select SCOPE_IDENTITY();