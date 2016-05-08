/****************************
 *
 *
 *
 ****************************
 */
public class MobilePhoneDao {

    /**
     *
     * @param qMobile_Phone_ID {@value $ObjectType.Mobile_Phone__c.Fields.Name.Label}
     * @return Mobile_Phone__cオブジェクト
     */
    public static Mobile_Phone__c queryUnique(String qMobile_Phone_ID) {
        return query(qMobile_Phone_ID).get(0);
    }

    public static List<Mobile_Phone__c> queryAll() {
        return query(null);
    }

    public static List<Mobile_Phone__c> query(String qMobile_Phone_ID) {
        return query(qMobile_Phone_ID, null);
    }
    public static List<Mobile_Phone__c> query(String qMobile_Phone_ID, String qMobile_Phone_Name) {
        return query(qMobile_Phone_ID, null, qMobile_Phone_Name);
    }

    public static List<Mobile_Phone__c> query(String qMobile_Phone_ID, Id qMobilePhoneOwnerUserId, String qMobile_Phone_Name) {

        String query = 'select Name, MobilePhoneOwnerUserId__c, MobilePhoneName__c, CreatedDate, SystemModStamp from Mobile_Phone__c';

        boolean addCondition = false;

        if (String.isNotBlank(qMobile_Phone_ID)) {
            if (addCondition == false) {
                query += ' where ';
            }
            if (addCondition) {
                query += ' and ';
            }
            query += ' Name = \'' + qMobile_Phone_ID + '\'';

            addCondition = true;
        }

        if (qMobilePhoneOwnerUserId != null) {
            if (addCondition == false) {
                query += ' where ';
            }
            if (addCondition) {
                query += ' and ';
            }
            query += ' MobilePhoneOwnerUserId__c = \'' + qMobilePhoneOwnerUserId + '\'';

            addCondition = true;
        }

        if (String.isNotBlank(qMobile_Phone_Name)) {
            if (addCondition == false) {
                query += ' where ';
            }
            if (addCondition) {
                query += ' and ';
            }
            query += ' MobilePhoneName__c like \'%' + qMobile_Phone_Name + '%\'';

            addCondition = true;
        }

        query += ' order by Name DESC ';

        System.debug(query);

        return Database.query(query);
    }

    public static List<Mobile_Phone__c> queryByName(String qMobile_Phone_Name) {
        return query(null, qMobile_Phone_Name);
    }
}
