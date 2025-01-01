Use DFClient.pkg
Use Windows.pkg
Use cDbCJGridPromptList.pkg

Use cSalesPersonDataDictionary.dd

Cd_Popup_Object SalesPerson_sl is a dbModalPanel

    Set Minimize_Icon to False
    Set Label to "Sales Person List"
    Set Size to 99 260
    Set Location to 4 5
    Set piMinSize to 99 180

    Object oSalesPersonDataDictionary is a cSalesPersonDataDictionary
    End_Object

    Set Main_DD to oSalesPersonDataDictionary
    Set Server to oSalesPersonDataDictionary

    Object oSelList is a cDbCJGridPromptList
        Set Size to 70 249
        Set Location to 6 5
        Set pbAllowColumnRemove to False
        Set peAnchors to anAll

        Object oSalesPerson_ID is a cDbCJGridColumn
            Entry_Item SalesPerson.ID
            Set piWidth to 60
            Set psCaption to "ID"
        End_Object

        Object oSalesPerson_Name is a cDbCJGridColumn
            Entry_Item SalesPerson.Name
            Set piWidth to 313
            Set psCaption to "Sales Person Name"
        End_Object
    End_Object

    Object oOK_bn is a Button
        Set Label to "&Ok"
        Set Location to 81 99
        Set peAnchors to anBottomRight
        Set Default_State to True

        Procedure OnClick
            Send OK of oSelList
        End_Procedure

    End_Object

    Object oCancel_bn is a Button
        Set Label to "&Cancel"
        Set Location to 81 152
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Cancel of oSelList
        End_Procedure

    End_Object

    Object oSearch_bn is a Button
        Set Label to "&Search..."
        Set Location to 81 205
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Search of oSelList
        End_Procedure

    End_Object

    On_Key Key_Alt+Key_O Send KeyAction of oOk_bn
    On_Key Key_Alt+Key_C Send KeyAction of oCancel_bn
    On_Key Key_Alt+Key_S Send KeyAction of oSearch_bn

Cd_End_Object

