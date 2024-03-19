sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'leagueservice/test/integration/FirstJourney',
		'leagueservice/test/integration/pages/LeaguesList',
		'leagueservice/test/integration/pages/LeaguesObjectPage'
    ],
    function(JourneyRunner, opaJourney, LeaguesList, LeaguesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('leagueservice') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheLeaguesList: LeaguesList,
					onTheLeaguesObjectPage: LeaguesObjectPage
                }
            },
            opaJourney.run
        );
    }
);