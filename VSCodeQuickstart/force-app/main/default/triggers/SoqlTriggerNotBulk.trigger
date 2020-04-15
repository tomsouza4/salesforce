/*Performing Bulk SOQL
SOQL queries can be powerful. You can retrieve related records and check a combination of multiple conditions 
in one query. By using SOQL features, you can write less code and make fewer queries to the database. 
Making fewer database queries helps you avoid hitting query limits, which are 100 SOQL queries for synchronous 
Apex or 200 for asynchronous Apex.

The following trigger shows a SOQL query pattern to avoid. The example makes a SOQL query inside a for loop 
to get the related opportunities for each account, which runs once for each Account sObject in Trigger.New. 
If you have a large list of accounts, a SOQL query inside a for loop could result in too many SOQL queries. 
The next example shows the recommended approach.*/
trigger SoqlTriggerNotBulk on Account(after update) {   
    for(Account a : Trigger.New) {
        // Get child records for each account
        // Inefficient SOQL query as it runs once for each account!
        Opportunity[] opps = [SELECT Id,Name,CloseDate 
                             FROM Opportunity WHERE AccountId=:a.Id];
        
        // Do some other processing
    }
}