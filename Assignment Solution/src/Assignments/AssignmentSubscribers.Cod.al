codeunit 60100 "Assignment Subscribers"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnAfterManualReleaseSalesDoc, '', false, false)]
    local procedure "Release Sales Document_OnAfterManualReleaseSalesDoc"(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean)
    var
        Assignment: Record Assignment;
        SalesHeaderReleaseMsg: Label 'Remember to post this Sales Order %1';
    begin
        Assignment.Init();
        Assignment."No." := 'A' + Format(Random(9999999));
        Assignment.Title := StrSubstNo(SalesHeaderReleaseMsg, SalesHeader."No.");
        Assignment.Description := Assignment.Title;
        Assignment.Insert();
    end;
}