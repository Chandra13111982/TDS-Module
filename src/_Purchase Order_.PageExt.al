pageextension 50002 "Purchase Order" extends "Purchase Order"
{
    layout
    {
        addfirst("Invoice Details")
        {
            field("TDS Code"; Rec."TDS Code")
            {
                ApplicationArea = All;

                trigger OnValidate()
                var
                    PurchaseLine: Record "Purchase Line";
                begin
                    PurchaseLine.reset;
                    purchaseline.SetRange("Document No.", rec."No.");
                    If PurchaseLine.findfirst then begin
                        Rec.CalcFields("TDS Base");
                        CurrPage.Update(true);
                    end;
                end;
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
}
