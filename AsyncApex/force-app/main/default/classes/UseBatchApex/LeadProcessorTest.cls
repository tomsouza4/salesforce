@istest
public class LeadProcessorTest {
    @TestSetup
    static void makeLeads(){
        List<Lead> list_lead = new List<Lead>();
        Integer total_leads = 200;

        for (Integer i = 0; i < total_leads; i++) {
            list_lead.add(new Lead(lastname='lead'+i, company='lead'+i));
        }
        insert list_lead;
    }
    static testmethod void test() {
        Test.startTest();
        LeadProcessor leadproc = new LeadProcessor();
        Id batchId = Database.executeBatch(leadproc);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from lead where leadsource = 'Dreamforce']);
    }  
}
