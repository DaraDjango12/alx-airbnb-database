Performance Improvement Report: Partitioning the Bookings Table by Date
Background
The bookings table was large and queries filtering by date (e.g., bookings within a specific date range) were slow due to full table scans. To address this, range partitioning was implemented based on the check_in_date column, splitting the table into quarterly partitions.

Testing Approach
Queries filtering bookings by a date range were run on both the original unpartitioned table and the new partitioned table.

Performance was analyzed using EXPLAIN ANALYZE to observe query plans and execution times.


| Aspect                   | Before Partitioning                            | After Partitioning                                                        |
| ------------------------ | ---------------------------------------------- | ------------------------------------------------------------------------- |
| **Query Execution Time** | High (full table scans on large data)          | Significantly reduced (scan limited to relevant partitions)               |
| **Query Plan**           | Sequential scan over entire table              | Index or sequential scan limited to target partitions (partition pruning) |
| **Resource Utilization** | High CPU and I/O usage                         | Lower CPU and I/O due to smaller scan ranges                              |
| **Scalability**          | Poor performance growth as data size increased | Improved scalability as queries handle smaller partitions                 |
