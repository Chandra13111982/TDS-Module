pageextension 50009 "Posted Purch. Inv. Subform" extends "Posted Purch. Invoice Subform"
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
