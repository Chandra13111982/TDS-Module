codeunit 50000 BizsoftApplicationManagement
{
    //[EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterFinalizePosting', '', false, false)]
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterFinalizePostingOnBeforeCommit', '', false, false)]
    //local procedure OnAfterFinalizinfPurchPosting(CommitIsSupressed: Boolean; PreviewMode: Boolean; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; var PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr."; var PurchHeader: Record "Purchase Header"; var PurchInvHeader: Record "Purch. Inv. Header"; var PurchRcptHeader: Record "Purch. Rcpt. Header"; var ReturnShptHeader: Record "Return Shipment Header")
    local procedure OnAfterFinalizePostingOnBeforeCommit(Var PurchHeader: Record "Purchase Header"; Var PurchRcptHeader: Record "Purch. Rcpt. Header"; var PurchInvHeader: Record "Purch. Inv. Header"; var ReturnShptHeader: Record "Return Shipment Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; PreviewMode: Boolean; EverythingInvoiced: Boolean)
    var
        TDSPosting: Record "TDS Posting Group";
        GenJnlLine: Record "Gen. Journal Line";
        LineNo: Integer;
    begin
        clear(GenJnlLine);
        if PurchInvHeader."TDS Amount" > 0 then begin
            GenJnlLine.INIT;
            GenJnlLine."Line No.":=LineNo;
            GenJnlLine."Document Type":=GenJnlLine."Document Type"::" ";
            GenJnlLine."Document No.":=PurchInvHeader."No.";
            GenJnlLine."Posting Date":=PurchInvHeader."Posting Date";
            GenJnlLine.VALIDATE("Account Type", GenJnlLine."Account Type"::Vendor);
            GenJnlLine.VALIDATE("Account No.", PurchInvHeader."Pay-to Vendor No.");
            GenJnlLine.VALIDATE(Amount, PurchInvHeader."TDS Amount");
            GenJnlLine.VALIDATE("Bal. Account Type", GenJnlLine."Bal. Account Type"::"G/L Account");
            TDSPosting.Get(PurchInvHeader."TDS Code");
            GenJnlLine.VALIDATE("Bal. Account No.", TDSPosting."G/L Account");
            GenJnlLine.Description:='TDS Entries';
            GenJnlPostLine.Run(GenJnlLine);
        end;
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterCheckMandatoryFields', '', false, false)]
    local procedure OnAfterCheckMandatoryFields(var PurchaseHeader: Record "Purchase Header"; CommitIsSupressed: Boolean)
    var
        tdsgroup: Record "TDS Posting Group";
        glaccount: Record "G/L Account";
    begin
        PurchaseHeader.CalcFields("TDS Base");
        If PurchaseHeader."TDS Base" > 0 then PurchaseHeader.TestField("TDS Code");
        IF PurchaseHeader."TDS Code" <> '' then begin
            PurchaseHeader.TestField("TDS Percentage");
            PurchaseHeader.TestField("TDS Amount");
            If tdsgroup.get(PurchaseHeader."TDS Code")then tdsgroup.TestField("G/L Account");
            If glaccount.get(tdsgroup."G/L Account")then glaccount.TestField("Direct Posting", true);
        end;
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterCheckAndUpdate', '', false, false)]
    local procedure OnAfterCheckandUpdate(var PurchaseHeader: Record "Purchase Header"; CommitIsSuppressed: Boolean; PreviewMode: Boolean)
    begin
        PurchaseHeader.CalcFields("TDS Base");
        PurchaseHeader."TDS Amount":=(PurchaseHeader."TDS Percentage" / 100) * PurchaseHeader."TDS Base";
    end;
}
