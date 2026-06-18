using LeaveService as service from '../../srv/leave-service';
annotate service.Employees with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'emp_number',
                Value : emp_number,
            },
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'email',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Label : 'role',
                Value : role,
            },
            {
                $Type : 'UI.DataField',
                Label : 'totalLeaveEntitlement',
                Value : totalLeaveEntitlement,
            },
            {
                $Type : 'UI.DataField',
                Label : 'leaveBalance',
                Value : leaveBalance,
            },
            {
                $Type : 'UI.DataField',
                Label : 'manager_number',
                Value : manager_number,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Employee Leaves',
            ID : 'EmployeeLeaves',
            Target : 'leaveRequests/@UI.LineItem#EmployeeLeaves',
            @UI.Hidden  : { $edmJson: { $Not: { $Path: 'IsActiveEntity' } } } 
            //Hiding the LeaveRequests facet when the Employee is not active (draft) to avoid errors when creating a new employee
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : email,
            Label : 'email',
        },
        {
            $Type : 'UI.DataField',
            Value : emp_number,
            Label : 'emp_number',
        },
        {
            $Type : 'UI.DataField',
            Value : leaveBalance,
            Label : 'leaveBalance',
        },
        {
            $Type : 'UI.DataField',
            Value : manager_number,
            Label : 'manager_number',
        },
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'name',
        },
        {
            $Type : 'UI.DataField',
            Value : role,
            Label : 'role',
        },
        {
            $Type : 'UI.DataField',
            Value : totalLeaveEntitlement,
            Label : 'totalLeaveEntitlement',
        },
    ],
);

annotate service.Employees with {
    manager @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Employees',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : manager_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'emp_number',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'email',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'role',
            },
        ],
    }
};

annotate service.Employees with {
    manager_number @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'ManagerValueHelp',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : manager_number,
                    ValueListProperty : 'emp_number',
                },
            ],
            Label : 'Manager',
        },
        Common.ValueListWithFixedValues : true,
        Common.Text : emp_number,
        )};

annotate service.ManagerValueHelp with {
    emp_number @Common.Text : name
};

annotate service.Employees with {
    role @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'RoleValueHelp',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : role,
                    ValueListProperty : 'role',
                },
            ],
            Label : 'Role',
        },
        Common.ValueListWithFixedValues : true,
)};

annotate service.LeaveRequests with @(
    UI.LineItem #EmployeeLeaves : [
        {
            $Type : 'UI.DataField',
            Value : emp_number,
            Label : 'emp_number',
        },
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'name',
        },
        {
            $Type : 'UI.DataField',
            Value : leaveType,
            Label : 'leaveType',
        },
        {
            $Type : 'UI.DataField',
            Value : startDate,
            Label : 'startDate',
        },
        {
            $Type : 'UI.DataField',
            Value : endDate,
            Label : 'endDate',
        },
        {
            $Type : 'UI.DataField',
            Value : daysCount,
            Label : 'daysCount',
        },
        {
            $Type : 'UI.DataField',
            Value : comment,
            Label : 'comment',
        },
        {
            $Type : 'UI.DataField',
            Value : status,
            Label : 'status',
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
        {
            $Type : 'UI.DataField',
            Value : modifiedBy,
        },
        {
            $Type : 'UI.DataField',
            Value : modifiedAt,
        },
    ]
);

