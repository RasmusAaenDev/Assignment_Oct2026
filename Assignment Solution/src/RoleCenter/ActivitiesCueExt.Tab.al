tableextension 60100 "Activities Cue Ext" extends "Activities Cue"
{
    fields
    {
        field(60100; "Assignments"; Integer)
        {
            Caption = 'Assignments';
            FieldClass = FlowField;
            CalcFormula = count(Assignment);
        }
        field(60101; "Incompleted Assignments"; Integer)
        {
            Caption = 'Incompleted Assignments';
            FieldClass = FlowField;
            CalcFormula = count(Assignment where(Status = const(Incompleted)));
        }
        field(60102; "In Progress Assignments"; Integer)
        {
            Caption = 'In Progress Assignments';
            FieldClass = FlowField;
            CalcFormula = count(Assignment where(Status = const("In Progress")));
        }
        field(60103; "Completed Assignments"; Integer)
        {
            Caption = 'Completed Assignments';
            FieldClass = FlowField;
            CalcFormula = count(Assignment where(Status = const(Completed)));
        }
    }
}