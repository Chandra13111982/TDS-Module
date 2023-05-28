pageextension 50006 "Purch. Cr. Memo" extends "Purchase Credit Memo"
{
    layout
    {
        // Add changes to page layout here
        addfirst("Invoice Details")
        {
            field("TDS Code"; Rec."TDS Code")
            {
                ApplicationArea = All;
            }
            field("TDS Percentage"; Rec."TDS Percentage")
            {
                ApplicationArea = All;
            }
            field("TDS Base"; Rec."TDS Base")
            {
                ApplicationArea = All;
            }
            field("TDS Amount"; Rec."TDS Amount")
            {
                ApplicationArea = All;
            }
        }
    }
    var myInt: Integer;
}
