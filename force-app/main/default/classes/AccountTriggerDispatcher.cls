public with sharing class AccountTriggerDispatcher {
    public AccountTriggerDispatcher(system.TriggerOperation opprationType) {
          switch on opprationType {
             when BEFORE_INSERT {
                 
             }
             when BEFORE_UPDATE {
                 
             }
             when BEFORE_DELETE {
                accountTriggerHandler.preventDeletionWithAttachment(Trigger.oldMap);
             }
             when AFTER_INSERT {
                 accountTriggerHandler.casecadeDelete(Trigger.oldMap, Trigger.newMap);
             }
             when AFTER_UPDATE {
                 accountTriggerHandler.casecadeDelete(trigger.oldMap, trigger.newMap);
             }
             when AFTER_DELETE {
                 
             }
             when AFTER_UNDELETE {
                 
             }
             when else {
                 
             }

    }
}