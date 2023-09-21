-- Create an index on ServicePoint.city
CREATE INDEX ServicePointCity ON ServicePoint(city);

-- Create an index on Deliver_To.TimeDelivered
CREATE INDEX DeliverTime ON Deliver_To(TimeDelivered);

-- Combine the two queries into a single query
-- Query the ordernumbers that are to be delivered to a particular city during a specified period
-- Select streetaddr, starttime, endtime from ServicePoint in the same city as a particular user
-- Example: City = 'Montreal', TimeDelivered < '2017-03-21', TimeDelivered > '2016-03-21', userid = 5

SELECT sp.streetaddr, sp.starttime, sp.endtime, dt.orderNumber
FROM ServicePoint sp
JOIN Deliver_To dt ON sp.addrid = dt.addrid
WHERE sp.city = 'Montreal'
  AND dt.TimeDelivered < '2017-03-21'
  AND dt.TimeDelivered > '2016-03-21'
  AND sp.addrid IN (SELECT Address.addrid FROM Address WHERE userid = 5);
