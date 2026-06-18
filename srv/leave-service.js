const cds = require('@sap/cds')

module.exports = class LeaveService extends cds.ApplicationService {
  init() {

    const { Employees, LeaveRequests } = cds.entities('LeaveService')

    this.before(['CREATE', 'UPDATE'], Employees, async (req) => {

      console.log('Before CREATE/UPDATE Employees', req.data)
      /*const { emp_number, email, totalLeaveEntitlement, leaveBalance } = req.data

      if (!emp_number || !email) {
        return req.error(400, 'Employee Number and Email are mandatory fields.')
      }
      if (req.data.email) {
        req.data.email = req.data.email.toLowerCase().trim()
      }
      if (leaveBalance > totalLeaveEntitlement) {
        return req.error(400, 'Leave balance cannot exceed the total annual entitlement boundary.', 'leaveBalance')
      }

      if (req.event === 'CREATE') {
        const duplicateCheck = await SELECT.one.from(Employees)
          .where({ emp_number: emp_number })
          .or({ email: req.data.email })

        if (duplicateCheck) {
          return req.error(409, 'An employee record with this Employee Number or Email already exists.')
        }
      }*/

    })


    this.after('READ', Employees, async (employees, req) => {
      console.log('After READ Employees', employees)
    })




    return super.init()
  }
}
