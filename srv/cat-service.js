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
    srv.on('ChangeShipstatus', 'Header', async (req) => {
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
    // srv.on('ChangeItemstatus', 'Header', async (req) => {
    //     console.log("it is our request",req);
    //     const { Receiptno } = req.params[0];
    //     const result = await cds.transaction(req).run(
    //         SELECT.one.from('my.bookshop.Header').where({ Receiptno })
    //     );
    //     // const { Shipstatus } = req.params[4];
    //     console.log("req",req.params[0])
    //     if(result.Shipstatus =="Completed"){
    //         const header = await cds.transaction(req).run(
    //             SELECT.one.from('my.bookshop.Object').where({Invrecno: Receiptno })
    //         );
    
            
    //         if (header) {
    //             await cds.transaction(req).run(
    //                 UPDATE('my.bookshop.Object')
    //                 .set({ Itemstatus: 'Shipped' })
    //                 .where({Invrecno: Receiptno })
    //             );
    //             req.info(200,"ItemStatus Changed Succesfully")
    //         }

    //     }
    //     else{
    //         req.error(404, "To change the ItemStatus, Shipstatus should be completed")
    //     }
      
        
    // });
    srv.on('ChangeItemstatus', 'Object', async (req) => {
        console.log("it is our request",req);
        const { ID } = req.params[1];
         const result = await cds.transaction(req).run(
             SELECT.one.from('my.bookshop.Object').where({ID})
         );
        console.log("req",req.params[1])
        console.log("result",result)
        var Receiptno=result.Invrecno_Receiptno;
        console.log("receiptno",Receiptno);
        const result1 = await cds.transaction(req).run(
            SELECT.one.from('my.bookshop.Header').where({ Receiptno })
        );
        console.log("result1",result1);
        if(result1.Shipstatus=="Completed"){
            await cds.transaction(req).run(
                         UPDATE('my.bookshop.Object')
                         .set({ Itemstatus: 'Shipped' })
                         .where({ID})
    
            );
            req.info(200,`Itemstatus updated to Shipped for ID:${ID}`)
        }
        else{
            req.error(404,`ItemStatus Can not be changed as Shipstatus is not Completed for Receipt No:${Receiptno}`)
        }    
    });
    srv.on('Deleteobject', 'Object', async (req) => {
        console.log("requestis",req)
        const { ID } = req.params[1];
        console.log("ID IS:",ID);
        const object = await cds.transaction(req).run(
            SELECT.one.from('my.bookshop.Object').where({ID})
        );
        if (object) {
        await cds.transaction(req).run(
            DELETE('my.bookshop.Object').where({ID})
           
        );
        req.info(200,`Item Successfully Deleted for ID:${ID}`)
        }
        else{
            req.error(404,`Object Does not Exist`)
    
        }
        
    });
    srv.on('Create', 'Object', async (req) => {
        // Itemstatus;Invrecno_Receiptno
        console.log("requestparams:",req.params);
        console.log("requestparams receipt:",req.params[0].Receiptno);
        console.log("requestparamslength:",req.params.length);
     //   const{ id }= req.params[1];
     //    const result = await cds.transaction(req).run(
     //     SELECT.one.from('my.bookshop.Object').where({id}))
     //     console.log("result is printing",result)
     
     
     let Invrecno_Receiptno=req.params[0].Receiptno;
     const {Itemno,Salesoffice,Deliveryqty,Approvedqty } = req.data;
      let Itemstatus = "Created";
        
         // const object = await cds.transaction(req).run(
         //     SELECT.one.from('my.bookshop.Header').where({ Receiptno })
         // );
         // if (header) {
     
              const updatedFields = {
                 Itemno: Itemno,
                 Itemstatus:Itemstatus ,
                 Salesoffice:Salesoffice,
                 Deliveryqty:Deliveryqty ,
                 Approvedqty:Approvedqty ,
                 Invrecno_Receiptno: Invrecno_Receiptno
             };
             console.log(updatedFields);
     
             // Update the Header entry with the updated fields
             await cds.transaction(req).run(
                 INSERT.into('my.bookshop.Object')
                 .entries(updatedFields)
             );
             req.info(200,`Item Created`)
     
         //     return `Header entry with Receiptno '${Receiptno}' updated successfully.`;
         // } else {
         //     return `Header entry with Receiptno '${Receiptno}' not found.`;
         // }
              
     });
});



        
  