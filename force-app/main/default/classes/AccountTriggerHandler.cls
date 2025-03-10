public with sharing class AccountTriggerHandler {
    // Cascade Updates Across Related Objects:
    // When an Account's Industry field is updated, update the Industry field of all related Contacts and Opportunities.
    // Ensure bulk-safe handling and governor limit compliance.
    public static void casecadeDelete(Map<id, Account> oldMap, Map<id, Account> newMap) {
        set<id> accountIds = new set<id>();
        for (Account account : newMap.values()) {
            if (account.Industry != oldMap.get(account.Id).Industry) {
                accountIds.add(account.Id);
            }
        }
        List<account> accQueryList = [SELECT Id, Industry FROM Account WHERE Id IN :accountIds];
        List<Contact> contactList = new List<Contact>([SELECT Id, Industry FROM Contact WHERE AccountId IN :accountIds]);
        List<Opportunity> opportunityList = new List<Opportunity>([SELECT Id, Industry FROM Opportunity WHERE AccountId IN :accountIds]);
        List<Contact> contactsToUpdate = new List<Contact>();
        List<Opportunity> opportunitiesToUpdate = new List<Opportunity>();
        for (Account account : accQueryList) {
            for (Contact contact : contactList) {
                if (contact.AccountId == account.Id) {
                    contact.Industry = account.Industry;
                    contactsToUpdate.add(contact);
                }
            }
            for (Opportunity opportunity : opportunityList) {
                if (opportunity.AccountId == account.Id) {
                    opportunity.Industry = account.Industry;
                    opportunitiesToUpdate.add(opportunity);
                }
            }
        }
        if(!contactsToUpdate.isEmpty()) {
            update contactsToUpdate;
        }
        if(!opportunitiesToUpdate.isEmpty()) {
            update opportunitiesToUpdate;
        }
    }

    // Prevent Deletion Based on Criteria:
    // Prevent the deletion of Accounts that have associated Cases with a Status of "Open".
    // Add a custom error message to inform users why the deletion is blocked.
    public static void preventDeleteAccount(List<Account> accounts) {
        List<Case> cases = [SELECT Id FROM Case WHERE AccountId IN :accounts AND Status = 'Open'];
        for (Account account : accounts) {
            for (Case caseObj : cases) {
                if (caseObj.AccountId == account.Id) {
                    account.addError('Cannot delete Account with open Cases.');
                }
            }
        }
    }
    
}