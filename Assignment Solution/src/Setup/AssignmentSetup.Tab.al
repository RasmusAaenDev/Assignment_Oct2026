table 60101 "Assignment Setup"
{

    fields
    {
        field(1; "Primary Key"; Code[10])
        {

        }

        field(2; "Assignment Nos"; Code[20])
        {
            Caption = 'Assignment Nos';
            TableRelation = "No. Series";
        }

    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    var
        RecordHasBeenRead: Boolean;

    procedure GetRecordOnce()
    begin
        if RecordHasBeenRead then
            exit;
        Get();
        RecordHasBeenRead := true;
    end;

    procedure InsertIfNotExists()
    begin
        Reset();
        if not Get() then begin
            Init();
            Insert(true);
        end;
    end;


}