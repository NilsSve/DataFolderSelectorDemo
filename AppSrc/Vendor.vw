Use Dfclient.pkg
Use DataDict.pkg
Use cDbFormHint.pkg
Use dfCEntry.pkg

Use cVendorDataDictionary.dd

Activate_View Activate_oVendorView for oVendorView
Object oVendorView is a dbView
    Set Border_Style to Border_Thick
    Set Label to "Vendor Entry View"
    Set Location to 6 6
    Set Size to 128 281
    Set piMaxSize to 137 350
    Set piMinSize to 128 215
    Set pbAutoActivate to True

    Object oVendorDataDictionary is a cVendorDataDictionary
    End_Object

    Set Main_DD to oVendorDataDictionary
    Set Server to oVendorDataDictionary

    Object oVendor_Id is a cDbFormHint
        Entry_Item Vendor.ID
        Set Label to "Vendor ID:"
        Set Size to 12 42
        Set Location to 9 67
        Set peAnchors to anTopLeft
        Set Label_Col_Offset to 2
        Set Label_Justification_Mode to jMode_Right
    End_Object

    Object oVendor_Name is a cDbFormHint
        Entry_Item Vendor.Name
        Set Label to "Vendor Name:"
        Set Size to 12 186
        Set Location to 23 67
        Set peAnchors to anTopLeftRight
        Set Label_Col_Offset to 2
        Set Label_Justification_Mode to jMode_Right
    End_Object

    Object oVendor_Address is a cDbFormHint
        Entry_Item Vendor.Address
        Set Label to "Street Address:"
        Set Size to 12 186
        Set Location to 37 67
        Set peAnchors to anTopLeftRight
        Set Label_Col_Offset to 2
        Set Label_Justification_Mode to jMode_Right
    End_Object

    Object oVendor_City is a cDbFormHint
        Entry_Item Vendor.City
        Set Label to "City:"
        Set Size to 12 90
        Set Location to 51 67
        Set peAnchors to anTopLeft
        Set Label_Col_Offset to 2
        Set Label_Justification_Mode to jMode_Right
    End_Object

    Object oVendor_State is a dbComboForm
        Entry_Item Vendor.State
        Set Label to "State:"
        Set Size to 12 32
        Set Location to 65 67
        Set peAnchors to anTopLeft
        Set Form_Border to 0
        Set Label_Col_Offset to 2
        Set Label_Justification_Mode to jMode_Right
        Set Entry_State to False
        Set Code_Display_Mode to cb_code_display_code
    End_Object

    Object oVendor_Zip is a cDbFormHint
        Entry_Item Vendor.Zip
        Set Label to "Zip/Postal Code:"
        Set Size to 12 66
        Set Location to 79 67
        Set peAnchors to anTopLeft
        Set Label_Col_Offset to 2
        Set Label_Justification_Mode to jMode_Right
    End_Object

    Object oVendor_Phone_Number is a cDbFormHint
        Entry_Item Vendor.Phone_Number
        Set Label to "Phone Number:"
        Set Size to 12 126
        Set Location to 93 67
        Set peAnchors to anTopLeftRight
        Set Label_Col_Offset to 2
        Set Label_Justification_Mode to jMode_Right
    End_Object

    Object oVendor_Fax_Number is a cDbFormHint
        Entry_Item Vendor.Fax_Number
        Set Label to "Fax Number:"
        Set Size to 12 126
        Set Location to 107 67
        Set peAnchors to anTopLeftRight
        Set Label_Col_Offset to 2
        Set Label_Justification_Mode to jMode_Right
    End_Object

End_Object

