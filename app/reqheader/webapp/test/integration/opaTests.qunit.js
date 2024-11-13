sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sravan/ust/reqheader/test/integration/FirstJourney',
		'sravan/ust/reqheader/test/integration/pages/ReqHeaderSetList',
		'sravan/ust/reqheader/test/integration/pages/ReqHeaderSetObjectPage'
    ],
    function(JourneyRunner, opaJourney, ReqHeaderSetList, ReqHeaderSetObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sravan/ust/reqheader') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheReqHeaderSetList: ReqHeaderSetList,
					onTheReqHeaderSetObjectPage: ReqHeaderSetObjectPage
                }
            },
            opaJourney.run
        );
    }
);