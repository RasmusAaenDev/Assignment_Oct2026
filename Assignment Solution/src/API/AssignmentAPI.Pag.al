page 60104 AssignmentAPI
{
    PageType = API;
    Caption = 'assignmentAPI';
    APIPublisher = 'rasmus';
    APIGroup = 'assignment';
    APIVersion = 'v1.0';
    EntityName = 'assignment';
    EntitySetName = 'assignments';
    SourceTable = Assignment;
    DelayedInsert = true;
    // {baseURL}/v2.0/{tenantId}/{environmentName}/api/{APIPublisher}/{APIGroup}/{APIVersion}/company({CompanyId})/{entitySetName}
    // https://api.businesscentral.dynamics.com/v2.0/fc23e6dc-4e94-4644-9c7b-aeb6785a11d7/SandboxDev/api/rasmus/assignment/v1.0/company(b59478e4-f6bb-f111-85be-70a8a578e91b)/assignments
    // https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/webservices/api-endpoint-structure

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
                field(categoryCode; Rec."Category Code")
                {
                    Caption = 'Category Code';
                    ApplicationArea = All;
                }
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
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