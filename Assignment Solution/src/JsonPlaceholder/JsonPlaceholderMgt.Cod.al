codeunit 60102 "JsonPlaceholder Mgt."
{
    procedure GetData()
    var
        Assignment: Record Assignment temporary;
        Client: HttpClient;
        Respons: HttpResponseMessage;
        ResponseText: Text;
        JToken: JsonToken;
        JObject: JsonObject;
        JArray: JsonArray;
        AssignmentCnt: Integer;
        UserIdVar: Integer;
    begin
        Client.Get('https://jsonplaceholder.typicode.com/todos', Respons);

        Respons.Content.ReadAs(ResponseText);

        JArray.ReadFrom(ResponseText);
        foreach JToken in JArray do begin
            JObject := JToken.AsObject();

            JObject.SelectToken('userId', JToken);
            Assignment."User ID" := JToken.AsValue().AsInteger();

            JObject.SelectToken('id', JToken);
            Assignment."No." := JToken.AsValue().AsText();

            JObject.SelectToken('title', JToken);
            Assignment.Title := JToken.AsValue().AsText();

            JObject.SelectToken('completed', JToken);
            if JToken.AsValue().AsBoolean() then
                Assignment.Status := Assignment.Status::Completed
            else
                Assignment.Status := Assignment.Status::Incompleted;

            if TryInsertAssignment(Assignment) then
                AssignmentCnt += 1;
        end;

        Message('We have added %1 assignments', AssignmentCnt);
    end;

    [TryFunction]
    local procedure TryInsertAssignment(TempAssignment: Record Assignment temporary)
    var
        Assignment: Record Assignment;
    begin
        Assignment.Init();
        Assignment.TransferFields(TempAssignment);
        Assignment.Insert();
    end;
}