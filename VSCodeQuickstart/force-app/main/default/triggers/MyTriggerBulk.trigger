/* It uses a for loop to iterate over all available sObjects. This loop works if Trigger.New contains 
 one sObject or many sObjects.*/
trigger MyTriggerBulk on Account(before insert) {
    for(Account a : Trigger.New) {
        a.Description = 'New description';
    }
}