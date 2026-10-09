pageextension 60100 "O365 Activities Ext" extends "O365 Activities"
{
    layout
    {
        addafter("Incoming Documents")
        {
            cuegroup(Assignment)
            {
                Caption = 'Assignments';

                field(Assignments; Rec.Assignments)
                {
                    ApplicationArea = All;
                }
                field("Incompleted Assignments"; Rec."Incompleted Assignments")
                {
                    ApplicationArea = All;
                }
                field("In Progress Assignments"; Rec."In Progress Assignments")
                {
                    ApplicationArea = All;
                }
                field("Completed Assignments"; Rec."Completed Assignments")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}