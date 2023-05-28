tableextension 50002 "Purchase Invoice Header" extends "Purch. Inv. Header"
{
    fields
    {
        // Add changes to table fields here
        field(50100; "TDS Percentage"; Decimal)
        {
            Caption = 'TDS Percentage %';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50001; "TDS Code"; Code[20])
        {
            Caption = 'TDS Code';
            DataClassification = ToBeClassified;
            TableRelation = "TDS Posting Group";
            ValidateTableRelation = false;
        }
        field(50002; "TDS Amount"; Decimal)
        {
            Caption = 'TDS Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50003; "TDS Base"; Decimal)
        {
            Caption = 'TDS Base';
            FieldClass = FlowField;
            CalcFormula = sum("Purch. Inv. Line".Amount where("Document No."=field("No."), "TDS Applicable"=const(true)));
            Editable = false;
        }
    }
    var myInt: Integer;
}
