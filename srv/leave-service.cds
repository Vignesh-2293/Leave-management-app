using my.leavemanagement as lm from '../db/schema';

service LeaveService {

    entity Employees as projection on lm.Employees;

    entity LeaveRequests as projection on lm.LeaveRequests;
}
