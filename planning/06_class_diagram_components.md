# Components of the Class Diagram

## System (nouns not given classes)
Application / Budgeting App
User
Developer
Spending
Money / Expenditure (this is contained in Transactions)

## Classes (nouns from parsing)
Transaction (class, hence 'transactions' table)
Category (or Tag)
Month (of date of Transaction)

## Attributes of each Class (nouns from parsing)
Description (or Merchant) of each Transaction
Value of each Transaction
Category (or Tag) of each Transaction
Date of Transaction
Budget for Category


## Types of each Attributes (nouns from parsing)

## Methods for each Class (verbs from parsing)
CRUD on Transaction
CRUD on Categories (some limitations)
CR on Months
Month for a Transaction
Missing Months over all Transactions
Month List for Reporting / Filtering
Category List for Reporting / Filtering
List of Transactions for all/some months, all/some tags
Total Spend for list of transactions
Import bank statement (make it randomised list of transactions)
Warn user if budget exceeded

## Relationships between Classes
Transaction has a Month
Transaction has a Category
