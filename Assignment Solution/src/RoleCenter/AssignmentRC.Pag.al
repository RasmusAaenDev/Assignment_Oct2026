page 60103 "Assignment RC"
{
    Caption = 'Assignment Role';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part(Control139; "Headline RC Business Manager")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control16; "O365 Activities")
            {
                AccessByPermission = TableData "Activities Cue" = I;
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {
        // area(Creation)
        // {
        //     action(ActionBarAction)
        //     {
        //         RunObject = Page ObjectName;
        //     }
        // }
        // area(Sections)
        // {
        //     group(SectionsGroupName)
        //     {
        //         action(SectionsAction)
        //         {
        //             RunObject = Page ObjectName;
        //         }
        //     }
        // }
        // area(Embedding)
        // {
        //     action(EmbeddingAction)
        //     {
        //         RunObject = Page ObjectName;
        //     }
        // }
    }
}