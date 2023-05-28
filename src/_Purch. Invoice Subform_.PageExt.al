pageextension 50005 "Purch. Invoice Subform" extends "Purch. Invoice Subform"
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
