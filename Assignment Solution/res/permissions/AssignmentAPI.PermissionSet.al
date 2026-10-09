namespace Assignment;

permissionset 60102 "Assignment API"
{
    Assignable = true;
    Permissions = tabledata Assignment = RIMD,
        tabledata "Assignment Setup" = R,
        table Assignment = X,
        table "Assignment Setup" = X,
        codeunit "Assignment Subscribers" = X,
        page AssignmentAPI = X,
        page AssignmentAPIv2 = X,
        query CustomerToSalesLine = X;
}