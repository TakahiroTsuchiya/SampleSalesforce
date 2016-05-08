public with sharing class SampleSearchController {

    // 検索条件を保持する変数
    public Mobile_Phone__c conditionMobilePhone { get; set; }

    // 検索結果を保持する変数
    public List<Mobile_Phone__c> mobilePhoneDatas { get; set; }

    /*
     * 初期処理
     */
    public void initAction() {
        // 検索条件を初期化
        conditionMobilePhone = new Mobile_Phone__c();
        // 表示データを空にする
        mobilePhoneDatas = new List<Mobile_Phone__c>();
        // 詳細画面から遷移した場合、検索条件を設定・結果を表示する
        conditionMobilePhone.MobilePhoneName__c = ApexPages.currentPage().getParameters().get('MobilePhoneName__c');

        if (String.isNotBlank(conditionMobilePhone.MobilePhoneName__c)) {
            queryAction();
        }
    }

    /*
     * 検索ボタン押下時処理
     */
    public void queryAction() {

        mobilePhoneDatas = MobilePhoneDao.query(null, conditionMobilePhone.MobilePhoneOwnerUserId__c, conditionMobilePhone.MobilePhoneName__c);
    }

    public class MobilePhoneData {

        private Mobile_Phone__c mobilePhoneData;

        public MobilePhoneData(Mobile_Phone__c mobilePhone) {

            this.mobilePhoneData = mobilePhone;
        }

        // 端末所有者名
        public String mobilePhoneOwnerName {
            get{
                return this.mobilePhoneData.MobilePhoneOwnerUserId__r.Name;
            }
        }
        // 端末ID
        public String mobilePhoneId {
            get{
                return this.mobilePhoneData.Name;
            }
        }
        // 端末名
        public String mobilePhoneName {
            get{
                return this.mobilePhoneData.MobilePhoneName__c;
            }
        }
    }
}
