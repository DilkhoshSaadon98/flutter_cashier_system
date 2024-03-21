// Count Pending cart :
CREATE OR REPLACE VIEW countcartview AS SELECT
    COUNT(*) AS pending_cart_count,
    tbl_cart.cart_number
FROM
    tbl_cart
WHERE
    cart_status = 'pending';

// View Cart:--------------------------------------------
    CREATE OR REPLACE VIEW cartview AS SELECT
    SUM(
        CAST(
            tbl_items.items_sellingprice  AS INT
        )
    ) AS items_price,
    COUNT(tbl_cart.cart_items_id) AS count_items,
    tbl_cart.*,
    tbl_items.*
FROM
    tbl_cart
INNER JOIN tbl_items ON tbl_items.items_id = tbl_cart.cart_items_id
WHERE
    cart_orders = 0
GROUP BY
    tbl_cart.cart_items_id,
    tbl_cart.cart_number,
    tbl_cart.cart_orders;