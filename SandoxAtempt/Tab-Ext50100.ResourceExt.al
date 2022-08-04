tableextension 50100 ResourceExt extends Resource
{
    fields
    {
        field(50100; "Internal/External"; Enum "Seminar Internal/External")
        {
            Caption = 'Internal/External';
            DataClassification = ToBeClassified;

        }
        field(50101; "Maximum Participants"; Integer)
        {
            Caption = 'Maximum Participants';
            DataClassification = ToBeClassified;
        }
        field(50102; "Quantity Per Day"; Decimal)
        {
            Caption = 'Quantity Per Day';
            DataClassification = ToBeClassified;
        }
    }
}
