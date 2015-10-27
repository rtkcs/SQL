declare  @head as TABLE(
          N_POLICY_ID   int 
        , N_POLICY_NBR  bigint 
        , S_D_UNITS     VARCHAR(10) 
        , S_UNITS       VARCHAR(20) 
        , FUND_DESC     VARCHAR(50)
        , S_D_APPROVE   VARCHAR(10) 
        , S_AHDJ        VARCHAR(20) 
        , S_AMOUNT      VARCHAR(20) 
        , S_NAME        VARCHAR(100)
        , S_SSN         VARCHAR(10)
        , S_IDENT       VARCHAR(24)
        , S_D_BIRTH     VARCHAR(10) 
        , S_ADDRESS     VARCHAR(100)
        , S_ADDRESS_LINE1 VARCHAR(50)
        , S_ADDRESS_LINE2 VARCHAR(50)
        , S_PAGE        VARCHAR(50)
        , S_PRISP       VARCHAR(20) 
        , S_POPL        VARCHAR(20) 
        , S_ODPL        VARCHAR(20)
        ) 
        
insert into @head
select 
	  123 as N_POLICY_ID   
	, 123456 as N_POLICY_NBR  
	, 'S_D_UNITS' S_D_UNITS     
	, 'S_UNITS'   S_UNITS
	, 'FUND_DESC' FUND_DESC     
	, 'S_D_APPROV' S_D_APPROVE   
	, 'S_AHDJ' S_AHDJ        
	, 'S_AMOUNT' S_AMOUNT      
	, 'S_NAME' S_NAME        
	, 'S_SSN' S_SSN         
	, 'S_IDENT' S_IDENT       
	, 'S_D_BIRTH' S_D_BIRTH     
	, 'S_ADDRESS' S_ADDRESS     
	, 'S_ADDRESS_LINE1' S_ADDRESS_LINE1
	, 'S_ADDRESS_LINE2' S_ADDRESS_LINE2
	, 'S_PAGE' S_PAGE        
	, 'S_PRISP' S_PRISP       
	, 'S_POPL' S_POPL        
	, 'S_ODPL' S_ODPL        

select * from @head;