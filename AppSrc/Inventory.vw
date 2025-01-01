Use Windows.pkg
Use dfClient.pkg
Use DataDict.pkg
Use cDbFormHint.pkg

Use cCJStandardCommandBarSystem.pkg
Use cVendorDataDictionary.dd
Use cInventoryDataDictionary.dd

// This enhanced example add a custom floating menu to the ID entry field. The floating menu adds an option
// to run a report that shows which customers are ordering the current product/inventory item. The menu option
// will be disabled when the user did not select a product/inventory item.

// Clicking anywhere on a line with a customer leads to opening the customer entry view, finding the customer.

Activate_View Activate_oInventoryView for oInventoryView
Object oInventoryView is a dbView
    Set Border_Style to Border_Thick
    Set Label to "Inventory Item View"
    Set Location to 5 8
    Set Size to 140 305
    Set piMaxSize to 140 350
    Set piMinSize to 140 270
    Set pbAutoActivate to True

    Object oVendorDataDictionary is a cVendorDataDictionary
    End_Object

    Object oInventoryDataDictionary is a cInventoryDataDictionary
        Set DDO_Server to oVendorDataDictionary
    End_Object

    Set Main_DD to oInventoryDataDictionary
    Set Server to oInventoryDataDictionary

    Object oInventory_Item_ID is a cDbFormHint
        Entry_Item Inventory.Item_ID
        Set Label to "Invt. Item ID:"
        Set Size to 12 60
        Set Location to 15 70
        Set peAnchors to anTopLeft
        Set Label_Col_Offset to 2
        Set Label_Justification_Mode to jMode_Right

        Object oInventoryItemIDContextMenu is a cCJContextMenu
            Delegate Set Floating_Menu_Object to Self

            Object oUndoMenuItem is a cCJUndoMenuItem
            End_Object

            Object oCutMenuItem is a cCJCutMenuItem
                Set pbControlBeginGroup to True
            End_Object

            Object oCopyMenuItem is a cCJCopyMenuItem
            End_Object

            Object oPasteMenuItem is a cCJPasteMenuItem
            End_Object

            Object oDeleteItem is a cCJDeleteEditMenuItem
            End_Object

            Object oSelectAllMenuItem is a cCJSelectAllMenuItem
                Set pbControlBeginGroup to True
            End_Object

            Object oPromptMenuItem is a cCJPromptMenuItem
                Set pbControlBeginGroup to True
            End_Object

            Object oFindNextMenu is a cCJFindNextMenuItem
                Set pbControlBeginGroup to True
            End_Object

            Object oFindPreviousMenu is a cCJFindPreviousMenuItem
            End_Object

            Object oClearMenuItem is a cCJClearMenuItem
                Set pbControlBeginGroup to True
            End_Object

            Object oClearAllMenu is a cCJClearAllMenuItem
            End_Object

            Object oSaveMenu is a cCJSaveMenuItem
            End_Object

            Object oDeleteMenu is a cCJDeleteMenuItem
            End_Object

            Object oRememberitem is a cCJRememberFieldMenuItem
                Set pbControlBeginGroup to True
            End_Object

            Object oRetainItem is a cCJRememberLastFieldMenuItem
            End_Object

            Object oUnRememberitem is a cCJUnRememberFieldMenuItem
            End_Object

            Object oCJClearAllDynamicDefaults is a cCJUnRememberFieldAllMenuItem
            End_Object

            Object oOrderedbyMenuItem is a cCJMenuItem
                Set pbControlBeginGroup to True
                Set psCaption to "Ordered by"
                Set psDescription to "Show Customers Ordering this product"

                Procedure OnExecute Variant vCommandBarControl
                End_Procedure

                Function IsEnabled Returns Boolean
                    String sItemId

                    Get Field_Current_Value of oInventoryDataDictionary Field Inventory.Item_ID to sItemId

                    Function_Return (sItemId <> "")
                End_Function
            End_Object
        End_Object
    End_Object

    Object oInventory_Description is a cDbFormHint
        Entry_Item Inventory.Description
        Set Label to "Invt. Description:"
        Set Size to 12 210
        Set Location to 29 70
        Set peAnchors to anTopLeftRight
        Set Label_Col_Offset to 2
        Set Label_Justification_Mode to jMode_Right
    End_Object

    Object oVendorGroup is a dbGroup
        Set Size to 58 271
        Set Location to 46 9
        Set peAnchors to anAll
        Set Label to "Vendor"

        Object oInventory_Vendor_ID is a cDbFormHint
            Entry_Item Vendor.ID
            Set Label to "Vendor ID:"
            Set Size to 12 42
            Set Location to 9 61
            Set peAnchors to anTopLeft
            Set Label_Col_Offset to 2
            Set Label_Justification_Mode to jMode_Right
        End_Object

        Object oVendor_Name is a cDbFormHint
            Entry_Item Vendor.Name
            Set Label to "Vendor Name:"
            Set Size to 12 180
            Set Location to 23 61
            Set peAnchors to anTopLeftRight
            Set Label_Col_Offset to 2
            Set Label_Justification_Mode to jMode_Right
        End_Object

        Object oInventory_Vendor_Part_ID is a cDbFormHint
            Entry_Item Inventory.Vendor_Part_ID
            Set Label to "Vendor Part ID:"
            Set Size to 12 90
            Set Location to 37 61
            Set peAnchors to anTopLeft
            Set Label_Col_Offset to 2
            Set Label_Justification_Mode to jMode_Right
        End_Object
    End_Object

    Object oUnitGroup is a dbGroup
        Set Size to 28 271
        Set Location to 106 9
        Set peAnchors to anAll

        Object oInventory_Unit_Price is a cDbFormHint
            Entry_Item Inventory.Unit_Price
            Set Label to "Unit Price:"
            Set Size to 12 48
            Set Location to 10 61
            Set peAnchors to anTopLeft
            Set Label_Col_Offset to 2
            Set Label_Justification_Mode to jMode_Right
        End_Object

        Object oInventory_On_Hand is a cDbFormHint
            Entry_Item Inventory.On_Hand
            Set Label to "On Hand:"
            Set Size to 12 36
            Set Location to 10 205
            Set peAnchors to anTopRight
            Set Label_Col_Offset to 2
            Set Label_Justification_Mode to jMode_Right
        End_Object
    End_Object
End_Object

