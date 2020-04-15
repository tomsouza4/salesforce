/*When performing DML calls in a trigger or in a class, perform DML calls on a collection of sObjects when 
possible. Performing DML on each sObject individually uses resources inefficiently. The Apex runtime allows 
up to 150 DML calls in one transaction.

This trigger performs an update call inside a for loop that iterates over related opportunities. If certain 
conditions are met, the trigger updates the opportunity description. In this example, the update statement is 
inefficiently called once for each opportunity. If a bulk account update operation fired the trigger, there 
can be many accounts. If each account has one or two opportunities, we can easily end up with over 150 
opportunities. The DML statement limit is 150 calls.*/
trigger DmlTriggerNotBulk on Account(after update) {   
    // Get the related opportunities for the accounts in this trigger.        
    List<Opportunity> relatedOpps = [SELECT Id,Name,Probability FROM Opportunity
        WHERE AccountId IN :Trigger.New];          
    // Iterate over the related opportunities
    for(Opportunity opp : relatedOpps) {      
        // Update the description when probability is greater 
        // than 50% but less than 100% 
        if ((opp.Probability >= 50) && (opp.Probability < 100)) {
            opp.Description = 'New description for opportunity.';
            // Update once for each opportunity -- not efficient!
            update opp;
        }
    }    
}