/**
 * @description This class is used for CRUD Validation.
 */
public with sharing class CheckPermission {

    /**
    * @description This method checks create permissions.
    * @return Boolean depending on Create permission
    */
    public static Boolean hasOppCreatePermission() {
        return Schema.sObjectType.Opportunity.isCreateable();
    }

    /**
    * @description This method checks field-level read permissions.
    * @return Boolean depending on Access permission
    */
    public static Boolean hasOppAccessPermission() {
         return Schema.sObjectType.Opportunity.isAccessible();
    }

    /**
    * @description This method checks Update permissions.
    * @return Boolean depending on Update permission
    */
    public static Boolean hasOppUpdatePermission() {
        return Schema.sObjectType.Opportunity.isUpdateable();
    }

    /**
    * @description This method checks Delete permissions.
    * @return Boolean depending on Delete permission
    */
    public static Boolean hasOppDeletePermission() {
        return Schema.sObjectType.Opportunity.isDeletable();
    }
}