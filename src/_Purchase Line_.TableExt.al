tableextension 50001 "Purchase Line" extends "Purchase Line"
{
    fields
    {
        // Add changes to table fields here
        modify(Amount)
        {
        trigger OnAfterValidate()
        var
            PurchaseHeader: Record "Purchase Header";
        begin
            PurchaseHeader.Reset();
            PurchaseHeader.SetRange("No.", Rec."Document No.");
            if PurchaseHeader.FindFirst()then begin
                PurchaseHeader.CalcFields("TDS Base");
                PurchaseHeader."TDS Amount":=(PurchaseHeader."TDS Percentage" / 100) * PurchaseHeader."TDS Base";
            end;
        end;
        }
        field(50000; "TDS Applicable"; Boolean)
        {
            Caption = 'TDS Applicable';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                PurchaseHeader: Record "Purchase Header";
            begin
                PurchaseHeader.Reset();
                PurchaseHeader.SetRange("No.", Rec."Document No.");
                if PurchaseHeader.FindFirst()then begin
                    PurchaseHeader.CalcFields("TDS Base");
                    PurchaseHeader."TDS Amount":=(PurchaseHeader."TDS Percentage" / 100) * PurchaseHeader."TDS Base";
                end;
            end;
        }
    }
    var myInt: Integer;
    TDSApplicableEditable: Boolean;
}
