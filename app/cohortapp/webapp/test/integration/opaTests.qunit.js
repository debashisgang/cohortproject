sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'cohortapp/test/integration/FirstJourney',
		'cohortapp/test/integration/pages/HeaderList',
		'cohortapp/test/integration/pages/HeaderObjectPage'
    ],
    function(JourneyRunner, opaJourney, HeaderList, HeaderObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('cohortapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheHeaderList: HeaderList,
					onTheHeaderObjectPage: HeaderObjectPage
                }
            },
            opaJourney.run
        );
    }
);