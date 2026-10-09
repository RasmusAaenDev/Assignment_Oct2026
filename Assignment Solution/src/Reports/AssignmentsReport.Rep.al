report 60100 "Assignments Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = DefaultWord;

    dataset
    {
        dataitem(Assignment; Assignment)
        {
            column(CategoryCode_Assignment; "Category Code")
            {
                IncludeCaption = true;
            }
            column(CustomerNo_Assignment; "Customer No.")
            {
                IncludeCaption = true;
            }
            column(Description_Assignment; Description)
            {
                IncludeCaption = true;
            }
            column(No_Assignment; "No.")
            {
                IncludeCaption = true;
            }
            column(Status_Assignment; Status)
            {
                IncludeCaption = true;
            }
            column(SystemCreatedAt_Assignment; SystemCreatedAt)
            {
                IncludeCaption = true;
            }
            column(SystemCreatedBy_Assignment; SystemCreatedBy)
            {
                IncludeCaption = true;
            }
            column(SystemId_Assignment; SystemId)
            {
                IncludeCaption = true;
            }
            column(SystemModifiedAt_Assignment; SystemModifiedAt)
            {
                IncludeCaption = true;
            }
            column(SystemModifiedBy_Assignment; SystemModifiedBy)
            {
                IncludeCaption = true;
            }
            column(Title_Assignment; Title)
            {
                IncludeCaption = true;
            }
            column(UserID_Assignment; "User ID")
            {
                IncludeCaption = true;
            }
        }
    }

    rendering
    {
        layout(DefaultWord)
        {
            Type = Word;
            LayoutFile = 'src/Reports/Assignment.docx';
        }
    }

    var
        myInt: Integer;
}