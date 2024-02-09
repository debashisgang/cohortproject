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
                    'Changestatus'
               ], // Allowing CDS events by explicitly mentioning them
               to   : 'RiskManager'
          }
     ])            as projection on my.Header actions {
                           action Changestatus();
                           action detailview();
                      };

     annotate Header with @odata.draft.enabled;

     entity Object as projection on my.Object actions {
                           action Delete();
                           action Edit();
                      };

     annotate Object with @odata.draft.enabled;
}
