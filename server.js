// server.js
require("dotenv").config(); // doit être la première ligne

const express = require("express");
const mongoose = require("mongoose");

const app = express();
const PORT = process.env.PORT || 3000;

// Middlewares
app.use(express.json());

// Test du chargement de l'env
console.log("MONGODB_URI =", process.env.MONGODB_URI);

// MongoDB
mongoose.connect(process.env.MONGODB_URI)
  .then(() => console.log("✅ MongoDB connecté"))
  .catch(err => {
    console.error("❌ MongoDB erreur", err);
    process.exit(1);
  });

// Route test
app.get("/", (req, res) => {
  res.send("🚀 TripManager API en ligne");
});

// Lancement du serveur
app.listen(PORT, () => {
  console.log(`🌍 Serveur lancé sur http://localhost:${PORT}`);
});
