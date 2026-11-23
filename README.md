# Shopping Cart Database Design

A relational database design for an online shopping cart: an entity–relationship model, the relational schema with sample data, and relational-algebra queries with worked results. MySQL-style SQL is included so the design can be recreated and queried directly.

## What it covers

- **ER model** — five entities and their relationships, with attributes, keys, and mandatory/optional participation.
- **Relational schema** — the five relations derived from the ER model, with primary and foreign keys.
- **Relational algebra** — four queries written in relational algebra (selection, projection, join) with worked results on the sample data.

## Entities and relationships

| Entity | Attributes | Key |
| --- | --- | --- |
| COMPANY | company_id, name | company_id |
| ITEM | item_id, name, price, company_id, cart_id, order_id, customer_id | item_id |
| SHOPPING_CART | cart_id | cart_id |
| ORDER | order_id, order_number | order_id |
| CUSTOMER | customer_id, name, address, email, order_id, item_id | customer_id |

Relationships (see `diagrams/er-diagram.pdf`):

- A **shopping cart contains** items; a company **produces** items.
- A customer **buys** items; an item is **included in** an order.
- A customer **places** an order.

## Relational-algebra queries

Four queries over the sample data (worked results are in `report/Shopping_Cart_Database_Design.pdf` and `queries/relational-algebra-queries.docx`):

1. Names of the companies that sell chairs and tables → **IBM**
2. Addresses of customers with order IDs 11–20 → Brownsville, TX; McAllen, TX; Mission, TX
3. Names and email addresses of customers with item IDs 2 and 4 → John Smith, Jane Smith
4. Order numbers for customers John Smith or Jane Doe → 245, 478

## Files

| Path | Contents |
| --- | --- |
| `README.md` | This overview |
| `sql/schema.sql` | `CREATE TABLE` statements and sample data for all five relations |
| `diagrams/er-diagram.pdf` | The ER diagram |
| `report/Shopping_Cart_Database_Design.pdf` | Full design write-up: ER diagram and queries with results |
| `queries/relational-algebra-queries.docx` | The four relational-algebra queries with results (editable) |
