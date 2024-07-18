/**
 * @description This class demonstrates a simple debug statement.
 */
public with sharing class BrOut {
    /**
     * @description Constructor for the BrOut class.
     */
    public BrOut() {
        System.debug(INFO, 'Hello World');
    }

    /**
    * @description This method checks CRUD statements.
    */
    public void crudCheck() {
        // Check for Create permission
        if (!Schema.sObjectType.Opportunity.isCreateable()) {
            System.debug(INFO,'No permission to create Opportunity');
            return;
        }

        // Create an Opportunity Object
        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting'
        );

        // Insert the Opportunity
        if (Schema.sObjectType.Opportunity.isInsertable()) {
            insert opp;
        } else {
            return;
        }

        // Write SOQL to fetch an Opportunity with the name "Edge SLA"
        Opportunity edgeSLAOpp = [SELECT Id, Name, StageName, CloseDate FROM Opportunity WHERE Name = 'Edge SLA' LIMIT 1];

        // Update the fetched Opportunity
        edgeSLAOpp.StageName = 'Negotiation/Review';
        if (Schema.sObjectType.Opportunity.isUpdateable()){
            update edgeSLAOpp;
        } else {
            return;
        }

        // Delete the Opportunity
        if (Schema.sObjectType.Opportunity.isDeletable()) {
            delete opp;
        } else {
            return;
        }
    }
}