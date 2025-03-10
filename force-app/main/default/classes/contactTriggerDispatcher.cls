public with sharing class contactTriggerDispatcher {
    public contactTriggerDispatcher(System.TriggerOperation operationType) {
        switch on operationType {
            when BEFORE_INSERT {
                
            }
            when BEFORE_UPDATE {
                
            }
            when BEFORE_DELETE {
                
            }
            when AFTER_INSERT {
                //contactTriggerHandler.casecadeDelete(Trigger.oldMap, Trigger.newMap);
            }
            when AFTER_UPDATE {
                //contactTriggerHandler.casecadeDelete(Trigger.oldMap, Trigger.newMap);
            }
            when AFTER_DELETE {
                
            }
            when AFTER_UNDELETE {
                
            }
            when else {
                
            }
        }

    }
}