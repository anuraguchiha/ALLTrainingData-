public with sharing class contactTriggerHandler {
    // Custom Validation on Insert/Update:
    // Validate that a Contact's Email domain matches the Website domain of its parent Account.
    //If not, throw a custom error message

    public static void validateContact(List<Contact> contacts) {
        Set<Id> accountIds = new Set<Id>();
        for (Contact contact : contacts) {
            accountIds.add(contact.AccountId);
        }
        Map<Id, Account> accounts = new Map<Id, Account>([SELECT Id, Website FROM Account WHERE Id IN :accountIds]);
        for (Contact contact : contacts) {
            if (contact.Email != null && accounts.get(contact.AccountId) != null) {
                String contactDomain = contact.Email.substringAfter('@');
                String accountDomain = accounts.get(contact.AccountId).Website.substringAfter('www.');
                if (!contactDomain.equalsIgnoreCase(accountDomain)) {
                    contact.addError('Contact Email domain must match Account Website domain.');
                }
            }
        }
    }
}