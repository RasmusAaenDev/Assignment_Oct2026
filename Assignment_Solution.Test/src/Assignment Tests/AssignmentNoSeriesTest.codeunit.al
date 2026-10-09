codeunit 90000 "Assignment_No_Series_Test"
{
    Description = 'Description';
    Subtype = Test;

    trigger OnRun()
    begin
        IsInitialized := false;
    end;

    local procedure Initialize()
    begin
        ClearLastError();
        if IsInitialized then
            exit;

        // CUSTOMIZATION: Prepare setup tables etc. that are used for all test functions

        IsInitialized := true;
        Commit();
    end;

    local procedure SetupNoSeriesOnAssignmentSetup()
    var
        AssignmentSetup: Record "Assignment Setup";
        NoSeries: Record "No. Series";
    begin
        AssignmentSetup.InsertIfNotExists();
        NoSeries.FindFirst();
        AssignmentSetup."Assignment Nos" := NoSeries.Code;
        AssignmentSetup.Modify();
    end;

    local procedure InsertAnAssignment(): Record Assignment
    var
        Assignment: Record Assignment;
    begin
        Assignment.Init();
        Assignment.Validate(Title, 'TEST Title');
        Assignment.Insert(true);

        exit(Assignment);
    end;

    local procedure VerifyAssignmentNo(AssignmentRec: Record Assignment)
    begin
        AssignmentRec.TestField("No.");
    end;

    local procedure RemoveNoSeriesOnAssignmentSetup()
    var
        AssignmentSetup: Record "Assignment Setup";
    begin
        AssignmentSetup.InsertIfNotExists();
        AssignmentSetup."Assignment Nos" := '';
        AssignmentSetup.Modify();
    end;

    var
        IsInitialized: Boolean;


    [Test]
    procedure "No Series Has Been Setup_Creating An Assignment_Specify The No Automatically"()
    var
        AssignmentRec: Record Assignment;
    begin
        Initialize();
        // [GIVEN] No Series Has Been Setup 
        SetupNoSeriesOnAssignmentSetup();

        // [WHEN] Creating An Assignment 
        AssignmentRec := InsertAnAssignment();

        // [THEN] Specify The No Automatically
        VerifyAssignmentNo(AssignmentRec);
    end;


    [Test]
    procedure "No Series Has Not Been Setup_Insert An Assignment_Error Happened During Insert"()
    var
        AssignmentRec: Record Assignment;
    begin
        Initialize();
        // [GIVEN] No Series Has Not Been Setup 
        RemoveNoSeriesOnAssignmentSetup();

        // [WHEN] Insert An Assignment 
        asserterror InsertAnAssignment();

        // [THEN] Error Happened During Insert
    end;

}