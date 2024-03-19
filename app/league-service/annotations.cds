using LeagueService as service from '../../srv/LeagueService';

annotate service.Leagues with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'ID League',
            Value : idL,
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Country}',
            Value : country,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Name}',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Level',
            Value : level,
            
        },
        
        {
            $Type : 'UI.DataField',
            Value : team.idT,
            Label : '{i18n>TeamsOfThisLeague}',
        },
    ]
);






annotate service.Leagues with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'idL',
                Value : idL,
            },
            {
                $Type : 'UI.DataField',
                Label : 'country',
                Value : country,
            },
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'level',
                Value : level,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'League overview',
            ID : 'Leagueoverview',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'League Details',
                    ID : 'LeagueDetails',
                    Target : '@UI.FieldGroup#LeagueDetails',
                },],
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Teams',
            ID : 'Teams2',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Teams',
                    ID : 'Teams1',
                    Target : 'team/@UI.LineItem#Teams',
                },],
        },]
);
annotate service.Leagues with @(
    UI.SelectionFields : [
        level,country,]
);
annotate service.Teams with {
    idT @Common.Label : 'Team '
};
annotate service.Leagues with @(
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : idL,
        },
    }
);
annotate service.Leagues with @(
    UI.FieldGroup #LeagueDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : team.league.idL,
                Label : '{i18n>IdLeague}',
            },
            {
                $Type : 'UI.DataField',
                Value : team.league.name,
                Label : 'Name',
            },{
                $Type : 'UI.DataField',
                Value : team.league.country,
                Label : '{i18n>Country}',
            },{
                $Type : 'UI.DataField',
                Value : team.league.level,
                Label : '{i18n>Level}',
            },],
    }
);
annotate service.Leagues with @(
    UI.FieldGroup #TeamDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : team.idT,
                Label : '{i18n>TeamId}',
            },
            {
                $Type : 'UI.DataField',
                Value : team.name,
                Label : 'Name',
            },
            {
                $Type : 'UI.DataField',
                Value : team.city,
                Label : 'City',
            },
            {
                $Type : 'UI.DataField',
                Value : team.stadiumName,
                Label : '{i18n>StadiumName}',
            },
            {
                $Type : 'UI.DataField',
                Value : team.numberPlayers,
                Label : '{i18n>NumberPlayers}',
            },],
    }
);
annotate service.Teams with {
    idT @Common.Text : name
};
annotate service.Leagues with {
    level @Common.Label : '{i18n>Level}'
};
annotate service.Leagues with {
    country @Common.Label : '{i18n>Country}'
};
annotate service.Teams with @(
    UI.LineItem #Teams : [
        {
            $Type : 'UI.DataField',
            Value : city,
            Label : 'City',
        },{
            $Type : 'UI.DataField',
            Value : idT,
        },{
            $Type : 'UI.DataField',
            Value : name,
            Label : '{i18n>Name1} ',
        },{
            $Type : 'UI.DataField',
            Value : numberPlayers,
            Label : 'Number of players',
        },{
            $Type : 'UI.DataField',
            Value : stadiumName,
            Label : '{i18n>StadiumName}',
        },],
    
);
annotate service.Teams with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Players',
            ID : 'Players',
            Target : 'player/@UI.LineItem#Players',
        },
        
    ]
    
);

annotate service.Players with @(
    UI.LineItem #Players : [
        {
            $Type : 'UI.DataField',
            Value : idP,
            Label : '{i18n>Id}',
        },
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : '{i18n>Name}',
        },
        {
            $Type : 'UI.DataField',
            Value : surname,
            Label : '{i18n>Surname}',
        },{
            $Type : 'UI.DataField',
            Value : number,
            Label : '{i18n>Number}',
        },
        {
            $Type : 'UI.DataField',
            Value : active,
            Label : 'Active',
        },]
);
annotate service.Leagues with @(
    UI.DataPoint #idL : {
        $Type : 'UI.DataPointType',
        Value : idL,
        Title : '{i18n>Idl}',
    },
    UI.DataPoint #level : {
        $Type : 'UI.DataPointType',
        Value : level,
        Title : '{i18n>Level1}',
    },
    UI.HeaderFacets : []
);

annotate service.Leagues with @(
    UI.FieldGroup #Generalinfromation : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    }
);
annotate service.Teams with @(
    UI.FieldGroup #PlayersOverview : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : player.active,
                Label : 'active',
            },{
                $Type : 'UI.DataField',
                Value : player.idP,
                Label : 'idP',
            },{
                $Type : 'UI.DataField',
                Value : player.name,
                Label : 'name',
            },{
                $Type : 'UI.DataField',
                Value : player.surname,
                Label : 'surname',
            },{
                $Type : 'UI.DataField',
                Value : player.number,
                Label : 'number',
            },],
    }
);
annotate service.Players with {
    idP @Common.Text : {
            $value : name,
            ![@UI.TextArrangement] : #TextSeparate,
        }
};
annotate service.Leagues with @(
    UI.Identification : []
);
