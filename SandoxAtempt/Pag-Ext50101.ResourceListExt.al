pageextension 50101 ResourceListExt extends "Resource List"
{

    layout
    {
        addlast(Control1)
        {

            field("Internal/External"; Rec."Internal/External")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Customer No. field.';
                Visible = ShowType;
            }

            field("Maximum Participants"; Rec."Maximum Participants")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Customer No. field.';
                Visible = ShowMaxParticipants;
            }
        }
    }

    var
        ShowType: Boolean;
        ShowMaxParticipants: Boolean;

    trigger OnOpenPage()
    Begin
        Rec.FILTERGROUP(3);
        ShowType := Rec.GETFILTER(Type) = '';
        ShowMaxParticipants := Rec.GETFILTER(Type) = FORMAT(Rec.Type::Machine);
        Rec.FILTERGROUP(0);
    End;
}
