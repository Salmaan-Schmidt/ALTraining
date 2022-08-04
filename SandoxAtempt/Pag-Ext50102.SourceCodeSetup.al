pageextension 50102 "Source Code Setup" extends "Source Code Setup"
{
    layout
    {
        addlast(content)
        {
            group("Seminar Management") // FastTab
            {
                field(Seminar; Rec.Seminar)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
            }
        }
    }
}
