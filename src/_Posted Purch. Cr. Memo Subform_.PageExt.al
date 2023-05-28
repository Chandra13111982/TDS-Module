pageextension 50011 "Posted Purch. Cr. Memo Subform" extends "Posted Purch. Cr. Memo Subform"
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
