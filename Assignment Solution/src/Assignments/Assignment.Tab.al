table 60100 Assignment
{
    Caption = 'Assignment';
    DataClassification = CustomerContent;

    DataCaptionFields = "No.", Title;
    DrillDownPageID = "Assignment List";
    LookupPageID = "Assignment List";

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = SystemMetadata;
            Caption = 'No.';

            trigger OnValidate()
            begin
                TestNoSeries();
            end;
        }
        field(2; "User ID"; Integer)
        {
            DataClassification = SystemMetadata;
            Caption = 'User ID';
        }

        field(3; Title; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Title';
        }

        field(4; "Description"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }

        field(5; "Customer No."; Code[20])
        {
            TableRelation = Customer;
            DataClassification = OrganizationIdentifiableInformation;
            Caption = 'Customer No.';
        }

        field(6; "Category Code"; Code[20])
        {
            DataClassification = SystemMetadata;
            Caption = 'Category Code';
        }

        field(10; Status; Enum "Assignment Status")
        {
            DataClassification = SystemMetadata;
        }

        field(11; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        Assignment: Record Assignment;
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeInsert(Rec, IsHandled);
        if IsHandled then
            exit;

        if "No." = '' then begin
            AssignmentSetup.Get();
            AssignmentSetup.TestField("Assignment Nos");
            "No. Series" := AssignmentSetup."Assignment Nos";
            if NoSeries.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeries.GetNextNo("No. Series");
            Assignment.ReadIsolation(IsolationLevel::ReadUncommitted);
            Assignment.SetLoadFields("No.");
            while Assignment.Get("No.") do
                "No." := NoSeries.GetNextNo("No. Series");
        end;

    end;

    local procedure TestNoSeries()
    var
        Assignment: Record Assignment;
        IsHandled: Boolean;
    begin
        if "No." <> xRec."No." then
            if not Assignment.Get(Rec."No.") then begin
                AssignmentSetup.Get();
                NoSeries.TestManual(AssignmentSetup."Assignment Nos");
                "No. Series" := '';
            end;
    end;

    /// <summary>
    /// Assists the user in selecting or generating a new assignment number from the configured number series.
    /// </summary>
    /// <param name="OldAssign">The assignment record containing the current number series to look up related series.</param>
    /// <returns>True if a new assignment number was selected; otherwise, false.</returns>
    procedure AssistEdit(OldAssign: Record Assignment): Boolean
    var
        Assign: Record Assignment;
    begin
        Assign := Rec;
        AssignmentSetup.Get();
        AssignmentSetup.TestField("Assignment Nos");
        if NoSeries.LookupRelatedNoSeries(AssignmentSetup."Assignment Nos", OldAssign."No. Series", Assign."No. Series") then begin
            Assign."No." := NoSeries.GetNextNo(Assign."No. Series");
            Rec := Assign;
            // OnAssistEditOnBeforeExit(Assign);
            exit(true);
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsert(var Assignment: Record Assignment; var IsHandled: Boolean)
    begin
    end;

    var
        AssignmentSetup: Record "Assignment Setup";
        NoSeries: Codeunit "No. Series";
}