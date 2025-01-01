Use DFClient.pkg
Use Windows.pkg

Use cVendorDataDictionary.dd
Use cInventoryDataDictionary.dd

Cd_Popup_Object Inventory_sl is a dbModalPanel

    Set Minimize_Icon to False
    Set Label to "Inventory List"
    Set Size to 133 284
    Set Location to 4 4
    Set piMinSize to 133 284

    Object oVendorDataDictionary is a cVendorDataDictionary
    End_Object

    Object oInventoryDataDictionary is a cInventoryDataDictionary
        Set DDO_Server to oVendorDataDictionary
    End_Object

    Set Main_DD to oInventoryDataDictionary
    Set Server to oInventoryDataDictionary

    Object oSelList is a cDbCJGridPromptList
        Set Size to 105 273
        Set Location to 6 6
        Set peAnchors to anAll
        Set pbAllowColumnRemove to False

        Object oItemID is a cDbCJGridColumn
            Entry_Item Inventory.Item_iD
            Set psCaption to "Item ID"
            Set piWidth to 74
        End_Object

        Object oDescription is a cDbCJGridColumn
            Entry_Item Inventory.Description
            Set psCaption to "Description"
            Set piWidth to 205
        End_Object

        Object oUnitPrice is a cDbCJGridColumn
            Entry_Item Inventory.Unit_Price
            Set psCaption to "Unit Price"
            Set piWidth to 69
        End_Object

        Object oOnHand is a cDbCJGridColumn
            Entry_Item Inventory.On_Hand
            Set psCaption to "On Hand"
            Set piWidth to 61
        End_Object

    End_Object

    Object oOK_bn is a Button
        Set Label to "&Ok"
        Set Location to 115 123
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send OK of oSelList
        End_Procedure

    End_Object

    Object oCancel_bn is a Button
        Set Label to "&Cancel"
        Set Location to 115 176
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Cancel of oSelList
        End_Procedure

    End_Object

    Object oSearch_bn is a Button
        Set Label to "&Search..."
        Set Location to 115 229
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Search of oSelList
        End_Procedure

    End_Object

    On_Key Key_Alt+Key_O Send KeyAction of oOk_bn
    On_Key Key_Alt+Key_C Send KeyAction of oCancel_bn
    On_Key Key_Alt+Key_S Send KeyAction of oSearch_bn

Cd_End_Object

