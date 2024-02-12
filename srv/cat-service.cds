using my.bookshop as my from '../db/data-model';

service CatalogService {
      entity Header @(restrict: [
          {
               grant: ['READ','WRITE','UPDATE','UPSERT','DELETE'],
               to   : 'RiskViewer'
          },
          {
               grant: [
                    'READ',
                    'WRITE',
                    'UPDATE',
                    'UPSERT',
                    'DELETE',
                    'ChangeShipstatus'
                    

               ], // Allowing CDS events by explicitly mentioning them
               to   : 'RiskManager'
          }
     ])            
      as projection on my.Header actions {
                           action ChangeShipstatus() returns Header;
                           
                      };

      annotate Header with @odata.draft.enabled;

     entity Object as projection on my.Object actions{
          action ChangeItemstatus() returns Object;
          action Create(Itemno:String,Salesoffice:String,Deliveryqty:String,Approvedqty:String) returns Object;
          action Deleteobject() returns Object;
     }

     annotate Object with @odata.draft.enabled;
}
