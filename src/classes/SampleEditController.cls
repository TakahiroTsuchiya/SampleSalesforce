public with sharing class SampleEditController {

    public Mobile_Phone__c data { get; set; }

    public void initAction() {
        // 初期化
        data = new Mobile_Phone__c();
        // 編集の場合
        String Mobile_Phone_ID = System.currentPageReference().getParameters().get('Mobile_Phone_ID');
        if (String.isNotBlank(Mobile_Phone_ID)) {
            data = MobilePhoneDao.queryUnique(Mobile_Phone_ID);
        }
        System.debug('[Mobile_Phone_ID]' + Mobile_Phone_ID);
    }

    public PageReference saveAction() {
        return upsertData();
    }

    public PageReference deleteAction() {
        return deleteData();
    }

    public PageReference cancelAction() {
        return nextScreen();
    }

    private PageReference upsertData() {
        try {
            upsert data;
            return nextScreen();
        } catch (Exception e) {
        }
        return null;
    }

    private PageReference deleteData() {
        try {
            delete data;
            return nextScreen();
        } catch (Exception e) {
        }
        return null;
    }

    private PageReference nextScreen() {
        PageReference returnPage = Page.SampleSearch;
        returnPage.getParameters().put('MobilePhoneName__c', '');
        returnPage.getParameters().put('MobilePhoneOwnerUserId__c', '');
        return returnPage;
    }
}
