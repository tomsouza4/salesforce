@isTest
private class TestRestrictContactByName {
    @isTest static void TestDeleteAccountLastname() {

        // Perform test
        Test.startTest();
        Contact contatinho = new Contact(FirstName='Test4', LastName='INVALIDNAME');
        //insert acct;
        Database.SaveResult result = Database.insert(contatinho, false);
        System.debug('DEBUG: ' + result.getErrors());
        Test.stopTest();

        // Verify 
        // In this case the deletion should have been stopped by the trigger,
        // so verify that we got back an error.        
        //System.assert(!result.isSuccess());
        //System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',
                             result.getErrors()[0].getMessage());
        //System.assertEquals(false, !result.isSuccess());
                                                             

    }
}
