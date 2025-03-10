trigger contactTrigger on SOBJECT (before insert, 
                                   before update, 
                                   before delete, 
                                   after insert, 
                                   after update, 
                                   after delete, 
                                   after undelete) {
  
  //build framwork for trigger handler
  ContactTriggerDispatcher.dispatch(trigger.opprationType);

}