 /**
 * @description This class demonstrates a simple debug statement.
 */
public with sharing class BrOut {
    /**
     * @description Constructor for the BrOut class.
     */
    public BrOut() {
        System.debug(INFO, 'Hello World?');
    }

    /**
    * @description This method checks CRUD statements.
    */
    public void crudCheck() {
       
        // Create an Opportunity Object
        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting'
        );

        // Insert the Opportunity
        if (CheckPermission.hasOppCreatePermission()) {
            try {
                insert opp;
                System.debug(INFO,'Opportunity created successfully.');
            } catch (DmlException e) {
                System.debug(ERROR,'Error creating Opportunity: ' + e.getMessage());
            }
        } else {
            System.debug(INFO,'No Create Access for Opportunity.');
        }

        // Write SOQL to fetch an Opportunity with the name "Edge SLA"
        Opportunity edgeSLAOpp;
        if (CheckPermission.hasOppAccessPermission()) {
            try {
                edgeSLAOpp = [SELECT Id, Name, StageName, CloseDate FROM Opportunity WHERE Name = 'Edge SLA' LIMIT 1];
                System.debug(INFO,'Opportunity read successfully.');
            } catch (QueryException e) {
                System.debug(ERROR,'Error reading Opportunity: ' + e.getMessage());
            }
        } else {
            System.debug(ERROR,'No Read Access for Opportunity.');
        }

        // Update the fetched Opportunity
        edgeSLAOpp.StageName = 'Negotiation/Review';
        if (CheckPermission.hasOppUpdatePermission()){
            try {
                update edgeSLAOpp;
                System.debug(INFO,'Opportunity updated successfully.');
            } catch (DmlException e) {
                System.debug(ERROR,'Error updating Opportunity: ' + e.getMessage());
            }
        } else {
            System.debug(ERROR,'No Update Access for Opportunity.');
        }

        // Delete the Opportunity
        if (CheckPermission.hasOppDeletePermission()) {
            try{
                delete opp;
                System.debug(INFO,'Opportunity deleted successfully.');
            } catch (DmlException e) {
                System.debug(ERROR,'Error deleting Opportunity: ' + e.getMessage());
            }
        } else {
            System.debug(INFO,'No Delete Access for Opportunity.');
        }
    }
}