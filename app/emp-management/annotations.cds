using LeaveService as service from '../../srv/leave-service';
annotate service.Employees with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>LastName}',
                Value : lastName,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Email}',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Department}',
                Value : department,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : '{i18n>GeneralInformation}',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>EmployeeLeaves}',
            ID : 'i18nEmployeeLeaves',
            Target : 'leaveRequests/@UI.LineItem#i18nEmployeeLeaves',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Employeeid}',
            Value : id,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>FirstName}',
            Value : firstName,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>LastName}',
            Value : lastName,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Email}',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Department}',
            Value : department,
        },
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : firstName,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : id,
        },
        Initials : id,
        TypeImageUrl : 'sap-icon://employee',
    },
    UI.FieldGroup #EmployeeLeaves : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
);

annotate service.LeaveRequests with @(
    UI.LineItem #i18nEmployeeLeaves : [
        {
            $Type : 'UI.DataField',
            Value : employee_id,
            Label : '{i18n>Employeeid}',
        },
        {
            $Type : 'UI.DataField',
            Value : leaveType,
            Label : '{i18n>LeaveType}',
        },
        {
            $Type : 'UI.DataField',
            Value : comment,
            Label : '{i18n>Comment}',
        },
        {
            $Type : 'UI.DataField',
            Value : startDate,
            Label : '{i18n>Startdate}',
        },
        {
            $Type : 'UI.DataField',
            Value : endDate,
            Label : '{i18n>Enddate}',
        },
        {
            $Type : 'UI.DataField',
            Value : daysCount,
            Label : '{i18n>TotalDays}',
        },
        {
            $Type : 'UI.DataField',
            Value : status,
            Label : '{i18n>Status}',
        },
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : leaveType,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : comment,
        },
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>LeaveInformation}',
            ID : 'LeaveInformation',
            Target : '@UI.FieldGroup#LeaveInformation',
        },
    ],
    UI.FieldGroup #LeaveInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : '{i18n>Leaveid}',
            },
            {
                $Type : 'UI.DataField',
                Value : employee.firstName,
                Label : '{i18n>FirstName}',
            },
            {
                $Type : 'UI.DataField',
                Value : employee.lastName,
                Label : '{i18n>LastName}',
            },
            {
                $Type : 'UI.DataField',
                Value : startDate,
                Label : '{i18n>StartDate}',
            },
            {
                $Type : 'UI.DataField',
                Value : endDate,
                Label : '{i18n>EndDate}',
            },
            {
                $Type : 'UI.DataField',
                Value : daysCount,
                Label : '{i18n>TotalDays}',
            },
            {
                $Type : 'UI.DataField',
                Value : status,
                Label : '{i18n>Status}',
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt,
                Label : '{i18n>CreatedAt}',
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
                Label : '{i18n>ChangedAt}',
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },
        ],
    },
);

