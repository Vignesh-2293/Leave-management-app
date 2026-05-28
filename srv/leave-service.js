const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
    this.before(['CREATE', 'UPDATE'], 'LeaveRequests', (req) => {
        const { startDate, endDate } = req.data;
        
        // Dynamic Intercept: Force data integrity rule
        if (req.user.role === 'EmployeeRole') {
            req.data.employee_id = req.user.id; 
        }

        if (startDate && endDate) {
            const start = new Date(startDate);
            const end = new Date(endDate);
            if (start > end) {
                return req.error(400, 'Start date cannot be after end date.', 'in/startDate');
            }
            const diffTime = Math.abs(end - start);
            req.data.daysCount = Math.ceil(diffTime / (1000 * 60 * 60 * 24)) + 1;
        }
    });
});
