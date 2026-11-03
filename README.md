# Full Ecommerce Demo (`full_ecommerce_demo`)

A streamlined, production-ready LookML project built on Google BigQuery's public `bigquery-public-data.thelook_ecommerce` dataset. Modeled after `thelook_public` with simplified Explores, clean view architecture, and 6 interactive LookML dashboards (including a dedicated single-Explore cross-filtering & drill showcase).

---

## Project Architecture

### 1. Model & Explores ([`full_ecommerce_demo.model.lkml`](./full_ecommerce_demo.model.lkml))
* **Connection**: `default_bigquery_connection`
* **Explores (2)**:
  1. **`order_items`** (`"(1) Orders, Items and Users"`): Central transactional Explore joining `order_items`, `order_facts`, `inventory_items`, `users`, `user_order_facts`, `products`, `repeat_purchase_facts`, and `distribution_centers`.
  2. **`events`** (`"(2) Web Event Data"`): Digital clickstream & conversion funnel Explore joining `events`, `sessions`, `session_landing_page`, `session_bounce_page`, `product_viewed`, `users`, and `user_order_facts`.

### 2. Views (`views/`)
| File | Description |
| :--- | :--- |
| [`01_order_items.view.lkml`](./views/01_order_items.view.lkml) | Order line items, revenue, gross margin, return rates, shipping/processing speed, and 30-day repeat purchase rates. |
| [`02_users.view.lkml`](./views/02_users.view.lkml) | Customer demographics (`age_tier`, `gender`), geography (`state`, `city`, `zip`, `location`), and acquisition `traffic_source`. |
| [`03_inventory_items.view.lkml`](./views/03_inventory_items.view.lkml) | Inventory costs, stock on hand, days in inventory tiers, and stock coverage ratio. |
| [`04_products.view.lkml`](./views/04_products.view.lkml) | Product catalog hierarchy (`department`, `category`, `brand`, `item_name`, `retail_price`, `sku`) with drill paths and action links. |
| [`05_distribution_centers.view.lkml`](./views/05_distribution_centers.view.lkml) | Warehouse names and geographic coordinates. |
| [`11_order_facts.view.lkml`](./views/11_order_facts.view.lkml) | Native derived table computing order-level totals, item counts, sequence numbers, and `is_first_purchase`. |
| [`12_user_order_facts.view.lkml`](./views/12_user_order_facts.view.lkml) | SQL derived table for customer lifetime orders, lifetime revenue (LTV), repeat customer flags, and `days_as_customer_tiered`. |
| [`13_repeat_purchase_facts.view.lkml`](./views/13_repeat_purchase_facts.view.lkml) | SQL derived table tracking subsequent orders and repeat purchase timing. |
| [`51_events.view.lkml`](./views/51_events.view.lkml) | Web clickstream events, entry/exit events, bounce rates, and visitor metrics. |
| [`52_sessions.view.lkml`](./views/52_sessions.view.lkml) | Session-level aggregation and 5-step conversion funnel (`All Sessions` -> `Browse` -> `Product` -> `Cart` -> `Purchase`). |

### 3. LookML Dashboards (`dashboards/`)
| File | Dashboard Title | Highlights |
| :--- | :--- | :--- |
| [`us_sales_regional_performance.dashboard.lookml`](./dashboards/us_sales_regional_performance.dashboard.lookml) | **US Sales & Regional Performance** | Single-Explore (`order_items`) dashboard with `crossfilter_enabled: true`, 3 interactive maps (State Choropleth, Zip Points, Coordinate Points), Top Categories Donut, Monthly Sales Trend, Tabular City/State Grid, and 3 Customer Demographic & Loyalty Breakdown tiles (`Users by Age Tier & Gender`, `Users by Traffic Source`, `Users by Customer Tenure & Repeat Status`). |
| [`business_pulse.dashboard.lookml`](./dashboards/business_pulse.dashboard.lookml) | **Business Pulse** | Executive KPI summary, YoY sales trajectory, user acquisition by traffic source, and 30-day repeat purchase rates. |
| [`brand_lookup.dashboard.lookml`](./dashboards/brand_lookup.dashboard.lookml) | **Brand Lookup** | Deep-dive brand performance, category share of wallet, top purchasers, and web affinity. |
| [`customer_lookup.dashboard.lookml`](./dashboards/customer_lookup.dashboard.lookml) | **Customer Lookup** | 360-degree customer profile lookup by email with lifetime orders, returns, favorite categories, and location map. |
| [`shipping_logistics_overview.dashboard.lookml`](./dashboards/shipping_logistics_overview.dashboard.lookml) | **Shipping Logistics & Operations Overview** | Order shipment status, processing backlog (`status = 'Processing'`), and regional transit speed heatmaps. |
| [`web_analytics_overview.dashboard.lookml`](./dashboards/web_analytics_overview.dashboard.lookml) | **Web Analytics Overview** | Session conversion funnel, bounce rates, browser breakdown, and global visitor traffic. |
