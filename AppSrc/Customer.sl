Use DFClient.pkg
Use Windows.pkg
Use cDbCJGridPromptList.pkg

Use cCustomerDataDictionary.dd

Cd_Popup_Object Customer_sl is a dbModalPanel

    Set Border_Style to Border_Thick
    Set Minimize_Icon to False
    Set Label to "Customer List"
    Set Size to 134 238
    Set Location to 4 5
    Set piMinSize to 134 238

    Object oCustomerDataDictionary is a cCustomerDataDictionary
    End_Object

    Set Main_DD to oCustomerDataDictionary
    Set Server to oCustomerDataDictionary

    Object oSelList is a cDbCJGridPromptList
        Set Size to 100 224
        Set Location to 9 8
        Set peAnchors to anAll
        Set pbAllowColumnRemove to False

        Object oNumber is a cDbCJGridColumn
            Entry_Item Customer.Customer_Number
            Set piWidth to 93
            Set psCaption to "Number"
        End_Object

        Object oCustomerName is a cDbCJGridColumn
            Entry_Item Customer.Name
            Set piWidth to 243
            Set psCaption to "Customer Name"
        End_Object
    End_Object

    Object oOK_bn is a Button
        Set Label to "&Ok"
        Set Location to 116 77
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send OK of oSelList
        End_Procedure

    End_Object

    Object oCancel_bn is a Button
        Set Label to "&Cancel"
        Set Location to 116 130
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Cancel of oSelList
        End_Procedure

    End_Object

    Object oSearch_bn is a Button
        Set Label to "&Search..."
        Set Location to 116 183
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Search of oSelList
        End_Procedure

    End_Object

    On_Key Key_Alt+Key_O Send KeyAction of oOk_bn
    On_Key Key_Alt+Key_C Send KeyAction of oCancel_bn
    On_Key Key_Alt+Key_S Send KeyAction of oSearch_bn

Cd_End_Object
