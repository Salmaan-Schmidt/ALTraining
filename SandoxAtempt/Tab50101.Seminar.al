table 50101 "Seminar"
{
    Caption = 'Seminar';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Seminar List";
    LookupPageId = "Seminar List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IF "No." <> xRec."No." then begin
                    SeminarSetup.GET();
                    NoSeriesManagement.TestManual(SeminarSetup."Seminar Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IF ("Search Name" = UPPERCASE(xRec.Name)) OR ("Search Name" = '') THEN
                    "Search Name" := Name;
            end;
        }
        field(3; "Seminar Duration"; Decimal)
        {
            Caption = 'Seminar Duration';
            DataClassification = ToBeClassified;
        }
        field(4; "Minimum Participants"; Integer)
        {
            Caption = 'Minimum Participants';
            DataClassification = ToBeClassified;
        }
        field(5; "Maximum Participants"; Integer)
        {
            Caption = 'Maximum Participants';
            DataClassification = ToBeClassified;
        }
        field(6; "Search Name"; Code[50])
        {
            Caption = 'Search Name';
            DataClassification = ToBeClassified;
        }
        field(7; Blocked; Boolean)
        {
            Caption = 'Blocked';
            DataClassification = ToBeClassified;
        }
        field(8; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            DataClassification = ToBeClassified;
        }
        field(9; Comment; Boolean)
        {
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = exist("Comment Line" where("Table Name" = const(Seminar), "No." = field("No.")));
        }
        field(10; "Seminar Price"; Decimal)
        {
            Caption = 'Seminar Price';
            DataClassification = ToBeClassified;
        }
        field(11; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IF xRec."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group" THEN
                    IF
                        GenProductPostingGroup.ValidateVatProdPostingGroup(GenProductPostingGroup, "VAT Prod. Posting Group") THEN
                        VALIDATE("VAT Prod. Posting Group", GenProductPostingGroup."Def. VAT Prod. Posting Group");
            end;
        }
        field(12; "VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            DataClassification = ToBeClassified;
        }
        field(13; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(SK; "Search Name")
        {

        }
    }

    fieldgroups
    {
        fieldgroup(Brick; "No.", Name, "Seminar Duration", "Seminar Price") { }
        fieldgroup(DropDown; "No.", Name, "Seminar Duration", "Seminar Price") { }
    }

    var
        SeminarSetup: Record "Seminar Setup";
        CommentLine: Record "Comment Line";
        Seminar: Record Seminar;
        GenProductPostingGroup: Record "Gen. Product Posting Group";
        NoSeriesManagement: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        IF "No." = '' then begin
            SeminarSetup.Get();
            SeminarSetup.TESTFIELD("Seminar Nos");
            NoSeriesManagement.InitSeries(SeminarSetup."Seminar Nos", xRec."No. Series", 0D, Rec."No.", Rec."No. Series");
        END;
    end;


    trigger OnModify()
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnRename()
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnDelete()
    begin
        CommentLine.RESET;
        CommentLine.SETRANGE("Table Name", CommentLine."Table Name"::Seminar);
        CommentLine.SETRANGE("No.", "No.");
        CommentLine.DELETEALL;
    end;

    procedure AssistEdit(): Boolean
    begin
        Seminar := Rec;
        SeminarSetup.Get();
        SeminarSetup.TestField("Seminar Nos");
        if NoSeriesManagement.SelectSeries(SeminarSetup."Seminar Nos", xRec."No. Series", Rec."No. Series") then begin
            NoSeriesManagement.SetSeries("No.");
            Rec := Seminar;
            exit(true);
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetLastModifiedDateTime(var Seminar: Record Seminar)
    begin
    end;


}
