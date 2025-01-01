Use dfClient.pkg
Use DataDict.pkg
Use cDbFormHint.pkg
Use dfSpnEnt.pkg
Use dfCEntry.pkg
Use Windows.pkg

Use cVendorDataDictionary.dd
Use cInventoryDataDictionary.dd
Use cCustomerDataDictionary.dd
Use cSalesPersonDataDictionary.dd
Use cOrderHeaderDataDictionary.dd
Use cOrderDetailDataDictionary.dd

Use cDbCJGrid.pkg
Use cCJGridColumnRowIndicator.pkg
Use DbParentCombo.pkg
Use MonthCalendarPrompt.dg

Activate_View Activate_oDemoParentCombos for oDemoParentCombos
Object oDemoParentCombos is a dbView
    Set Border_Style to Border_Thick
    Set Maximize_Icon to True
    Set Label to "Parent Combo Demo"
    Set Location to 2 3
    Set Size to 178 383
    Set piMinSize to 178 383
    Set pbAutoActivate to True

    Object oVendorDataDictionary is a cVendorDataDictionary
    End_Object

    Object oInventoryDataDictionary is a cInventoryDataDictionary
        Set DDO_Server to oVendorDataDictionary
    End_Object

    Object oCustomerDataDictionary is a cCustomerDataDictionary
    End_Object

    Object oSalesPersonDataDictionary is a cSalesPersonDataDictionary
    End_Object

    Object oOrderHeaderDataDictionary is a cOrderHeaderDataDictionary
        Set DDO_Server to oCustomerDataDictionary
        Set DDO_Server to oSalesPersonDataDictionary

        // this lets you save a new OrderHeader from within OrderDetail.
        Set Allow_Foreign_New_Save_State to True

    End_Object

    Object oOrderDetailDataDictionary is a cOrderDetailDataDictionary
        Set DDO_Server to oOrderHeaderDataDictionary
        Set DDO_Server to oInventoryDataDictionary
        Set Constrain_File to OrderHeader.File_Number
    End_Object

    Set Main_DD to oOrderHeaderDataDictionary
    Set Server to oOrderHeaderDataDictionary

    Object oDbContainer3d1 is a dbGroup
        Set Size to 89 377
        Set Location to 2 3
        Set peAnchors to anTopLeftRight

        Object oOrderHeader_Order_Number is a cDbFormHint
            Entry_Item OrderHeader.Order_Number
            Set Label to "Order Number:"
            Set Size to 12 42
            Set Location to 14 62
            Set peAnchors to anTopLeft
            Set Label_Col_Offset to 2
            Set Label_Justification_Mode to jMode_Right

        End_Object

        Object oOrderHeader_Customer_Number is a DbParentCombo
            Entry_Item Customer.Customer_Number
            Set Label to "Customer Number:"
            Set Size to 13 42
            Set Location to 14 201
            Set peAnchors to anTopRight
            Set Label_Col_Offset to 2
            Set Label_Justification_Mode to jMode_Right
            Set psEmptyItemDescription to "???"
            // with numbers, not sorting may be preferred
            Set Combo_Sort_State to False
            // anytime this takes the focus, refill the combo. If the list is very
            // large you may not want this. However, if the list is very large you
            // may not want parent combos.
            Set pbRefillOnFocus to True
        End_Object

        Object oOrderHeader_Order_Date is a cDbFormHint
            Entry_Item OrderHeader.Order_Date
            Set Label to "Order Date:"
            Set Size to 12 67
            Set Location to 14 299
            Set peAnchors to anTopRight
            Set Label_Col_Offset to 2
            Set Label_Justification_Mode to jMode_Right

            Set Prompt_Object to oMonthCalendarPrompt
            Set Prompt_Button_Mode to PB_PromptOn
        End_Object

        Object oCustomer_Name is a cDbFormHint
            Entry_Item Customer.Name
            Set Label to "Customer Name:"
            Set Size to 12 180
            Set Location to 28 62
            Set peAnchors to anTopLeftRight
            Set Label_Col_Offset to 2
            Set Label_Justification_Mode to jMode_Right
        End_Object

        Object oCustomer_Address is a cDbFormHint
            Entry_Item Customer.Address
            Set Label to "Street Address:"
            Set Size to 12 180
            Set Location to 42 62
            Set peAnchors to anTopLeftRight
            Set Label_Col_Offset to 2
            Set Label_Justification_Mode to jMode_Right
        End_Object

        Object oCustomer_City is a cDbFormHint
            Entry_Item Customer.City
            Set Label to "City/State/Zip:"
            Set Size to 12 84
            Set Location to 56 62
            Set peAnchors to anTopLeftRight
            Set Label_Col_Offset to 2
            Set Label_Justification_Mode to jMode_Right
        End_Object

        Object oCustomer_State is a cDbFormHint
            Entry_Item Customer.State
            Set Size to 12 20
            Set Location to 56 155
            Set peAnchors to anTopRight
        End_Object

        Object oCustomer_Zip is a cDbFormHint
            Entry_Item Customer.Zip
            Set Size to 12 60
            Set Location to 56 183
            Set peAnchors to anTopRight
        End_Object

        Object oOrderHeader_Ordered_By is a cDbFormHint
            Entry_Item OrderHeader.Ordered_By
            Set Label to "Ordered By:"
            Set Size to 12 67
            Set Location to 42 299
            Set peAnchors to anTopRight
            Set Label_Col_Offset to 2
            Set Label_Justification_Mode to jMode_Right
        End_Object

        Object oOrderHeader_Salesperson_ID is a DbParentCombo
            Entry_Item SalesPerson.Id
            Set Label to "Sold by:"
            Set Size to 12 90
            Set Location to 56 276
            Set peAnchors to anTopRight
            Set Label_Col_Offset to 2
            Set Label_Justification_Mode to jMode_Right
            Set psEmptyItemDescription to "<none>"

            Procedure OnDefineDescription String ByRef sDescription
                Move (trim(SalesPerson.ID) + " - " * SalesPerson.Name) to sDescription
            End_Procedure
        End_Object

        Object oOrderHeader_Terms is a dbComboForm
            Entry_Item OrderHeader.Terms
            Set Label to "Terms:"
            Set Size to 12 85
            Set Location to 70 62
            Set peAnchors to anTopLeft
            Set Form_Border to 0
            Set Label_Col_Offset to 2
            Set Label_Justification_Mode to jMode_Right
            Set Entry_State to False

        End_Object

        Object oOrderHeader_Ship_Via is a dbComboForm
            Entry_Item OrderHeader.Ship_Via
            Set Label to "Ship Via:"
            Set Size to 12 103
            Set Location to 70 183
            Set peAnchors to anTopRight
            Set Form_Border to 0
            Set Label_Col_Offset to 2
            Set Label_Justification_Mode to jMode_Right
            Set Entry_State to False

        End_Object

    End_Object

    Object oOrderDetail_Grid is a cDbCJGrid
        Set Server to oOrderDetailDataDictionary
        Set Ordering to 1
        Set Size to 63 377
        Set Location to 94 3
        Set peAnchors to anAll
        Set pbAllowInsertRow to False
        Set pbRestoreLayout to False
        Set psLayoutSection to "OrderView_oOrderDetail_Grid2"
        Set piLayoutBuild to 6
        Set pbHeaderPrompts to True

        On_Key Key_F11 Send Request_InsertRow

        Object oMark is a cCJGridColumnRowIndicator
        End_Object

        Object oInventory_Item_ID is a cDbCJGridColumn
            Entry_Item Inventory.Item_ID
            Set piWidth to 91
            Set psCaption to "Item ID"
            Set psImage to "ActionPrompt.ico"
        End_Object

        Object oInventory_Description is a cDbCJGridColumn
            Entry_Item Inventory.Description
            Set piWidth to 213
            Set psCaption to "Description"
        End_Object

        Object oInventory_Unit_Price is a cDbCJGridColumn
            Entry_Item Inventory.Unit_Price
            Set piWidth to 53
            Set psCaption to "Unit Price"
        End_Object

        Object oOrderDetail_Qty_Ordered is a cDbCJGridColumn
            Entry_Item OrderDetail.Qty_Ordered
            Set piWidth to 50
            Set psCaption to "Quantity"
        End_Object

        Object oOrderDetail_Price is a cDbCJGridColumn
            Entry_Item OrderDetail.Price
            Set piWidth to 62
            Set psCaption to "Price"
        End_Object

        Object oOrderDetail_Extended_Price is a cDbCJGridColumn
            Entry_Item OrderDetail.Extended_Price
            Set piWidth to 81
            Set psCaption to "Total"
        End_Object

    End_Object

    Object oOrderHeader_Order_Total is a cDbFormHint
        Entry_Item OrderHeader.Order_Total
        Set Label to "Order Total:"
        Set Size to 12 60
        Set Location to 160 307
        Set peAnchors to anBottomRight
        Set Label_Col_Offset to 3
        Set Label_Justification_Mode to jMode_Right
    End_Object

    Object oPrintBtn is a Button
        Set Label to "Print Order"
        Set Location to 160 3
        Set peAnchors to anBottomLeft
        Set psToolTip to "Print preview of current order"

        Procedure OnClick
            Delegate Send PrintCurrentOrder // defined in view object
        End_Procedure

    End_Object

    // Change:   Create custom confirmation messages for save and delete
    //           We must create the new functions and assign verify messages
    //           to them.
    Function Confirm_Delete_Order Returns Integer
        Integer iRetVal
        Get Confirm "Delete Entire Order?" to iRetVal
        Function_Return iRetVal
    End_Function

    // Only confirm on the saving of new records
    Function Confirm_Save_Order Returns Integer
        Integer iNoSave iSrvr
        Boolean bOld
        Get Server to iSrvr
        Get HasRecord of iSrvr to bOld
        If not bOld Begin
            Get Confirm "Save this NEW order header?" to iNoSave
        End
        Function_Return iNoSave
    End_Function

    // Define alternate confirmation Messages
    Set Verify_Save_MSG       to (RefFunc(Confirm_Save_Order))
    Set Verify_Delete_MSG     to (RefFunc(Confirm_Delete_Order))
    Set Auto_Clear_DEO_State  to False // don't clear Header on save

    // print the current order. This message will be sent
    // by the print button
    Procedure PrintCurrentOrder
        Integer hDD iNum
        Get Server to hDD // this will be the OrderHeader DD
        If (HasRecord(hDD)) Begin // only do this if record exists
            Get Field_Current_Value of hDD Field OrderHeader.Order_Number to iNum
//            Send PrintOrder of oOrder_Report iNum
            Send Info_Box "This is just a stub and this invoice is not actually being printed" ("Print Order " + String(iNum))
        End
    End_Procedure

    // refresh is sent to containers. We will use that to control the print button and only
    // enable it when an order exists
    Procedure Refresh Integer eMode
        Boolean bRec
        Handle hoServer
        Get Server to hoServer
        Get HasRecord of hoServer to bRec
        Set Enabled_State of oPrintBtn to bRec
    End_Procedure

End_Object

