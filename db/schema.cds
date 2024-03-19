

namespace leagues;


entity Leagues {
    key idL: Integer;
    country: String(2) @mandatory; 
    name: String (120) @mandatory;
    level: Integer @mandatory @assert.range:[1,2,3]; //només pot tenir 3 valors. 
    team: Association to many Teams 
                on team.league = $self; //s'ha de vincular els camps de la lliga amb els camps del teams. Es té en compte el caps de league dins de team, no els seu ID. 
}

entity Teams{
    key idT:Integer;
    name: String(120) @mandatory;
    stadiumName:String(120) @mandatory;
    city: String(120) @mandatory;
    numberPlayers: Integer @mandatory;
    player: Association to many Players
                on player.team=$self;
    league: Association to Leagues; //no cal posar el "to one"
    
}

entity Players {
    key idP: Integer;
    name: String (120) @mandatory;
    surname: String(120) @mandatory;
    number: Integer @mandatory;
    active: Boolean @mandatory;
    team: Association to Teams; //no cal posar el "to one"

}
