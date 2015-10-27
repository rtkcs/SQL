select 
	name, service_broker_guid,
	is_broker_enabled,
	is_honor_broker_priority_on
from sys.databases

ALTER DATABASE database_name SET {
	ENABLE_BROKER |
	DISABLE_BROKER |	-- disables the broker in the currend database
	NEW_BROKER |		-- creates a new service broker identifier and removes all existing conversations
	ERROR_BROKER_CONVERSATIONS |	-- all conversations are ended with an error message
	HONOR_BROKER_PRIORITY { ON | OFF}	-- whether the system gives a preference to messages that come from conversations with high priority value
}


