tableextension 50005 "Purch. Cr. Memo Line" extends "Purch. Cr. Memo Line"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "TDS Applicable"; Boolean)
        {
            Caption = 'TDS Applicable';
            DataClassification = ToBeClassified;
        // trigger OnValidate()
        // var
        //     PurchaseHeader: Record "Purchase Header";
        // begin
        //     PurchaseHeader.Reset();
        //     PurchaseHeader.SetRange("No.", Rec."Document No.");
        //     if PurchaseHeader.FindFirst() then
        //         PurchaseHeader."TDS Amount" := PurchaseHeader."TDS Percentage" * PurchaseHeader."TDS Base";
        // end;
        }
    }
    var myInt: Integer;
}
