public with sharing class BrOut {
    public BrOut() {
        System.debug('Hello World');
    }

    public CrudCheck() {
        // Check for Create permission
        if (!Schema.sObjectType.Opportunity.isCreateable()) {
            System.debug('No permission to create Opportunity');
            return;
        }

        // Create an Opportunity Object
        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting'
        );

        // Insert the Opportunity
        if (Schema.sObjectType.Opportunity.isInsertable()) {
            // Step 2: Insert the Opportunity
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

        // Delete the fetched Opportunity
        if (Schema.sObjectType.Opportunity.isDeletable()) {
            delet opp;
        } else {
            return;
        }
    }
}