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
                System.debug('Opportunity created successfully.');
            } catch (DmlException e) {
                System.debug('Error creating Opportunity: ' + e.getMessage());
            }
        } else {
            System.debug('No Create Access for Opportunity.');
        }

        // Write SOQL to fetch an Opportunity with the name "Edge SLA"
        Opportunity edgeSLAOpp;
        if (CheckPermission.hasOppAccessPermission()) {
            try {
                edgeSLAOpp = [SELECT Id, Name, StageName, CloseDate FROM Opportunity WHERE Name = 'Edge SLA' LIMIT 1];
                System.debug('Opportunity read successfully.');
            } catch (QueryException e) {
                System.debug('Error reading Opportunity: ' + e.getMessage());
            }
        } else {
            System.debug('No Read Access for Opportunity.');
        }

        // Update the fetched Opportunity
        edgeSLAOpp.StageName = 'Negotiation/Review';
        if (CheckPermission.hasOppUpdatePermission()){
            try {
                update edgeSLAOpp;
                System.debug('Opportunity updated successfully.');
            } catch (DmlException e) {
                System.debug('Error updating Opportunity: ' + e.getMessage());
            }
        } else {
            System.debug('No Update Access for Opportunity.');
        }

        // Delete the Opportunity
        if (CheckPermission.hasOppDeletePermission()) {
            try{
                delete opp;
                System.debug('Opportunity deleted successfully.');
            } catch (DmlException e) {
                System.debug('Error deleting Opportunity: ' + e.getMessage());
            }
        } else {
            System.debug('No Delete Access for Opportunity.');
        }
    }
}