/*This example is a modified version of the previous one and shows a best practice for running SOQL queries. 
The SOQL query does the heavy lifting and is called once outside the main loop.

The SOQL query uses an inner query—(SELECT Id FROM Opportunities)—to get related opportunities of accounts.
The SOQL query is connected to the trigger context records by using the IN clause and binding the Trigger.New 
variable in the WHERE clause—WHERE Id IN :Trigger.New. This WHERE condition filters the accounts to only those 
records that fired this trigger.
Combining the two parts in the query results in the records we want in one call: the accounts in this trigger 
with the related opportunities of each account.

After the records and their related records are obtained, the for loop iterates over the records of interest 
by using the collection variable—in this case, acctsWithOpps. The collection variable holds the results of the 
SOQL query. That way, the for loop iterates only over the records we want to operate on. Because the related 
records are already obtained, no further queries are needed within the loop to get those records.*/
trigger SoqlTriggerBulk on Account(after update) {  
    // Perform SOQL query once.    
    // Get the related opportunities for the accounts in this trigger,
    // and iterate over those records.
    for(Opportunity opp : [SELECT Id,Name,CloseDate FROM Opportunity
        WHERE AccountId IN :Trigger.New]) {
  
        // Do some other processing
    }
}