namespace Assignment;

permissionset 60100 AssignmentSuper
{
    Assignable = true;
    Permissions = tabledata Assignment = RIMD,
        tabledata "Assignment Setup" = RIMD,
        table Assignment = X,
        table "Assignment Setup" = X,
        report "Assignments Report" = X,
        codeunit "Assignment Assisted Setup" = X,
        codeunit "Assignment Subscribers" = X,
        page "Assignment Card" = X,
        page "Assignment Factbox" = X,
        page "Assignment List" = X,
        page "Assignment RC" = X,
        page "Assignment Setup" = X,
        page "Assignment Wizard" = X,
        page AssignmentAPI = X,
        page AssignmentAPIv2 = X,
        query CustomerToSalesLine = X;
}