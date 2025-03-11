public with sharing class OpportunityTriggerDispatcher {
    public OpportunityTriggerDispatcher(System.TriggerOperation opprationType) {
        switch on opprationType {
            when BEFORE_INSERT {
                
            }
            when BEFORE_UPDATE {
                
            }
            when BEFORE_DELETE {
                
            }
            when AFTER_INSERT {
                
            }
            when AFTER_UPDATE {
                
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