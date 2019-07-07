# Possible Answers

1.
```
SELECT
    customer_id,
    COUNT(customer_id) AS total_transactions
FROM
    transactions
GROUP BY customer_id
HAVING total_transactions > 1
ORDER BY total_transactions DESC;
```

2.
```
SELECT
	shipping_state,
    COUNT(item) AS item_count
FROM transactions AS T
JOIN customers AS C
	ON T.customer_id = C.customer_id
GROUP BY shipping_state
ORDER BY item_count DESC;
```

3.
```
SELECT
    item_description,
    COUNT(transaction_id) AS number_sales
FROM transactions T
JOIN items I
		ON T.item = I.item
GROUP BY item_description
ORDER BY number_sales DESC;
```

4.
