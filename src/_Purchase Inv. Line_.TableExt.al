tableextension 50003 "Purchase Inv. Line" extends "Purch. Inv. Line"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "TDS Applicable"; Boolean)
        {
            Caption = 'TDS Applicable';
            DataClassification = ToBeClassified;
        }
    }
    var myInt: Integer;
}
