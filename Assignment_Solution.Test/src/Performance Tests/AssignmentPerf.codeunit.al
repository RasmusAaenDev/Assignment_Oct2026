codeunit 90001 "Assignment Perf"
{
    var
        BCPTTestContext: Codeunit "BCPT Test Context";

    trigger OnRun()
    begin
        VerifyAssignmentSolutionSetup();

        BCPTTestContext.StartScenario('AssignmentInsert');
        InsertAnAssignment();
        BCPTTestContext.EndScenario('AssignmentInsert');
    end;

    local procedure VerifyAssignmentSolutionSetup()
    var
        AssignmentSetup: Record "Assignment Setup";
        NoSeries: Record "No. Series";
    begin
        AssignmentSetup.InsertIfNotExists();
        NoSeries.FindFirst();
        AssignmentSetup."Assignment Nos" := NoSeries.Code;
        AssignmentSetup.Insert();
        Sleep(100);
    end;

    local procedure InsertAnAssignment()
    var
        Assignment: Record Assignment;
    begin
        Assignment.Init();
        Assignment.Validate(Title, 'Test Assignment');
        Assignment.Insert();
    end;
}