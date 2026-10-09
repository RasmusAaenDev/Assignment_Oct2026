page 60100 "Assignment List"
{
    Caption = 'Assignment List';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = Assignment;

    CardPageId = "Assignment Card";
    Editable = false;

    // QueryCategory = 'Customer List';
    // AdditionalSearchTerms = 'Customer Profile, Client Details, Buyer Information, Customer Data, Customer View, Client Profile, Customer Detail, Client Info';
    // AboutTitle = 'About customers';
    // AboutText = 'Here you overview all registered customers, their balances, and the sales statistics. With [Customer Templates](?page=1381 "Opens the Customer Templates") you can quickly create new customers having common details defined by the template.';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field(Title; Rec.Title)
                {
                    ToolTip = 'Specifies the value of the Title field.', Comment = '%';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                }
            }
        }

        area(FactBoxes)
        {
            part(assignmentFactbox; "Assignment Factbox")
            {
                SubPageLink = "No." = field("Customer No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Wizard)
            {
                Caption = 'Wizard';
                RunObject = Page "Assignment Wizard";
            }

            action(GetTodos)
            {
                Caption = 'Get Todos';

                trigger OnAction()
                var
                    JsonPlaceholderMgt: Codeunit "JsonPlaceholder Mgt.";
                begin
                    JsonPlaceholderMgt.GetData();
                end;
            }
        }
    }
}