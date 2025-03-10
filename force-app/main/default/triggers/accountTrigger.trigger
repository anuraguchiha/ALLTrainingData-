trigger accountTrigger on Account (before insert, 
                                  before update, 
                                  before delete, 
                                  after insert, 
                                  after update, 
                                  after delete, 
                                  after undelete) {


                                    //build framwork for trigger handler
                                    AccountTriggerDispatcher.dispatch(trigger.opprationType);
}