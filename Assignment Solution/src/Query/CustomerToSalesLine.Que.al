query 60100 CustomerToSalesLine
{
    QueryType = Normal;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(Name; Name)
            { }
            dataitem(Sales_Header; "Sales Header")
            {
                DataItemLink = "Sell-to Customer No." = Customer."No.";

                dataitem(Sales_Line; "Sales Line")
                {
                    DataItemLink = "Document Type" = Sales_Header."Document Type", "Document No." = Sales_Header."No.";
                    DataItemTableFilter = Type = const(Item);

                    column(Quantity; Quantity)
                    { }

                    column(Unit_of_Measure_Code; "Unit of Measure Code")
                    { }
                    dataitem(Item; Item)
                    {
                        DataItemLink = "No." = Sales_Line."No.";

                        column(Reserve; Reserve)
                        { }
                    }
                }
            }
        }
    }
}