pageextension 50007 "Purch. Cr. Memo Subform" extends "Purch. Cr. Memo Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Line Amount")
        {
            field("TDS Applicable"; Rec."TDS Applicable")
            {
                ApplicationArea = All;
            }
        }
    }
    var myInt: Integer;
}
