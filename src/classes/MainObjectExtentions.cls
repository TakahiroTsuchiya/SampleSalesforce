/********************************************************
 *
 *
 *
 *******************************************************/
public with sharing class MainObjectExtentions {
    // ApexPages.StandardSetController must be instantiated
    // for standard list controllers
    public ApexPages.StandardSetController setCon {
        get {
            if (setCon == null) {
                setCon = new ApexPages.StandardSetController(queryAll());
            }
            return setCon;
        }
        set;
    }

    /**
     * Constructor
     */
    public MainObjectExtentions(ApexPages.StandardController controller) {
    }

    // Initialize setCon and return a list of records
    public List<MainObject__c> getMainObjects() {
        return (List<MainObject__c>) setCon.getRecords();
    }

    /**
     * 
     * @return List<MainObject__c>
     */
    private List<MainObject__c> queryAll() {
        String query = 'SELECT '
                             + 'ID '
                             + ', NAME '
                             + ', relationOfM2SByA__c '
                             + ', relationOfM2SByA__r.ID '
                             + ', relationOfM2SByA__r.Name '
                             + ', relationOfM2SByA__r.dateOfA__c '
                             + ', relationOfM2SByA__r.dateOfB__c '
                             + ', relationOfM2SByB__c '
                             + ', relationOfM2SByB__r.ID '
                             + ', relationOfM2SByB__r.Name '
                             + ', relationOfM2SByB__r.dateOfA__c '
                             + ', relationOfM2SByB__r.dateOfB__c '
                             + ', relationOfM2SByC__c '
                             + ', relationOfM2SByC__r.ID '
                             + ', relationOfM2SByC__r.Name '
                             + ', relationOfM2SByC__r.dateOfA__c '
                             + ', relationOfM2SByC__r.dateOfB__c '
                             + ', relationOfM2SByD__c '
                             + ', relationOfM2SByD__r.ID '
                             + ', relationOfM2SByD__r.Name '
                             + ', relationOfM2SByD__r.dateOfA__c '
                             + ', relationOfM2SByD__r.dateOfB__c '
                         + 'FROM  '
                         + '    MainObject__c  '
                         + 'ORDER BY  '
                         + '    NAME DESC';
        return database.query(query);
    }
}