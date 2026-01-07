require("dotenv").config();

const express = require("express");
const mongoose = require("mongoose");

const app = express();
const PORT = process.env.PORT || 3000;

// Middlewares
app.use(express.json());

// Test du chargement de l'env
console.log("MONGODB_URI =", process.env.MONGODB_URI);

// Connexion MongoDB (facultative si tu n’en as pas besoin pour tester)
mongoose.connect(process.env.MONGODB_URI)
.then(() => console.log("✅ MongoDB connecté"))
.catch(err => {
console.error("❌ MongoDB erreur", err);

process.exit(1);

});

// Route test racine
app.get("/", (req, res) => {
res.send("🚀 TripManager API en ligne");
});

// Router API + route /api/cities
const api = express.Router();

api.get("/cities", (req, res) => {
res.json([
{ _id: "1", image: "https://picsum.photos/300/140", name: "Paris", country: "France" },

{ _id: "2", image: "https://picsum.photos/300/140", name: "Lyon", country: "France" }

]);
});

app.use("/api", api);

// Lancement du serveur
app.listen(PORT, () => {
console.log("🌍 Serveur lancé sur http://localhost:" + PORT);
});
