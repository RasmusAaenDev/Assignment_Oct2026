namespace Assignment;

permissionset 60101 "Assignment Basic"
{
    Assignable = true;
    Permissions = tabledata Assignment = RIMD,
        tabledata "Assignment Setup" = R,
        table Assignment = X,
        table "Assignment Setup" = X,
        report "Assignments Report" = X,
        codeunit "Assignment Assisted Setup" = X,
        codeunit "Assignment Subscribers" = X,
        page "Assignment Card" = X,
        page "Assignment Factbox" = X,
        page "Assignment List" = X,
        page "Assignment RC" = X,
        query CustomerToSalesLine = X;
}