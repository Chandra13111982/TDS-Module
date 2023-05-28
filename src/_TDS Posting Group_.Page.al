page 50001 "TDS Posting Group"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "TDS Posting Group";

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("TDS Code"; Rec."TDS Code")
                {
                    ApplicationArea = All;
                }
                field("TDS %"; Rec."TDS %")
                {
                    ApplicationArea = All;
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = All;
                }
                field("IRD Heading"; Rec."IRD Heading")
                {
                    ApplicationArea = All;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                end;
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean begin
        Rec.TestField("G/L Account");
    end;
    var myInt: Integer;
}
