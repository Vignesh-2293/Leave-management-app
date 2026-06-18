using my.leavemanagement as lm from '../db/schema';

service LeaveService {

    entity Employees        as
        projection on lm.Employees {
            *,
            manager.emp_number as manager_number @mandatory,
        };

    entity LeaveRequests    as
        projection on lm.LeaveRequests {
            *,
            employee.emp_number as emp_number,
            employee.name       as name,
        };

    @readonly
    entity ManagerValueHelp as projection on lm.ManagerValueHelp;

    @readonly
    entity RoleValueHelp as projection on lm.RoleValueHelp;
}

annotate LeaveService.Employees with @odata.draft.enabled: true;
