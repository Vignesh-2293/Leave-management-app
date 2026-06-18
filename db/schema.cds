namespace my.leavemanagement;

using {
    managed,
    cuid
} from '@sap/cds/common';


entity Employees : cuid {
    @assert.unique  @mandatory       @assert.notNull
    emp_number            : String(10);

    @mandatory      @assert.notNull
    name                  : String(50);

    @mandatory      @assert.notNull  @assert.unique
    email                 : String(100);

    @mandatory
    role                  : String(50);

    @mandatory
    totalLeaveEntitlement : Integer;

    @mandatory
    leaveBalance          : Integer;
    @mandatory
    manager               : Association to Employees;
    leaveRequests         : Composition of many LeaveRequests
                                on leaveRequests.employee = $self;
}

entity LeaveRequests : cuid, managed {
    @mandatory  @assert.notNull
    employee  : Association to Employees;

    @mandatory  @assert.notNull
    leaveType : String(20) enum {
        VACATION = 'Annual Vacation';
        SICK = 'Sick Leave';
        PERSONAL = 'Personal Leave';
    } default 'VACATION';

    @mandatory  @assert.notNull
    startDate : Date;

    @mandatory  @assert.notNull
    endDate   : Date;

    @readonly
    daysCount : Integer;

    @mandatory  @assert.notNull
    status    : String(15) enum {
        PENDING = 'Pending';
        APPROVED = 'Approved';
        REJECTED = 'Rejected';
    } default 'PENDING';

    comment   : String(500);
}

@readonly
entity ManagerValueHelp as
    select from (
        select distinct
            ID,
            emp_number,
            name,
            role
        from Employees
        where role like '%Manager%' or role = 'Chief Executive'
    ) {
        key ID,
            emp_number,
            name,
            role
    };

@readonly
entity RoleValueHelp as select from (
    select distinct 
        role 
    from Employees
) {
    key role 
};