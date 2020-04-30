global class LeadProcessor implements 
                Database.Batchable<sObject> {
    

    global Integer recordsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID, LeadSource FROM Lead'            
        );
    }      
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        List<Lead> list_leads = new List<Lead>();
        for (Lead lead : scope) {
            lead.LeadSource = 'Dreamforce';
            list_leads.add(lead);
            // increment the instance member counter
            recordsProcessed = recordsProcessed + 1;
        }
        update list_leads;
    }        
    global void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed. Shazam!');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        // call some utility to send email
        //EmailUtils.sendMessage(job, recordsProcessed);
    }      
}
