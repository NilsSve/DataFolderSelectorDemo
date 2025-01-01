Use DFClient.pkg
Use Windows.pkg
Use cDbCJGridPromptList.pkg

Use cCustomerDataDictionary.dd
Use cOrderHeaderDataDictionary.dd

Cd_Popup_Object OrderHeader_sl is a dbModalPanel

    Set Minimize_Icon to False
    Set Label to "Order List"
    Set Size to 134 392
    Set Location to 4 5
    Set piMinSize to 134 392

    Object oCustomerDataDictionary is a cCustomerDataDictionary
    End_Object

    Object oOrderHeaderDataDictionary is a cOrderHeaderDataDictionary
        Set DDO_Server to oCustomerDataDictionary
    End_Object

    Set Main_DD to oOrderHeaderDataDictionary
    Set Server to oOrderHeaderDataDictionary

    Object oSelList is a cDbCJGridPromptList
        Set Size to 100 377
        Set Location to 9 7
        Set pbAllowColumnRemove to False
        Set peAnchors to anAll

        Object oOrderHea_Order_Number is a cDbCJGridColumn
            Entry_Item OrderHeader.Order_Number
            Set piWidth to 87
            Set psCaption to "Order Number"
        End_Object

        Object oCustomer_Customer_Number is a cDbCJGridColumn
            Entry_Item Customer.Customer_Number
            Set piWidth to 84
            Set psCaption to "Cust. Number"
        End_Object

        Object oCustomer_Name is a cDbCJGridColumn
            Entry_Item Customer.Name
            Set piWidth to 231
            Set psCaption to "Customer Name"
        End_Object

        Object oOrderHeader_Order_Date is a cDbCJGridColumn
            Entry_Item OrderHeader.Order_Date
            Set piWidth to 75
            Set psCaption to "Order Date"
            Set peTextAlignment to xtpAlignmentRight
        End_Object

        Object oOrderHeader_Order_Total is a cDbCJGridColumn
            Entry_Item OrderHeader.Order_Total
            Set piWidth to 88
            Set psCaption to "Order Total"
        End_Object
    End_Object

    Object oOK_bn is a Button
        Set Label to "&Ok"
        Set Location to 116 231
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send OK of oSelList
        End_Procedure

    End_Object

    Object oCancel_bn is a Button
        Set Label to "&Cancel"
        Set Location to 116 284
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Cancel of oSelList
        End_Procedure

    End_Object

    Object oSearch_bn is a Button
        Set Label to "&Search..."
        Set Location to 116 337
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Search of oSelList
        End_Procedure

    End_Object

    On_Key Key_Alt+Key_O Send KeyAction of oOk_bn
    On_Key Key_Alt+Key_C Send KeyAction of oCancel_bn
    On_Key Key_Alt+Key_S Send KeyAction of oSearch_bn

Cd_End_Object

