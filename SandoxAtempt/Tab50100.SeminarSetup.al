table 50100 "Seminar Setup"
{
    Caption = 'Seminar Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = ToBeClassified;
        }
        field(2; "Seminar Nos"; Code[10])
        {
            Caption = 'Seminar Nos';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(3; "Seminar Registration Nos."; Code[10])
        {
            Caption = 'Seminar Registration Nos.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(4; "Posted Seminar Reg. Nos"; Code[10])
        {
            Caption = 'Posted Seminar Reg. Nos';
            DataClassification = ToBeClassified;
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
}
