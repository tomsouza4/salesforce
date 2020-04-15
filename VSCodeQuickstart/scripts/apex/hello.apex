// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'TomSouza';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);

Contact c = new Contact(LastName='Oliveira');
insert c;

Account a = new Account(Name='Lions & Cats',Id='0015A00002K2DUcQAN');
a.Description = 'Description';
update a;
//SELECT ID FROM ACCOUNT WHERE Name='Lions & Cats'

Opportunity opp = new Opportunity(Name='Lions & Cats Opportunity',Id='0065A00001Ze894QAB');
opp.Description = 'DESCRIPTION123';
update opp;