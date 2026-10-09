page 60105 AssignmentAPIv2
{
    PageType = API;
    Caption = 'assignmentAPI';
    APIPublisher = 'rasmus';
    APIGroup = 'assignment';
    APIVersion = 'v2.0';
    EntityName = 'assignment';
    EntitySetName = 'assignments';
    SourceTable = Assignment;
    DelayedInsert = true;
    // {baseURL}/{tenantId}/{environmentName}/api/{APIPublisher}/{APIGroup}/{APIVersion}/company({CompanyId})/{entitySetName}
    //https://api.businesscentral.dynamics.com/fc23e6dc-4e94-4644-9c7b-aeb6785a11d7/SandboxDev/api/rasmus/assignment/v1.0/company({CompanyId})/assignments

    layout
    {
        area(Content)
        {
            repeater(Assignments)
            {

                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                }
                field(title; Rec.Title)
                {
                    Caption = 'Title';
                    ApplicationArea = All;
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                    ApplicationArea = All;
                }
                field(userID; Rec."User ID")
                {
                    Caption = 'User ID';
                    ApplicationArea = All;
                }
            }
        }
    }
}