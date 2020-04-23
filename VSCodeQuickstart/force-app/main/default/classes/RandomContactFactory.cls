public class RandomContactFactory {

    /*The first parameter controls the number of contacts being generated, the second is the last name of 
    the contacts generated. */
    public static List<Contact> generateRandomContacts(Integer num_contacts_create, String last_name){
        List<Contact> contatinhos = new List<Contact>();
        for (Integer i=0; i < num_contacts_create; i++){
            Contact c = new Contact(FirstName='Test'+i,LastName=last_name+i);
            contatinhos.add(c);
            //insert acct;
            //Database.SaveResult result = Database.insert(contatinho, false);
        }
        return contatinhos;
    }
    
}
