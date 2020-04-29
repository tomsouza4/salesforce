public class AccountProcessor {
    @future(callout=true)
    //@future()
    public static void countContacts(List<String> accountID){
        //Select a specific Id or an amount of Ids based on the accountID list
        //String results = updateAccount(accountID);
        //String results = updateAccountDS(accountID); 
        updateAccountSimplified(accountID);
        //System.debug(results);
        }    
    
    public static void updateAccountSimplified(List<String> accountID){
        List<Account> lstAccount = [select id,Number_of_Contacts__c , (select id from contacts ) from account where id in :accountID ];
        for( Account acc : lstAccount )
        {
            List<Contact> lstCont = acc.contacts ;           
            acc.Number_of_Contacts__c = lstCont.size();
        }
        update lstAccount;
    }     
    /* Commented due to SFDC performance tests rejecting some lines of the code below
    public static String updateAccount(List<String> accountID){
        List<Account> relatedAccs = [SELECT Id, Name, Number_of_Contacts__c FROM Account WHERE Id IN :accountID];
        List<Account> accsToUpdate = new List<Account>();
        String results = '';
        for(Account acc : relatedAccs) {      
            acc.Number_of_Contacts__c = [SELECT COUNT() FROM Contact where AccountId =: acc.Id];
            accsToUpdate.add(acc);
            update accsToUpdate;
            results = acc.Name;        
        }    
        return results;
    }    

    public static String updateAccountDS(List<String> accountID){
        List<Account> relatedAccs = [SELECT Id, Name, Number_of_Contacts__c FROM Account WHERE Id IN :accountID];
        List<Account> accsToUpdate = new List<Account>();
        String results = '';
        for(Account acc : relatedAccs) {      
            acc.Number_of_Contacts__c = [SELECT COUNT() FROM Contact where AccountId =: acc.Id];
            accsToUpdate.add(acc);            
            results = acc.Name;        
        }    
        list<Database.SaveResult> result = Database.update(accsToUpdate, true);
        //Database.SaveResult result = Database.update(accsToUpdate.values(), false);
        
        // Iterate through saveResultList based on isSuccess capture the failed records
        for (Database.SaveResult sr : result) {
            if (!sr.isSuccess()) {
                // Operation was successful, so get the ID of the record that was processed
                System.debug('Successfully inserted account. Account ID: ' + sr.getId());
            }
            else {
                // Operation failed, so get all errors                
                for(Database.Error err : sr.getErrors()) {
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields());
                }
            }
        }
        return results;
    }*/                               
}//class
