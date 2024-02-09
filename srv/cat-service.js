// const cds = require('@sap/cds');
 
// module.exports = cds.service.impl(async (srv) => {
//   const { Header } = srv.entities;
 
//   // Define a custom action to update the record
//   srv.on('CatalogService.Changestatus', async (req) => {
//     const { Receiptno} = req.data;
 
//     // Update the record with the new value
//     await cds.transaction(req).run(
//       UPDATE(Header).set({ Shipstatus: 'Completed' }).where({ Receiptno })
//     );
 
//     return { message: 'Record updated successfully.' };
//   });
// });
const cds = require('@sap/cds');

module.exports = cds.service.impl((srv) => {
    srv.on('Changestatus', 'Header', async (req) => {
        console.log("it is our request",req);
        const { Receiptno } = req.params[0];
        console.log("req",req.params[0])
      
        const header = await cds.transaction(req).run(
            SELECT.one.from('my.bookshop.Header').where({ Receiptno })
        );

        
        if (header) {
            await cds.transaction(req).run(
                UPDATE('my.bookshop.Header')
                .set({ Shipstatus: 'Completed' })
                .where({ Receiptno })
            );
        } 
    });
});



        
  