namespace my.leavemanagement;

using { managed, cuid } from '@sap/cds/common';

// 1. Employee Master Data Entity
entity Employees {
    key id        : String(10); // Auto-unique key
    firstName     : String(50) @mandatory @assert.notNull;
    lastName      : String(50) @mandatory @assert.notNull;
    email         : String(100) @unique; // Secondary constraint
    department    : String(50);
    leaveRequests : Association to many LeaveRequests on leaveRequests.employee = $self;
}

// 2. Transactional Leave Management Entity
entity LeaveRequests : cuid, managed {
    // Dynamic relational linkages linking cleanly via context IDs
    employee  : Association to Employees @mandatory @assert.notNull; 
    
    leaveType : String(20) enum {
        VACATION = 'Annual Vacation';
        SICK     = 'Sick Leave';
        PERSONAL = 'Personal Leave';
    } default 'VACATION';

    startDate : Date @mandatory @assert.notNull;
    endDate   : Date @mandatory @assert.notNull;
    daysCount : Integer @readonly; // Calculated dynamically in backend js loop
    
    status    : String(20) enum {
        PENDING  = 'Pending Approval';
        APPROVED = 'Approved';
        REJECTED = 'Rejected';
    } default 'PENDING';

    comment   : String(500);
}
