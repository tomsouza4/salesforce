/*The following trigger assumes that only one record caused the trigger to fire. This trigger doesn’t work 
on a full record set when multiple records are inserted in the same transaction*/
trigger MyTriggerNotBulk on Account(before insert) {
    Account a = Trigger.New[0];
    a.Description = 'New description';
}