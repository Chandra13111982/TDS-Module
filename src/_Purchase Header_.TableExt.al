tableextension 50000 "Purchase Header" extends "Purchase Header"
{
    fields
    {
        field(50100; "TDS Percentage"; Decimal)
        {
            Caption = 'TDS Percentage %';
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                Rec.CalcFields("TDS Base");
                Rec."TDS Amount":=(Rec."TDS Percentage" / 100) * Rec."TDS Base";
            end;
        }
        field(50001; "TDS Code"; Code[20])
        {
            Caption = 'TDS Code';
            DataClassification = ToBeClassified;
            TableRelation = "TDS Posting Group"."TDS Code";

            //ValidateTableRelation = false;
            trigger OnValidate()
            var
                TDS: Record "TDS Posting Group";
            begin
                if Rec."TDS Code" <> '' Then begin
                    TDS.Reset();
                    TDS.SetRange("TDS Code", Rec."TDS Code");
                    tds.SetRange("Transaction Type", tds."Transaction Type"::Purchase);
                    if TDS.FindFirst()then Rec.Validate("TDS Percentage", TDS."TDS %");
                end
                else
                begin
                    Rec."TDS Percentage":=0;
                    Rec."TDS Amount":=0;
                end;
            // Rec.CalcFields("TDS Base");
            // Rec."TDS Amount":=(Rec."TDS Percentage" / 100) * Rec."TDS Base";
            end;
        }
        field(50002; "TDS Amount"; Decimal)
        {
            Caption = 'TDS Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        // trigger OnValidate()
        // begin
        //     Rec.CalcFields("TDS Base");
        //     Rec."TDS Amount":=(Rec."TDS Percentage" / 100) * Rec."TDS Base";
        // end;
        }
        field(50003; "TDS Base"; Decimal)
        {
            Caption = 'TDS Base';
            FieldClass = FlowField;
            CalcFormula = sum("Purchase Line".Amount where("Document No."=field("No."), "TDS Applicable"=const(true)));
            Editable = false;
        // trigger OnValidate()
        // begin
        //     Rec.CalcFields("TDS Base");
        //     Rec."TDS Amount":=(Rec."TDS Percentage" / 100) * Rec."TDS Base";
        // end;
        }
    }
    keys
    {
    }
}
