trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> taskList = new List<Task>(); //Creating a list for the tasks that are created once an opportunity is created.
    List<Opportunity> Opps = Trigger.new; //Creating a list of opportunities that are created newly using the trigger or based on the trigger event.
    
    if(Trigger.isInsert == true || Trigger.isUpdate == true) {
        for(Opportunity Opp : Opps) {
            if(Opp.StageName == 'Closed Won'){
                Task newTask = new Task(whatID = Opp.ID, Subject='Follow Up Test Task'); //A task is created with Opportunity ID and with the subject.
                taskList.add(newTask);
            }
        }
        insert taskList;
    }
}