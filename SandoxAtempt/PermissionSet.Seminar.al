permissionset 50100 Seminar
{
    Assignable = true;
    Caption = 'Seminar', MaxLength = 30;
    Permissions =
        table "Seminar Setup" = X,
        tabledata "Seminar Setup" = RMID,
        table Seminar = X,
        tabledata Seminar = RMID,
        table "Seminar Charge" = X,
        tabledata "Seminar Charge" = RMID,
        table "Seminar Registration Line" = X,
        tabledata "Seminar Registration Line" = RMID,
        table "Seminar Comment Line" = X,
        tabledata "Seminar Comment Line" = RMID,
        table "Seminar Registration Header" = X,
        tabledata "Seminar Registration Header" = RMID,
        table "Seminar Journal Line" = X,
        tabledata "Seminar Journal Line" = RMID,
        table "Seminar Ledger Entry" = X,
        tabledata "Seminar Ledger Entry" = RMID,
        table "Seminar Register" = X,
        tabledata "Seminar Register" = RMID,
        page "Seminar Setup" = X,
        page "Seminar Card" = X,
        page "Seminar List" = X,
        page "Seminar Comment Sheet" = X,
        page "Seminar Comment List" = X,
        page "Seminar Registration Subform" = X,
        page "Seminar Registration" = X,
        page "Seminar Registration List" = X,
        page "Seminar Details FactBox" = X,
        page "Seminar Charges" = X;
}
