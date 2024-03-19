
using {leagues as fl} from '../db/schema';

@path: 'service/leagues' //aixo es la route que segueix el https quan es busca el servei. Tens dues path, una per a cada servei i en funció de les teves credencials pots accedir o no. 
//@requires: 'LeaguesViewer'

service LeagueService  // crees els dos serveis i dones els prermisos a cada role. 
{
    @readonly entity Leagues as projection on fl.Leagues;
    @readonly entity Teams as projection on fl.Teams;
    @readonly entity Players as projection on fl.Players;
};


@path: 'service/leaguesAdm' //aquesta és l'altre path per anar a l'altre servei
//@requires: 'LeaguesAdmin'


service LeaguesServiceAdm {

    entity Leagues as projection on fl.Leagues;  //aquí ja no és @readonly ja que vols que sigui "escritura i lectura"
    entity Teams as projection on fl.Teams;
    entity Players as projection on fl.Players;
    //action DesactivarPlayer(ID:Integer) returns Players; //

    //falta la part de la crida a la action de l'altre "js".

};


//aquesta és una altre manera de fer-ho però molt més lenta- No cal especificar tant. 
// service LeagueService @(requieres: 'authenticated-user' ){
//     entity leagues @(restrict:[
//         {
//             grant:'READ',
//             to: 'LeaguesAdmin'
//         },
//         {
//             grant: [
//                 'READ',
//                 'WRITE',
//                 'UPDATE',
//                 'UPSERT',
//                 'DELETE',

//             ],
//             to: 'LeaguesViewer'
//         }
//     ]) as projection on fl.Leagues;
//     annotate leagues with @odata.draft.enabled;

//     entity teams @(restrict:[
//         {
//             grant:'READ',
//             to: 'LeaguesAdmin'
//         },
//         {
//             grant: [
//                 'READ',
//                 'WRITE',
//                 'UPDATE',
//                 'UPSERT',
//                 'DELETE',

//             ],
//             to: 'LeaguesViewer'
//         }
//     ]) as projection on fl.Teams;
//     annotate teams with @odata.draft.enabled;

//     entity players @(restrict:[
//         {
//             grant:'READ',
//             to: 'LeaguesAdmin'
//         },
//         {
//             grant: [
//                 'READ',
//                 'WRITE',
//                 'UPDATE',
//                 'UPSERT',
//                 'DELETE',

//             ],
//             to: 'LeaguesViewer'
//         }
//     ]) as projection on fl.Players;
//     annotate players with @odata.draft.enabled;
// }

// @path: 'service/leaguesAdm' 

// service LeagueServiceAdm @(requieres: 'authenticated-user' ){
            
//     entity leagues @(restrict:[
//         {
//             grant: ['READ',
//                     'WRITE'
            
//             ],
//             to: ['LeaguesAdmin', 'LeaguesViewer']
//         },
//         {
//             grant: [
//                 'READ',
//                 'WRITE',
//                 'UPDATE',
//                 'UPSERT',
//                 'DELETE',

//             ],
//             to: 'LeaguesAdmin'
//         }
//     ]) as projection on fl.Leagues;

//      entity teams @(restrict:[
//         {
//             grant: ['READ',
//                     'WRITE'
            
//             ],
//             to: ['LeaguesAdmin', 'LeaguesViewer']
//         },
//         {
//             grant: [
//                 'READ',
//                 'WRITE',
//                 'UPDATE',
//                 'UPSERT',
//                 'DELETE',

//             ],
//             to: 'LeaguesAdmin'
//         }
//     ]) as projection on fl.Teams;
//     annotate teams with @odata.draft.enabled;

//      entity players @(restrict:[
//         {
//             grant: ['READ',
//                     'WRITE'
            
//             ],
//             to: ['LeaguesAdmin', 'LeaguesViewer']
//         },
//         {
//             grant: [
//                 'READ',
//                 'WRITE',
//                 'UPDATE',
//                 'UPSERT',
//                 'DELETE',

//             ],
//             to: 'LeaguesAdmin'
//         }
//     ]) as projection on fl.Players;

// }