table 50001 "TDS Posting Group"
{
    Caption = 'TDS Posting Group';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "TDS Code"; Code[20])
        {
            Caption = 'TDS Code';
            DataClassification = ToBeClassified;
        }
        field(2; "TDS %"; Decimal)
        {
            Caption = 'TDS Percentage %';
            DataClassification = ToBeClassified;
        }
        field(3; "IRD Heading"; Code[50])
        {
            Caption = 'IRD Heading';
            DataClassification = ToBeClassified;
        }
        field(4; "Transaction Type"; Option)
        {
            Caption = 'Transaction Type';
            DataClassification = ToBeClassified;
            OptionCaption = 'Sales,Purchase';
            OptionMembers = "Sales", "Purchase";
        }
        field(5; "G/L Account"; Code[50])
        {
            Caption = 'G/L Account';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
    }
    keys
    {
        key(Key1; "TDS Code")
        {
            Clustered = true;
        }
    }
    var myInt: Integer;
    trigger OnInsert()
    begin
    end;
    trigger OnModify()
    begin
    end;
    trigger OnDelete()
    begin
    end;
    trigger OnRename()
    begin
    end;
}
