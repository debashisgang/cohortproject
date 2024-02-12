using CatalogService as service from '../../srv/cat-service';

annotate service.Header with @(
Capabilities.SearchRestrictions: {
    Searchable: false
  },
    UI.UpdateHidden:false,
    UI.DeleteHidden:true,
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Receiptno',
            Value : Receiptno,
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Shiplocation',
            Value : Shiplocation,
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Salesarea',
            Value : Salesarea,
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Part',
            Value : Part,
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Shipstatus',
            Value : Shipstatus,
            ![@UI.Importance] : #High,
        },
       
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.ChangeShipstatus',
            Label : 'ChangeShipstatus',
        },
    ]
);
annotate service.Header with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Receiptno',
                Value : Receiptno,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Shiplocation',
                Value : Shiplocation,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Salesarea',
                Value : Salesarea,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Part',
                Value : Part,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Shipstatus',
                Value : Shipstatus,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Shippedquantity',
                Value : Shippedquantity,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Receivedquantity',
                Value : Receivedquantity,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Updatedby',
                Value : Updatedby,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Object',
            ID : 'Object',
            Target : 'object1/@UI.LineItem#Object1',
        },
    ]
);
annotate service.Header with @(
    UI.SelectionFields : [
        Receiptno,
        Shiplocation,
        Shipstatus,
    ]
);
annotate service.Header with {
    Receiptno @Common.Label : 'Receiptno'
};
annotate service.Header with {
    Shiplocation @Common.Label : 'Shiplocation'
};
annotate service.Header with {
    Shipstatus @Common.Label : 'Shipstatus'
};
annotate service.Object with @(
 
    UI.LineItem #Object : [
        {
            $Type : 'UI.DataField',
            Value : Invrecno.object1.Approvedqty,
            Label : 'Approvedqty',
        },{
            $Type : 'UI.DataField',
            Value : Invrecno.object1.Deliveryqty,
            Label : 'Deliveryqty',
        },{
            $Type : 'UI.DataField',
            Value : Invrecno.object1.Invrecno_Receiptno,
            Label : 'Invrecno_Receiptno',
        },{
            $Type : 'UI.DataField',
            Value : Invrecno.object1.Itemno,
            Label : 'Itemno',
        },{
            $Type : 'UI.DataField',
            Value : Invrecno.object1.Itemstatus,
            Label : 'Itemstatus',
        },{
            $Type : 'UI.DataField',
            Value : Invrecno.object1.Salesoffice,
            Label : 'Salesoffice',
        },],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : Itemstatus,
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : Approvedqty,
            ![@UI.Importance] : #High,
        },
    ]
);
annotate service.Object with @(
    UI.LineItem #object : [
        {
            $Type : 'UI.DataField',
            Value : Approvedqty,
            Label : 'Approvedqty',
        },{
            $Type : 'UI.DataField',
            Value : Deliveryqty,
            Label : 'Deliveryqty',
        },{
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },{
            $Type : 'UI.DataField',
            Value : Invrecno_Receiptno,
            Label : 'Invrecno_Receiptno',
        },{
            $Type : 'UI.DataField',
            Value : Itemno,
            Label : 'Itemno',
        },{
            $Type : 'UI.DataField',
            Value : Itemstatus,
            Label : 'Itemstatus',
        },{
            $Type : 'UI.DataField',
            Value : Salesoffice,
            Label : 'Salesoffice',
        },]
);
annotate service.Object with @(
    UI.LineItem #object1 : []
);
annotate service.Object with @(
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'objectpage',
            ID : 'objectpage',
            Facets : [
            ],
        },]
);
annotate service.Object with @(
    UI.UpdateHidden:true,
    UI.DeleteHidden:true,
    UI.CreateHidden:true,
    UI.LineItem #Object1 : [
        {
            $Type : 'UI.DataField',
            Value : Approvedqty,
            Label : 'Approvedqty',
        },{
            $Type : 'UI.DataField',
            Value : Deliveryqty,
            Label : 'Deliveryqty',
        },{
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },{
            $Type : 'UI.DataField',
            Value : Itemstatus,
            Label : 'Itemstatus',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.ChangeItemstatus',
            Label : 'ChangeItemstatus',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.Deleteobject',
            Label : 'Deleteobject',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.Create',
            Label : 'Create',
        },]
);
annotate service.Header with @(
    UI.Identification : []
);
