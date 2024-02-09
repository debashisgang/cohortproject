namespace my.bookshop;

using
{
    managed,
    cuid,
    User,
    sap.common.CodeList
}
from '@sap/cds/common';

entity Header
{
    key Receiptno : String;
    Shiplocation : String;
    Salesarea : String;
    Part : String;
    Shipstatus : String;
    Shippedquantity : String;
    Receivedquantity : String;
    Updatedby : String;
    object1 : Association to many Object on object1.Invrecno = $self;
}
entity Object:cuid,managed
{
    Itemno : String;
    Itemstatus : String;
    Salesoffice : String;
    Deliveryqty : String;
    Approvedqty : String;
    Invrecno : Association to Header;
}
