const express = require('express');
const app = express();
const alertsRoutes = require('./routes/alerts');

app.use(express.json());
app.use(alertsRoutes);

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
