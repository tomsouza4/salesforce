@isTest(SeeAllData=true)
public class AccountProcessorTest {
        
    @isTest 
    private static void testCountContacts(){

        //SELECT COUNT() FROM Contact where AccountId = '0015A000025nspeQAA'
        //SELECT AccountId FROM Contact where AccountId = '0015A000025nspeQAA'
        //SELECT Number_Of_contacts__c from Account where Id = '0015A000025nspfQAA'

        List <String> lstContacts = new List <String>();
        lstContacts.add('0015A000025nspfQAA');

        Test.startTest();
            AccountProcessor.countContacts(lstContacts);
        Test.stopTest();
        Account acc = [select Number_of_Contacts__c from Account where id in :lstContacts LIMIT 1];
        System.assertEquals ( Integer.valueOf(acc.Number_of_Contacts__c) ,2);
                             
    }
}
