sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'sravan.ust.reqheader',
            componentId: 'ReqHeaderSetObjectPage',
            contextPath: '/ReqHeaderSet'
        },
        CustomPageDefinitions
    );
});