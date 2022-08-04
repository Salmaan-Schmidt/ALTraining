pageextension 50100 ResourceCardExt extends "Resource Card"
{
    layout
    {
        addlast(General)
        {

            field("Internal/External"; Rec."Internal/External")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Customer No. field.';
            }

            field("Quantity Per Day"; Rec."Quantity Per Day")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Customer No. field.';
            }
        }

        addlast(content)
        {
            group(Room) // FastTab
            {
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ApplicationArea = All;
                    ToolTip = 'Maximum Participants';
                }
            }
        }

    }
}
