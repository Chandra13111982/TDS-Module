pageextension 50003 "Purchase Order Subform" extends "Purchase Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Line Amount")
        {
            field("TDS Applicable"; Rec."TDS Applicable")
            {
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    CurrPage.Update(true);
                end;
            }
        }
    }
    var myInt: Integer;
}
