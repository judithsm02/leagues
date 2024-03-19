
const cds = require('@sap/cds');
const { count } = require('console'); 

module.exports = cds.service.impl(async function() { 


    const { Players, Teams, Leagues } = this.entities; // THIS indica que està treballant en aquesta entity. 

    this.before("CREATE",Players, async (req) => //ASYNC: no funcionen simultàniament. En canvi, el sync si. 
    {
        const player=req.data;

        const team= await cds.run(SELECTE.one.from('Teams').where({ID:player.team.ID}));
        
        if(team.numberPlayers >=3)
        {
            return req.reject(404, `Team` + Teams.name+`has already 3 players`);
        }
    
    });

    this.after("CREATE", Players, async(req) =>
    {
        await UPDATE ('Teams').set ({numberPlayers:{'+=':1}}).where({ID:req.team.idT}); //SET: estbaleix les dades que li vols donar per fer l'update. 

        //AWAIT: funció del await. treballa amb el async
            //La declaración de async y await generan una función asíncrona, es decir que por dentro siguen trabajando con promesas, recordando que estas pasan por alguno de los estados siguientes:

            // resolved
            // rejected
            // pending
    }
    );

    //creo la funció que fa que es pugui desactivar un player. Després la utilitzaré en la part del servei i faré la crida amb un @action

    this.on("DesactivarPlayer",async(req) =>
    { 
        const desactivar= await UPDATE ('players').set({active:false}).where({ID:req.data.idP}) //no sé si estic utilitzant bé les variables.  

            if (desactivar===false)
            {
                return req.reject(404, `El player` + req.data.idP+`no existeix.`);
            }
                return SELECT.one.from('Players').where({ ID: req.data.idP}) //no entenc aquesta part
        })
    }
      
    );
    

