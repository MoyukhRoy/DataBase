-- STORED PROCEDURE
-- Compute the average amount of a product brand and then use it to modify the quantity of a product specified by the user in the save_to_shopping_cart relation

DELIMITER //

CREATE PROCEDURE func1(IN vpid INT, IN vbrand VARCHAR(255))
BEGIN
  DECLARE v_amount INT;
  
  SELECT AVG(amount) INTO v_amount FROM product WHERE brand = vbrand;
  
  UPDATE save_to_shopping_cart SET quantity = v_amount WHERE pid = vpid;
  
  SELECT v_amount;
END;
//

DELIMITER ;

-- EXECUTE
CALL func1(8, 'Microsoft');

-- REVERT
UPDATE save_to_shopping_cart SET quantity = 1 WHERE pid = 8;

-- TRIGGER PROCEDURE
CREATE TABLE shoppingcart_audits (
  id INT AUTO_INCREMENT PRIMARY KEY,
  userid INT NOT NULL,
  pid INT NOT NULL,
  quantity INT NOT NULL,
  changed_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER quantity_changes
BEFORE UPDATE
ON save_to_shopping_cart FOR EACH ROW
BEGIN
  IF NEW.quantity <> OLD.quantity THEN
    INSERT INTO shoppingcart_audits (userid, pid, quantity) VALUES (OLD.userid, OLD.pid, OLD.quantity);
  END IF;
END;
//

DELIMITER ;

-- Example of using the trigger
-- This assumes you have already executed the previous queries and triggered an update to save_to_shopping_cart
-- A new record in shoppingcart_audits will be created for the changes.

UPDATE save_to_shopping_cart SET quantity = 5 WHERE pid = 8;
