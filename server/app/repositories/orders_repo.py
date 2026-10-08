from app.database_helpers import fetch_all

async def get_daily_sales():
      return await fetch_all(
        """
        SELECT SUM(oi.order_item_price * oi.order_item_qty) as Total_Amount, SUM(oi.order_item_qty) as Total_Produk_Terjual, date_trunc('day', o.order_created_at) as Sale_Date
        FROM orders o join order_items oi on o.order_id = oi.order_item_order_id
        GROUP BY date_trunc('day', o.order_created_at)
        ORDER BY date_trunc('day', o.order_created_at)
        """
      )
