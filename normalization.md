# Database Normalization to Third Normal Form (3NF)

## Objective

To apply normalization principles to eliminate redundancy and ensure the database design is in Third Normal Form (3NF).

---

## Step 1: Review of Initial Schema

Entities:

- **User**
  - user_id (PK)
  - first_name
  - last_name
  - email
  - password_hash
  - phone_number
  - role
  - created_at

- **Property**
  - property_id (PK)
  - user_id (FK)
  - title
  - description
  - address
  - city
  - state
  - country
  - price_per_night
  - created_at

- **Booking**
  - booking_id (PK)
  - user_id (FK)
  - property_id (FK)
  - start_date
  - end_date
  - total_price
  - status

- **Review**
  - review_id (PK)
  - booking_id (FK)
  - rating
  - comment
  - created_at

---

## Step 2: Apply First Normal Form (1NF)

**1NF Rule:** Eliminate repeating groups. Ensure each field contains only atomic values.

 Each table has atomic columns (e.g., no list of phone numbers or multiple emails).

---

## Step 3: Apply Second Normal Form (2NF)

**2NF Rule:** Eliminate partial dependencies. Every non-key attribute must depend on the entire primary key.

- All tables with single-column primary keys already meet 2NF.
- No composite keys are used that might cause partial dependency.

2NF is satisfied.

---

## Step 4: Apply Third Normal Form (3NF)

**3NF Rule:** Eliminate transitive dependencies. No non-key column should depend on another non-key column.

### Analysis:

- In the **Property** table:
  - `address`, `city`, `state`, and `country` may be better normalized into a separate `Location` table to avoid redundancy if multiple properties share the same location.

### 3NF Adjustments:

#### New Table: `Location`

- **location_id** (PK)
- **address**
- **city**
- **state**
- **country**

#### Modified Table: `Property`

- property_id (PK)
- user_id (FK)
- location_id (FK)
- title
- description
- price_per_night
- created_at

---

## Final Database Schema (in 3NF)

### User
- user_id (PK)
- first_name
- last_name
- email
- password_hash
- phone_number
- role
- created_at

### Location
- location_id (PK)
- address
- city
- state
- country

### Property
- property_id (PK)
- user_id (FK → User)
- location_id (FK → Location)
- title
- description
- price_per_night
- created_at

### Booking
- booking_id (PK)
- user_id (FK → User)
- property_id (FK → Property)
- start_date
- end_date
- total_price
- status

### Review
- review_id (PK)
- booking_id (FK → Booking)
- rating
- comment
- created_at

---

## Summary

The database is now normalized to **Third Normal Form (3NF)**. Redundancies related to location data were eliminated by introducing a separate `Location` table. All non-key attributes now depend only on primary keys and are free from transitive dependencies.

This enhances:
- Data integrity
- Reduced redundancy
- Easier maintenance
