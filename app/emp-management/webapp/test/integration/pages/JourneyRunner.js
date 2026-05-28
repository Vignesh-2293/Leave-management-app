sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"empmanagement/test/integration/pages/EmployeesList",
	"empmanagement/test/integration/pages/EmployeesObjectPage",
	"empmanagement/test/integration/pages/LeaveRequestsObjectPage"
], function (JourneyRunner, EmployeesList, EmployeesObjectPage, LeaveRequestsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('empmanagement') + '/test/flpSandbox.html#empmanagement-tile',
        pages: {
			onTheEmployeesList: EmployeesList,
			onTheEmployeesObjectPage: EmployeesObjectPage,
			onTheLeaveRequestsObjectPage: LeaveRequestsObjectPage
        },
        async: true
    });

    return runner;
});

