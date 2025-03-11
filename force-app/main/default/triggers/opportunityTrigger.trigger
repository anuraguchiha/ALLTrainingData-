trigger opportunityTrigger on Opportunity (before insert, 
                                           before update, 
                                           before delete, 
                                           after insert, 
                                           after update, 
                                           after delete, 
                                           after undelete) {

                                            opportunityTriggerDispatcher.dispatch(trigger.opprationType);

}