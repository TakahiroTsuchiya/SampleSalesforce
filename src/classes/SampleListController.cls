public with sharing class SampleListController {

    public List<String> rightSelectedItems { get; set; }

    public List<String> leftSelectedItems { get; set; }
    
    public List<SelectOption> rightSelectItems { get; set; }

    public List<SelectOption> leftSelectItems { get; set; }

    public Map<Id, Name> optionsMap { get; set; }

    public PageReference removeOptions() {
        return null;
    }

    public PageReference addOptions() {
        
        return null;
    }

    public PageReference initAction() {

        optionsMap = new Map<Id, Name>();

        rightSelectItems = new List<SelectOption>();
        
        leftSelectItems = new List<SelectOption>();
        leftSelectItems.add(new SelectOption('Red', '赤'));
        leftSelectItems.add(new SelectOption('Yellow ', '黄'));
        leftSelectItems.add(new SelectOption('Green', '緑'));
        leftSelectItems.add(new SelectOption('Blue', '青'));
        leftSelectItems.add(new SelectOption('Purple', '紫'));

        return null;
    }

}