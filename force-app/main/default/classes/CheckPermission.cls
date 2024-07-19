/**
 * @description This class is used for CRUD Validation.
 */
public with sharing class CheckPermission {

    /**
    * @description This method checks create permissions.
    */
    public static Boolean hasOppCreatePermission() {
        return Schema.sObjectType.Opportunity.isCreateable();
    }

    /**
    * @description This method checks field-level read permissions.
    */
    public static Boolean hasOppAccessPermission() {
        return Schema.sObjectType.Opportunity.isAccessible();
    }

    /**
    * @description This method checks Update permissions.
    */
    public static Boolean hasOppUpdatePermission() {
        return Schema.sObjectType.Opportunity.isUpdateable();
    }

    /**
    * @description This method checks Delete permissions.
    */
    public static Boolean hasOppDeletePermission() {
        return Schema.sObjectType.Opportunity.isDeletable();
    }
}