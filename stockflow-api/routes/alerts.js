const express = require('express');
const router = express.Router();
const db = require('../db/knex');

// GET /api/companies/:companyId/alerts/low-stock
router.get('/api/companies/:companyId/alerts/low-stock', async (req, res) => {
  const { companyId } = req.params;
  const alerts = [];

  try {
    const warehouses = await db('warehouses').where({ company_id: companyId });

    for (const warehouse of warehouses) {
      const inventoryItems = await db('inventory').where({ warehouse_id: warehouse.id });

      for (const item of inventoryItems) {
        const product = await db('products').where({ id: item.product_id }).first();
        const thresholdRow = await db('product_thresholds').where({ product_id: product.id }).first();
        if (!thresholdRow) continue;

        const threshold = thresholdRow.threshold;
        if (item.quantity >= threshold) continue;

        // Get sales in last 30 days
        const thirtyDaysAgo = new Date();
        thirtyDaysAgo.setDate(thirtyDaysAgo.getDate() - 30);

        const sales = await db('sales')
          .where('product_id', product.id)
          .andWhere('warehouse_id', warehouse.id)
          .andWhere('sold_at', '>=', thirtyDaysAgo);

        if (!sales.length) continue;

        const totalSales = sales.reduce((sum, sale) => sum + sale.quantity, 0);
        const avgDailySales = totalSales / 30;
        const daysUntilStockout = avgDailySales > 0 ? Math.floor(item.quantity / avgDailySales) : null;

        const supplierProduct = await db('supplier_products').where({ product_id: product.id }).first();
        const supplier = supplierProduct
          ? await db('suppliers').where({ id: supplierProduct.supplier_id }).first()
          : null;

        alerts.push({
          product_id: product.id,
          product_name: product.name,
          sku: product.sku,
          warehouse_id: warehouse.id,
          warehouse_name: warehouse.name,
          current_stock: item.quantity,
          threshold,
          days_until_stockout: daysUntilStockout,
          supplier: supplier
            ? {
                id: supplier.id,
                name: supplier.name,
                contact_email: supplier.contact_email
              }
            : null
        });
      }
    }

    return res.status(200).json({
      alerts,
      total_alerts: alerts.length
    });

  } catch (error) {
    console.error(err);
    return res.status(500).json({ error: 'Internal Server Error' });
  }
});

module.exports = router;
